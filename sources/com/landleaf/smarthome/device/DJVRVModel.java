package com.landleaf.smarthome.device;

import com.landleaf.smarthome.model.DeviceAttribute;
import java.util.HashMap;
import java.util.Map;

@ProductCodeAnnotation({ProductCodeConst.VRV})
/* loaded from: classes.dex */
public class DJVRVModel extends BaseLocalDeviceModel {
    private static volatile DJVRVModel singleton;

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getAddLength() {
        return 100;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public boolean getIsMultiple() {
        return true;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getStartAdd() {
        return 0;
    }

    private DJVRVModel() {
    }

    public static DJVRVModel getInstance() {
        if (singleton == null) {
            synchronized (DJVRVModel.class) {
                if (singleton == null) {
                    singleton = new DJVRVModel();
                }
            }
        }
        return singleton;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public Map<String, Integer> getAttTagAdd() {
        if (this.attTagAdd == null) {
            this.attTagAdd = new HashMap();
            this.attTagAdd.put(AttributeTagConst.SWITCH, 18);
        }
        return this.attTagAdd;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public Map<String, DeviceAttribute> getAttValueAdd() {
        if (this.attValueAdd == null) {
            this.attValueAdd = new HashMap();
            this.attValueAdd.put("on", new DeviceAttribute(AttributeTagConst.SWITCH, 1));
            this.attValueAdd.put("off", new DeviceAttribute(AttributeTagConst.SWITCH, 2));
            this.attValueAdd.put("cold", new DeviceAttribute(AttributeTagConst.SYS_MODE, 1));
            this.attValueAdd.put("hot", new DeviceAttribute(AttributeTagConst.SYS_MODE, 2));
            this.attValueAdd.put("wind", new DeviceAttribute(AttributeTagConst.SYS_MODE, 3));
            this.attValueAdd.put("dehumidification", new DeviceAttribute(AttributeTagConst.SYS_MODE, 4));
        }
        return this.attValueAdd;
    }
}
