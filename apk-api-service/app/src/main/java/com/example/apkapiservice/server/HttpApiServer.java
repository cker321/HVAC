package com.example.apkapiservice.server;

import android.util.Log;

import com.example.apkapiservice.bean.TicaInnerStatus;
import com.example.apkapiservice.bean.WindStatus;
import com.example.apkapiservice.controller.AirControlHandler;
import com.example.apkapiservice.controller.WindControlHandler;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import fi.iki.elonen.NanoHTTPD;
import fi.iki.elonen.NanoHTTPD.IHTTPSession;
import fi.iki.elonen.NanoHTTPD.Response;
import fi.iki.elonen.NanoHTTPD.Response.Status;

import java.util.HashMap;
import java.util.Map;

/**
 * HTTP API服务器
 * 提供空调和新风控制的HTTP API接口
 */
public class HttpApiServer extends NanoHTTPD {
    private static final String TAG = "HttpApiServer";
    private final Gson gson;
    
    public HttpApiServer(int port) {
        super(port);
        gson = new GsonBuilder().setPrettyPrinting().create();
        Log.i(TAG, "HTTP API服务器初始化，端口：" + port);
    }
    
    @Override
    public Response serve(IHTTPSession session) {
        String uri = session.getUri();
        NanoHTTPD.Method method = session.getMethod();
        Map<String, String> params = session.getParms();
        
        Log.i(TAG, "收到请求：" + method + " " + uri);
        
        try {
            // 处理API请求
            if (uri.startsWith("/api/")) {
                return handleApiRequest(uri, method, params);
            }
            
            // 默认返回API文档
            return newFixedLengthResponse(Status.OK, "text/html", getApiDocHtml());
        } catch (Exception e) {
            Log.e(TAG, "处理请求异常", e);
            return newErrorResponse("处理请求失败：" + e.getMessage());
        }
    }
    
    /**
     * 处理API请求
     */
    private Response handleApiRequest(String uri, NanoHTTPD.Method method, Map<String, String> params) {
        // 空调相关API
        if (uri.startsWith("/api/air/")) {
            return handleAirRequest(uri, method, params);
        }
        
        // 新风相关API
        if (uri.startsWith("/api/wind/")) {
            return handleWindRequest(uri, method, params);
        }
        
        // 系统信息API
        if (uri.equals("/api/system/info")) {
            return handleSystemInfoRequest();
        }
        
        // 未知API
        return newErrorResponse("未知的API请求：" + uri);
    }
    
    /**
     * 判断串口是否可用
     */
    private boolean isSerialPortAvailable() {
        // 检测是否在手机环境 如果是小米手机 则认为串口不可用
        if (android.os.Build.MANUFACTURER.contains("Xiaomi")) {
            return false;
        }
        boolean isEmulator = android.os.Build.PRODUCT.contains("sdk") || 
                            android.os.Build.MODEL.contains("Emulator") || 
                            android.os.Build.MODEL.contains("Android SDK") ||
                            android.os.Build.BRAND.startsWith("generic");
        
        // 检测是否有串口权限
        boolean hasSerialPermission = true; // 简化处理，实际应该检查权限
        
        // 如果是模拟器或手机，则认为串口不可用
        return !isEmulator && hasSerialPermission;
    }
    
