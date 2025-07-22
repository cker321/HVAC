package com.landleaf.smarthome.device;

import com.landleaf.smarthome.model.DeviceAttribute;
import java.util.HashMap;
import java.util.Map;

@ProductCodeAnnotation({ProductCodeConst.SENSOR})
/* loaded from: classes.dex */
public class SensorModel extends BaseLocalDeviceModel {
    private static volatile SensorModel singleton;

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getAddLength() {
        return 5;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public int getStartAdd() {
        return 1;
    }

    private SensorModel() {
    }

    public static SensorModel getInstance() {
        if (singleton == null) {
            synchronized (SensorModel.class) {
                if (singleton == null) {
                    singleton = new SensorModel();
                }
            }
        }
        return singleton;
    }

    @Override // com.landleaf.smarthome.device.BaseLocalDeviceModel
    public Map<String, Integer> getAttTagAdd() {
        if (this.attTagAdd == null) {
            this.attTagAdd = new HashMap();
            this.attTagAdd.put(AttributeTagConst.TEMP, 0);
            this.attTagAdd.put(AttributeTagConst.HUMIDITY, 1);
            this.attTagAdd.put(AttributeTagConst.VOC, 2);
            this.attTagAdd.put(AttributeTagConst.CO2, 3);
            this.attTagAdd.put(AttributeTagConst.PM25, 4);
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
