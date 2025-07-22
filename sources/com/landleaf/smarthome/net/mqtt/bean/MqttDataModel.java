package com.landleaf.smarthome.net.mqtt.bean;

import java.util.List;

/* loaded from: classes.dex */
public class MqttDataModel<T> {
    private String deviceSn;
    private List<T> items;
    private int productCode;
    private int sceneNo;
    private String updateType;

    public String getDeviceSn() {
        return this.deviceSn;
    }

    public String getUpdateType() {
        return this.updateType;
    }

    public void setUpdateType(String str) {
        this.updateType = str;
    }

    public void setDeviceSn(String str) {
        this.deviceSn = str;
    }

    public int getProductCode() {
        return this.productCode;
    }

    public void setProductCode(int i) {
        this.productCode = i;
    }

    public List<T> getItems() {
        return this.items;
    }

    public void setItems(List<T> list) {
        this.items = list;
    }

    public int getSceneNo() {
        return this.sceneNo;
    }

    public void setSceneNo(int i) {
        this.sceneNo = i;
    }

    public String toString() {
        return "MqttDataModel{deviceSn='" + this.deviceSn + "', productCode=" + this.productCode + ", items=" + this.items + ", sceneNo=" + this.sceneNo + ", updateType='" + this.updateType + "'}";
    }
}