    /**
     * 处理空调相关请求
     */
    private Response handleAirRequest(String uri, NanoHTTPD.Method method, Map<String, String> params) {
        AirControlHandler airHandler = AirControlHandler.getInstance();
        
        // 获取空调状态
        if (uri.equals("/api/air/status")) {
            // 检查串口是否可用
            if (!isSerialPortAvailable()) {
                // 在手机环境下返回模拟数据
                Map<String, Object> result = new HashMap<>();
                result.put("code", 0);
                result.put("message", "success");
                
                // 创建模拟空调状态
                TicaInnerStatus mockStatus = new TicaInnerStatus(1, "主卧");
                mockStatus.setPowerSetting(false); // 默认关机
                mockStatus.setSettingMode(AirControlHandler.MODE_COOL);  // 制冷模式
                mockStatus.setSettingTemp(26); // 默认温度
                mockStatus.setSettingWindSpeed(AirControlHandler.SPEED_AUTO);  // 自动风速
                mockStatus.setReturnAirTemperature(25.5f); // 室内温度
                
                result.put("data", mockStatus);
                result.put("note", "注意：当前在手机环境下运行，串口不可用，返回模拟数据");
                
                return newJsonResponse(result);
            }
            
            // 获取机器编号参数
            int machineNo = 1;
            if (params.containsKey("machineNo")) {
                try {
                    machineNo = Integer.parseInt(params.get("machineNo"));
                } catch (NumberFormatException e) {
                    return newErrorResponse("无效的机器编号");
                }
            }
            
            // 设置当前操作的机器
            airHandler.setMachineNo(machineNo);
            
            try {
                // 读取空调状态
                TicaInnerStatus status = airHandler.readInnerStatus();
                
                // 检查状态是否有效
                if (status == null) {
                    return newErrorResponse("读取空调状态失败，返回空数据");
                }
                
                // 返回状态数据
                Map<String, Object> result = new HashMap<>();
                result.put("code", 0);
                result.put("message", "success");
                result.put("data", status);
                
                return newJsonResponse(result);
            } catch (Exception e) {
                Log.e(TAG, "读取空调状态异常", e);
                return newErrorResponse("读取空调状态异常: " + e.getMessage());
            }
        }
        
        // 控制空调
        if (uri.equals("/api/air/control")) {
            // 检查串口是否可用
            if (!isSerialPortAvailable()) {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 0);
                result.put("message", "success");
                result.put("data", null);
                result.put("note", "注意：当前在手机环境下运行，串口不可用，命令已模拟执行");
                
                return newJsonResponse(result);
            }
            
            // 获取控制参数
            int machineNo = getIntParam(params, "machineNo", 1);
            String action = params.get("action");
            
            if (action == null || action.isEmpty()) {
                return newErrorResponse("缺少action参数");
            }
            
            // 设置当前操作的机器
            airHandler.setMachineNo(machineNo);
            
            boolean success = false;
            
            // 执行控制命令
            switch (action) {
                case "power":
                    int power = getIntParam(params, "value", 0);
                    success = airHandler.sendCommand(AirControlHandler.CMD_POWER, power);
                    break;
                case "mode":
                    int mode = getIntParam(params, "value", AirControlHandler.MODE_COOL);
                    success = airHandler.sendCommand(AirControlHandler.CMD_MODE, mode);
                    break;
                case "temp":
                    int temp = getIntParam(params, "value", 26);
                    success = airHandler.sendCommand(AirControlHandler.CMD_TEMP, temp);
                    break;
                case "speed":
                    int speed = getIntParam(params, "value", AirControlHandler.SPEED_AUTO);
                    success = airHandler.sendCommand(AirControlHandler.CMD_SPEED, speed);
                    break;
                default:
                    return newErrorResponse("未知的控制命令：" + action);
            }
            
            // 返回控制结果
            Map<String, Object> result = new HashMap<>();
            result.put("code", success ? 0 : -1);
            result.put("message", success ? "success" : "failed");
            result.put("data", null);
            
            return newJsonResponse(result);
        }
        
