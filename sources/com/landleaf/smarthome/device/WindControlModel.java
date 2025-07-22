package com.landleaf.smarthome.device;

import com.landleaf.smarthome.model.DeviceAttribute;
import java.util.HashMap;
import java.util.Map;

@ProductCodeAnnotation({ProductCodeConst.GLC})
/* loaded from: classes.dex */
public class WindControlModel extends BaseLocalDeviceModel {
    private static volatile WindControlModel singleton;

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getAddLength() {
        return 5;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getStartAdd() {
        return 1;
    }

    private WindControlModel() {
    }

    public static WindControlModel getInstance() {
        if (singleton == null) {
            synchronized (WindControlModel.class) {
                if (singleton == null) {
                    singleton = new WindControlModel();
                }
            }
        }
        return singleton;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public Map<String, Integer> getAttTagAdd() {
        if (this.attTagAdd == null) {
            this.attTagAdd = new HashMap();
            this.attTagAdd.put(AttributeTagConst.SWITCH, 50);
            this.attTagAdd.put(AttributeTagConst.SYS_MODE, 51);
            this.attTagAdd.put(AttributeTagConst.WIND_SPEED, 52);
            this.attTagAdd.put(AttributeTagConst.HUMI_ENABLE, 53);
            this.attTagAdd.put(AttributeTagConst.RETURN_AIR_TEMP, 15);
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
