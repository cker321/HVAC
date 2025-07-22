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
        
        // 检查从机地址和功能码
        if (response[0] != request[0] || response[1] != request[1]) {
            Log.e(TAG, "Slave address or function code mismatch");
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
}
