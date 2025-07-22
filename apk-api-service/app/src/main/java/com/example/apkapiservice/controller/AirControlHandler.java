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
    
    // 电源常量
    public static final int POWER_ON = 128;   // 开机
    public static final int POWER_OFF = 0;    // 关机
    
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
        // 创建一个新的状态对象，避免修改原有对象
        TicaInnerStatus status = new TicaInnerStatus(this.machineNo, 
                this.ticaInnerStatus != null && !TextUtils.isEmpty(this.ticaInnerStatus.getRoomName()) ? 
                this.ticaInnerStatus.getRoomName() : "房间" + this.machineNo);
        
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(
                AIR_ADDRESS, 
                READ_FUNCTION_CODE, 
                ((this.machineNo - 1) * 16) + INNER_START_ADDRESS, 
                16
        );
        
        boolean success = false;
        try {
            Log.d(TAG, "尝试通过串口读取空调状态");
            byte[] response = Rs485Executor.getInstance().write(readSendBytes, 300);
            
            if (response != null && Rs485Utils.getInstance().returnCheck(response, readSendBytes)) {
                Log.d(TAG, "串口通信成功，解析响应数据");
                convertToTicaInnerStatus(status, Rs485Utils.getInstance().calReadDataArray(response));
                status.setMachineNo(this.machineNo);
                status.setDeviceSn(String.valueOf(this.machineNo));
                
                // 更新缓存状态
                this.ticaInnerStatus = status;
                statusMap.put(this.machineNo, status);
                success = true;
            } else {
                Log.e(TAG, "串口通信失败或校验失败，使用模拟数据");
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "读取空调内机状态失败", e);
        } catch (Exception e) {
            Log.e(TAG, "读取空调内机状态异常", e);
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
        
        // 计算机器编号对应的电源位
        int iPow = (int) Math.pow(2.0d, (double) (this.machineNo - 1));
        
        // 生成写入命令
        byte[] writeBytes = writeStatusToBytes(this.ticaInnerStatus, iPow);
        
        try {
            byte[] response = Rs485Executor.getInstance().write(writeBytes, 300);
            boolean success = Rs485Utils.getInstance().returnCheck(response, writeBytes);
            
            if (success) {
                // 更新缓存状态
                statusMap.put(this.machineNo, this.ticaInnerStatus);
                return true;
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "发送控制命令失败", e);
        }
        
        return false;
    }
    
    /**
     * 将状态对象转换为写入字节数组
     */
    private byte[] writeStatusToBytes(TicaInnerStatus status, int powerBit) {
        int[] values = new int[9];
        
        // 设置模式
        values[0] = status.getSettingMode();
        
        // 设置温度
        values[1] = status.getSettingTemp();
        
        // 设置风速
        values[2] = status.getSettingWindSpeed();
        
        // 设置电源状态
        values[3] = status.isPowerSetting() ? powerBit : 0;
        
        // 其他参数保持默认值
        values[4] = 0;
        values[5] = 0;
        values[6] = 0;
        values[7] = 0;
        values[8] = 0;
        
        // 生成写入命令
        return Rs485Utils.getInstance().getWriteSendBytes(
                AIR_ADDRESS,
                WRITE_FUNCTION_CODE,
                ((this.machineNo - 1) * 16) + INNER_START_ADDRESS,
                values
        );
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
}
