package com.landleaf.smarthome.device;

import com.landleaf.smarthome.model.DeviceAttribute;
import java.io.Serializable;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class BaseLocalDeviceModel implements Serializable {
    protected Map<String, Integer> attTagAdd;
    protected Map<String, DeviceAttribute> attValueAdd;
    protected boolean isMultiple;

    public abstract int getAddLength();

    public abstract Map<String, Integer> getAttTagAdd();

    public abstract Map<String, DeviceAttribute> getAttValueAdd();

    public abstract int getStartAdd();

    public boolean getIsMultiple() {
        return this.isMultiple;
    }

    public void setAttTagAdd(Map<String, Integer> map) {
        this.attTagAdd = map;
    }

    public void setAttValueAdd(Map<String, DeviceAttribute> map) {
        this.attValueAdd = map;
    }

    public void setMultiple(boolean z) {
        this.isMultiple = z;
    }
}
