package com.landleaf.smarthome.model;

/* loaded from: classes.dex */
public class TimingModel {
    private int enabled;
    private String endDate;
    private String executeTime;
    private String sceneId;
    private String sceneName;
    private int skipHoliday;
    private String startDate;
    private String timingId;
    private int type;
    private String weekday;

    public String getTimingId() {
        return this.timingId;
    }

    public void setTimingId(String str) {
        this.timingId = str;
    }

    public String getSceneId() {
        return this.sceneId;
    }

    public void setSceneId(String str) {
        this.sceneId = str;
    }

    public String getSceneName() {
        return this.sceneName;
    }

    public void setSceneName(String str) {
        this.sceneName = str;
    }

    public String getExecuteTime() {
        return this.executeTime;
    }

    public void setExecuteTime(String str) {
        this.executeTime = str;
    }

    public int getType() {
        return this.type;
    }

    public void setType(int i) {
        this.type = i;
    }

    public int getEnabled() {
        return this.enabled;
    }

    public void setEnabled(int i) {
        this.enabled = i;
    }

    public int getSkipHoliday() {
        return this.skipHoliday;
    }

    public void setSkipHoliday(int i) {
        this.skipHoliday = i;
    }

    public String getWeekday() {
        return this.weekday;
    }

    public void setWeekday(String str) {
        this.weekday = str;
    }

    public String getStartDate() {
        return this.startDate;
    }

    public void setStartDate(String str) {
        this.startDate = str;
    }

    public String getEndDate() {
        return this.endDate;
    }

    public void setEndDate(String str) {
        this.endDate = str;
    }
}
