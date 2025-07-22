package com.landleaf.smarthome.model;

/* loaded from: classes.dex */
public class SceneControlBean {
    boolean delayControl;
    int modeIndex;
    boolean remoteControl;

    public SceneControlBean(int i, boolean z) {
        this.modeIndex = i;
        this.remoteControl = z;
    }

    public boolean isDelayControl() {
        return this.delayControl;
    }

    public void setDelayControl(boolean z) {
        this.delayControl = z;
    }

    public int getModeIndex() {
        return this.modeIndex;
    }

    public boolean isRemountControl() {
        return this.remoteControl;
    }

    public String toString() {
        return "SceneControlBean{modeIndex=" + this.modeIndex + ", remoteControl=" + this.remoteControl + '}';
    }
}
