package com.example.apkapiservice.controller;

import android.util.Log;

import com.example.apkapiservice.bean.WindStatus;
import com.example.apkapiservice.utils.JsonResponse;
import com.yanzhenjie.andserver.annotation.GetMapping;
import com.yanzhenjie.andserver.annotation.PostMapping;
import com.yanzhenjie.andserver.annotation.RequestBody;
import com.yanzhenjie.andserver.annotation.RequestMapping;
import com.yanzhenjie.andserver.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 新风控制API接口
 * 提供新风状态获取和控制功能
 */
@RestController
@RequestMapping("/api/wind")
public class WindController {
    private static final String TAG = "WindController";
    private final WindControlHandler windControlHandler;
    
    public WindController() {
        windControlHandler = WindControlHandler.getInstance();
    }
    
    /**
     * 获取新风状态
     * 
     * @return 新风状态
     */
    @GetMapping("/status")
    public JsonResponse getWindStatus() {
        try {
            WindStatus status = windControlHandler.readStatus();
            
            if (status != null) {
                return JsonResponse.success("获取成功", status);
            } else {
                return JsonResponse.error("获取新风状态失败");
            }
        } catch (Exception e) {
            Log.e(TAG, "获取新风状态失败", e);
            return JsonResponse.error("获取新风状态失败: " + e.getMessage());
        }
    }
    
    /**
     * 控制新风
     * 
     * @param params 请求参数，包含controlType和value字段
     * @return 控制结果
     */
    @PostMapping("/control")
    public JsonResponse controlWind(@RequestBody Map<String, Object> params) {
        try {
            String controlType = (String) params.get("controlType");
            Integer value = (Integer) params.get("value");
            
            if (controlType == null || value == null) {
                return JsonResponse.error("控制类型和值不能为空");
            }
            
            boolean success = false;
            
            switch (controlType) {
                case "power":
                    success = windControlHandler.setPower(value);
                    break;
                case "mode":
                    success = windControlHandler.setMode(value);
                    break;
                case "speed":
                    success = windControlHandler.setWindSpeed(value);
                    break;
                case "humidity":
                    success = windControlHandler.setHumiditySwitch(value);
                    break;
                default:
                    return JsonResponse.error("未知的控制类型: " + controlType);
            }
            
            if (success) {
                // 控制成功后重新读取状态
                WindStatus status = windControlHandler.readStatus();
                return JsonResponse.success("控制成功", status);
            } else {
                return JsonResponse.error("控制失败");
            }
        } catch (Exception e) {
            Log.e(TAG, "控制新风失败", e);
            return JsonResponse.error("控制新风失败: " + e.getMessage());
        }
    }
}
