package com.example.apkapiservice;

import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.format.Formatter;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.apkapiservice.bean.TicaInnerStatus;
import com.example.apkapiservice.bean.WindStatus;
import com.example.apkapiservice.controller.AirControlHandler;
import com.example.apkapiservice.controller.WindControlHandler;
import com.example.apkapiservice.service.ApiService;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

/**
 * 主活动
 * 提供用户界面和服务控制
 */
public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    
    private TextView tvServiceStatus;
    private TextView tvAirStatus;
    private TextView tvWindStatus;
    private TextView tvApiAddress;
    private TextView tvApiResponse;
    private Button btnStartService;
    private Button btnStopService;
    private Button btnRefreshStatus;
    
    // API测试按钮
    private Button btnTestAirStatus;
    private Button btnTestAirPowerOn;
    private Button btnTestAirPowerOff;
    private Button btnTestWindStatus;
    private Button btnTestWindPowerOn;
    private Button btnTestWindPowerOff;
    
    private String deviceIpAddress = "";
    private final int API_PORT = 8080;
    
    private boolean isServiceRunning = false;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        // 初始化视图
        initViews();
        
        // 设置点击事件
        setupClickListeners();
        
        // 更新服务状态
        updateServiceStatus();
    }
    
    /**
     * 初始化视图
     */
    private void initViews() {
        tvServiceStatus = findViewById(R.id.tv_service_status);
        tvAirStatus = findViewById(R.id.tv_air_status);
        tvWindStatus = findViewById(R.id.tv_wind_status);
        tvApiAddress = findViewById(R.id.tv_api_address);
        tvApiResponse = findViewById(R.id.tv_api_response);
        
        btnStartService = findViewById(R.id.btn_start_service);
        btnStopService = findViewById(R.id.btn_stop_service);
        btnRefreshStatus = findViewById(R.id.btn_refresh_status);
        
        // 初始化API测试按钮
        btnTestAirStatus = findViewById(R.id.btn_test_air_status);
        btnTestAirPowerOn = findViewById(R.id.btn_test_air_power_on);
        btnTestAirPowerOff = findViewById(R.id.btn_test_air_power_off);
        btnTestWindStatus = findViewById(R.id.btn_test_wind_status);
        btnTestWindPowerOn = findViewById(R.id.btn_test_wind_power_on);
        btnTestWindPowerOff = findViewById(R.id.btn_test_wind_power_off);
        
        // 获取设备IP地址并更新显示
        deviceIpAddress = getLocalIpAddress();
        updateApiAddressDisplay();
    }
    
    /**
     * 设置点击事件
     */
    private void setupClickListeners() {
        // 启动服务按钮
        btnStartService.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startApiService();
            }
        });
        
        // 停止服务按钮
        btnStopService.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                stopApiService();
            }
        });
        
        // 刷新状态按钮
        btnRefreshStatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                refreshDeviceStatus();
            }
        });
        
        // API测试按钮点击事件
        btnTestAirStatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/status", "GET");
            }
        });
        
        btnTestAirPowerOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=power&value=128", "GET");
            }
        });
        
        btnTestAirPowerOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=power&value=0", "GET");
            }
        });
        
        btnTestWindStatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/wind/status", "GET");
            }
        });
        
        btnTestWindPowerOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/wind/control?action=power&value=1", "GET");
            }
        });
        
        btnTestWindPowerOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/wind/control?action=power&value=0", "GET");
            }
        });
    }
    
    /**
     * 获取本地IP地址
     */
    private String getLocalIpAddress() {
        try {
            // 遍历所有网络接口
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                NetworkInterface networkInterface = networkInterfaces.nextElement();
                // 跳过回环和虚拟接口
                if (networkInterface.isLoopback() || networkInterface.isVirtual() || !networkInterface.isUp()) {
                    continue;
                }
                
                Enumeration<InetAddress> addresses = networkInterface.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress addr = addresses.nextElement();
                    if (addr instanceof Inet4Address) {
                        return addr.getHostAddress();
                    }
                }
            }
        } catch (SocketException e) {
            Log.e(TAG, "获取IP地址失败", e);
        }
        
        // 如果无法获取，返回默认值
        return "127.0.0.1";
    }
    
    /**
     * 更新API地址显示
     */
    private void updateApiAddressDisplay() {
        String apiAddress = "API服务地址：http://" + deviceIpAddress + ":" + API_PORT;
        tvApiAddress.setText(apiAddress);
    }
    
    /**
     * 测试API请求
     * @param endpoint API端点
     * @param method 请求方法
     */
    private void testApiRequest(final String endpoint, final String method) {
        // 更新UI显示正在请求
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                tvApiResponse.setText("正在发送请求...");
            }
        });
        
        // 创建后台线程发送请求
        new Thread(new Runnable() {
            @Override
            public void run() {
                HttpURLConnection connection = null;
                BufferedReader reader = null;
                final StringBuilder response = new StringBuilder();
                
                try {
                    // 构建完整URL - 使用127.0.0.1测试自己的请求
                    String urlString = "http://127.0.0.1:" + API_PORT + endpoint;
                    URL url = new URL(urlString);
                    
                    // 创建连接
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod(method);
                    connection.setConnectTimeout(5000);
                    connection.setReadTimeout(5000);
                    
                    // 获取响应状态码
                    int responseCode = connection.getResponseCode();
                    response.append("状态码: ").append(responseCode).append("\n");
                    
                    // 读取响应内容
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                        String line;
                        while ((line = reader.readLine()) != null) {
                            response.append(line).append("\n");
                        }
                    } else {
                        response.append("请求失败: ").append(connection.getResponseMessage());
                    }
                } catch (IOException e) {
                    response.append("请求异常: ").append(e.getMessage());
                    Log.e(TAG, "请求异常", e);
                } finally {
                    // 关闭连接和读取器
                    if (reader != null) {
                        try {
                            reader.close();
                        } catch (IOException e) {
                            Log.e(TAG, "关闭读取器失败", e);
                        }
                    }
                    if (connection != null) {
                        connection.disconnect();
                    }
                    
                    // 更新UI显示响应结果
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            tvApiResponse.setText(response.toString());
                        }
                    });
                }
            }
        }).start();
    }
    
    /**
     * 启动API服务
     */
    private void startApiService() {
        Intent serviceIntent = new Intent(this, ApiService.class);
        startService(serviceIntent);
        isServiceRunning = true;
        updateServiceStatus();
    }
    
    /**
     * 停止API服务
     */
    private void stopApiService() {
        Intent serviceIntent = new Intent(this, ApiService.class);
        stopService(serviceIntent);
        isServiceRunning = false;
        updateServiceStatus();
    }
    
    /**
     * 更新服务状态显示
     */
    private void updateServiceStatus() {
        if (isServiceRunning) {
            tvServiceStatus.setText("服务状态：运行中");
            btnStartService.setEnabled(false);
            btnStopService.setEnabled(true);
            btnRefreshStatus.setEnabled(true);
        } else {
            tvServiceStatus.setText("服务状态：已停止");
            btnStartService.setEnabled(true);
            btnStopService.setEnabled(false);
            btnRefreshStatus.setEnabled(false);
        }
    }
    
    /**
     * 刷新设备状态
     */
    private void refreshDeviceStatus() {
        // 创建后台线程读取设备状态
        new Thread(new Runnable() {
            @Override
            public void run() {
                // 读取空调状态
                final TicaInnerStatus airStatus = AirControlHandler.getInstance().readInnerStatus();
                
                // 读取新风状态
                final WindStatus windStatus = WindControlHandler.getInstance().readStatus();
                
                // 在UI线程更新显示
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        updateAirStatusDisplay(airStatus);
                        updateWindStatusDisplay(windStatus);
                    }
                });
            }
        }).start();
    }
    
    /**
     * 更新空调状态显示
     */
    private void updateAirStatusDisplay(TicaInnerStatus status) {
        if (status != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("空调状态：\n");
            sb.append("机器编号：").append(status.getMachineNo()).append("\n");
            sb.append("房间名称：").append(status.getRoomName()).append("\n");
            sb.append("电源状态：").append(status.isPowerSetting() ? "开" : "关").append("\n");
            sb.append("设定模式：").append(getModeString(status.getSettingMode())).append("\n");
            sb.append("设定温度：").append(status.getSettingTemp()).append("°C\n");
            sb.append("设定风速：").append(getSpeedString(status.getSettingWindSpeed())).append("\n");
            sb.append("回风温度：").append(status.getReturnAirTemperature()).append("°C");
            
            tvAirStatus.setText(sb.toString());
        } else {
            tvAirStatus.setText("空调状态：读取失败");
        }
    }
    
    /**
     * 更新新风状态显示
     */
    private void updateWindStatusDisplay(WindStatus status) {
        if (status != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("新风状态：\n");
            sb.append("电源状态：").append(status.getPower() == 1 ? "开" : "关").append("\n");
            sb.append("工作模式：").append(getWindModeString(status.getMode())).append("\n");
            sb.append("风速设置：").append(getWindSpeedString(status.getWindSpeed())).append("\n");
            sb.append("加湿功能：").append(status.getHumiditySwitch() == 1 ? "开" : "关").append("\n");
            sb.append("当前温度：").append(status.getShowTemp()).append("°C\n");
            sb.append("当前湿度：").append(status.getWindHumidity()).append("%");
            
            tvWindStatus.setText(sb.toString());
        } else {
            tvWindStatus.setText("新风状态：读取失败");
        }
    }
    
    /**
     * 获取空调模式字符串
     */
    private String getModeString(int mode) {
        switch (mode) {
            case AirControlHandler.MODE_COOL:
                return "制冷";
            case AirControlHandler.MODE_HEAT:
                return "制热";
            case AirControlHandler.MODE_FAN:
                return "通风";
            case AirControlHandler.MODE_DRY:
                return "除湿";
            default:
                return "未知(" + mode + ")";
        }
    }
    
    /**
     * 获取空调风速字符串
     */
    private String getSpeedString(int speed) {
        switch (speed) {
            case AirControlHandler.SPEED_LOW:
                return "低风";
            case AirControlHandler.SPEED_MEDIUM:
                return "中风";
            case AirControlHandler.SPEED_HIGH:
                return "高风";
            case AirControlHandler.SPEED_AUTO:
                return "自动";
            default:
                return "未知(" + speed + ")";
        }
    }
    
    /**
     * 获取新风模式字符串
     */
    private String getWindModeString(int mode) {
        switch (mode) {
            case WindControlHandler.MODE_WIND:
                return "通风";
            case WindControlHandler.MODE_COOL:
                return "制冷";
            case WindControlHandler.MODE_DRY:
                return "除湿";
            case WindControlHandler.MODE_HEAT:
                return "制热";
            case WindControlHandler.MODE_AUTO:
                return "自动";
            default:
                return "未知(" + mode + ")";
        }
    }
    
    /**
     * 获取新风风速字符串
     */
    private String getWindSpeedString(int speed) {
        switch (speed) {
            case WindControlHandler.SPEED_HIGH:
                return "高风";
            case WindControlHandler.SPEED_MEDIUM:
                return "中风";
            case WindControlHandler.SPEED_LOW:
                return "低风";
            default:
                return "未知(" + speed + ")";
        }
    }
}
