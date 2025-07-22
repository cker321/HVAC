package com.landleaf.smarthome.device;

import com.landleaf.smarthome.model.DeviceAttribute;
import java.util.HashMap;
import java.util.Map;

@ProductCodeAnnotation({ProductCodeConst.GLV})
/* loaded from: classes.dex */
public class AirControlModel extends BaseLocalDeviceModel {
    private static volatile AirControlModel singleton;

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getAddLength() {
        return 5;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getStartAdd() {
        return 1;
    }

    private AirControlModel() {
    }

    public static AirControlModel getInstance() {
        if (singleton == null) {
            synchronized (AirControlModel.class) {
                if (singleton == null) {
                    singleton = new AirControlModel();
                }
            }
        }
        return singleton;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public Map<String, Integer> getAttTagAdd() {
        if (this.attTagAdd == null) {
            this.attTagAdd = new HashMap();
            this.attTagAdd.put(AttributeTagConst.SYS_MODE, 0);
            this.attTagAdd.put(AttributeTagConst.TEMP_SETTING, 1);
            this.attTagAdd.put(AttributeTagConst.WIND_SPEED, 2);
            this.attTagAdd.put(AttributeTagConst.SWITCH, 3);
            this.attTagAdd.put(AttributeTagConst.TEMP, 151);
        }
        return this.attTagAdd;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public Map<String, DeviceAttribute> getAttValueAdd() {
        if (this.attValueAdd == null) {
            this.attValueAdd = new HashMap();
        }
        return this.attValueAdd;
    }
}
