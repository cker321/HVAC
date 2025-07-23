package com.example.apkapiservice.controller;

import android.text.TextUtils;
import android.util.Log;

import com.example.apkapiservice.bean.TicaInnerStatus;
import com.example.apkapiservice.utils.Rs485Executor;
import com.example.apkapiservice.utils.Rs485Utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 空调控制处理器
 * 负责与空调设备通信，获取状态和发送控制命令
 */
public class AirControlHandler {
    private static final String TAG = "AirControlHandler";
    private static AirControlHandler instance;
    
    // RS485通信相关常量
    private static final int AIR_ADDRESS = 3;
    private static final int READ_FUNCTION_CODE = 3;
    private static final int WRITE_FUNCTION_CODE = 16;
    private static final int INNER_START_ADDRESS = 144;
    private static final int OUTER_START_ADDRESS = 96;
    
    // 空调模式常量
    public static final int MODE_COOL = 1;    // 制冷模式
    public static final int MODE_HEAT = 2;    // 制热模式
    public static final int MODE_FAN = 4;     // 通风模式
    public static final int MODE_DRY = 5;     // 除湿模式
    
    // 风速常量
    public static final int SPEED_LOW = 0;    // 低风速
    public static final int SPEED_MEDIUM = 1; // 中风速
    public static final int SPEED_HIGH = 2;   // 高风速
    public static final int SPEED_AUTO = 3;   // 自动风速
    
    // 电源状态常量（对照原应用Constant.smali）
    public static final int POWER_OFF = 0;         // 通用关机 (POWER_OFF)
    public static final int POWER_ON = 1;          // 通用开机 (POWER_ON)
    public static final int AIR_POWER_OFF = 0x0;     // 空调关机 (AIR_POWER_OFF)
    public static final int AIR_POWER_ON = 0x80;   // 空调开机 (AIR_POWER_ON = 128)
    
    // 地址常量（对照原应用）
    public static final int AIR_POWER_ADDRESS = 0x3;    // 电源地址
    public static final int AIR_MODE_ADDRESS = 0x0;     // 模式地址
    public static final int AIR_SET_TEMP_ADDRESS = 0x1; // 温度地址
    public static final int AIR_SPEED_ADDRESS = 0x2;    // 风速地址
    public static final int AIR_MACHINE_LENGTH = 0x10;  // 机器长度 = 16
    
    // 控制命令类型
    public static final int CMD_MODE = 0;     // 模式设置
    public static final int CMD_TEMP = 1;     // 温度设置
    public static final int CMD_SPEED = 2;    // 风速设置
    public static final int CMD_POWER = 3;    // 电源设置
    
    private int machineNo = 1;  // 默认机器编号
    private TicaInnerStatus ticaInnerStatus;  // 当前空调状态
    private final Map<Integer, TicaInnerStatus> statusMap = new ConcurrentHashMap<>();  // 存储多台空调状态
    private List<TicaInnerStatus> deviceList;  // 设备列表
    
    private AirControlHandler() {
        this.ticaInnerStatus = new TicaInnerStatus(machineNo, "主卧");
    }
    
    public static AirControlHandler getInstance() {
        if (instance == null) {
            synchronized (AirControlHandler.class) {
                if (instance == null) {
                    instance = new AirControlHandler();
                }
            }
        }
        return instance;
    }
    
    /**
     * 设置设备列表
     */
    public void setDeviceList(List<TicaInnerStatus> deviceList) {
        this.deviceList = deviceList;
    }
    
    /**
     * 设置当前操作的机器编号
     */
    public void setMachineNo(int machineNo) {
        this.machineNo = machineNo;
        if (!statusMap.containsKey(machineNo)) {
            TicaInnerStatus status = new TicaInnerStatus(machineNo, "房间" + machineNo);
            statusMap.put(machineNo, status);
        }
        this.ticaInnerStatus = statusMap.get(machineNo);
    }
    
