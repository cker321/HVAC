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
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.apkapiservice.bean.HouseType;
import com.example.apkapiservice.bean.Room;
import com.example.apkapiservice.bean.TicaInnerStatus;
import com.example.apkapiservice.bean.WindStatus;
import com.example.apkapiservice.controller.AirControlHandler;
import com.example.apkapiservice.controller.RoomManager;
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
    private Button btnApplyHouseType;
    
    // 房间类型选择
    private RadioGroup rgHouseType;
    private RadioButton rbHouseT2;
    private RadioButton rbHouseT41;
    private RadioButton rbHouseT42;
    
    // 房间选择
    private RadioGroup rgRoomSelection;
    private TextView tvNoRooms;
    private int selectedRoomId = 1; // 默认选中第一个房间
    
    // API测试按钮
    private Button btnTestAirStatus;
    private Button btnTestAirPowerOn;
    private Button btnTestAirPowerOff;
    private Button btnTestWindStatus;
    private Button btnTestWindPowerOn;
    private Button btnTestWindPowerOff;
    private Button btnTestRoomInit;
    private Button btnTestRoomStatus;
    
    // 空调控制按钮
    private Button btnTestAirModeCool;
    private Button btnTestAirModeHeat;
    private Button btnTestAirTempDown;
    private Button btnTestAirTempUp;
    private Button btnTestAirSpeedLow;
    private Button btnTestAirSpeedMed;
    private Button btnTestAirSpeedHigh;
    private Button btnTestAirSpeedAuto;
    
    // 新风控制按钮
    private Button btnTestWindSpeedLow;
    private Button btnTestWindSpeedMed;
    private Button btnTestWindSpeedHigh;
    private Button btnTestWindSpeedLowOff;
    private Button btnTestWindSpeedMedOff;
    private Button btnTestWindSpeedHighOff;
    private Button btnTestWindAllOff;
    
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
        
        // 程序启动时自动启动服务（避免重复启动）
        autoStartServiceIfNeeded();
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
        btnApplyHouseType = findViewById(R.id.btn_apply_house_type);
        
        // 初始化房间类型选择
        rgHouseType = findViewById(R.id.rg_house_type);
        rbHouseT2 = findViewById(R.id.rb_house_t2);
        rbHouseT41 = findViewById(R.id.rb_house_t4_1);
        rbHouseT42 = findViewById(R.id.rb_house_t4_2);
        
        // 初始化房间选择
        rgRoomSelection = findViewById(R.id.rg_room_selection);
        tvNoRooms = findViewById(R.id.tv_no_rooms);
        
        // 初始化API测试按钮
        btnTestAirStatus = findViewById(R.id.btn_test_air_status);
        btnTestAirPowerOn = findViewById(R.id.btn_test_air_power_on);
        btnTestAirPowerOff = findViewById(R.id.btn_test_air_power_off);
        btnTestWindStatus = findViewById(R.id.btn_test_wind_status);
        btnTestWindPowerOn = findViewById(R.id.btn_test_wind_power_on);
        btnTestWindPowerOff = findViewById(R.id.btn_test_wind_power_off);
        
        // 添加房间API测试按钮
        btnTestRoomInit = findViewById(R.id.btn_test_room_init);
        btnTestRoomStatus = findViewById(R.id.btn_test_room_status);
        
        // 初始化空调控制按钮
        btnTestAirModeCool = findViewById(R.id.btn_test_air_mode_cool);
        btnTestAirModeHeat = findViewById(R.id.btn_test_air_mode_heat);
        btnTestAirTempDown = findViewById(R.id.btn_test_air_temp_down);
        btnTestAirTempUp = findViewById(R.id.btn_test_air_temp_up);
        btnTestAirSpeedLow = findViewById(R.id.btn_test_air_speed_low);
        btnTestAirSpeedMed = findViewById(R.id.btn_test_air_speed_med);
        btnTestAirSpeedHigh = findViewById(R.id.btn_test_air_speed_high);
        btnTestAirSpeedAuto = findViewById(R.id.btn_test_air_speed_auto);
        
        // 初始化新风控制按钮
        btnTestWindSpeedLow = findViewById(R.id.btn_test_wind_speed_low);
        btnTestWindSpeedMed = findViewById(R.id.btn_test_wind_speed_med);
        btnTestWindSpeedHigh = findViewById(R.id.btn_test_wind_speed_high);
        btnTestWindSpeedLowOff = findViewById(R.id.btn_test_wind_speed_low_off);
        btnTestWindSpeedMedOff = findViewById(R.id.btn_test_wind_speed_med_off);
        btnTestWindSpeedHighOff = findViewById(R.id.btn_test_wind_speed_high_off);
        btnTestWindAllOff = findViewById(R.id.btn_test_wind_all_off);
        
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
        
        // 应用户型设置按钮
        btnApplyHouseType.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                applyHouseType();
            }
        });
        
        // 测试获取空调状态（使用当前选中房间）
        btnTestAirStatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/status?machineNo=" + selectedRoomId, "GET");
            }
        });
        
        // 测试空调开机（使用当前选中房间）
        btnTestAirPowerOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=power&value=1&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        // 测试空调关机（使用当前选中房间）
        btnTestAirPowerOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=power&value=0&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        // 测试获取新风状态
        btnTestWindStatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/wind/status", "GET");
            }
        });
        
        // 测试新风开机
        btnTestWindPowerOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/wind/control", "POST", "{\"controlType\":\"power\",\"value\":1}");
            }
        });
        
        // 测试新风关机
        btnTestWindPowerOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/wind/control", "POST", "{\"controlType\":\"power\",\"value\":0}");
            }
        });
        
        // 测试房间初始化
        if (btnTestRoomInit != null) {
            btnTestRoomInit.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    testApiRequest("/api/rooms/init", "POST", "{}");
                }
            });
        }
        
        // 测试获取房间状态
        if (btnTestRoomStatus != null) {
            btnTestRoomStatus.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    testApiRequest("/api/rooms/status", "GET");
                }
            });
        }
        
        // 空调模式控制
        btnTestAirModeCool.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=mode&value=1&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        btnTestAirModeHeat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=mode&value=2&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        // 空调温度控制 降低空调当前温度
        btnTestAirTempDown.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 先获取当前空调温度，

                // 然后降低1度

                // 如果超过最低 不执行
                testApiRequest("/api/air/control?action=temp&value=20&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        btnTestAirTempUp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 先获取当前空调温度

                // 然后升高1度

                // 如果超过最高 不执行
                testApiRequest("/api/air/control?action=temp&value=26&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        // 空调风速控制
        btnTestAirSpeedLow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=speed&value=0&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        btnTestAirSpeedMed.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=speed&value=1&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        btnTestAirSpeedHigh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=speed&value=2&machineNo=" + selectedRoomId, "GET");
            }
        });

        btnTestAirSpeedAuto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=speed&value=3&machineNo=" + selectedRoomId, "GET");
            }
        });
        
        // 新风控制按钮点击事件
        btnTestWindSpeedLow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().setLowWindPower(WindControlHandler.POWER_ON);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("低风开启: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
            }
        });
        
        btnTestWindSpeedMed.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().setMediumWindPower(WindControlHandler.POWER_ON);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("中风开启: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
            }
        });
        
        btnTestWindSpeedHigh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().setHighWindPower(WindControlHandler.POWER_ON);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("高风开启: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
            }
        });
        
        btnTestWindSpeedLowOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().setLowWindPower(WindControlHandler.POWER_OFF);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("低风关闭: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
            }
        });
        
        btnTestWindSpeedMedOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().setMediumWindPower(WindControlHandler.POWER_OFF);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("中风关闭: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
            }
        });
        
        btnTestWindSpeedHighOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().setHighWindPower(WindControlHandler.POWER_OFF);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("高风关闭: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
            }
        });
        
        btnTestWindAllOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean success = WindControlHandler.getInstance().turnOffAllWind();
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                tvApiResponse.setText("关闭所有新风: " + (success ? "成功" : "失败"));
                            }
                        });
                    }
                }).start();
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
        testApiRequest(endpoint, method, null);
    }
    
    /**
     * 测试API请求
     * @param endpoint API端点
     * @param method 请求方法
     * @param jsonBody JSON请求体
     */
    private void testApiRequest(final String endpoint, final String method, final String jsonBody) {
        // 显示加载中
        tvApiResponse.setText("请求中...");
        
        Log.d(TAG, "testApiRequest endpoint: " + endpoint);
        Log.d(TAG, "testApiRequest method: " + method);
        Log.d(TAG, "testApiRequest jsonBody: " + jsonBody);
        new Thread(new Runnable() {
            @Override
            public void run() {
                String result = "请求失败";
                
                try {
                    String urlStr = "http://" + deviceIpAddress + ":" + API_PORT + endpoint;
                    URL url = new URL(urlStr);
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod(method);
                    connection.setConnectTimeout(5000);
                    connection.setReadTimeout(5000);
                    
                    // 如果有请求体，设置Content-Type并写入数据
                    if (jsonBody != null && !jsonBody.isEmpty()) {
                        connection.setRequestProperty("Content-Type", "application/json");
                        connection.setDoOutput(true);
                        connection.getOutputStream().write(jsonBody.getBytes("UTF-8"));
                    }
                    
                    int responseCode = connection.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        BufferedReader reader = new BufferedReader(
                                new InputStreamReader(connection.getInputStream()));
                        StringBuilder response = new StringBuilder();
                        String line;
                        
                        while ((line = reader.readLine()) != null) {
                            response.append(line);
                        }
                        
                        reader.close();
                        result = response.toString();
                    } else {
                        result = "请求失败，响应码: " + responseCode;
                    }
                    
                    connection.disconnect();
                } catch (IOException e) {
                    Log.e(TAG, "API请求失败", e);
                    result = "请求异常: " + e.getMessage();
                }
                
                final String finalResult = result;
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        tvApiResponse.setText(finalResult);
                    }
                });
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
     * 程序启动时自动启动服务（避免重复启动）
     */
    private void autoStartServiceIfNeeded() {
        // 检查服务是否已经在运行
        if (!isServiceRunning) {
            try {
                // 启动服务
                startApiService();
                
                // 显示自动启动信息
                if (tvApiResponse != null) {
                    tvApiResponse.setText("程序启动时自动启动API服务成功");
                }
                
                Log.d("MainActivity", "程序启动时自动启动API服务成功");
            } catch (Exception e) {
                Log.e("MainActivity", "自动启动服务失败: " + e.getMessage());
                if (tvApiResponse != null) {
                    tvApiResponse.setText("自动启动服务失败: " + e.getMessage());
                }
            }
        } else {
            Log.d("MainActivity", "服务已在运行，无需重复启动");
        }
    }
    
    /**
     * 应用户型设置
     */
    private void applyHouseType() {
        String houseType = "T4-1"; // 默认T4-1户型
        
        if (rbHouseT2.isChecked()) {
            houseType = "T2";
        } else if (rbHouseT41.isChecked()) {
            houseType = "T4-1";
        } else if (rbHouseT42.isChecked()) {
            houseType = "T4-2";
        } else {
            houseType = "T4-1";
        }
        
        final String finalHouseType = houseType;
        Log.d(TAG, "设置户型类型: applyHouseType finalHouseType: " + finalHouseType);
        
        // 更新房间选择
        updateRoomSelection(finalHouseType);
        
        testApiRequest("/api/house/type", "POST", "{\"houseType\":\"" + finalHouseType + "\"}");
    }
    
    /**
     * 刷新设备状态
     */
    private void refreshDeviceStatus() {
        // 显示加载中
        tvAirStatus.setText("空调状态：读取中...");
        tvWindStatus.setText("新风状态：读取中...");
        
        new Thread(new Runnable() {
            @Override
            public void run() {
                // 读取空调状态（使用当前选中房间）
                final TicaInnerStatus airStatus = AirControlHandler.getInstance().readStatus(selectedRoomId);
                
                // 读取新风状态
                final WindStatus windStatus = WindControlHandler.getInstance().readStatus();
                
                // 更新UI
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
    
    /**
     * 更新房间选择
     */
    private void updateRoomSelection(String houseType) {
        // 清除现有的房间选项
        rgRoomSelection.removeAllViews();
        
        // 根据户型获取房间列表
        HouseType hType = null;
        if ("T2".equals(houseType)) {
            hType = HouseType.T2;
        } else if ("T4-1".equals(houseType)) {
            hType = HouseType.T4_1;
        } else if ("T4-2".equals(houseType)) {
            hType = HouseType.T4_2;
        }
        
        if (hType != null) {
            java.util.List<Room> rooms = RoomManager.getInstance().getCurrentRooms();
            
            if (rooms != null && !rooms.isEmpty()) {
                // 隐藏“请先选择户型”提示
                tvNoRooms.setVisibility(View.GONE);
                
                // 为每个房间创建 RadioButton
                boolean isFirst = true;
                for (Room room : rooms) {
                    RadioButton rbRoom = new RadioButton(this);
                    rbRoom.setId(View.generateViewId());
                    rbRoom.setText(room.getRoomName());
                    rbRoom.setTag(room.getId()); // 将房间ID保存在tag中
                    
                    // 默认选中第一个房间
                    if (isFirst) {
                        rbRoom.setChecked(true);
                        selectedRoomId = room.getId();
                        isFirst = false;
                    }
                    
                    // 设置点击事件
                    rbRoom.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {
                        @Override
                        public void onCheckedChanged(android.widget.CompoundButton buttonView, boolean isChecked) {
                            if (isChecked) {
                                selectedRoomId = (Integer) buttonView.getTag();
                                Log.d(TAG, "选中房间: " + buttonView.getText() + ", ID: " + selectedRoomId);
                            }
                        }
                    });
                    
                    rgRoomSelection.addView(rbRoom);
                }
            } else {
                // 显示无房间提示
                tvNoRooms.setText("该户型暂无房间配置");
                tvNoRooms.setVisibility(View.VISIBLE);
            }
        } else {
            // 显示请先选择户型提示
            tvNoRooms.setText("请先选择户型");
            tvNoRooms.setVisibility(View.VISIBLE);
        }
    }
}
