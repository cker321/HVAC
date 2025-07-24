package com.example.apkapiservice.utils;

import android.util.Log;

/**
 * RS485通信工具类
 * 用于处理RS485协议的数据发送和接收
 */
public class Rs485Utils {
    private static final String TAG = "Rs485Utils";
    private static Rs485Utils instance;

    private Rs485Utils() {
    }

    public static Rs485Utils getInstance() {
        if (instance == null) {
            synchronized (Rs485Utils.class) {
                if (instance == null) {
                    instance = new Rs485Utils();
                }
            }
        }
        return instance;
    }

    /**
     * 生成读取指令的字节数组
     *
     * @param slaveAddress 从机地址
     * @param functionCode 功能码
     * @param startAddress 起始地址
     * @param length       读取长度
     * @return 读取指令的字节数组
     */
    public byte[] getReadSendBytes(int slaveAddress, int functionCode, int startAddress, int length) {
        byte[] bytes = new byte[8];
        bytes[0] = (byte) slaveAddress;
        bytes[1] = (byte) functionCode;
        bytes[2] = (byte) (startAddress >> 8);
        bytes[3] = (byte) (startAddress & 0xFF);
        bytes[4] = (byte) (length >> 8);
        bytes[5] = (byte) (length & 0xFF);
        
        // 计算CRC校验码
        int crc = calculateCRC(bytes, 6);
        bytes[6] = (byte) (crc & 0xFF);
        bytes[7] = (byte) (crc >> 8);
        
        return bytes;
    }

    /**
     * 生成写入指令的字节数组
     *
     * @param slaveAddress 从机地址
     * @param functionCode 功能码
     * @param startAddress 起始地址
     * @param values       写入的值
     * @return 写入指令的字节数组
     */
    public byte[] getWriteSendBytes(int slaveAddress, int functionCode, int startAddress, int[] values) {
        int dataLength = values.length * 2;
        byte[] bytes = new byte[7 + dataLength];
        
        bytes[0] = (byte) slaveAddress;
        bytes[1] = (byte) functionCode;
        bytes[2] = (byte) (startAddress >> 8);
        bytes[3] = (byte) (startAddress & 0xFF);
        bytes[4] = (byte) (values.length >> 8);
        bytes[5] = (byte) (values.length & 0xFF);
        bytes[6] = (byte) dataLength;
        
        // 填充数据
        for (int i = 0; i < values.length; i++) {
            bytes[7 + i * 2] = (byte) (values[i] >> 8);
            bytes[8 + i * 2] = (byte) (values[i] & 0xFF);
        }
        
        // 计算CRC校验码
        int crc = calculateCRC(bytes, bytes.length - 2);
        bytes[bytes.length - 2] = (byte) (crc & 0xFF);
        bytes[bytes.length - 1] = (byte) (crc >> 8);
        
        return bytes;
    }
    
    /**
     * 生成单寄存器写入指令（功能码06）
     *
     * @param slaveAddress  从机地址
     * @param functionCode  功能码（通常为06）
     * @param registerAddress 寄存器地址
     * @param registerValue   寄存器值
     * @return 单寄存器写入指令的字节数组
     */
    public byte[] getSingleWriteSendBytes(int slaveAddress, int functionCode, int registerAddress, int registerValue) {
        byte[] bytes = new byte[8]; // 单寄存器写入命令长度固定为8字节
        
        bytes[0] = (byte) slaveAddress;
        bytes[1] = (byte) functionCode;
        bytes[2] = (byte) (registerAddress >> 8);
        bytes[3] = (byte) (registerAddress & 0xFF);
        bytes[4] = (byte) (registerValue >> 8);
        bytes[5] = (byte) (registerValue & 0xFF);
        
        // 计算CRC校验码
        int crc = calculateCRC(bytes, 6);
        bytes[6] = (byte) (crc & 0xFF);
        bytes[7] = (byte) (crc >> 8);
        
        return bytes;
    }

