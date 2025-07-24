package com.example.apkapiservice.controller;

import android.util.Log;

import com.example.apkapiservice.bean.WindStatus;
import com.example.apkapiservice.utils.Rs485Executor;
import com.example.apkapiservice.utils.Rs485Utils;

/**
 * 新风控制处理器
 * 负责与新风设备通信，获取状态和发送控制命令
 */
public class WindControlHandler {
    private static final String TAG = "WindControlHandler";
    private static WindControlHandler instance;
    
    // RS485通信相关常量
    private static final int WIND_ADDRESS = 2;
    private static final int READ_FUNCTION_CODE = 3;
    private static final int WRITE_FUNCTION_CODE = 6;
    private static final int START_ADDRESS_TEMP = 0;
    private static final int READ_LENGTH_TEMP = 16;
    private static final int START_ADDRESS_SYSTEM = 50;
    private static final int READ_LENGTH_SYSTEM = 4;
    
    // 数据索引常量
    private static final int INDEX_SHOW_TEMP = 15;
    private static final int INDEX_SHOW_HUMIDITY = 11;
    private static final int INDEX_SWITCH = 0;
    private static final int INDEX_MODE = 1;
    private static final int INDEX_WIND_SPEED = 2;
    private static final int INDEX_HUMIDIFICATION = 3;
    
    // 新风模式常量
    public static final int MODE_WIND = 0;      // 通风模式
    public static final int MODE_COOL = 1;      // 制冷模式
    public static final int MODE_DRY = 2;       // 除湿模式
    public static final int MODE_HEAT = 3;      // 制热模式
    public static final int MODE_AUTO = 4;      // 自动模式
    
    // 风速常量
    public static final int SPEED_HIGH = 0;     // 高风速
    public static final int SPEED_MEDIUM = 1;   // 中风速
    public static final int SPEED_LOW = 2;      // 低风速
    
    // 新风控制寄存器地址常量（基于实际报文）
    private static final int WIND_POWER_LOW_ADDR = 0x0032;    // 低档风控制地址 (50)
    private static final int WIND_POWER_MED_ADDR = 0x0034;    // 中档风控制地址 (52)
    private static final int WIND_POWER_HIGH_ADDR = 0x0034;   // 高档风控制地址 (52)
    private static final int WIND_MODE_ADDR = 0x0033;         // 模式控制地址 (51)
    
    // 新风模式值常量（基于实际报文）
    public static final int MODE_VENTILATION = 0;  // 通风模式 (0x0000)
    public static final int MODE_DEHUMIDIFY = 2;   // 除湿模式 (0x0002)
    public static final int MODE_AUTO_NEW = 4;     // 自动模式 (0x0004)
    
    // 电源常量
    public static final int POWER_OFF = 0;      // 关机
    public static final int POWER_ON = 1;       // 开机
    
    // 加湿开关常量
    public static final int HUMIDITY_OFF = 0;   // 关闭加湿
    public static final int HUMIDITY_ON = 1;    // 开启加湿
    
    private String deviceSn = "71071";          // 设备序列号
    private WindStatus currentStatus;           // 当前新风状态
    private WindStatus tempStatus;              // 温湿度状态
    private WindStatus powerStatus;             // 电源状态
    
    private WindControlHandler() {
        this.currentStatus = new WindStatus();
        this.tempStatus = new WindStatus();
        this.powerStatus = new WindStatus();
    }
    
    public static WindControlHandler getInstance() {
        if (instance == null) {
            synchronized (WindControlHandler.class) {
                if (instance == null) {
                    instance = new WindControlHandler();
                }
            }
        }
        return instance;
    }
    
    /**
     * 设置设备序列号
     */
    public void setDeviceSn(String deviceSn) {
        this.deviceSn = deviceSn;
    }
    
