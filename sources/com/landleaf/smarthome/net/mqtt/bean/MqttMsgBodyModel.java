package com.landleaf.smarthome.net.mqtt.bean;

import java.io.Serializable;

/* loaded from: classes.dex */
public class MqttMsgBodyModel<T> implements Serializable {
    private static final long serialVersionUID = 8443750514590483952L;
    private MqttHeaderModel header;
    private MqttPayloadModel<T> payload;

    public MqttHeaderModel getHeader() {
        return this.header;
    }

    public void setHeader(MqttHeaderModel mqttHeaderModel) {
        this.header = mqttHeaderModel;
    }

    public MqttPayloadModel<T> getPayload() {
        return this.payload;
    }

    public void setPayload(MqttPayloadModel<T> mqttPayloadModel) {
        this.payload = mqttPayloadModel;
    }

    public String toString() {
        return "MqttMsgBodyModel{header=" + this.header + ", payload=" + this.payload + '}';
    }
}