        return newErrorResponse("未知的空调API请求：" + uri);
    }
    
    /**
     * 处理新风相关请求
     */
    private Response handleWindRequest(String uri, NanoHTTPD.Method method, Map<String, String> params) {
        WindControlHandler windHandler = WindControlHandler.getInstance();
        
        // 获取新风状态
        if (uri.equals("/api/wind/status")) {
            // 检查串口是否可用
            if (!isSerialPortAvailable()) {
                // 在手机环境下返回模拟数据
                Map<String, Object> result = new HashMap<>();
                result.put("code", 0);
                result.put("message", "success");
                
                // 创建模拟新风状态
                WindStatus mockStatus = new WindStatus();
                mockStatus.setPower(WindControlHandler.POWER_OFF); // 默认关机
                mockStatus.setMode(WindControlHandler.MODE_WIND);  // 通风模式
                mockStatus.setWindSpeed(WindControlHandler.SPEED_MEDIUM); // 中速
                mockStatus.setShowTemp(25.0f); // 显示温度
                mockStatus.setWindHumidity(45.0f); // 湿度
                mockStatus.setHumiditySwitch(WindControlHandler.HUMIDITY_OFF); // 加湿关闭
                
                result.put("data", mockStatus);
                result.put("note", "注意：当前在手机环境下运行，串口不可用，返回模拟数据");
                
                return newJsonResponse(result);
            }
            
            // 读取新风状态
            WindStatus status = windHandler.readStatus();
            
            // 返回状态数据
            Map<String, Object> result = new HashMap<>();
            result.put("code", 0);
            result.put("message", "success");
            result.put("data", status);
            
            return newJsonResponse(result);
        }
        
        // 控制新风
        if (uri.equals("/api/wind/control")) {
            // 检查串口是否可用
            if (!isSerialPortAvailable()) {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 0);
                result.put("message", "success");
                result.put("data", null);
                result.put("note", "注意：当前在手机环境下运行，串口不可用，命令已模拟执行");
                
                return newJsonResponse(result);
            }
            
            // 获取控制参数
            String action = params.get("action");
            
            if (action == null || action.isEmpty()) {
                return newErrorResponse("缺少action参数");
            }
            
            boolean success = false;
            
            // 执行控制命令
            switch (action) {
                case "power":
                    int power = getIntParam(params, "value", WindControlHandler.POWER_OFF);
                    success = windHandler.setPower(power);
                    break;
                case "mode":
                    int mode = getIntParam(params, "value", WindControlHandler.MODE_WIND);
                    success = windHandler.setMode(mode);
                    break;
                case "speed":
                    int speed = getIntParam(params, "value", WindControlHandler.SPEED_MEDIUM);
                    success = windHandler.setWindSpeed(speed);
                    break;
                case "humidity":
                    int humidity = getIntParam(params, "value", WindControlHandler.HUMIDITY_OFF);
                    success = windHandler.setHumiditySwitch(humidity);
                    break;
                default:
                    return newErrorResponse("未知的控制命令：" + action);
            }
            
            // 返回控制结果
            Map<String, Object> result = new HashMap<>();
            result.put("code", success ? 0 : -1);
            result.put("message", success ? "success" : "failed");
            result.put("data", null);
            
            return newJsonResponse(result);
        }
        
        return newErrorResponse("未知的新风API请求：" + uri);
    }
    
    /**
     * 处理系统信息请求
     */
    private Response handleSystemInfoRequest() {
        Map<String, Object> info = new HashMap<>();
        info.put("appName", "APK API Service");
        info.put("version", "1.0.0");
        info.put("apiVersion", "v1");
        
        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("message", "success");
        result.put("data", info);
        
        return newJsonResponse(result);
    }
    
    /**
     * 从参数中获取整数值
     */
    private int getIntParam(Map<String, String> params, String key, int defaultValue) {
        if (params.containsKey(key)) {
            try {
                return Integer.parseInt(params.get(key));
            } catch (NumberFormatException e) {
                Log.w(TAG, "无效的整数参数：" + key + "=" + params.get(key));
            }
        }
        return defaultValue;
    }
    
    /**
     * 创建JSON响应
     */
    private Response newJsonResponse(Object data) {
        return newFixedLengthResponse(Status.OK, "application/json", gson.toJson(data));
    }
    
    /**
     * 创建错误响应
     */
    private Response newErrorResponse(String message) {
        Map<String, Object> error = new HashMap<>();
        error.put("code", -1);
        error.put("message", message);
        error.put("data", null);
        
        return newFixedLengthResponse(Status.OK, "application/json", gson.toJson(error));
    }
    
    /**
     * 获取API文档HTML
     */
    private String getApiDocHtml() {
        return "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<head>\n" +
                "    <title>APK API Service - API文档</title>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <style>\n" +
                "        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; line-height: 1.6; }\n" +
                "        h1 { color: #333; }\n" +
                "        h2 { color: #0066cc; margin-top: 30px; }\n" +
                "        h3 { color: #009900; }\n" +
                "        pre { background: #f5f5f5; padding: 10px; border-radius: 5px; overflow-x: auto; }\n" +
                "        .endpoint { background: #e6f3ff; padding: 10px; border-left: 4px solid #0066cc; margin-bottom: 20px; }\n" +
                "        .method { font-weight: bold; color: #0066cc; }\n" +
                "        .param { margin-left: 20px; }\n" +
                "        .param-name { font-weight: bold; }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <h1>APK API Service - API文档</h1>\n" +
                "    <p>这是空调和新风控制API服务的文档。</p>\n" +
                "    \n" +
                "    <h2>空调控制API</h2>\n" +
                "    \n" +
                "    <div class=\"endpoint\">\n" +
                "        <p class=\"method\">GET /api/air/status</p>\n" +
                "        <p>获取空调状态</p>\n" +
                "        <p>参数：</p>\n" +
                "        <div class=\"param\">\n" +
                "            <p><span class=\"param-name\">machineNo</span> - 机器编号（可选，默认为1）</p>\n" +
                "        </div>\n" +
                "        <p>响应示例：</p>\n" +
                "        <pre>{\n" +
                "  \"code\": 0,\n" +
                "  \"message\": \"success\",\n" +
                "  \"data\": {\n" +
                "    \"machineNo\": 1,\n" +
                "    \"roomName\": \"主卧\",\n" +
                "    \"returnAirTemperature\": 26.5,\n" +
                "    \"settingMode\": 1,\n" +
                "    \"settingTemp\": 26,\n" +
                "    \"settingWindSpeed\": 3,\n" +
                "    \"powerSetting\": true\n" +
                "  }\n" +
                "}</pre>\n" +
                "    </div>\n" +
                "    \n" +
                "    <div class=\"endpoint\">\n" +
                "        <p class=\"method\">POST /api/air/control</p>\n" +
                "        <p>控制空调</p>\n" +
                "        <p>参数：</p>\n" +
                "        <div class=\"param\">\n" +
                "            <p><span class=\"param-name\">machineNo</span> - 机器编号（可选，默认为1）</p>\n" +
                "            <p><span class=\"param-name\">action</span> - 控制动作（必填，可选值：power/mode/temp/speed）</p>\n" +
                "            <p><span class=\"param-name\">value</span> - 控制值（必填）</p>\n" +
                "            <p>power取值：0（关）、128（开）</p>\n" +
                "            <p>mode取值：1（制冷）、2（制热）、4（通风）、5（除湿）</p>\n" +
                "            <p>temp取值：16-32（温度）</p>\n" +
                "            <p>speed取值：0（低）、1（中）、2（高）、3（自动）</p>\n" +
                "        </div>\n" +
                "        <p>响应示例：</p>\n" +
                "        <pre>{\n" +
                "  \"code\": 0,\n" +
                "  \"message\": \"success\",\n" +
                "  \"data\": null\n" +
                "}</pre>\n" +
                "    </div>\n" +
                "    \n" +
                "    <h2>新风控制API</h2>\n" +
                "    \n" +
                "    <div class=\"endpoint\">\n" +
                "        <p class=\"method\">GET /api/wind/status</p>\n" +
                "        <p>获取新风状态</p>\n" +
                "        <p>响应示例：</p>\n" +
                "        <pre>{\n" +
                "  \"code\": 0,\n" +
                "  \"message\": \"success\",\n" +
                "  \"data\": {\n" +
                "    \"typeTemp\": false,\n" +
                "    \"showTemp\": 25.5,\n" +
                "    \"windHumidity\": 45.0,\n" +
                "    \"power\": 1,\n" +
                "    \"mode\": 0,\n" +
                "    \"windSpeed\": 1,\n" +
                "    \"humiditySwitch\": 0\n" +
                "  }\n" +
                "}</pre>\n" +
                "    </div>\n" +
                "    \n" +
                "    <div class=\"endpoint\">\n" +
                "        <p class=\"method\">POST /api/wind/control</p>\n" +
                "        <p>控制新风</p>\n" +
                "        <p>参数：</p>\n" +
                "        <div class=\"param\">\n" +
                "            <p><span class=\"param-name\">action</span> - 控制动作（必填，可选值：power/mode/speed/humidity）</p>\n" +
                "            <p><span class=\"param-name\">value</span> - 控制值（必填）</p>\n" +
                "            <p>power取值：0（关）、1（开）</p>\n" +
                "            <p>mode取值：0（通风）、1（制冷）、2（除湿）、3（制热）、4（自动）</p>\n" +
                "            <p>speed取值：0（高）、1（中）、2（低）</p>\n" +
                "            <p>humidity取值：0（关）、1（开）</p>\n" +
                "        </div>\n" +
                "        <p>响应示例：</p>\n" +
                "        <pre>{\n" +
                "  \"code\": 0,\n" +
                "  \"message\": \"success\",\n" +
                "  \"data\": null\n" +
                "}</pre>\n" +
                "    </div>\n" +
                "    \n" +
                "    <h2>系统信息API</h2>\n" +
                "    \n" +
                "    <div class=\"endpoint\">\n" +
                "        <p class=\"method\">GET /api/system/info</p>\n" +
                "        <p>获取系统信息</p>\n" +
                "        <p>响应示例：</p>\n" +
                "        <pre>{\n" +
                "  \"code\": 0,\n" +
                "  \"message\": \"success\",\n" +
                "  \"data\": {\n" +
                "    \"appName\": \"APK API Service\",\n" +
                "    \"version\": \"1.0.0\",\n" +
                "    \"apiVersion\": \"v1\"\n" +
                "  }\n" +
                "}</pre>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>";
    }
}
