package com.landleaf.smarthome.model;

/* loaded from: classes.dex */
public class VersionModel {
    private boolean updateFlag;
    private String url;
    private String version;

    public String getVersion() {
        return this.version;
    }

    public void setVersion(String str) {
        this.version = str;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String str) {
        this.url = str;
    }

    public boolean isUpdateFlag() {
        return this.updateFlag;
    }

    public void setUpdateFlag(boolean z) {
        this.updateFlag = z;
    }
}
