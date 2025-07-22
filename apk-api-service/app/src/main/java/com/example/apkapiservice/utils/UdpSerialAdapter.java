package com.example.apkapiservice.utils;

import android.util.Log;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

/**
 * 基于UDP Socket的串口通信适配器
 * 模拟原始应用中的vt_uart类，通过本地UDP Socket与系统服务通信
 */
public class UdpSerialAdapter {
    private static final String TAG = "UdpSerialAdapter";
    private static final int BUFFER_SIZE = 512;
    private static final String LOCAL_IP = "127.0.0.1";
    // 与系统串口服务通信的端口配置
    // 系统串口服务在端口10060监听，我们发送数据到该端口
    // 尝试监听10061（原始应用的接收端口），如果失败则使用10072
    private static final int PREFERRED_RECEIVE_PORT = 10061; // 优先尝试的接收端口
    private static final int FALLBACK_RECEIVE_PORT = 10072;  // 备用接收端口
    private static final int SYSTEM_SERIAL_PORT = 10060; // 系统串口服务端口
    
    private int actualReceivePort; // 实际使用的接收端口

    private DatagramSocket socket;
    private final ByteBuffer receiveBuffer = ByteBuffer.allocate(BUFFER_SIZE);
    private boolean isRunning = false;
    private UdpInputStream inputStream;
    private UdpOutputStream outputStream;
    
    /**
     * 启动UDP串口适配器
     */
    public void start() {
        // 先尝试绑定到优先端口（原始应用的接收端口）
        boolean success = false;
        
        try {
            Log.e(TAG, "UDP串口:尝试绑定优先端口: " + PREFERRED_RECEIVE_PORT);
            socket = new DatagramSocket(PREFERRED_RECEIVE_PORT);
            actualReceivePort = PREFERRED_RECEIVE_PORT;
            Log.e(TAG, "UDP串口:成功绑定到优先端口: " + PREFERRED_RECEIVE_PORT);
            success = true;
        } catch (SocketException e) {
            Log.w(TAG, "UDP串口:无法绑定优先端口" + PREFERRED_RECEIVE_PORT + ", 尝试备用端口: " + e.getMessage());
            
            // 尝试备用端口
            try {
                Log.e(TAG, "UDP串口:尝试绑定备用端口: " + FALLBACK_RECEIVE_PORT);
                socket = new DatagramSocket(FALLBACK_RECEIVE_PORT);
                actualReceivePort = FALLBACK_RECEIVE_PORT;
                Log.e(TAG, "UDP串口:成功绑定到备用端口: " + FALLBACK_RECEIVE_PORT);
                success = true;
            } catch (SocketException e2) {
                Log.e(TAG, "UDP串口:无法绑定备用端口" + FALLBACK_RECEIVE_PORT + ", 尝试随机端口: " + e2.getMessage());
                
                // 最后尝试随机端口
                try {
                    socket = new DatagramSocket(); // 使用随机端口
                    actualReceivePort = socket.getLocalPort();
                    Log.e(TAG, "UDP串口:使用随机端口: " + actualReceivePort);
                    success = true;
                } catch (SocketException e3) {
                    Log.e(TAG, "UDP串口:所有端口绑定尝试均失败", e3);
                    isRunning = false;
                    return;
                }
            }
        }
        
        if (success) {
            isRunning = true;
            new Thread(new UdpReceiveThread()).start();
            Log.e(TAG, "UDP串口:接收线程已启动");
            inputStream = new UdpInputStream();
            outputStream = new UdpOutputStream();
            Log.e(TAG, "UDP串口适配器启动成功，使用端口: " + actualReceivePort);
        }
    }
    
    /**
     * 关闭UDP串口适配器
     */
    public void close() {
        isRunning = false;
        if (socket != null) {
            socket.close();
            socket = null;
        }
        Log.d(TAG, "UDP串口适配器已关闭");
    }
    
