package com.dnake.desktop.controller;

import android.util.Log;
import com.dnake.desktop.bean.RegisterInfo;
import com.dnake.desktop.costant.VariableConstant;
import com.dnake.desktop.dnake.v700.dxml;

/* loaded from: classes.dex */
public class SettingController {
    RegisterInfo infoUpdate() {
        RegisterInfo registerInfo = new RegisterInfo();
        dxml dxmlVar = new dxml();
        dxmlVar.load("/dnake/cfg/sys.xml");
        int i = dxmlVar.getInt("/sys/talk/building", 0);
        int i2 = dxmlVar.getInt("/sys/talk/unit", 0);
        int i3 = dxmlVar.getInt("/sys/talk/floor", 0);
        int i4 = dxmlVar.getInt("/sys/talk/family", 0);
        Log.d("SettingController", i + "," + i2 + "," + i3 + "," + i4);
        registerInfo.setFloorId(String.valueOf(i));
        registerInfo.setUnitId(String.valueOf(i2));
        StringBuilder sb = new StringBuilder();
        sb.append(i3);
        sb.append(String.format("%02d", Integer.valueOf(i4)));
        registerInfo.setRoomId(sb.toString());
        registerInfo.setRoomType(VariableConstant.HOUSE_TYPE);
        registerInfo.setIpAddress(VariableConstant.DEVICE_IP);
        registerInfo.setDeviceID(VariableConstant.DEVICE_ID);
        return registerInfo;
    }
}
