package com.landleaf.smarthome.model;

import java.io.Serializable;

/* loaded from: classes.dex */
public class DeviceAttribute implements Serializable {
    private int addValue;
    private String attrTag;
    private String attrValue;

    public DeviceAttribute() {
    }

    public DeviceAttribute(String str, String str2) {
        this.attrTag = str;
        this.attrValue = str2;
    }

    public DeviceAttribute(String str, int i) {
        this.attrTag = str;
        this.addValue = i;
    }

    public int getAddValue() {
        return this.addValue;
    }

    public void setAddValue(int i) {
        this.addValue = i;
    }

    public String getAttrTag() {
        return this.attrTag;
    }

    public void setAttrTag(String str) {
        this.attrTag = str;
    }

    public String getAttrValue() {
        return this.attrValue;
    }

    public void setAttrValue(String str) {
        this.attrValue = str;
    }

    public String toString() {
        return "DeviceAttribute{attrTag='" + this.attrTag + "', attrValue='" + this.attrValue + "', addValue=" + this.addValue + '}';
    }
}
