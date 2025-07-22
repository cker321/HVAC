package com.landleaf.smarthome.net.mqtt.bean;

/* loaded from: classes.dex */
public class MqttPayloadModel<T> {
    private int code;
    private MqttDataModel<T> data;
    private String message;

    public int getCode() {
        return this.code;
    }

    public void setCode(int i) {
        this.code = i;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String str) {
        this.message = str;
    }

    public MqttDataModel<T> getData() {
        return this.data;
    }

    public void setData(MqttDataModel<T> mqttDataModel) {
        this.data = mqttDataModel;
    }

    public String toString() {
        return "MqttPayloadModel{code=" + this.code + ", message='" + this.message + "', data=" + this.data + '}';
    }
}
