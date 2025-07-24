package com.example.apkapiservice.bean;

/**
 * 房间类，包含房间信息和空调状态
 */
public class Room {
    private int id;
    private int machineNo;        // 空调机号
    private String roomName;      // 房间名称
    private TicaInnerStatus status; // 空调状态

    public Room() {
        this.status = new TicaInnerStatus();
    }

    public Room(int machineNo, String roomName) {
        this.id = machineNo;
        this.machineNo = machineNo;
        this.roomName = roomName;
        this.status = new TicaInnerStatus();
    }

    public int getMachineNo() {
        return machineNo;
    }

    public void setMachineNo(int machineNo) {
        this.machineNo = machineNo;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TicaInnerStatus getStatus() {
        return status;
    }

    public void setStatus(TicaInnerStatus status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Room{" +
                "machineNo=" + machineNo +
                ", roomName='" + roomName + '\'' +
                ", status=" + status +
                '}';
    }
}
