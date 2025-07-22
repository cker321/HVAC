package com.dnake.desktop.bean;

/* loaded from: classes.dex */
public class RegisterInfo {
    String deviceID;
    String floorId;
    String ipAddress;
    String roomId;
    String roomType;
    String unitId;

    public String getFloorId() {
        return this.floorId;
    }

    public void setFloorId(String str) {
        this.floorId = str;
    }

    public String getUnitId() {
        return this.unitId;
    }

    public void setUnitId(String str) {
        this.unitId = str;
    }

    public String getRoomType() {
        return this.roomType;
    }

    public void setRoomType(String str) {
        this.roomType = str;
    }

    public String getRoomId() {
        return this.roomId;
    }

    public void setRoomId(String str) {
        this.roomId = str;
    }

    public String getIpAddress() {
        return this.ipAddress;
    }

    public void setIpAddress(String str) {
        this.ipAddress = str;
    }

    public String getDeviceID() {
        return this.deviceID;
    }

    public void setDeviceID(String str) {
        this.deviceID = str;
    }

    public String toString() {
        return "RegisterInfo{floorId='" + this.floorId + "', unitId='" + this.unitId + "', roomType='" + this.roomType + "', roomId='" + this.roomId + "', ipAddress='" + this.ipAddress + "', deviceID='" + this.deviceID + "'}";
    }
}