    /**
     * 设置串口参数（波特率、校验位等）
     * @param parity 校验位
     * @param baudRate 波特率
     */
    public void setup(int parity, int baudRate) {
        Log.d(TAG, "设置串口参数: 校验位=" + parity + ", 波特率=" + baudRate);
        // 这里应该发送一个特殊的UDP包给系统服务，通知其设置串口参数
        // 由于我们没有原始应用中的dmsg和dxml类，这里简化处理
        try {
            byte[] setupData = ("SETUP:" + parity + "," + baudRate).getBytes();
            transmit(setupData);
        } catch (IOException e) {
            Log.e(TAG, "设置串口参数失败", e);
        }
    }
    
    /**
     * 发送数据
     * @param data 要发送的数据
     * @throws IOException 发送异常
     */
    private void transmit(byte[] data) throws IOException {
        if (socket != null && isRunning) {
            try {
                DatagramPacket packet = new DatagramPacket(
                        data, 
                        data.length, 
                        InetAddress.getByName(LOCAL_IP), 
                        SYSTEM_SERIAL_PORT
                );
                socket.send(packet);
                Log.e(TAG, "发送数据到系统串口服务(" + SYSTEM_SERIAL_PORT + "): " + bytesToHex(data));
                Log.e(TAG, "我们的源端口: " + socket.getLocalPort() + ", 期望在端口" + socket.getLocalPort() + "接收响应");
            } catch (IOException e) {
                Log.e(TAG, "发送数据失败", e);
                throw e;
            }
        } else {
            Log.e(TAG, "UDP串口适配器未启动或已关闭");
            throw new IOException("UDP串口适配器未启动或已关闭");
        }
    }
    
    /**
     * 发送数据并等待接收响应
     * @param data 要发送的数据
     * @param expectedLength 期望接收的数据长度
     * @param timeoutMs 超时时间（毫秒）
     * @return 接收到的响应数据
     */
    public byte[] sendAndReceive(byte[] data, int expectedLength, int timeoutMs) {
        Log.d(TAG, "发送并接收数据: 期望长度=" + expectedLength + ", 超时=" + timeoutMs + "ms");
        byte[] result = null;
        
        try {
            // 清空接收缓冲区
            synchronized (receiveBuffer) {
                receiveBuffer.clear();
            }
            
            // 发送数据
            transmit(data);
            
            // 等待接收响应
            int waitInterval = 10; // 每次等待10ms
            int maxAttempts = timeoutMs / waitInterval;
            
            for (int i = 0; i < maxAttempts; i++) {
                TimeUnit.MILLISECONDS.sleep(waitInterval);
                
                synchronized (receiveBuffer) {
                    if (receiveBuffer.position() >= expectedLength) {
                        receiveBuffer.flip();
                        result = new byte[expectedLength];
                        receiveBuffer.get(result);
                        Log.d(TAG, "接收到数据: " + bytesToHex(result));
                        break;
                    }
                }
            }
        } catch (IOException | InterruptedException e) {
            Log.e(TAG, "发送接收数据异常", e);
        } finally {
            synchronized (receiveBuffer) {
                receiveBuffer.clear();
            }
        }
        
        return result;
    }
    
    /**
     * 获取输入流
     * @return 输入流
     */
    public InputStream getInputStream() {
        return inputStream;
    }
    
    /**
     * 获取输出流
     * @return 输出流
     */
    public OutputStream getOutputStream() {
        return outputStream;
    }
    
