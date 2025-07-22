package com.landleaf.smarthome.model;

import java.io.Serializable;
import java.util.List;

/* loaded from: classes.dex */
public class DeviceModel implements Serializable {
    private static final long serialVersionUID = -850566081892463813L;
    private List<DeviceAttribute> attrs;
    private String deviceName;
    private String deviceSn;
    private int hvacFlag;
    private List<HvacSceneModeListModel> hvacList;

    /* renamed from: id */
    private Long f143id;
    private int port;
    private int productCode;
    private int protocol;
    private Long roomId;
    private int sortNo;

    public DeviceModel(Long l, String str, String str2, int i, int i2, int i3, Long l2, int i4, int i5) {
        this.f143id = null;
        this.f143id = l;
        this.deviceSn = str;
        this.deviceName = str2;
        this.port = i;
        this.protocol = i2;
        this.sortNo = i3;
        this.roomId = l2;
        this.productCode = i4;
        this.hvacFlag = i5;
    }

    public DeviceModel() {
        this.f143id = null;
    }

    public List<HvacSceneModeListModel> getHvacList() {
        return this.hvacList;
    }

    public void setHvacList(List<HvacSceneModeListModel> list) {
        this.hvacList = list;
    }

    public int getProtocol() {
        return this.protocol;
    }

    public void setProtocol(int i) {
        this.protocol = i;
    }

    public List<DeviceAttribute> getAtts() {
        return this.attrs;
    }

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

    public int getPort() {
        return this.port;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public int getSortNo() {
        return this.sortNo;
    }

    public void setSortNo(int i) {
        this.sortNo = i;
    }

    public int getProductCode() {
        return this.productCode;
    }

    public void setProductCode(int i) {
        this.productCode = i;
    }

    public List<DeviceAttribute> getAttrs() {
        return this.attrs;
    }

    public void setAttrs(List<DeviceAttribute> list) {
        this.attrs = list;
    }

    public Long getId() {
        return this.f143id;
    }

    public void setId(Long l) {
        this.f143id = l;
    }

    public Long getRoomId() {
        return this.roomId;
    }

    public void setRoomId(Long l) {
        this.roomId = l;
    }

    public int getHvacFlag() {
        return this.hvacFlag;
    }

    public void setHvacFlag(int i) {
        this.hvacFlag = i;
    }
}
