package com.example.apkapiservice.controller;

import android.util.Log;

import com.example.apkapiservice.bean.HouseType;
import com.example.apkapiservice.bean.Room;
import com.example.apkapiservice.bean.TicaInnerStatus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 房间管理器
 * 负责管理不同户型的房间配置和状态
 */
public class RoomManager {
    private static final String TAG = "RoomManager";
    private static RoomManager instance;
    
    private HouseType currentHouseType = HouseType.T4_1; // 默认为T4-1户型
    private final Map<HouseType, List<Room>> houseRooms = new HashMap<>();
    private final AirControlHandler airControlHandler;
    
    private RoomManager() {
        airControlHandler = AirControlHandler.getInstance();
        initRoomConfigurations();
    }
    
    public static RoomManager getInstance() {
        if (instance == null) {
            synchronized (RoomManager.class) {
                if (instance == null) {
                    instance = new RoomManager();
                }
            }
        }
        return instance;
    }
    
    /**
     * 初始化各户型的房间配置
     */
    private void initRoomConfigurations() {
        // T2户型房间配置 - 参考原始APP的roomArrayT2配置
        List<Room> t2Rooms = new ArrayList<>();
        t2Rooms.add(new Room(1, "客厅"));
        t2Rooms.add(new Room(2, "餐厅"));
        t2Rooms.add(new Room(3, "卧室1"));
        t2Rooms.add(new Room(4, "卧室2"));
        t2Rooms.add(new Room(5, "主卧"));
        houseRooms.put(HouseType.T2, t2Rooms);
        
        // T4-1户型房间配置 - 参考原始APP的roomArrayT4_1配置
        List<Room> t41Rooms = new ArrayList<>();
        t41Rooms.add(new Room(1, "客厅"));
        t41Rooms.add(new Room(2, "卧室1"));
        t41Rooms.add(new Room(3, "卧室2"));
        t41Rooms.add(new Room(4, "主卧"));
        t41Rooms.add(new Room(5, "卧室3"));
        houseRooms.put(HouseType.T4_1, t41Rooms);
        
        // T4-2户型房间配置 - 参考原始APP的roomArrayT4_2配置
        List<Room> t42Rooms = new ArrayList<>();
        t42Rooms.add(new Room(1, "客厅"));
        t42Rooms.add(new Room(2, "卧室1"));
        t42Rooms.add(new Room(3, "卧室2"));
        t42Rooms.add(new Room(4, "主卧"));
        houseRooms.put(HouseType.T4_2, t42Rooms);
    }
    
    /**
     * 设置当前户型
     * 
     * @param houseType 户型类型
     * @return 是否设置成功
     */
    public boolean setHouseType(HouseType houseType) {
        if (houseType != null) {
            this.currentHouseType = houseType;
            Log.i(TAG, "设置户型为: " + houseType.getValue());
            return true;
        }
        return false;
    }
    
    /**
     * 获取当前户型
     * 
     * @return 当前户型
     */
    public HouseType getCurrentHouseType() {
        return currentHouseType;
    }
    
    /**
     * 获取当前户型的所有房间
     * 
     * @return 房间列表
     */
    public List<Room> getCurrentRooms() {
        return houseRooms.get(currentHouseType);
    }
    
    /**
     * 根据机号获取房间
     * 
     * @param machineNo 机号
     * @return 房间对象，如果不存在则返回null
     */
    public Room getRoomByMachineNo(int machineNo) {
        List<Room> rooms = getCurrentRooms();
        if (rooms != null) {
            for (Room room : rooms) {
                if (room.getMachineNo() == machineNo) {
                    return room;
                }
            }
        }
        return null;
    }
    
    /**
     * 初始化房间状态
     * 读取所有房间的空调状态
     * 
     * @return 是否初始化成功
     */
    public boolean initRoomStatus() {
        List<Room> rooms = getCurrentRooms();
        if (rooms == null) {
            return false;
        }
        
        boolean success = true;
        for (Room room : rooms) {
            try {
                // 设置空调机号
                airControlHandler.setMachineNo(room.getMachineNo());
                // 读取空调状态
                TicaInnerStatus status = airControlHandler.readStatus();
                if (status != null) {
                    Log.d(TAG, "读取房间状态成功：" + room.getRoomName() + "，状态：" + status);
                    room.setStatus(status);
                } else {
                    // 如果读取失败，设置默认状态
                    // TicaInnerStatus defaultStatus = new TicaInnerStatus();
                    // defaultStatus.setPowerSetting(false);
                    // defaultStatus.setSettingMode(1); // 制冷模式
                    // defaultStatus.setSettingTemp(26);
                    // defaultStatus.setSettingWindSpeed(0); // 自动风速
                    // room.setStatus(defaultStatus);
                    success = false;
                }
            } catch (Exception e) {
                Log.e(TAG, "初始化房间状态失败: " + room.getRoomName(), e);
                success = false;
            }
        }
        
        return success;
    }
    
    /**
     * 更新指定房间的空调状态
     * 
     * @param machineNo 机号
     * @return 更新后的房间状态，如果失败则返回null
     */
    public Room updateRoomStatus(int machineNo) {
        Room room = getRoomByMachineNo(machineNo);
        if (room == null) {
            return null;
        }
        
        try {
            // 设置空调机号
            airControlHandler.setMachineNo(machineNo);
            // 读取空调状态
            TicaInnerStatus status = airControlHandler.readStatus();
            if (status != null) {
                room.setStatus(status);
                return room;
            }
        } catch (Exception e) {
            Log.e(TAG, "更新房间状态失败: " + room.getRoomName(), e);
        }
        
        return null;
    }
    
    /**
     * 控制指定房间的空调
     * 
     * @param machineNo 机号
     * @param cmdType 命令类型（0:模式, 1:温度, 2:风速, 3:电源）
     * @param value 命令值
     * @return 控制后的房间状态，如果失败则返回null
     */
    public Room controlRoom(int machineNo, int cmdType, int value) {
        Room room = getRoomByMachineNo(machineNo);
        if (room == null) {
            return null;
        }
        
        try {
            // 设置空调机号
            airControlHandler.setMachineNo(machineNo);
            
            boolean success = false;
            switch (cmdType) {
                case 0: // 模式
                    success = airControlHandler.setMode(value);
                    break;
                case 1: // 温度
                    success = airControlHandler.setTemp(value);
                    break;
                case 2: // 风速
                    success = airControlHandler.setWindSpeed(value);
                    break;
                case 3: // 电源
                    success = airControlHandler.setPower(value);
                    break;
                default:
                    Log.e(TAG, "未知的命令类型: " + cmdType);
                    return null;
            }
            
            if (success) {
                // 控制成功后更新房间状态
                return updateRoomStatus(machineNo);
            }
        } catch (Exception e) {
            Log.e(TAG, "控制房间空调失败: " + room.getRoomName(), e);
        }
        
        return null;
    }
}
