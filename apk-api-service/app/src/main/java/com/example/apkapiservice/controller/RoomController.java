package com.example.apkapiservice.controller;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import com.example.apkapiservice.bean.HouseType;
import com.example.apkapiservice.bean.Room;
import com.example.apkapiservice.utils.JsonResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 房间控制API接口
 * 提供户型选择、房间初始化和按房间控制空调的功能
 */
public class RoomController {
    private static final String TAG = "RoomController";
    private static final String PREFS_NAME = "HouseTypePrefs";
    private static final String KEY_HOUSE_TYPE = "houseType";
    
    private final RoomManager roomManager;
    private Context context;  
    
    public RoomController() {
        roomManager = RoomManager.getInstance();
        // 默认构造函数
    }
    
    public RoomController(Context context) {
        this.context = context;
        roomManager = RoomManager.getInstance();
        // 如果有保存的户型，则自动加载
        loadSavedHouseType();
    }
    
    /**
     * 从本地存储加载保存的户型
     */
    private void loadSavedHouseType() {
        if (context == null) {
            Log.w(TAG, "无法加载保存的户型：context为空");
            return;
        }
        
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            String savedHouseType = prefs.getString(KEY_HOUSE_TYPE, null);
            
            if (savedHouseType != null && !savedHouseType.isEmpty()) {
                Log.d(TAG, "从本地存储加载户型: " + savedHouseType);
                HouseType houseType = HouseType.fromString(savedHouseType);
                roomManager.setHouseType(houseType);
            }
        } catch (Exception e) {
            Log.e(TAG, "加载保存的户型失败", e);
        }
    }
    
    /**
     * 保存户型到本地存储
     * 
     * @param houseTypeStr 户型字符串
     * @return 是否保存成功
     */
    private boolean saveHouseType(String houseTypeStr) {
        if (context == null) {
            Log.w(TAG, "无法保存户型：context为空");
            return false;
        }
        
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = prefs.edit();
            editor.putString(KEY_HOUSE_TYPE, houseTypeStr);
            boolean result = editor.commit();
            Log.d(TAG, "保存户型到本地存储: " + houseTypeStr + ", 结果: " + result);
            return result;
        } catch (Exception e) {
            Log.e(TAG, "保存户型失败", e);
            return false;
        }
    }
    
    /**
     * 设置户型类型
     * 
     * @param params 请求参数，包含houseType字段
     * @return 设置结果数据映射
     */
    public Map<String, Object> setHouseType(Map<String, Object> params) {
        try {
            Log.d(TAG, "设置户型类型: " + params);
            String houseTypeStr = (String) params.get("houseType");
            if (houseTypeStr == null || houseTypeStr.isEmpty()) {
                Map<String, Object> errorResult = new HashMap<>();
                errorResult.put("code", 400);
                errorResult.put("message", "户型类型不能为空");
                errorResult.put("data", null);
                return errorResult;
            }
            
            HouseType houseType = HouseType.fromString(houseTypeStr);
            boolean success = roomManager.setHouseType(houseType);
            
            // 如果设置成功且context不为空，保存到本地存储
            if (success && context != null) {
                saveHouseType(houseTypeStr);
            }
            
            Map<String, Object> result = new HashMap<>();
            if (success) {
                Map<String, Object> data = new HashMap<>();
                data.put("houseType", houseType.getValue());
                result.put("code", 200);
                result.put("message", "设置成功");
                result.put("data", data);
            } else {
                result.put("code", 500);
                result.put("message", "设置失败");
                result.put("data", null);
            }
            return result;
        } catch (Exception e) {
            Log.e(TAG, "设置户型类型失败", e);
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("code", 500);
            errorResult.put("message", "设置户型类型失败: " + e.getMessage());
            errorResult.put("data", null);
            return errorResult;
        }
    }
    
    /**
     * 根据户型初始化房间状态
     * 
     * @param params 请求参数，可选包含houseType字段
     * @return 初始化结果数据映射
     */
    public Map<String, Object> initRoomStatus(Map<String, Object> params) {
        try {
            // 如果提供了户型类型，先设置户型
            if (params != null && params.containsKey("houseType")) {
                String houseTypeStr = (String) params.get("houseType");
                HouseType houseType = HouseType.fromString(houseTypeStr);
                roomManager.setHouseType(houseType);
            }
            
            boolean success = roomManager.initRoomStatus();
            
            Map<String, Object> data = new HashMap<>();
            data.put("houseType", roomManager.getCurrentHouseType().getValue());
            data.put("rooms", roomManager.getCurrentRooms());
            
            Map<String, Object> result = new HashMap<>();
            if (success) {
                result.put("code", 200);
                result.put("message", "初始化成功");
                result.put("data", data);
            } else {
                // 即使部分失败，也返回当前状态
                result.put("code", 206); // 部分成功
                result.put("message", "部分房间初始化失败，返回当前状态");
                result.put("data", data);
            }
            return result;
        } catch (Exception e) {
            Log.e(TAG, "初始化房间状态失败", e);
            Map<String, Object> result = new HashMap<>();
            result.put("code", 500);
            result.put("message", "初始化房间状态失败: " + e.getMessage());
            result.put("data", null);
            return result;
        }
    }
    
    /**
     * 获取所有房间空调状态
     * 
     * @return 所有房间状态
     */
    public Map<String, Object> getAllRoomStatus() {
        try {
            List<Room> rooms = roomManager.getCurrentRooms();
            
            Map<String, Object> data = new HashMap<>();
            data.put("houseType", roomManager.getCurrentHouseType().getValue());
            data.put("rooms", rooms);
                
            Map<String, Object> result = new HashMap<>();
            result.put("code", 200);
            result.put("message", "获取成功");
            result.put("data", data);
            return result;
        } catch (Exception e) {
            Log.e(TAG, "获取所有房间状态失败", e);
            Map<String, Object> result = new HashMap<>();
            result.put("code", 500);
            result.put("message", "获取所有房间状态失败: " + e.getMessage());
            result.put("data", null);
            return result;
        }
    }
    
    /**
     * 获取指定房间空调状态
     * 
     * @param machineNo 机号
     * @return 指定房间状态
     */
    public Map<String, Object> getRoomStatus(int machineNo) {
        try {
            Room room = roomManager.updateRoomStatus(machineNo);
            
            if (room != null) {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 200);
                result.put("message", "获取成功");
                result.put("data", room);
                return result;
            } else {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 500);
                result.put("message", "获取房间状态失败，房间不存在或通信错误");
                result.put("data", null);
                return result;
            }
        } catch (Exception e) {
            Log.e(TAG, "获取房间状态失败", e);
            Map<String, Object> result = new HashMap<>();
            result.put("code", 500);
            result.put("message", "获取房间状态失败: " + e.getMessage());
            result.put("data", null);
            return result;
        }
    }
    
    /**
     * 按房间设置空调状态
     * 
     * @param machineNo 机号
     * @param params 请求参数，包含cmdType和value字段
     * @return 控制结果
     */
    public Map<String, Object> controlRoom(int machineNo, Map<String, Object> params) {
        try {
            Integer cmdType = (Integer) params.get("cmdType");
            Integer value = (Integer) params.get("value");
            
            if (cmdType == null || value == null) {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 400);
                result.put("message", "命令类型和值不能为空");
                result.put("data", null);
                return result;
            }
            
            Room room = roomManager.controlRoom(machineNo, cmdType, value);
            
            if (room != null) {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 200);
                result.put("message", "控制成功");
                result.put("data", room);
                return result;
            } else {
                Map<String, Object> result = new HashMap<>();
                result.put("code", 500);
                result.put("message", "控制失败，房间不存在或通信错误");
                result.put("data", null);
                return result;
            }
        } catch (Exception e) {
            Log.e(TAG, "控制房间空调失败", e);
            Map<String, Object> result = new HashMap<>();
            result.put("code", 500);
            result.put("message", "控制房间空调失败: " + e.getMessage());
            result.put("data", null);
            return result;
        }
    }
}