    /**
     * UDP接收线程
     */
    private class UdpReceiveThread implements Runnable {
        @Override
        public void run() {
            Log.e(TAG, "UDP接收线程已启动，监听端口: " + actualReceivePort);
            
            while (isRunning) {
                try {
                    byte[] buffer = new byte[BUFFER_SIZE];
                    DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
                    
                    Log.d(TAG, "等待接收UDP数据包...");
                    socket.receive(packet);
                    int length = packet.getLength();
                    
                    if (length > 0) {
                        byte[] data = new byte[length];
                        System.arraycopy(packet.getData(), 0, data, 0, length);
                        
                        Log.e(TAG, "*** 接收到UDP数据包 ***");
                        Log.e(TAG, "来源地址: " + packet.getAddress().getHostAddress());
                        Log.e(TAG, "来源端口: " + packet.getPort());
                        Log.e(TAG, "数据长度: " + length);
                        Log.e(TAG, "数据内容: " + bytesToHex(data));
                        
                        synchronized (receiveBuffer) {
                            if (receiveBuffer.remaining() < length) {
                                receiveBuffer.clear();
                                Log.d(TAG, "接收缓冲区已清空");
                            }
                            receiveBuffer.put(data);
                            Log.d(TAG, "数据已放入接收缓冲区，当前位置: " + receiveBuffer.position());
                        }
                    }
                } catch (IOException e) {
                    if (isRunning) {
                        Log.e(TAG, "UDP接收数据异常", e);
                    } else {
                        Log.d(TAG, "UDP接收线程已停止");
                    }
                }
            }
        }
    }
    
    /**
     * UDP输入流实现
     */
    private class UdpInputStream extends InputStream {
        private byte[] buffer = new byte[0];
        private int position = 0;
        
        @Override
        public int read() throws IOException {
            if (position >= buffer.length) {
                // 从UDP接收缓冲区获取新数据
                updateBufferFromReceiveBuffer();
                if (buffer.length == 0) {
                    return -1; // 没有数据可读
                }
            }
            
            return buffer[position++] & 0xff;
        }
        
        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            if (position >= buffer.length) {
                // 从UDP接收缓冲区获取新数据
                updateBufferFromReceiveBuffer();
                if (buffer.length == 0) {
                    return -1; // 没有数据可读
                }
            }
            
            int available = buffer.length - position;
            int readLen = Math.min(available, len);
            
            System.arraycopy(buffer, position, b, off, readLen);
            position += readLen;
            
            return readLen;
        }
        
        @Override
        public int available() throws IOException {
            // 检查当前缓冲区和接收缓冲区
            int currentAvailable = buffer.length - position;
            
            synchronized (receiveBuffer) {
                return currentAvailable + receiveBuffer.position();
            }
        }
        
        /**
         * 从UDP接收缓冲区更新输入流缓冲区
         */
        private void updateBufferFromReceiveBuffer() {
            synchronized (receiveBuffer) {
                if (receiveBuffer.position() > 0) {
                    // 从receiveBuffer读取数据
                    receiveBuffer.flip();
                    byte[] newData = new byte[receiveBuffer.remaining()];
                    receiveBuffer.get(newData);
                    receiveBuffer.clear();
                    
                    // 更新输入流缓冲区
                    buffer = newData;
                    position = 0;
                    
                    Log.e(TAG, "从UDP接收缓冲区读取数据到输入流: " + bytesToHex(newData));
                }
            }
        }
        
        /**
         * 设置缓冲区数据（已弃用，现在从receiveBuffer自动获取）
         * @param data 数据
         */
        @Deprecated
        public void setBuffer(byte[] data) {
            if (data != null) {
                buffer = data;
                position = 0;
            }
        }
    }
    
    /**
     * UDP输出流实现
     */
    private class UdpOutputStream extends OutputStream {
        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
        }
        
        @Override
        public void write(byte[] b, int off, int len) throws IOException {
            if (b == null || len <= 0) {
                return;
            }
            
            byte[] data = new byte[len];
            System.arraycopy(b, off, data, 0, len);
            transmit(data);
        }
    }
    
    /**
     * 将字节数组转换为十六进制字符串
     * @param bytes 字节数组
     * @return 十六进制字符串
     */
    private String bytesToHex(byte[] bytes) {
        if (bytes == null || bytes.length == 0) {
            return "";
        }
        
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X ", b & 0xff));
        }
        return sb.toString();
    }
}
