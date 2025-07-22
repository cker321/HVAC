package com.dnake.desktop.bean;

/* loaded from: classes.dex */
public class AirControlReturn {
    private String msg;

    /* renamed from: ok */
    private boolean f98ok;

    public AirControlReturn(boolean z) {
        this.f98ok = z;
    }

    public AirControlReturn(String str, boolean z) {
        this.msg = str;
        this.f98ok = z;
    }

    public boolean isOk() {
        return this.f98ok;
    }

    public void setOk(boolean z) {
        this.f98ok = z;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String str) {
        this.msg = str;
    }
}
