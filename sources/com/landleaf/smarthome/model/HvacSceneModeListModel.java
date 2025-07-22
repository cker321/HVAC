package com.landleaf.smarthome.model;

import java.io.Serializable;
import java.util.List;

/* loaded from: classes.dex */
public class HvacSceneModeListModel implements Serializable {
    List<DeviceAttribute> attrs;
    List<DeviceModel> temPanel;

    public List<DeviceAttribute> getAtts() {
        return this.attrs;
    }

    public void setAtts(List<DeviceAttribute> list) {
        this.attrs = list;
    }

    public List<DeviceModel> getTemPanel() {
        return this.temPanel;
    }

    public void setTemPanel(List<DeviceModel> list) {
        this.temPanel = list;
    }
}
