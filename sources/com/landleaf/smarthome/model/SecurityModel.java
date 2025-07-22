package com.landleaf.smarthome.model;

/* loaded from: classes.dex */
public class SecurityModel {
    private String alarmDevice;
    private int alarmId;
    private long alarmTime;
    private int alarmType;
    private int alarmZone;
    private String context;

    public int getAlarmZone() {
        return this.alarmZone;
    }

    public void setAlarmZone(int i) {
        this.alarmZone = i;
    }

    public int getAlarmType() {
        return this.alarmType;
    }

    public void setAlarmType(int i) {
        this.alarmType = i;
    }

    public long getAlarmTime() {
        return this.alarmTime;
    }

    public void setAlarmTime(long j) {
        this.alarmTime = j;
    }

    public int getAlarmId() {
        return this.alarmId;
    }

    public void setAlarmId(int i) {
        this.alarmId = i;
    }

    public String getContext() {
        return this.context;
    }

    public void setContext(String str) {
        this.context = str;
    }

    public String getAlarmDevice() {
        return this.alarmDevice;
    }

    public void setAlarmDevice(String str) {
        this.alarmDevice = str;
    }
}