    /**
     * 读取新风状态（包括温湿度和系统状态）
     */
    public WindStatus readStatus() {
        WindStatus tempStatus = readShowTemp();
        WindStatus systemStatus = readSystemStatus();
        
        // 合并温湿度和系统状态
        if (tempStatus != null && systemStatus != null) {
            systemStatus.setShowTemp(tempStatus.getShowTemp());
            systemStatus.setWindHumidity(tempStatus.getWindHumidity());
            systemStatus.setTypeTemp(tempStatus.isTypeTemp());
            this.currentStatus = systemStatus;
        } else if (tempStatus != null) {
            this.currentStatus = tempStatus;
        } else if (systemStatus != null) {
            this.currentStatus = systemStatus;
        }
        
        return this.currentStatus;
    }
    
    /**
     * 读取温湿度数据
     */
    public WindStatus readShowTemp() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(
                WIND_ADDRESS,
                READ_FUNCTION_CODE,
                START_ADDRESS_TEMP,
                READ_LENGTH_TEMP
        );
        
        try {
            Log.d(TAG, "尝试读取新风温湿度数据，设备地址: " + WIND_ADDRESS);
            byte[] response = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (response != null && Rs485Utils.getInstance().returnCheck(response, readSendBytes)) {
                Log.d(TAG, "读取新风温湿度数据成功");
                WindStatus status = parseData(true, response);
                this.tempStatus = status;
                return status;
            } else {
                Log.e(TAG, "读取新风温湿度数据失败，响应数据校验失败或为空");
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "读取新风温湿度数据失败", e);
        } catch (Exception e) {
            Log.e(TAG, "读取新风温湿度数据异常", e);
        }
        