    /**
     * 读取空调内机状态
     */
    public TicaInnerStatus readInnerStatus() {
        Log.e(TAG, "*** 开始读取空调内机状态 ***");
        Log.e(TAG, "机器编号: " + this.machineNo);
        Log.e(TAG, "设备地址: " + AIR_ADDRESS);
        
        // 创建一个新的状态对象，避免修改原有对象
        TicaInnerStatus status = new TicaInnerStatus(this.machineNo, 
                this.ticaInnerStatus != null && !TextUtils.isEmpty(this.ticaInnerStatus.getRoomName()) ? 
                this.ticaInnerStatus.getRoomName() : "房间" + this.machineNo);
        Log.e(TAG, "TicaInnerStatus对象创建成功");
        
        int startAddress = ((this.machineNo - 1) * 16) + INNER_START_ADDRESS;
        Log.e(TAG, "计算得到的起始地址: " + startAddress);
        
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(
                AIR_ADDRESS, 
                READ_FUNCTION_CODE, 
                startAddress, 
                16
        );
        Log.e(TAG, "生成读取命令: " + bytesToHex(readSendBytes));
        
        boolean success = false;
        try {
            Log.e(TAG, "尝试通过串口读取空调状态");
            byte[] response = Rs485Executor.getInstance().write(readSendBytes, 300);
            
            if (response != null) {
                Log.e(TAG, "收到响应数据: " + bytesToHex(response));
                Log.e(TAG, "响应数据长度: " + response.length);
                
                if (Rs485Utils.getInstance().returnCheck(response, readSendBytes)) {
                    Log.e(TAG, "数据校验成功，开始解析数据");
                    byte[] dataArray = Rs485Utils.getInstance().calReadDataArray(response);
                    Log.e(TAG, "提取的数据数组: " + bytesToHex(dataArray));
                    
                    convertToTicaInnerStatus(status, dataArray);
                    Log.e(TAG, "数据转换完成");
                    
                    status.setMachineNo(this.machineNo);
                    status.setDeviceSn(String.valueOf(this.machineNo));
                    
                    // 更新缓存状态
                    this.ticaInnerStatus = status;
                    statusMap.put(this.machineNo, status);
                    success = true;
                    Log.e(TAG, "空调状态读取成功");
                } else {
                    Log.e(TAG, "数据校验失败！");
                    Log.e(TAG, "发送的命令: " + bytesToHex(readSendBytes));
                    Log.e(TAG, "收到的响应: " + bytesToHex(response));
                }
            } else {
                Log.e(TAG, "未收到任何响应数据！");
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "读取空调内机状态被中断", e);
        } catch (Exception e) {
            Log.e(TAG, "读取空调内机状态异常", e);
            Log.e(TAG, "异常详细信息: " + e.getMessage());
        }
        
        // 如果串口通信失败，返回null并记录日志
        if (!success) {
            Log.e(TAG, "串口通信失败，无法获取空调状态。设备地址: " + AIR_ADDRESS + ", 机器编号: " + this.machineNo);
            return null;
        }
        
        return status;
    }
    
    /**
     * 读取空调外机状态
     */
    public float readOuterStatus() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(
                AIR_ADDRESS, 
                READ_FUNCTION_CODE, 
                OUTER_START_ADDRESS, 
                16
        );
        
