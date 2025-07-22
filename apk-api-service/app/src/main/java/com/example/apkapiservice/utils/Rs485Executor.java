package com.example.apkapiservice.utils;

import android.serialport.SerialPort;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * RS485通信执行器
 * 负责实际的串口通信操作
 */
public class Rs485Executor {
    private static final String TAG = "Rs485Executor";
    private static Rs485Executor instance;
    
    private SerialPort serialPort;
    private InputStream inputStream;
    private OutputStream outputStream;
    private final Lock lock = new ReentrantLock();
    
    // 串口路径
    private static final String SERIAL_PORT_PATH = "/dev/ttyS1";
    // 备用串口路径
    private static final String[] BACKUP_SERIAL_PATHS = {
        "/dev/ttyS0",
        "/dev/ttyS2",
        "/dev/ttyGS0",
        "/dev/ttyGS1"
    };
    private static final int BAUD_RATE = 9600;                   // 波特率
    private static final int READ_TIMEOUT = 1000;                // 读取超时时间(毫秒)
    
    // 串口权限相关
    private static final String BLUETOOTH_GROUP = "net_bt_stack";  // 蓝牙组名称
    private static final String BLUETOOTH_USER = "bluetooth";     // 蓝牙用户名称
    
    private Rs485Executor() {
        try {
            Log.d(TAG, "开始初始化串口执行器");
            
            // 检查应用是否有root权限
            boolean hasRootAccess = false;
            try {
                Process process = Runtime.getRuntime().exec("su -c id");
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line = reader.readLine();
                hasRootAccess = (line != null && line.contains("uid=0"));
                Log.d(TAG, "检查root权限: " + (hasRootAccess ? "有root权限" : "无root权限") + ", 输出: " + line);
            } catch (Exception e) {
                Log.e(TAG, "检查root权限失败: " + e.getMessage());
            }
            
            // 先尝试默认串口路径
            File portFile = new File(SERIAL_PORT_PATH);
            boolean portFound = false;
            String currentPath = SERIAL_PORT_PATH;
            
            // 检查所有串口路径并记录状态
            Log.d(TAG, "检查所有可能的串口路径");
            Log.d(TAG, "默认串口 " + SERIAL_PORT_PATH + " 存在状态: " + portFile.exists());
            for (String path : BACKUP_SERIAL_PATHS) {
                File file = new File(path);
                Log.d(TAG, "备用串口 " + path + " 存在状态: " + file.exists());
            }
            
            if (!portFile.exists()) {
                Log.e(TAG, "默认串口文件不存在: " + SERIAL_PORT_PATH + ", 尝试备用串口");
                
                // 尝试备用串口路径
                for (String backupPath : BACKUP_SERIAL_PATHS) {
                    File backupFile = new File(backupPath);
                    if (backupFile.exists()) {
                        Log.i(TAG, "找到可用的备用串口: " + backupPath);
                        portFile = backupFile;
                        currentPath = backupPath;
                        portFound = true;
                        break;
                    }
                }
                
                if (!portFound) {
                    Log.e(TAG, "所有串口路径均不可用");
                    return;
                }
            } else {
                portFound = true;
            }
            
            // 记录串口文件的权限信息
            Log.i(TAG, "串口文件权限检查: " + SERIAL_PORT_PATH);
            Log.i(TAG, "当前应用权限: " + (portFile.canRead() ? "r" : "-") + (portFile.canWrite() ? "w" : "-"));
            
            try {
                // 记录当前文件权限信息
                Process process = Runtime.getRuntime().exec("ls -l " + SERIAL_PORT_PATH);
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                while ((line = reader.readLine()) != null) {
                    Log.i(TAG, "串口文件信息: " + line);
                }
                reader.close();
            } catch (Exception e) {
                Log.e(TAG, "获取串口文件信息失败", e);
            }
            
            // 检查串口文件权限
            if (!portFile.canRead() || !portFile.canWrite()) {
                try {
                    // 尝试多种方式修改权限
                    Log.i(TAG, "尝试修改串口文件权限: " + SERIAL_PORT_PATH);
                    
                    // 方式1: 直接修改为666权限
                    Process process = Runtime.getRuntime().exec("su -c chmod 666 " + SERIAL_PORT_PATH);
                    process.waitFor();
                    Log.i(TAG, "尝试方式1完成");
                    
                    // 方式2: 尝试添加当前用户到蓝牙组
                    process = Runtime.getRuntime().exec("su -c chown " + BLUETOOTH_USER + ":" + BLUETOOTH_GROUP + " " + SERIAL_PORT_PATH);
                    process.waitFor();
                    Log.i(TAG, "尝试方式2完成");
                    
                    // 方式3: 尝试修改组权限
                    process = Runtime.getRuntime().exec("su -c chmod 660 " + SERIAL_PORT_PATH);
                    process.waitFor();
                    Log.i(TAG, "尝试方式3完成");
                    
                    // 再次检查权限
                    if (!portFile.canRead() || !portFile.canWrite()) {
                        Log.e(TAG, "串口文件权限不足: " + SERIAL_PORT_PATH + ", 尝试修改权限失败");
                        Log.e(TAG, "当前权限: " + (portFile.canRead() ? "r" : "-") + (portFile.canWrite() ? "w" : "-"));
                        
                        // 尝试获取当前文件权限信息
                        process = Runtime.getRuntime().exec("ls -l " + SERIAL_PORT_PATH);
                        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                        String line;
                        while ((line = reader.readLine()) != null) {
                            Log.e(TAG, "串口文件信息: " + line);
                        }
                        reader.close();
                    } else {
                        Log.i(TAG, "成功修改串口文件权限");
                    }
                } catch (Exception e) {
                    Log.e(TAG, "尝试修改串口文件权限失败", e);
                }
            } else {
                Log.i(TAG, "串口文件权限正常");
            }
            
            try {
                // 打开串口
                Log.i(TAG, "尝试打开串口: " + currentPath + ", 波特率: " + BAUD_RATE);
                
                // 记录当前进程信息
                try {
                    Process process = Runtime.getRuntime().exec("id");
                    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        Log.d(TAG, "当前进程信息: " + line);
                    }
                    reader.close();
                } catch (Exception e) {
                    Log.e(TAG, "无法获取进程信息", e);
                }
                
                // 尝试不同的打开方式
                Exception lastException = null;
                
                try {
                    // 方式1: 直接打开
                    Log.d(TAG, "方式1: 直接打开串口");
                    serialPort = new SerialPort(portFile, BAUD_RATE, 0);
                    Log.i(TAG, "直接打开串口成功");
                } catch (Exception e) {
                    lastException = e;
                    Log.e(TAG, "直接打开串口失败: " + e.getMessage(), e);
                    
                    try {
                        // 方式2: 尝试使用root权限打开
                        Log.d(TAG, "方式2: 尝试使用root权限打开");
                        Process process = Runtime.getRuntime().exec("su -c chmod 666 " + currentPath);
                        int result = process.waitFor();
                        Log.i(TAG, "尝试使用root权限修改权限后打开, 结果代码: " + result);
                        
                        // 检查权限是否已修改
                        process = Runtime.getRuntime().exec("ls -la " + currentPath);
                        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                        String line = reader.readLine();
                        Log.i(TAG, "权限修改后串口文件信息: " + line);
                        
                        serialPort = new SerialPort(portFile, BAUD_RATE, 0);
                        Log.i(TAG, "使用root权限打开串口成功");
                    } catch (Exception e2) {
                        lastException = e2;
                        Log.e(TAG, "使用root权限打开串口失败: " + e2.getMessage(), e2);
                        
                        try {
                            // 方式3: 尝试使用JNI直接访问
                            Log.d(TAG, "方式3: 尝试使用原生方式访问串口");
                            // 注意: 这里我们使用另一种构造方式
                            serialPort = SerialPort.class.getConstructor(String.class, int.class)
                                    .newInstance(currentPath, BAUD_RATE);
                            Log.i(TAG, "使用原生方式访问串口成功");
                        } catch (Exception e3) {
                            lastException = e3;
                            Log.e(TAG, "所有方式均失败，无法打开串口: " + e3.getMessage(), e3);
                            throw lastException; // 抛出最后一个异常，以便后续处理
                        }
                    }
                }
                
                // 获取输入输出流
                inputStream = serialPort.getInputStream();
                outputStream = serialPort.getOutputStream();
                Log.i(TAG, "串口打开成功: " + currentPath);
            } catch (SecurityException e) {
                Log.e(TAG, "串口权限不足，无法访问: " + SERIAL_PORT_PATH, e);
                Log.e(TAG, "请确保应用有root权限或者已经添加到蓝牙组");
                
                // 尝试使用其他方法获取权限
                try {
                    Log.i(TAG, "尝试使用其他方法获取串口权限");
                    
                    // 尝试使用su命令直接打开串口
                    Process process = Runtime.getRuntime().exec("su -c cat " + SERIAL_PORT_PATH);
                    int exitCode = process.waitFor();
                    Log.i(TAG, "尝试使用su命令访问串口，返回码: " + exitCode);
                    
                    // 如果可以访问，则尝试再次修改权限
                    if (exitCode == 0) {
                        process = Runtime.getRuntime().exec("su -c chmod 777 " + SERIAL_PORT_PATH);
                        process.waitFor();
                        Log.i(TAG, "尝试使用su命令修改串口权限为777");
                        
                        // 再次尝试打开串口
                        try {
                            serialPort = new SerialPort(portFile, BAUD_RATE, 0);
                            inputStream = serialPort.getInputStream();
                            outputStream = serialPort.getOutputStream();
                            Log.i(TAG, "串口打开成功: " + SERIAL_PORT_PATH);
                        } catch (Exception e2) {
                            Log.e(TAG, "再次尝试打开串口失败", e2);
                        }
                    }
                } catch (Exception e2) {
                    Log.e(TAG, "尝试使用其他方法获取串口权限失败", e2);
                }
            } catch (UnsatisfiedLinkError e) {
                Log.e(TAG, "加载本地库失败: libserial_port.so, 请检查库文件是否存在于正确路径", e);
            } catch (Exception e) {
                Log.e(TAG, "打开串口失败: " + SERIAL_PORT_PATH + ", 请检查设备配置和权限", e);
            }
        } catch (Exception e) {
            Log.e(TAG, "Rs485Executor初始化过程中发生异常", e);
        }
    }
    
    public static Rs485Executor getInstance() {
        if (instance == null) {
            synchronized (Rs485Executor.class) {
                if (instance == null) {
                    instance = new Rs485Executor();
                }
            }
        }
        return instance;
    }
    
    /**
     * 向串口写入数据并读取响应
     *
     * @param data    要写入的数据
     * @param timeout 读取响应的超时时间(毫秒)
     * @return 读取到的响应数据
     * @throws InterruptedException 如果线程被中断
     */
    public byte[] write(byte[] data, int timeout) throws InterruptedException {
        if (serialPort == null) {
            Log.e(TAG, "串口未初始化或初始化失败，无法进行串口通信。请检查串口设备是否存在及权限设置");
            return null;
        }
        
        lock.lock();
        try {
            if (outputStream == null || inputStream == null) {
                Log.e(TAG, "串口流未初始化，无法进行串口通信");
                return null;
            }
            
            // 清空输入缓冲区
            try {
                int available = inputStream.available();
                if (available > 0) {
                    inputStream.skip(available);
                }
            } catch (IOException e) {
                Log.e(TAG, "清空输入缓冲区失败: " + e.getMessage());
            }
            
            // 写入数据
            try {
                outputStream.write(data);
                outputStream.flush();
                
                // 打印发送的数据
                StringBuilder sb = new StringBuilder();
                for (byte b : data) {
                    sb.append(String.format("%02X ", b & 0xFF));
                }
                Log.d(TAG, "发送数据: " + sb.toString());
            } catch (IOException e) {
                Log.e(TAG, "写入数据失败: " + e.getMessage() + ", 请检查串口连接是否正常");
                return null;
            } catch (Exception e) {
                Log.e(TAG, "写入数据时发生异常: " + e.getMessage());
                return null;
            }
            
            // 读取响应
            return readResponse(timeout);
        } finally {
            lock.unlock();
        }
    }
    
    /**
     * 从串口读取响应数据
     *
     * @param timeout 超时时间(毫秒)
     * @return 读取到的响应数据
     * @throws InterruptedException 如果线程被中断
     */
    private byte[] readResponse(int timeout) throws InterruptedException {
        byte[] buffer = new byte[128];
        int bytesRead = 0;
        long startTime = System.currentTimeMillis();
        
        try {
            // 等待数据到达
            Thread.sleep(50); // 给设备一点响应时间
            
            while (System.currentTimeMillis() - startTime < timeout) {
                if (inputStream.available() > 0) {
                    int readCount = inputStream.read(buffer, bytesRead, buffer.length - bytesRead);
                    if (readCount > 0) {
                        bytesRead += readCount;
                    }
                    
                    // 检查是否已经接收到完整的响应
                    if (bytesRead >= 5) { // 至少包含从机地址、功能码、数据长度字段和CRC校验
                        // 对于Modbus RTU协议，我们需要检查数据是否完整
                        if (buffer[1] == 0x03 || buffer[1] == 0x04) { // 读取功能码
                            int dataLength = buffer[2] & 0xFF;
                            if (bytesRead >= dataLength + 5) { // 从机地址(1) + 功能码(1) + 数据长度(1) + 数据(n) + CRC(2)
                                break;
                            }
                        } else if (buffer[1] == 0x06 || buffer[1] == 0x10) { // 写入功能码
                            if (bytesRead >= 8) { // 从机地址(1) + 功能码(1) + 地址(2) + 值/长度(2) + CRC(2)
                                break;
                            }
                        }
                    }
                    
                    // 防止缓冲区溢出
                    if (bytesRead >= buffer.length) {
                        break;
                    }
                } else {
                    // 如果没有数据可读，短暂休眠以避免CPU占用过高
                    Thread.sleep(10);
                }
            }
        } catch (IOException e) {
            Log.e(TAG, "读取响应数据失败: " + e.getMessage() + ", 请检查串口连接是否正常");
            return null;
        } catch (Exception e) {
            Log.e(TAG, "读取响应数据时发生异常: " + e.getMessage());
            return null;
        }
        
        if (bytesRead > 0) {
            byte[] result = new byte[bytesRead];
            System.arraycopy(buffer, 0, result, 0, bytesRead);
            
            // 打印接收到的数据
            StringBuilder sb = new StringBuilder();
            for (byte b : result) {
                sb.append(String.format("%02X ", b & 0xFF));
            }
            Log.d(TAG, "接收数据: " + sb.toString());
            
            return result;
        } else {
            Log.w(TAG, "在超时时间内未收到响应数据，请检查设备是否工作正常");
            return null;
        }
    }
    
    /**
     * 关闭串口
     */
    public void close() {
        lock.lock();
        try {
            if (serialPort != null) {
                try {
                    if (inputStream != null) {
                        inputStream.close();
                        inputStream = null;
                    }
                    if (outputStream != null) {
                        outputStream.close();
                        outputStream = null;
                    }
                } catch (IOException e) {
                    Log.e(TAG, "Error closing streams: " + e.getMessage());
                }
                
                serialPort.close();
                serialPort = null;
                Log.i(TAG, "Serial port closed");
            }
        } finally {
            lock.unlock();
        }
    }
}
