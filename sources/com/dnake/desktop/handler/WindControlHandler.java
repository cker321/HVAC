package com.dnake.desktop.handler;

import com.dnake.desktop.bean.NtWriteResult;
import com.dnake.desktop.bean.WindStatus;
import com.dnake.desktop.callback.Rs485Callback;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.dnake.Rs485Executor;
import com.dnake.desktop.utils.Rs485Utils;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.device.ProductCodeConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.net.hardware.ProtocolUtils;
import com.landleaf.smarthome.net.mqtt.MqttExecutor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.greenrobot.eventbus.EventBus;

/* loaded from: classes.dex */
public class WindControlHandler implements Rs485Callback {
    private WindStatus prePowerWindStatus;
    private WindStatus preTempWindStatus;
    private final int WIND_ADDRESS = 2;
    private final int READ_FUNCTION_CODE = 3;
    private final int WRITE_FUNCTION_CODE = 6;
    private final int READ_FUNCTION_CODE_BUG = 1;
    private final int START_ADDRESS_TEMP = 0;
    private final int READ_LENGTH_TEMP = 16;
    private final int START_ADDRESS_SYSTEM = 50;
    private final int READ_LENGTH_SYSTEM = 4;
    private final int INDEX_SHOW_TEMP = 15;
    private final int INDEX_SHOW_HUMIDITY = 11;
    private final int INDEX_SWITCH = 0;
    private final int INDEX_MODE = 1;
    private final int INDEX_WIND_SPEED = 2;
    private final int INDEX_HUMIDIFICATION = 3;
    private String deviceSn = "71071";
    HashMap<Integer, String> hashMap = new HashMap<>();

    private String getPowerAttrValue(int i) {
        return i == 1 ? "on" : "off";
    }

    private String getWindModeAttrValue(int i) {
        return i == 1 ? "cold" : i == 3 ? "hot" : i == 0 ? "wind" : i == 2 ? "dehumidification" : Constant.ATTR_MODE_AUTO;
    }

    private String getWindSpeedAttrValue(int i) {
        return i == 0 ? "high_speed" : i == 1 ? "medium_speed" : "low_speed";
    }