        try {
            byte[] response = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(response, readSendBytes)) {
                int[] data = Rs485Utils.getInstance().toIntArray(Rs485Utils.getInstance().calReadDataArray(response));
                if (data.length > 4) {
                    return data[4] / 10.0f;  // 外机温度
                }
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "读取空调外机状态失败", e);
        }
        
        return 0.0f;
    }
    
    /**
     * 发送控制命令
     *
     * @param cmdType 命令类型（模式、温度、风速、电源）
     * @param value   命令值
     * @return 是否发送成功
     */
    public boolean sendCommand(int cmdType, int value) {
        // 更新状态
        if (cmdType == CMD_TEMP) {
            this.ticaInnerStatus.setSettingTemp(value);
        } else if (cmdType == CMD_POWER) {
            this.ticaInnerStatus.setPowerSetting(value == POWER_ON);
        } else if (cmdType == CMD_MODE) {
            this.ticaInnerStatus.setSettingMode(value);
        } else if (cmdType == CMD_SPEED) {
            this.ticaInnerStatus.setSettingWindSpeed(value);
        }
        
        Log.e(TAG, "*** 使用优化的单寄存器写入策略 ***");
        Log.e(TAG, "命令类型: " + cmdType + ", 值: " + value + ", 机器编号: " + this.machineNo);
        
        // 使用已验证成功的策略4：功能码06 + 地址映射
        boolean success = sendOptimizedCommand(cmdType, value);
        
        if (success) {
            // 更新缓存状态
            statusMap.put(this.machineNo, this.ticaInnerStatus);
            Log.e(TAG, "空调控制命令执行成功！");
            return true;
        } else {
            Log.e(TAG, "空调控制命令失败");
            return false;
        }
    }
    
    /**
     * 优化的空调控制命令发送（双重策略，优先原协议）
     */
    private boolean sendOptimizedCommand(int cmdType, int value) {
        Log.e(TAG, "*** 开始双重策略控制（优先原协议） ***");
        Log.e(TAG, "命令类型: " + getCommandTypeName(cmdType) + ", 值: " + value);
        
        // 策略A：优先尝试原应用协议的完整写入（完全模拟原报文）
        Log.e(TAG, "策略A：尝试原应用协议完整写入（功能码10）");
        boolean originalProtocolSuccess = sendOriginalProtocolCommand(cmdType, value);
        if (originalProtocolSuccess) {
            Log.e(TAG, "策略A成功！使用原应用协议");
            return true;
        }
        
        // 策略B：如果原协议失败，尝试单寄存器写入（修复后）
        Log.e(TAG, "策略A失败，尝试策略B：单寄存器写入（功能码06，已修夏bug）");
        boolean singleRegisterSuccess = trySingleRegisterWrite(cmdType, value);
        if (singleRegisterSuccess) {
            Log.e(TAG, "策略B成功！使用单寄存器写入");
            return true;
        }
        
        Log.e(TAG, "双重策略都失败了");
        return false;
    }
    
    /**
     * 尝试单寄存器写入
     */
    private boolean trySingleRegisterWrite(int cmdType, int value) {
        int registerAddress = calculateRegisterAddress(cmdType);
        int registerValue = calculateRegisterValue(cmdType, value);
        
        Log.e(TAG, "单寄存器写入 - 地址: 0x" + String.format("%04X", registerAddress) + ", 值: " + registerValue);
        
        try {
            byte[] writeBytes = Rs485Utils.getInstance().getSingleWriteSendBytes(
                    AIR_ADDRESS, 6, registerAddress, registerValue);
            
            Log.e(TAG, "发送单寄存器报文: " + bytesToHex(writeBytes));
            
            byte[] response = Rs485Executor.getInstance().write(writeBytes, 300);
            
            if (Rs485Utils.getInstance().returnCheck(response, writeBytes)) {
                Log.e(TAG, "单寄存器写入成功！");
                
                boolean deviceResponded = checkDeviceResponse(cmdType, value);
                if (deviceResponded) {
                    Log.e(TAG, "设备已响应单寄存器命令");
                } else {
                    Log.w(TAG, "警告：单寄存器通信成功，但设备可能未实际响应");
                }
                return true;
            } else {
                Log.e(TAG, "单寄存器写入失败：响应校验不通过");
                return false;
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "单寄存器写入异常: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * 基于原应用协议的完整写入方法（作为备用方案）
     */
    private boolean sendOriginalProtocolCommand(int cmdType, int value) {
        Log.e(TAG, "使用原应用协议结构发送命令");
        
        // 构建18字节的数据结构（基于原报文分析）
        int[] registerValues = new int[9];
        
        // 初始化为全零
        for (int i = 0; i < 9; i++) {
            registerValues[i] = 0;
        }
        
        // 根据命令类型设置对应的寄存器值
        switch (cmdType) {
            case CMD_POWER:
                // 电源控制：先读取设备当前状态，使用当前的模式、温度、风速设置
                TicaInnerStatus currentStatus = readInnerStatus();
                int currentMode = 0x0001;    // 默认模式
                int currentTemp = 0x0018;    // 默认温度 24度
                int currentSpeed = 0x0003;   // 默认风速 3
                
                if (currentStatus != null) {
                    // 使用设备当前状态
                    currentMode = currentStatus.getSettingMode();
                    currentTemp = currentStatus.getSettingTemp();
                    currentSpeed = currentStatus.getSettingWindSpeed();
                    Log.e(TAG, "读取到设备当前状态: 模式=" + currentMode + ", 温度=" + currentTemp + ", 风速=" + currentSpeed);
                } else {
                    Log.e(TAG, "无法读取设备当前状态，使用默认值");
                }
                
                if (value == 1) {  // 电源开启
                    // 使用设备当前状态或默认值
                    registerValues[0] = currentMode;  // 使用当前模式
                    registerValues[1] = currentTemp;  // 使用当前温度
                    registerValues[2] = currentSpeed; // 使用当前风速
                    registerValues[3] = 0x0080; // 电源控制位（开启）
                    registerValues[4] = 0x0000; // 保留
                    registerValues[5] = 0x0001; // 控制位（开启时设置）
                    registerValues[6] = 0x0000; // 保留
                    registerValues[7] = 0x0000; // 保留
                    registerValues[8] = 0x0000; // 保留
                    Log.e(TAG, "设置电源开启: 模式=0x" + Integer.toHexString(currentMode) + 
                            ", 温度=" + currentTemp + "度, 风速=" + currentSpeed + ", 电源=0x80");
                } else {
                    // 电源关闭：根据真实关机报文结构
                    // 关机报文: 00 01 00 18 00 03 00 00 00 00 00 01 00 00 00 00 00 00
                    registerValues[0] = currentMode;  // 保持当前模式
                    registerValues[1] = currentTemp;  // 保持当前温度
                    registerValues[2] = currentSpeed; // 保持当前风速
                    registerValues[3] = 0x0000; // 关闭电源控制位
                    registerValues[4] = 0x0000; // 保留
                    registerValues[5] = 0x0001; // 关机时的控制位（根据真实报文）
                    registerValues[6] = 0x0000; // 保留
                    registerValues[7] = 0x0000; // 保留
                    registerValues[8] = 0x0000; // 保留
                    Log.e(TAG, "设置电源关闭: 模式=0x" + Integer.toHexString(currentMode) + 
                            ", 温度=" + currentTemp + "度, 风速=" + currentSpeed + ", 电源=0x00");
                }
                break;
            case CMD_MODE:
                // 模式控制：先读取设备当前状态，保持温度和风速设置
                TicaInnerStatus modeStatus = readInnerStatus();
                int keepTemp = 0x0018;    // 默认温度
                int keepSpeed = 0x0003;   // 默认风速
                
                if (modeStatus != null) {
                    keepTemp = modeStatus.getSettingTemp();
                    keepSpeed = modeStatus.getSettingWindSpeed();
                }
                
                registerValues[0] = value;    // 设置新模式
                registerValues[1] = keepTemp; // 保持当前温度
                registerValues[2] = keepSpeed;// 保持当前风速
                registerValues[3] = 0x0080;  // 保持电源开启
                registerValues[4] = 0x0000;  // 保留
                registerValues[5] = 0x0001;  // 控制位
                registerValues[6] = 0x0000;  // 保留
                registerValues[7] = 0x0000;  // 保留
                registerValues[8] = 0x0000;  // 保留
                Log.e(TAG, "设置模式: " + value + "，保持温度=" + keepTemp + "、风速=" + keepSpeed);
                break;
            case CMD_TEMP:
                // 温度控制：先读取设备当前状态，保持模式和风速设置
                TicaInnerStatus tempStatus = readInnerStatus();
                int keepMode = 0x0001;    // 默认模式
                int keepSpeed2 = 0x0003;  // 默认风速
                
                if (tempStatus != null) {
                    keepMode = tempStatus.getSettingMode();
                    keepSpeed2 = tempStatus.getSettingWindSpeed();
                }
                
                registerValues[0] = keepMode; // 保持当前模式
                registerValues[1] = value;    // 设置新温度
                registerValues[2] = keepSpeed2;// 保持当前风速
                registerValues[3] = 0x0080;  // 保持电源开启
                registerValues[4] = 0x0000;  // 保留
                registerValues[5] = 0x0001;  // 控制位
                registerValues[6] = 0x0000;  // 保留
                registerValues[7] = 0x0000;  // 保留
                registerValues[8] = 0x0000;  // 保留
                Log.e(TAG, "设置温度: " + value + "度，保持模式=" + keepMode + "、风速=" + keepSpeed2);
                break;
            case CMD_SPEED:
                // 风速控制：先读取设备当前状态，保持模式和温度设置
                TicaInnerStatus speedStatus = readInnerStatus();
                int keepMode2 = 0x0001;   // 默认模式
                int keepTemp2 = 0x0018;   // 默认温度
                
                if (speedStatus != null) {
                    keepMode2 = speedStatus.getSettingMode();
                    keepTemp2 = speedStatus.getSettingTemp();
                }
                
                registerValues[0] = keepMode2; // 保持当前模式
                registerValues[1] = keepTemp2; // 保持当前温度
                registerValues[2] = value;     // 设置新风速
                registerValues[3] = 0x0080;   // 保持电源开启
                registerValues[4] = 0x0000;   // 保留
                registerValues[5] = 0x0001;   // 控制位
                registerValues[6] = 0x0000;   // 保留
                registerValues[7] = 0x0000;   // 保留
                registerValues[8] = 0x0000;   // 保留
                Log.e(TAG, "设置风速: " + value + "，保持模式=" + keepMode2 + "、温度=" + keepTemp2);
                break;
        }
        
        try {
            // 使用功能码10（多寄存器写入），起始地址 0x0000
            byte[] writeBytes = Rs485Utils.getInstance().getWriteSendBytes(
                    AIR_ADDRESS,
                    16, // 功能码10
                    0x0000, // 起始地址（与原应用一致）
                    registerValues
            );
            
            Log.e(TAG, "发送原协议命令: " + bytesToHex(writeBytes));
            
            // 发送命令并等待响应
            byte[] response = Rs485Executor.getInstance().write(writeBytes, 300);
            
            // 检查响应
            if (Rs485Utils.getInstance().returnCheck(response, writeBytes)) {
                Log.e(TAG, "原协议命令成功！");
                
                // 检查设备响应
                boolean deviceResponded = checkDeviceResponse(cmdType, value);
                if (deviceResponded) {
                    Log.e(TAG, "设备已响应原协议命令");
                } else {
                    Log.w(TAG, "警告：原协议通信成功，但设备可能未实际响应");
                }
                return true;
            } else {
                Log.e(TAG, "原协议命令失败：响应校验不通过");
                return false;
            }
            
        } catch (InterruptedException e) {
            Log.e(TAG, "原协议命令异常: " + e.getMessage());
            return false;
        }
    }
    
    private int calculateRegisterAddress(int cmdType) {
        // 使用原应用Constant.smali中定义的正确地址常量
        switch (cmdType) {
            case CMD_POWER: 
                return AIR_POWER_ADDRESS;    // 0x3 - 电源控制地址
            case CMD_MODE: 
                return AIR_MODE_ADDRESS;     // 0x0 - 模式控制地址
            case CMD_TEMP: 
                return AIR_SET_TEMP_ADDRESS; // 0x1 - 温度控制地址
            case CMD_SPEED: 
                return AIR_SPEED_ADDRESS;    // 0x2 - 风速控制地址
            default: 
                return AIR_POWER_ADDRESS;    // 默认使用电源地址
        }
    }
    
    private int calculateRegisterValue(int cmdType, int value) {
        switch (cmdType) {
            case CMD_POWER: 
                // 使用原应用Constant.smali中定义的正确电源值
                int powerValue = (value == 1) ? AIR_POWER_ON : AIR_POWER_OFF;  // 开机=0x80(128), 关机=0x0
                Log.e(TAG, "电源控制值计算: 输入value=" + value + ", 输出powerValue=" + powerValue + " (0x" + Integer.toHexString(powerValue) + ")");
                return powerValue;
            default: 
                return value;
        }
    }
    
    private boolean checkDeviceResponse(int cmdType, int value) {
        try {
            Thread.sleep(500); // 等待设备响应
            TicaInnerStatus currentStatus = readInnerStatus();
            if (currentStatus == null) {
                Log.w(TAG, "无法读取设备状态来验证响应");
                return false;
            }
            
            switch (cmdType) {
                case CMD_POWER:
                    boolean expected = (value == 1);
                    boolean actual = currentStatus.isPowerSetting();
                    Log.e(TAG, "电源状态验证 - 期望: " + expected + ", 实际: " + actual);
                    return expected == actual;
                default:
                    return false; // 其他命令类型暂时不验证
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "设备响应检查异常: " + e.getMessage());
            return false;
        }
    }
    
    private String getCommandTypeName(int cmdType) {
        switch (cmdType) {
            case CMD_POWER: return "电源";
            case CMD_MODE: return "模式";
            case CMD_TEMP: return "温度";
            case CMD_SPEED: return "风速";
            default: return "未知";
        }
    }
    

    

    
    /**
     * 将接收到的数据转换为空调状态对象
     */
    private void convertToTicaInnerStatus(TicaInnerStatus status, byte[] data) {
        if (data == null || data.length < 32) {
            Log.e(TAG, "数据长度不足，无法解析");
            return;
        }
        
        int[] intData = Rs485Utils.getInstance().toIntArray(data);
        
        // 解析各项状态数据
        status.setSettingMode(intData[0]);
        status.setSettingTemp(intData[1]);
        status.setSettingWindSpeed(intData[2]);
        
        // 计算机器编号对应的电源位
        int iPow = (int) Math.pow(2.0d, (double) (this.machineNo - 1));
        status.setPowerSetting((intData[3] & iPow) != 0);
        
        // 解析温度数据
        status.setReturnAirTemperature(intData[8] / 10.0f);
        status.setIntakeTemperature(intData[9] / 10.0f);
        status.setMidDiskTemperature(intData[10] / 10.0f);
        status.setOutletTemperature(intData[11] / 10.0f);
        
        // 解析运行状态
        status.setModeRun(intData[4]);
        status.setWindSpeedStatus(intData[5]);
        status.setElectricAuxiliaryHeatingStatus(intData[6]);
        status.setWaterPumpStatus(intData[7]);
        
        // 解析错误状态
        if (intData.length > 12) {
            status.setTH1Error(intData[12]);
            status.setTH2Error(intData[13]);
            status.setTH3Error(intData[14]);
            status.setTH4Error(intData[15]);
        }
    }
    
    /**
     * 获取当前空调状态
     */
    public TicaInnerStatus getCurrentStatus() {
        return this.ticaInnerStatus;
    }
    
    /**
     * 获取指定机器编号的空调状态
     */
    public TicaInnerStatus getStatusByMachineNo(int machineNo) {
        if (statusMap.containsKey(machineNo)) {
            return statusMap.get(machineNo);
        }
        return null;
    }
    
    /**
     * 获取所有空调状态
     */
    public Map<Integer, TicaInnerStatus> getAllStatus() {
        return statusMap;
    }
    
    /**
     * 读取当前空调状态
     * 这是一个便捷方法，调用readInnerStatus并返回结果
     * 
     * @return 空调状态对象
     */
    public TicaInnerStatus readStatus() {
        return readInnerStatus();
    }
    
    /**
     * 设置空调模式
     * 
     * @param mode 模式值（1:制冷, 2:制热, 4:通风, 5:除湿）
     * @return 是否设置成功
     */
    public boolean setMode(int mode) {
        return sendCommand(CMD_MODE, mode);
    }
    
    /**
     * 设置空调温度
     * 
     * @param temp 温度值（通常为16-30）
     * @return 是否设置成功
     */
    public boolean setTemp(int temp) {
        return sendCommand(CMD_TEMP, temp);
    }
    
    /**
     * 设置空调风速
     * 
     * @param speed 风速值（0:低风, 1:中风, 2:高风, 3:自动）
     * @return 是否设置成功
     */
    public boolean setWindSpeed(int speed) {
        return sendCommand(CMD_SPEED, speed);
    }
    
    /**
     * 设置空调电源
     * 
     * @param power 电源值（0:关机, 1:开机）
     * @return 是否设置成功
     */
    public boolean setPower(int power) {
        return sendCommand(CMD_POWER, power == 0 ? POWER_OFF : POWER_ON);
    }
    

    
    /**
     * 使用单寄存器写入（功能码06）（策略4）
     */
    private byte[] writeSingleRegister(int cmdType, int value) {
        Log.e(TAG, "尝试策略4：使用单寄存器写入（功能码06）");
        
        // 尝试多个可能的寄存器地址
        int[] possibleAddresses = {
            0x0000, 0x0001, 0x0002, 0x0003, // 基础地址
            0x0010, 0x0011, 0x0012, 0x0013, // 偏移16
            0x0020, 0x0021, 0x0022, 0x0023, // 偏移32
            0x0040, 0x0041, 0x0042, 0x0043, // 偏移64
            0x0050, 0x0051, 0x0052, 0x0053, // 偏移80
            0x0060, 0x0061, 0x0062, 0x0063  // 偏移96
        };
        
        // 根据命令类型选择地址偏移
        int addressOffset;
        int registerValue;
        
        switch (cmdType) {
            case CMD_POWER:
                addressOffset = 3; // 电源通常在偏移3
                registerValue = value == POWER_ON ? 1 : 0; // 简化电源值
                Log.e(TAG, "写入电源控制，值: " + registerValue);
                break;
            case CMD_MODE:
                addressOffset = 0; // 模式通常在偏移0
                registerValue = value;
                Log.e(TAG, "写入模式控制，值: " + registerValue);
                break;
            case CMD_TEMP:
                addressOffset = 1; // 温度通常在偏移1
                registerValue = value;
                Log.e(TAG, "写入温度控制，值: " + registerValue);
                break;
            case CMD_SPEED:
                addressOffset = 2; // 风速通常在偏移2
                registerValue = value;
                Log.e(TAG, "写入风速控制，值: " + registerValue);
                break;
            default:
                addressOffset = 3;
                registerValue = value;
                break;
        }
        
        // 选择第一个尝试的地址（从最简单的开始）
        int registerAddress = possibleAddresses[addressOffset]; // 先尝试基础地址
        Log.e(TAG, "尝试寄存器地址: 0x" + String.format("%04X", registerAddress) + ", 值: " + registerValue);
        
        // 使用功能码06（单寄存器写入）
        return Rs485Utils.getInstance().getSingleWriteSendBytes(
                AIR_ADDRESS,
                6, // 功能码06
                registerAddress,
                registerValue
        );
    }
    

    
    /**
     * 系统性尝试多个地址的单寄存器写入（策略6）
     */
    private boolean tryMultipleSingleRegisterAddresses(int cmdType, int value) {
        Log.e(TAG, "尝试策略6：系统性尝试多个地址的单寄存器写入");
        
        // 定义要尝试的地址列表
        int[] addressesToTry = {
            // 基础地址范围
            0x0000, 0x0001, 0x0002, 0x0003,
            // 常见偏移地址
            0x0010, 0x0011, 0x0012, 0x0013,
            0x0020, 0x0021, 0x0022, 0x0023,
            0x0040, 0x0041, 0x0042, 0x0043,
            0x0050, 0x0051, 0x0052, 0x0053,
            0x0060, 0x0061, 0x0062, 0x0063,
            // 其他可能的地址
            0x0100, 0x0101, 0x0102, 0x0103
        };
        
        // 计算寄存器值
        int registerValue;
        switch (cmdType) {
            case CMD_POWER:
                registerValue = value == POWER_ON ? 1 : 0;
                Log.e(TAG, "尝试电源控制，值: " + registerValue);
                break;
            case CMD_MODE:
                registerValue = value;
                Log.e(TAG, "尝试模式控制，值: " + registerValue);
                break;
            case CMD_TEMP:
                registerValue = value;
                Log.e(TAG, "尝试温度控制，值: " + registerValue);
                break;
            case CMD_SPEED:
                registerValue = value;
                Log.e(TAG, "尝试风速控制，值: " + registerValue);
                break;
            default:
                registerValue = value;
                break;
        }
        
        // 逐个尝试每个地址
        for (int i = 0; i < Math.min(5, addressesToTry.length); i++) { // 限制尝试5个地址，避免过长
            int registerAddress = addressesToTry[i];
            Log.e(TAG, "尝试地址 " + (i+1) + "/5: 0x" + String.format("%04X", registerAddress));
            
            try {
                // 生成写入命令
                byte[] writeBytes = Rs485Utils.getInstance().getSingleWriteSendBytes(
                        AIR_ADDRESS,
                        6, // 功能码06
                        registerAddress,
                        registerValue
                );
                
                // 发送命令并等待响应
                byte[] response = Rs485Executor.getInstance().write(writeBytes, 300);
                
                // 检查响应
                if (Rs485Utils.getInstance().returnCheck(response, writeBytes)) {
                    Log.e(TAG, "策略6成功！地址: 0x" + String.format("%04X", registerAddress) + ", 值: " + registerValue);
                    return true;
                } else {
                    Log.e(TAG, "地址 0x" + String.format("%04X", registerAddress) + " 失败，继续尝试下一个");
                }
                
            } catch (InterruptedException e) {
                Log.e(TAG, "地址 0x" + String.format("%04X", registerAddress) + " 异常: " + e.getMessage());
            }
        }
        
        Log.e(TAG, "策略6：所有地址都尝试失败");
        return false;
    }
    
    /**
     * 将字节数组转换为十六进制字符串（用于调试）
     */
    private String bytesToHex(byte[] bytes) {
        if (bytes == null) return "null";
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X ", b & 0xFF));
        }
        return sb.toString().trim();
    }
}
