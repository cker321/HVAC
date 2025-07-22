package com.landleaf.smarthome.net.mqtt.bean;

/* loaded from: classes.dex */
public class MqttHeaderModel {
    private int ackCode;
    private String messageId;
    private String name;
    private String screenMac;

    public int getAckCode() {
        return this.ackCode;
    }

    public void setAckCode(int i) {
        this.ackCode = i;
    }

    public String getMessageId() {
        return this.messageId;
    }

    public void setMessageId(String str) {
        this.messageId = str;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String getScreenMac() {
        return this.screenMac;
    }

    public void setScreenMac(String str) {
        this.screenMac = str;
    }
}