    public void setDeviceSn(String str) {
        this.deviceSn = str;
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void read() {
        readShowTemp();
        readSystemStatus();
    }

    private void readShowTemp() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(2, 3, 0, 16);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                WindStatus data = parseData(true, bArrWrite);
                EventBus.getDefault().post(data);
                upload(data);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void readSystemStatus() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(2, 3, 50, 4);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                WindStatus data = parseData(false, bArrWrite);
                EventBus.getDefault().post(data);
                upload(data);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void upload(WindStatus windStatus) {
        if (adjustUpload(windStatus)) {
            DeviceModel deviceModel = new DeviceModel();
            deviceModel.setDeviceSn(this.deviceSn);
            deviceModel.setProductCode(ProductCodeConst.GLC);
            ArrayList arrayList = new ArrayList();
            if (windStatus.isTypeTemp()) {
                arrayList.add(new DeviceAttribute(AttributeTagConst.RETURN_AIR_TEMP, String.valueOf((int) windStatus.getShowTemp())));
                this.preTempWindStatus = windStatus;
            } else {
                DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.SWITCH, getPowerAttrValue(windStatus.getPower()));
                DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.SYS_MODE, getWindModeAttrValue(windStatus.getMode()));
                DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.WIND_SPEED, getWindSpeedAttrValue(windStatus.getWindSpeed()));
                DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.HUMI_ENABLE, getPowerAttrValue(windStatus.getHumiditySwitch()));
                arrayList.add(deviceAttribute);
                arrayList.add(deviceAttribute2);
                arrayList.add(deviceAttribute3);
                arrayList.add(deviceAttribute4);
                this.prePowerWindStatus = windStatus;
            }
            deviceModel.setAttrs(arrayList);
            MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
        }
    }

    private boolean adjustUpload(WindStatus windStatus) {
        if (this.prePowerWindStatus != null && this.preTempWindStatus != null) {
            if (windStatus.isTypeTemp() && this.preTempWindStatus.equals(windStatus)) {
                return false;
            }
            if (!windStatus.isTypeTemp() && this.prePowerWindStatus.equals(windStatus)) {
                return false;
            }
        }
        return true;
    }

    private WindStatus parseData(boolean z, byte[] bArr) {
        WindStatus windStatus = new WindStatus();
        windStatus.setTypeTemp(z);
        int[] intArray = Rs485Utils.getInstance().toIntArray(Rs485Utils.getInstance().calReadDataArray(bArr));
        if (z) {
            windStatus.setShowTemp(intArray[15] / 10.0f);
            windStatus.setWindHumidity(intArray[11] / 10.0f);
            return windStatus;
        }
        windStatus.setPower(intArray[0]);
        windStatus.setMode(intArray[1]);
        windStatus.setWindSpeed(intArray[2]);
        windStatus.setHumiditySwitch(intArray[3]);
        return windStatus;
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void write(int i, int i2) {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(2, 6, i, i2);
        try {
            if (Rs485Utils.getInstance().returnCheck(Rs485Executor.getInstance().write(readSendBytes, 300), readSendBytes)) {
                EventBus.getDefault().post(new NtWriteResult(i, i2, true));
                uploadWrite(i, i2);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void uploadWrite(int i, int i2) {
        DeviceModel deviceModel = new DeviceModel();
        deviceModel.setDeviceSn(this.deviceSn);
        deviceModel.setProductCode(ProductCodeConst.GLC);
        ArrayList arrayList = new ArrayList();
        if (i == 50) {
            arrayList.add(new DeviceAttribute(AttributeTagConst.SWITCH, getPowerAttrValue(i2)));
        }
        if (i == 51) {
            arrayList.add(new DeviceAttribute(AttributeTagConst.SYS_MODE, getWindModeAttrValue(i2)));
        }
        if (i == 52) {
            arrayList.add(new DeviceAttribute(AttributeTagConst.WIND_SPEED, getWindSpeedAttrValue(i2)));
        }
        if (i == 53) {
            arrayList.add(new DeviceAttribute(AttributeTagConst.HUMI_ENABLE, getPowerAttrValue(i2)));
        }
        deviceModel.setAttrs(arrayList);
        MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void uploadDeviceBug() {
        handlerWindRecord(0, 0, 43);
        handlerWindRecord(1, 50, 62);
        handlerWindRecord(2, 200, 52);
        handlerWindRecord(3, 300, 37);
        uploadBug();
    }

    private void uploadBug() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(2, 1, 0, 80);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                List<Integer> faults4FaultAdds = ProtocolUtils.getFaults4FaultAdds(Rs485Utils.getInstance().toIntArray(Rs485Utils.getInstance().calReadDataArray(bArrWrite)));
                DeviceModel deviceModel = new DeviceModel();
                deviceModel.setDeviceSn(this.deviceSn);
                deviceModel.setProductCode(ProductCodeConst.GLC);
                ArrayList arrayList = new ArrayList();
                DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.GLC_1_FAULT_1, String.valueOf(faults4FaultAdds.get(0)));
                DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.GLC_1_FAULT_2, String.valueOf(faults4FaultAdds.get(1)));
                DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.GLC_1_FAULT_3, String.valueOf(faults4FaultAdds.get(2)));
                DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.GLC_1_FAULT_4, String.valueOf(faults4FaultAdds.get(3)));
                DeviceAttribute deviceAttribute5 = new DeviceAttribute(AttributeTagConst.GLC_1_FAULT_5, String.valueOf(faults4FaultAdds.get(4)));
                arrayList.add(deviceAttribute);
                arrayList.add(deviceAttribute2);
                arrayList.add(deviceAttribute3);
                arrayList.add(deviceAttribute4);
                arrayList.add(deviceAttribute5);
                deviceModel.setAttrs(arrayList);
                MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void handlerWindRecord(int i, int i2, int i3) {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(2, 3, i2, i3);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                this.hashMap.put(Integer.valueOf(i), getUploadString(Rs485Utils.getInstance().toIntArray(Rs485Utils.getInstance().calReadDataArray(bArrWrite))));
                if (updateWindStatus()) {
                    StringBuffer stringBuffer = new StringBuffer();
                    Iterator<Integer> it = this.hashMap.keySet().iterator();
                    while (it.hasNext()) {
                        stringBuffer.append(this.hashMap.get(it.next()));
                    }
                    stringBuffer.delete(stringBuffer.length() - 1, stringBuffer.length());
                    DeviceModel deviceModel = new DeviceModel();
                    deviceModel.setDeviceSn(this.deviceSn);
                    deviceModel.setProductCode(ProductCodeConst.GLC);
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(new DeviceAttribute(AttributeTagConst.GLC_WIND_STATUS, stringBuffer.toString()));
                    deviceModel.setAttrs(arrayList);
                    MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
                    Iterator<Integer> it2 = this.hashMap.keySet().iterator();
                    while (it2.hasNext()) {
                        this.hashMap.put(it2.next(), null);
                    }
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private String getUploadString(int[] iArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i : iArr) {
            stringBuffer.append(i + "_");
        }
        return stringBuffer.toString();
    }

    private boolean updateWindStatus() {
        if (this.hashMap.keySet().size() != 4) {
            return false;
        }
        Iterator<Integer> it = this.hashMap.keySet().iterator();
        while (it.hasNext()) {
            if (this.hashMap.get(it.next()) == null) {
                return false;
            }
        }
        return true;
    }
}
