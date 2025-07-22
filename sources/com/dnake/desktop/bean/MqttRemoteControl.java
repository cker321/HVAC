package com.dnake.desktop.bean;

/* loaded from: classes.dex */
public class MqttRemoteControl {
    private int controlAddress;
    private int controlValue;
    private String deviceSn;
    private int productCode;

    public MqttRemoteControl(String str, int i) {
        this.deviceSn = str;
        this.productCode = i;
    }

    public void setControlAddress(int i) {
        this.controlAddress = i;
    }

    public void setControlValue(int i) {
        this.controlValue = i;
    }

    public String getDeviceSn() {
        return this.deviceSn;
    }

    public int getProductCode() {
        return this.productCode;
    }

    public int getControlAddress() {
        return this.controlAddress;
    }

    public int getControlValue() {
        return this.controlValue;
    }

    public String toString() {
        return "MqttRemoteControl{deviceSn=" + this.deviceSn + ", productCode=" + this.productCode + ", controlAddress=" + this.controlAddress + ", controlValue=" + this.controlValue + '}';
    }
}
