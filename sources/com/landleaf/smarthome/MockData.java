package com.landleaf.smarthome;

import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.device.AttributeValueConst;
import com.landleaf.smarthome.device.ProductCodeConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.SecurityModel;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class MockData {
    public static List<SecurityModel> getSecurityList() {
        ArrayList arrayList = new ArrayList();
        SecurityModel securityModel = new SecurityModel();
        securityModel.setAlarmId(1);
        securityModel.setAlarmTime(System.currentTimeMillis());
        securityModel.setAlarmZone(1);
        securityModel.setAlarmDevice("红外");
        securityModel.setContext("报警");
        arrayList.add(securityModel);
        SecurityModel securityModel2 = new SecurityModel();
        securityModel2.setAlarmId(2);
        securityModel2.setAlarmTime(System.currentTimeMillis());
        securityModel2.setAlarmZone(2);
        securityModel2.setAlarmDevice("烟感");
        securityModel2.setContext("报警");
        arrayList.add(securityModel2);
        return arrayList;
    }

    public static DeviceModel getDeviceModel() {
        DeviceModel deviceModel = new DeviceModel();
        deviceModel.setDeviceSn("1");
        deviceModel.setProductCode(ProductCodeConst.VRV);
        ArrayList arrayList = new ArrayList();
        DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.SWITCH, "off");
        DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.SYS_MODE, "hot");
        DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.WIND_SPEED, AttributeValueConst.WIND_1);
        arrayList.add(deviceAttribute);
        arrayList.add(deviceAttribute2);
        arrayList.add(deviceAttribute3);
        deviceModel.setAttrs(arrayList);
        return deviceModel;
    }
}