    /**
     * 校验返回数据是否正确
     *
     * @param response 返回的数据
     * @param request  请求的数据
     * @return 是否校验通过
     */
    public boolean returnCheck(byte[] response, byte[] request) {
        if (response == null || response.length < 5) {
            Log.e(TAG, "Response is null or too short");
            return false;
        }
        
        // 添加详细的调试日志
        // Log.e(TAG, "*** Modbus协议校验 ***");
        // Log.e(TAG, "请求数据: " + bytesToHex(request));
        // Log.e(TAG, "响应数据: " + bytesToHex(response));
        // Log.e(TAG, "请求从机地址: 0x" + String.format("%02X", request[0] & 0xFF));
        // Log.e(TAG, "响应从机地址: 0x" + String.format("%02X", response[0] & 0xFF));
        // Log.e(TAG, "请求功能码: 0x" + String.format("%02X", request[1] & 0xFF));
        // Log.e(TAG, "响应功能码: 0x" + String.format("%02X", response[1] & 0xFF));
        
        // 检查是否为Modbus异常响应
        if ((response[1] & 0x80) != 0) {
            int exceptionCode = response[2] & 0xFF;
            Log.e(TAG, "*** Modbus异常响应 ***");
            Log.e(TAG, "异常功能码: 0x" + String.format("%02X", response[1] & 0xFF));
            Log.e(TAG, "异常码: 0x" + String.format("%02X", exceptionCode));
            
            Log.e(TAG, "异常原因: " + getModbusExceptionMessage(exceptionCode));
            return false;
        }
        
        // 检查从机地址和功能码
        if (response[0] != request[0] || response[1] != request[1]) {
            Log.e(TAG, "Slave address or function code mismatch");
            Log.e(TAG, "地址匹配: " + (response[0] == request[0]));
            Log.e(TAG, "功能码匹配: " + (response[1] == request[1]));
            return false;
        }
        
        // 检查CRC校验
        int dataLength = response.length - 2;
        int crc = calculateCRC(response, dataLength);
        int responseCrc = ((response[response.length - 1] & 0xFF) << 8) | (response[response.length - 2] & 0xFF);
        
        if (crc != responseCrc) {
            Log.e(TAG, "CRC check failed");
            return false;
        }
        
        return true;
    }

    /**
     * 计算CRC校验码
     *
     * @param bytes  数据字节数组
     * @param length 计算长度
     * @return CRC校验码
     */
    public int calculateCRC(byte[] bytes, int length) {
        int crc = 0xFFFF;
        for (int i = 0; i < length; i++) {
            crc ^= bytes[i] & 0xFF;
            for (int j = 0; j < 8; j++) {
                if ((crc & 0x0001) != 0) {
                    crc >>= 1;
                    crc ^= 0xA001;
                } else {
                    crc >>= 1;
                }
            }
        }
        return crc;
    }

    /**
     * 从响应数据中提取数据部分
     *
     * @param response 响应数据
     * @return 提取的数据部分
     */
    public byte[] calReadDataArray(byte[] response) {
        if (response == null || response.length < 5) {
            return new byte[0];
        }
        
        int dataLength = response[2] & 0xFF;
        byte[] data = new byte[dataLength];
        System.arraycopy(response, 3, data, 0, dataLength);
        
        return data;
    }

    /**
     * 将字节数组转换为整型数组
     *
     * @param bytes 字节数组
     * @return 整型数组
     */
    public int[] toIntArray(byte[] bytes) {
        if (bytes == null || bytes.length < 2) {
            return new int[0];
        }
        
        int[] result = new int[bytes.length / 2];
        for (int i = 0; i < result.length; i++) {
            result[i] = ((bytes[i * 2] & 0xFF) << 8) | (bytes[i * 2 + 1] & 0xFF);
        }
        
        return result;
    }
    
    /**
     * 获取Modbus异常码的描述信息
     */
    private String getModbusExceptionMessage(int exceptionCode) {
        switch (exceptionCode) {
            case 0x01: return "非法功能码";
            case 0x02: return "非法数据地址";
            case 0x03: return "非法数据值";
            case 0x04: return "从机设备故障";
            case 0x05: return "确认";
            case 0x06: return "从机设备忙";
            case 0x08: return "内存奇偶校验错误";
            case 0x0A: return "网关路径不可用";
            case 0x0B: return "网关目标设备响应失败";
            default: return "未知异常码: 0x" + String.format("%02X", exceptionCode);
        }
    }
    
    /**
     * 将字节数组转换为十六进制字符串
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