        Log.e(TAG, "串口通信失败，无法获取新风温湿度数据。设备地址: " + WIND_ADDRESS);
        return null;
    }
    
    /**
     * 读取系统状态数据
     */
    public WindStatus readSystemStatus() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(
                WIND_ADDRESS,
                READ_FUNCTION_CODE,
                START_ADDRESS_SYSTEM,
                READ_LENGTH_SYSTEM
        );
        
        try {
            Log.d(TAG, "尝试读取新风系统状态，设备地址: " + WIND_ADDRESS + ", 起始地址: " + START_ADDRESS_SYSTEM);
            byte[] response = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (response != null && Rs485Utils.getInstance().returnCheck(response, readSendBytes)) {
                Log.d(TAG, "读取新风系统状态成功");
                WindStatus status = parseData(false, response);
                this.powerStatus = status;
                return status;
            } else {
                Log.e(TAG, "读取新风系统状态失败，响应数据校验失败或为空");
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "读取新风系统状态失败", e);
        } catch (Exception e) {
            Log.e(TAG, "读取新风系统状态异常", e);
        }
        
        Log.e(TAG, "串口通信失败，无法获取新风系统状态。设备地址: " + WIND_ADDRESS);
        return null;
    }
    
    /**
     * 解析接收到的数据
     *
     * @param isTemp 是否为温湿度数据
     * @param response 接收到的响应数据
     * @return 解析后的新风状态
     */
    private WindStatus parseData(boolean isTemp, byte[] response) {
        WindStatus status = new WindStatus();
        status.setTypeTemp(isTemp);
        
        byte[] data = Rs485Utils.getInstance().calReadDataArray(response);
        int[] intData = Rs485Utils.getInstance().toIntArray(data);
        
        if (isTemp) {
            // 解析温湿度数据
            if (intData.length > INDEX_SHOW_TEMP) {
                status.setShowTemp(intData[INDEX_SHOW_TEMP] / 10.0f);
            }
            if (intData.length > INDEX_SHOW_HUMIDITY) {
                status.setWindHumidity(intData[INDEX_SHOW_HUMIDITY] / 10.0f);
            }
        } else {
            // 解析系统状态数据
            if (intData.length > INDEX_SWITCH) {
                status.setPower(intData[INDEX_SWITCH]);
            }
            if (intData.length > INDEX_MODE) {
                status.setMode(intData[INDEX_MODE]);
            }
            if (intData.length > INDEX_WIND_SPEED) {
                status.setWindSpeed(intData[INDEX_WIND_SPEED]);
            }
            if (intData.length > INDEX_HUMIDIFICATION) {
                status.setHumiditySwitch(intData[INDEX_HUMIDIFICATION]);
            }
        }
        
        return status;
    }
    
    /**
     * 发送控制命令
     *
     * @param address 寄存器地址
     * @param value   命令值
     * @return 是否发送成功
     */
    public boolean sendCommand(int address, int value) {
        byte[] writeBytes = Rs485Utils.getInstance().getWriteSendBytes(
                WIND_ADDRESS,
                WRITE_FUNCTION_CODE,
                address,
                new int[]{value}
        );
        
        try {
            byte[] response = Rs485Executor.getInstance().write(writeBytes, 300);
            boolean success = Rs485Utils.getInstance().returnCheck(response, writeBytes);
            
            if (success) {
                // 更新状态
                updateStatus(address, value);
                return true;
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "发送新风控制命令失败", e);
        }
        
        return false;
    }
    
    /**
     * 设置电源状态
     *
     * @param power 电源状态（0关/1开）
     * @return 是否设置成功
     */
    public boolean setPower(int power) {
        return sendCommand(START_ADDRESS_SYSTEM + INDEX_SWITCH, power);
    }
    
    /**
     * 设置工作模式
     *
     * @param mode 工作模式
     * @return 是否设置成功
     */
    public boolean setMode(int mode) {
        return sendCommand(START_ADDRESS_SYSTEM + INDEX_MODE, mode);
    }
    
    /**
     * 设置风速
     *
     * @param speed 风速
     * @return 是否设置成功
     */
    public boolean setWindSpeed(int speed) {
        return sendCommand(START_ADDRESS_SYSTEM + INDEX_WIND_SPEED, speed);
    }
    
    /**
     * 设置加湿功能
     *
     * @param humiditySwitch 加湿开关（0关/1开）
     * @return 是否设置成功
     */
    public boolean setHumiditySwitch(int humiditySwitch) {
        return sendCommand(START_ADDRESS_SYSTEM + INDEX_HUMIDIFICATION, humiditySwitch);
    }
    
    /**
     * 根据命令更新状态
     */
    private void updateStatus(int address, int value) {
        int index = address - START_ADDRESS_SYSTEM;
        
        switch (index) {
            case INDEX_SWITCH:
                this.currentStatus.setPower(value);
                break;
            case INDEX_MODE:
                this.currentStatus.setMode(value);
                break;
            case INDEX_WIND_SPEED:
                this.currentStatus.setWindSpeed(value);
                break;
            case INDEX_HUMIDIFICATION:
                this.currentStatus.setHumiditySwitch(value);
                break;
        }
    }
    
    /**
     * 获取当前新风状态
     */
    public WindStatus getCurrentStatus() {
        return this.currentStatus;
    }
    
    // ==================== 基于实际报文的精确控制方法 ====================
    
    /**
     * 发送单寄存器控制命令（基于实际报文）
     * @param registerAddress 寄存器地址
     * @param registerValue 寄存器值
     * @return 是否成功
     */
    private boolean sendSingleRegisterCommand(int registerAddress, int registerValue) {
        try {
            byte[] writeBytes = Rs485Utils.getInstance().getSingleWriteSendBytes(
                    WIND_ADDRESS, WRITE_FUNCTION_CODE, registerAddress, registerValue);
            
            Log.d(TAG, "发送新风单寄存器报文: " + bytesToHex(writeBytes));
            
            byte[] response = Rs485Executor.getInstance().write(writeBytes, 300);
            
            if (Rs485Utils.getInstance().returnCheck(response, writeBytes)) {
                Log.d(TAG, "新风单寄存器控制成功！");
                return true;
            } else {
                Log.e(TAG, "新风单寄存器控制失败");
                return false;
            }
        } catch (InterruptedException e) {
            Log.e(TAG, "发送新风控制命令异常", e);
            return false;
        }
    }
    
    /**
     * 控制低档风电源（地址 0x0032）
     * @param power 0-关闭, 1-开启
     * @return 是否成功
     */
    public boolean setLowWindPower(int power) {
        Log.d(TAG, "设置低档风电源: " + (power == 1 ? "开启" : "关闭"));
        return sendSingleRegisterCommand(WIND_POWER_LOW_ADDR, power);
    }
    
    /**
     * 控制中档风电源（地址 0x0034）
     * @param power 0-关闭, 1-开启
     * @return 是否成功
     */
    public boolean setMediumWindPower(int power) {
        Log.d(TAG, "设置中档风电源: " + (power == 1 ? "开启" : "关闭"));
        return sendSingleRegisterCommand(WIND_POWER_MED_ADDR, power);
    }
    
    /**
     * 控制高档风电源（地址 0x0034）
     * @param power 0-关闭, 1-开启
     * @return 是否成功
     */
    public boolean setHighWindPower(int power) {
        Log.d(TAG, "设置高档风电源: " + (power == 1 ? "开启" : "关闭"));
        return sendSingleRegisterCommand(WIND_POWER_HIGH_ADDR, power);
    }
    
    /**
     * 统一的新风控制接口（基于实际报文）
     * @param speed 风速等级 (SPEED_LOW/SPEED_MEDIUM/SPEED_HIGH)
     * @param power 电源状态 (0-关闭, 1-开启)
     * @return 是否成功
     */
    public boolean controlWindBySpeed(int speed, int power) {
        Log.d(TAG, "统一新风控制 - 风速: " + speed + ", 电源: " + power);
        
        switch (speed) {
            case SPEED_LOW:
                return setLowWindPower(power);
            case SPEED_MEDIUM:
                return setMediumWindPower(power);
            case SPEED_HIGH:
                return setHighWindPower(power);
            default:
                Log.e(TAG, "不支持的风速等级: " + speed);
                return false;
        }
    }
    
    /**
     * 关闭所有档位的新风
     * @return 是否成功
     */
    public boolean turnOffAllWind() {
        Log.d(TAG, "关闭所有档位的新风");
        boolean success = true;
        success &= setLowWindPower(POWER_OFF);
        success &= setMediumWindPower(POWER_OFF);
        success &= setHighWindPower(POWER_OFF);
        return success;
    }
    
    // ==================== 新风模式控制方法 ====================
    
    /**
     * 设置新风模式（基于实际报文）
     * @param mode 模式值 (MODE_VENTILATION/MODE_DEHUMIDIFY/MODE_AUTO_NEW)
     * @return 是否成功
     */
    public boolean setWindMode(int mode) {
        String modeName;
        switch (mode) {
            case MODE_VENTILATION:
                modeName = "通风模式";
                break;
            case MODE_DEHUMIDIFY:
                modeName = "除湿模式";
                break;
            case MODE_AUTO_NEW:
                modeName = "自动模式";
                break;
            default:
                Log.e(TAG, "不支持的新风模式: " + mode);
                return false;
        }
        
        Log.d(TAG, "设置新风模式: " + modeName + " (" + mode + ")");
        return sendSingleRegisterCommand(WIND_MODE_ADDR, mode);
    }
    
    /**
     * 设置通风模式
     * @return 是否成功
     */
    public boolean setVentilationMode() {
        return setWindMode(MODE_VENTILATION);
    }
    
    /**
     * 设置除湿模式
     * @return 是否成功
     */
    public boolean setDehumidifyMode() {
        return setWindMode(MODE_DEHUMIDIFY);
    }
    
    /**
     * 设置自动模式
     * @return 是否成功
     */
    public boolean setAutoMode() {
        return setWindMode(MODE_AUTO_NEW);
    }
    
    /**
     * 字节数组转十六进制字符串
     */
    private String bytesToHex(byte[] bytes) {
        if (bytes == null) return "null";
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X ", b));
        }
        return sb.toString().trim();
    }
}
