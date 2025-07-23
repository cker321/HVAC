package com.example.apkapiservice;

import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.format.Formatter;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
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
    
    // API测试按钮
    private Button btnTestAirStatus;
    private Button btnTestAirPowerOn;
    private Button btnTestAirPowerOff;
    private Button btnTestWindStatus;
    private Button btnTestWindPowerOn;
    private Button btnTestWindPowerOff;
    private Button btnTestRoomInit;
    private Button btnTestRoomStatus;
    
    // 房间选择相关
    private Spinner spinnerRoomSelection;
    private Spinner spinnerRoomTypeSelection;
    private TextView tvSelectedRoom;
    private String[] currentRooms;
    private String selectedRoom = "";
    
    // 空调控制相关
    private Button btnTempMinus;
    private Button btnTempPlus;
    private TextView tvTemperature;
    private RadioGroup rgFanSpeed;
    private RadioButton rbFanLow;
    private RadioButton rbFanMedium;
    private RadioButton rbFanHigh;
    private Spinner spinnerAcMode;
    private Button btnApplyAcSettings;
    
    // 空调控制参数
    private int currentTemperature = 24;
    private int currentFanSpeed = 2; // 1=低, 2=中, 3=高
    private int currentAcMode = 0; // 0=制冷, 1=制热, 2=除湿, 3=送风, 4=自动
    
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
        btnApplyHouseType = findViewById(R.id.btn_apply_house_type);
        
        // 初始化房间类型选择
        // rgHouseType = findViewById(R.id.rg_house_type);
        // rbHouseT2 = findViewById(R.id.rb_house_t2);
        // rbHouseT41 = findViewById(R.id.rb_house_t4_1);
        // rbHouseT42 = findViewById(R.id.rb_house_t4_2);
        
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
        
        // 初始化房间选择相关控件  
        spinnerRoomTypeSelection = findViewById(R.id.spinner_room_type_selection);
        spinnerRoomSelection = findViewById(R.id.spinner_room_selection);
        tvSelectedRoom = findViewById(R.id.tv_selected_room);
        
        // 初始化空调控制相关控件
        btnTempMinus = findViewById(R.id.btn_temp_minus);
        btnTempPlus = findViewById(R.id.btn_temp_plus);
        tvTemperature = findViewById(R.id.tv_temperature);
        rgFanSpeed = findViewById(R.id.rg_fan_speed);
        rbFanLow = findViewById(R.id.rb_fan_low);
        rbFanMedium = findViewById(R.id.rb_fan_medium);
        rbFanHigh = findViewById(R.id.rb_fan_high);
        spinnerAcMode = findViewById(R.id.spinner_ac_mode);
        btnApplyAcSettings = findViewById(R.id.btn_apply_ac_settings);
        
        // 初始化空调模式下拉框
        setupAcModeSpinner();
        
        // 初始化温度显示
        updateTemperatureDisplay();
        
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
        
        // 测试获取空调状态
        btnTestAirStatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/status", "GET");
            }
        });
        
        // 测试空调开机（默认机器编号1）
        btnTestAirPowerOn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=power&value=1&machineNo=1", "GET");
            }
        });
        
        // 测试空调关机（默认机器编号1）
        btnTestAirPowerOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                testApiRequest("/api/air/control?action=power&value=0&machineNo=1", "GET");
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
        
        // 设置房间类型选择监听器
        setupRoomTypeSelectionListener();
    
        // 设置房间选择监听器
        setupRoomSelectionListener();
        
        // 设置空调控制监听器
        setupAirControlListeners();
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
     * 设置空调模式下拉框
     */
    private void setupAcModeSpinner() {
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.ac_modes, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerAcMode.setAdapter(adapter);
        
        spinnerAcMode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                currentAcMode = position;
            }
            
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // 不做处理
            }
        });
    }
    
    /**
     * 设置房间类型选择监听器
     */
    private void setupRoomTypeSelectionListener() {
        spinnerRoomTypeSelection.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String selectedType = parent.getItemAtPosition(position).toString();
                String houseType;
                
                // 从显示文本中提取户型代码
                if (selectedType.contains("T2")) {
                    houseType = "T2";
                } else if (selectedType.contains("T4-1")) {
                    houseType = "T4-1";
                } else if (selectedType.contains("T4-2")) {
                    houseType = "T4-2";
                } else {
                    houseType = "T4-1"; // 默认
                }
                
                // 更新房间选择下拉框
                updateRoomSelection(houseType);
                
                // 记录日志
                Log.d(TAG, "房间类型已选择: " + selectedType + ", 户型代码: " + houseType);
            }
            
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // 默认使用T4-1户型
                updateRoomSelection("T4-1");
            }
        });
    }
    
    /**
     * 设置房间选择监听器
     */
    private void setupRoomSelectionListener() {
        spinnerRoomSelection.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (currentRooms != null && position < currentRooms.length) {
                    selectedRoom = currentRooms[position];
                    tvSelectedRoom.setText("当前选择：" + selectedRoom);
                }
            }
            
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                selectedRoom = "";
                tvSelectedRoom.setText("当前选择：请选择房间");
            }
        });
    }
    
    /**
     * 设置空调控制监听器
     */
    private void setupAirControlListeners() {
        // 温度减少按钮
        btnTempMinus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (currentTemperature > 16) {
                    currentTemperature--;
                    updateTemperatureDisplay();
                }
            }
        });
        
        // 温度增加按钮
        btnTempPlus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (currentTemperature < 30) {
                    currentTemperature++;
                    updateTemperatureDisplay();
                }
            }
        });
        
        // 风速选择监听器
        rgFanSpeed.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                if (checkedId == R.id.rb_fan_low) {
                    currentFanSpeed = 1;
                } else if (checkedId == R.id.rb_fan_medium) {
                    currentFanSpeed = 2;
                } else if (checkedId == R.id.rb_fan_high) {
                    currentFanSpeed = 3;
                }
            }
        });
        
        // 应用设置按钮
        btnApplyAcSettings.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                applyAirConditionerSettings();
            }
        });
    }
    
    /**
     * 更新温度显示
     */
    private void updateTemperatureDisplay() {
        tvTemperature.setText(currentTemperature + "°C");
    }
    
    /**
     * 更新房间选择下拉框
     */
    private void updateRoomSelection(String houseType) {
        int arrayResId;
        switch (houseType) {
            case "T2":
                arrayResId = R.array.t2_rooms;
                break;
            case "T4-1":
                arrayResId = R.array.t4_1_rooms;
                break;
            case "T4-2":
                arrayResId = R.array.t4_2_rooms;
                break;
            default:
                arrayResId = R.array.t4_1_rooms; // 默认使用T4-1
                break;
        }
        Log.e(TAG, "updateRoomSelection arrayResId: " + arrayResId);
        currentRooms = getResources().getStringArray(arrayResId);
        Log.e(TAG, "updateRoomSelection currentRooms: " + currentRooms);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this,
                android.R.layout.simple_spinner_item, currentRooms);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerRoomSelection.setAdapter(adapter);
        
        // 重置选择
        selectedRoom = "";
        tvSelectedRoom.setText("当前选择：请选择房间");
    }
    
    /**
     * 应用空调设置
     */
    private void applyAirConditionerSettings() {
        if (selectedRoom.isEmpty()) {
            Toast.makeText(this, "请先选择房间", Toast.LENGTH_SHORT).show();
            return;
        }
        
        // 构建API请求参数
        StringBuilder apiUrl = new StringBuilder("/api/air/control");
        apiUrl.append("?room=").append(selectedRoom);
        apiUrl.append("&temp=").append(currentTemperature);
        apiUrl.append("&speed=").append(currentFanSpeed);
        apiUrl.append("&mode=").append(currentAcMode);
        
        // 发送API请求
        testApiRequest(apiUrl.toString(), "GET");
        
        Toast.makeText(this, "正在应用空调设置：" + selectedRoom + 
                ", 温度:" + currentTemperature + "°C" +
                ", 风速:" + getFanSpeedText(currentFanSpeed) +
                ", 模式:" + getAcModeText(currentAcMode), Toast.LENGTH_LONG).show();
    }
    
    /**
     * 获取风速文本
     */
    private String getFanSpeedText(int speed) {
        switch (speed) {
            case 1: return "低";
            case 2: return "中";
            case 3: return "高";
            default: return "未知";
        }
    }
    
    /**
     * 获取空调模式文本
     */
    private String getAcModeText(int mode) {
        String[] modes = getResources().getStringArray(R.array.ac_modes);
        if (mode >= 0 && mode < modes.length) {
            return modes[mode];
        }
        return "未知";
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
        
        // 更新房间选择下拉框
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
                // 读取空调状态
                final TicaInnerStatus airStatus = AirControlHandler.getInstance().readStatus();
                
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
}
