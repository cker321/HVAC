package com.dnake.desktop.bean;

/* loaded from: classes.dex */
public class LandleafDbEvent {
    private boolean res;
    private boolean useErrorProtocol;

    public boolean isUseErrorProtocol() {
        return this.useErrorProtocol;
    }

    public void setUseErrorProtocol(boolean z) {
        this.useErrorProtocol = z;
    }

    public LandleafDbEvent(boolean z) {
        this.res = z;
    }

    public boolean isRes() {
        return this.res;
    }

    public void setRes(boolean z) {
        this.res = z;
    }

    public String toString() {
        return "LandleafDbEvent{res=" + this.res + ", useErrorProtocol=" + this.useErrorProtocol + '}';
    }
}
