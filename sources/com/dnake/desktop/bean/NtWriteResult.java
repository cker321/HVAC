package com.dnake.desktop.bean;

/* loaded from: classes.dex */
public class NtWriteResult {
    int address;
    float value;
    boolean writeWind;

    public NtWriteResult(int i, float f, boolean z) {
        this.address = i;
        this.value = f;
        this.writeWind = z;
    }

    public int getAddress() {
        return this.address;
    }

    public float getValue() {
        return this.value;
    }

    public boolean isWriteWind() {
        return this.writeWind;
    }

    public String toString() {
        return "NtWriteResult{address=" + this.address + ", value=" + this.value + ", writeWind=" + this.writeWind + '}';
    }
}
