package com.dnake.desktop.controller;

import android.util.Log;
import com.dnake.desktop.bean.TicaInnerStatus;
import com.dnake.desktop.bean.WindStatus;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.net.hardware.HardwareExecutor;
import com.yanzhenjie.andserver.annotation.GetMapping;
import com.yanzhenjie.andserver.annotation.PostMapping;
import com.yanzhenjie.andserver.annotation.RequestMapping;
import com.yanzhenjie.andserver.annotation.RequestParam;
import com.yanzhenjie.andserver.annotation.RestController;
import com.yanzhenjie.andserver.framework.body.JsonBody;
import com.yanzhenjie.andserver.http.HttpResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * 设备API控制器
 * 提供设备状态查询和控制的HTTP API接口
 */
@RestController
@RequestMapping("/api")
public class DeviceApiController {
    private static final String TAG = "DeviceApiController";

    /**
     * 获取空调设备状态
     */
    @GetMapping("/air/status")
    public void getAirStatus(HttpResponse response) {
        try {
            Log.e(TAG, "开始获取空调状态");
            
            // 创建响应数据
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 200);
            jsonObject.put("message", "success");
            Log.e(TAG, "基础JSON对象创建成功");
            
            // 创建空调状态数据
            JSONObject data = new JSONObject();
            TicaInnerStatus status = new TicaInnerStatus();
            Log.e(TAG, "TicaInnerStatus对象创建成功");
            
            // 这里应该从实际设备获取状态，这里只是示例
            status.setMachineNo(1);
            status.setRoomName("客厅");
            status.setIntakeTemperature(26.5f);
            status.setReturnAirTemperature(25.0f);
            status.setModeRun(1);  // 1表示制冷模式
            status.setWindSpeedStatus(2);  // 2表示中速
            status.setPowerSetting(true);  // 开机状态
            Log.e(TAG, "TicaInnerStatus属性设置完成");
            
            // 将状态转换为JSON - 逐个添加以定位问题
            Log.e(TAG, "开始转换为JSON");
            data.put("machineNo", status.getMachineNo());
            Log.e(TAG, "machineNo添加成功: " + status.getMachineNo());
            
            data.put("roomName", status.getRoomName());
            Log.e(TAG, "roomName添加成功: " + status.getRoomName());
            
            data.put("temperature", status.getReturnAirTemperature());
            Log.e(TAG, "temperature添加成功: " + status.getReturnAirTemperature());
            
            data.put("mode", status.getModeRun());
            Log.e(TAG, "mode添加成功: " + status.getModeRun());
            
            data.put("windSpeed", status.getWindSpeedStatus());
            Log.e(TAG, "windSpeed添加成功: " + status.getWindSpeedStatus());
            
            data.put("power", status.isPowerSetting() ? 1 : 0);
            Log.e(TAG, "power添加成功: " + (status.isPowerSetting() ? 1 : 0));
            
            jsonObject.put("data", data);
            Log.e(TAG, "完整JSON对象创建成功");
            
            response.setBody(new JsonBody(jsonObject.toString()));
            Log.e(TAG, "响应设置成功");
        } catch (JSONException e) {
            Log.e(TAG, "获取空调状态失败", e);
            Log.e(TAG, "异常详细信息: " + e.getMessage());
            Log.e(TAG, "异常堆栈: ", e);
            try {
                JSONObject error = new JSONObject();
                error.put("code", 500);
                error.put("message", "获取空调状态失败: " + e.getMessage());
                response.setBody(new JsonBody(error.toString()));
            } catch (JSONException ex) {
                Log.e(TAG, "创建错误响应失败", ex);
            }
        }
    }

    /**
     * 获取新风设备状态
     */
    @GetMapping("/wind/status")
    public void getWindStatus(HttpResponse response) {
        try {
            // 创建响应数据
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 200);
            jsonObject.put("message", "success");
            
            // 创建新风状态数据
            JSONObject data = new JSONObject();
            WindStatus status = new WindStatus();
            // 这里应该从实际设备获取状态，这里只是示例
            status.setShowTemp(24.5f);
            status.setWindHumidity(45.0f);
            status.setPower(1);  // 1表示开机
            status.setMode(2);   // 2表示自动模式
            status.setWindSpeed(1);  // 1表示低速
            
            // 将状态转换为JSON
            data.put("temperature", status.getShowTemp());
            data.put("humidity", status.getWindHumidity());
            data.put("power", status.getPower());
            data.put("mode", status.getMode());
            data.put("windSpeed", status.getWindSpeed());
            
            jsonObject.put("data", data);
            response.setBody(new JsonBody(jsonObject.toString()));
        } catch (JSONException e) {
            Log.e(TAG, "获取新风状态失败", e);
            try {
                JSONObject error = new JSONObject();
                error.put("code", 500);
                error.put("message", "获取新风状态失败: " + e.getMessage());
                response.setBody(new JsonBody(error.toString()));
            } catch (JSONException ex) {
                Log.e(TAG, "创建错误响应失败", ex);
            }
        }
    }

    /**
     * 控制空调设备
     */
    @PostMapping("/air/control")
    public void controlAir(
            @RequestParam("deviceId") String deviceId,
            @RequestParam("attributeTag") String attributeTag,
            @RequestParam("attributeValue") String attributeValue,
            HttpResponse response) {
        try {
            // 创建设备模型
            DeviceModel deviceModel = new DeviceModel();
            deviceModel.setDeviceId(deviceId);
            
            // 执行设备控制
            HardwareExecutor.getInstance(null).deviceWriteAsyn(deviceModel, attributeTag, attributeValue);
            
            // 创建响应数据
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 200);
            jsonObject.put("message", "success");
            jsonObject.put("data", true);
            response.setBody(new JsonBody(jsonObject.toString()));
        } catch (Exception e) {
            Log.e(TAG, "控制空调设备失败", e);
            try {
                JSONObject error = new JSONObject();
                error.put("code", 500);
                error.put("message", "控制空调设备失败: " + e.getMessage());
                response.setBody(new JsonBody(error.toString()));
            } catch (JSONException ex) {
                Log.e(TAG, "创建错误响应失败", ex);
            }
        }
    }

    /**
     * 控制新风设备
     */
    @PostMapping("/wind/control")
    public void controlWind(
            @RequestParam("deviceId") String deviceId,
            @RequestParam("attributeTag") String attributeTag,
            @RequestParam("attributeValue") String attributeValue,
            HttpResponse response) {
        try {
            // 创建设备模型
            DeviceModel deviceModel = new DeviceModel();
            deviceModel.setDeviceId(deviceId);
            
            // 执行设备控制
            HardwareExecutor.getInstance(null).deviceWriteAsyn(deviceModel, attributeTag, attributeValue);
            
            // 创建响应数据
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code", 200);
            jsonObject.put("message", "success");
            jsonObject.put("data", true);
            response.setBody(new JsonBody(jsonObject.toString()));
        } catch (Exception e) {
            Log.e(TAG, "控制新风设备失败", e);
            try {
                JSONObject error = new JSONObject();
                error.put("code", 500);
                error.put("message", "控制新风设备失败: " + e.getMessage());
                response.setBody(new JsonBody(error.toString()));
            } catch (JSONException ex) {
                Log.e(TAG, "创建错误响应失败", ex);
            }
        }
    }
}
