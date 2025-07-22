package com.landleaf.smarthome.model;

import java.util.List;

/* loaded from: classes.dex */
public class SceneDeviceModel {
    private List<DeviceAttribute> attrs;
    private String deviceName;
    private String deviceSn;
    private int hvacFlag;
    private List<HvacSceneModeListModel> hvacList;
    private String port;
    private String productCode;
    private Long roomId;
    private int sortNo;

    public String getDeviceSn() {
        return this.deviceSn;
    }

    public void setDeviceSn(String str) {
        this.deviceSn = str;
    }

    public String getDeviceName() {
        return this.deviceName;
    }

    public void setDeviceName(String str) {
        this.deviceName = str;
    }

    public String getPort() {
        return this.port;
    }

    public void setPort(String str) {
        this.port = str;
    }

    public int getSortNo() {
        return this.sortNo;
    }

    public void setSortNo(int i) {
        this.sortNo = i;
    }

    public Long getRoomId() {
        return this.roomId;
    }

    public void setRoomId(Long l) {
        this.roomId = l;
    }

    public String getProductCode() {
        return this.productCode;
    }

    public void setProductCode(String str) {
        this.productCode = str;
    }

    public int getHvacFlag() {
        return this.hvacFlag;
    }

    public void setHvacFlag(int i) {
        this.hvacFlag = i;
    }

    public List<DeviceAttribute> getAtts() {
        return this.attrs;
    }

    public void setAtts(List<DeviceAttribute> list) {
        this.attrs = list;
    }

    public List<HvacSceneModeListModel> getHvacList() {
        return this.hvacList;
    }

    public void setHvacList(List<HvacSceneModeListModel> list) {
        this.hvacList = list;
    }
}
