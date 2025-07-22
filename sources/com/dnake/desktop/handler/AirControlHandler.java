package com.dnake.desktop.handler;

import android.text.TextUtils;
import android.util.Log;
import com.dnake.desktop.bean.NtWriteResult;
import com.dnake.desktop.bean.TicaInnerStatus;
import com.dnake.desktop.callback.Rs485Callback;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.dnake.Rs485Executor;
import com.dnake.desktop.utils.Rs485Utils;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.device.ProductCodeConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.net.mqtt.MqttExecutor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.greenrobot.eventbus.EventBus;

/* loaded from: classes.dex */
public class AirControlHandler implements Rs485Callback {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private List<TicaInnerStatus> deviceList;
    private TicaInnerStatus ticaInnerStatus;
    private String TAG = "AirControlHandler";
    private final int AIR_ADDRESS = 3;
    private int machineNo = 1;
    private final int INNER_START_ADDRESS = 144;
    private final int OUTER_START_ADDRESS = 96;
    private final int WRITE_FUNCTION_CODE = 16;
    private final int READ_FUNCTION_CODE = 3;
    private final int DEFAULT_WRITE_AMOUNT = 9;
    private final Map<Integer, TicaInnerStatus> hashMap = new ConcurrentHashMap();
    HashMap<Integer, TicaInnerStatus> uploadMap = new HashMap<>();

    private String getModeAttrValue(int i) {
        return i == 1 ? "cold" : i == 2 ? "hot" : i == 4 ? "wind" : "dehumidification";
    }

    private String getPowerAttrValue(boolean z) {
        return z ? "on" : "off";
    }

    private String getSpeedAttrValue(int i) {
        return i == 2 ? "high_speed" : i == 1 ? "medium_speed" : i == 0 ? "low_speed" : Constant.ATTR_SPEED_AUTO;
    }

    public void setDeviceList(List<TicaInnerStatus> list) {
        this.deviceList = list;
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void read() {
        readInnerStatus();
        readOuterStatus();
    }

    private void readInnerStatus() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(3, 3, ((this.machineNo - 1) * 16) + 144, 16);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                convertToTicaInnerStatus(this.ticaInnerStatus, Rs485Utils.getInstance().calReadDataArray(bArrWrite));
                EventBus.getDefault().post(this.ticaInnerStatus);
                this.ticaInnerStatus.setMachineNo(this.machineNo);
                this.ticaInnerStatus.setDeviceSn(String.valueOf(ProductCodeConst.GLV) + this.machineNo);
                uploadRead(this.ticaInnerStatus);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void readOuterStatus() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(3, 3, 96, 16);
        try {
            if (Rs485Utils.getInstance().returnCheck(Rs485Executor.getInstance().write(readSendBytes, 300), readSendBytes)) {
                EventBus.getDefault().post(new NtWriteResult(100, Rs485Utils.getInstance().toIntArray(Rs485Utils.getInstance().calReadDataArray(r1))[4] / 10.0f, false));
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void write(int i, int i2) {
        DeviceModel deviceModel = new DeviceModel();
        deviceModel.setDeviceSn(String.valueOf(ProductCodeConst.GLV) + this.machineNo);
        deviceModel.setProductCode(ProductCodeConst.GLV);
        ArrayList arrayList = new ArrayList();
        int iPow = (int) Math.pow(2.0d, (double) (this.machineNo - 1));
        if (i == 1) {
            this.ticaInnerStatus.setSettingTemp(i2);
            arrayList.add(new DeviceAttribute(AttributeTagConst.TEMP_SETTING, String.valueOf(i2)));
        }
        if (i == 3) {
            this.ticaInnerStatus.setPowerSetting(i2 == 128);
            arrayList.add(new DeviceAttribute(AttributeTagConst.SWITCH, getPowerAttrValue(this.ticaInnerStatus.isPowerSetting())));
        }
        if (i == 0) {
            this.ticaInnerStatus.setSettingMode(i2);
            arrayList.add(new DeviceAttribute(AttributeTagConst.SYS_MODE, getModeAttrValue(i2)));
        }
        if (i == 2) {
            this.ticaInnerStatus.setSettingWindSpeed(i2);
            arrayList.add(new DeviceAttribute(AttributeTagConst.WIND_SPEED, getSpeedAttrValue(i2)));
        }
        byte[] bArrWriteStatusToBytes = writeStatusToBytes(this.ticaInnerStatus, iPow);
        try {
            if (Rs485Utils.getInstance().returnCheck(Rs485Executor.getInstance().write(bArrWriteStatusToBytes, 300), bArrWriteStatusToBytes)) {
                EventBus.getDefault().post(new NtWriteResult(i, i2, false));
                updateTica(this.machineNo);
                deviceModel.setAttrs(arrayList);
                MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public boolean handlerAirModeConflict(int i) {
        synchronized (this.hashMap) {
            boolean z = true;
            for (Integer num : this.hashMap.keySet()) {
                if (this.machineNo != num.intValue()) {
                    TicaInnerStatus ticaInnerStatus = this.hashMap.get(num);
                    Log.d("AirControlHandler", "integer:" + num + "," + ticaInnerStatus);
                    if (ticaInnerStatus.isPowerSetting()) {
                        int settingMode = ticaInnerStatus.getSettingMode();
                        if (i == 2 && i != settingMode) {
                            return false;
                        }
                        if (i == 1 && settingMode == 2) {
                            return false;
                        }
                        if (i == 4 && settingMode == 2) {
                            return false;
                        }
                        if (i == 5 && settingMode == 2) {
                            return false;
                        }
                        z = false;
                    } else {
                        continue;
                    }
                }
            }
            if (z) {
            }
            return true;
        }
    }

    public void upload() {
        List<TicaInnerStatus> list = this.deviceList;
        if (list != null) {
            for (TicaInnerStatus ticaInnerStatus : list) {
                byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(3, 3, ((ticaInnerStatus.getMachineNo() - 1) * 16) + 144, 16);
                try {
                    byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
                    if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                        convertToTicaInnerStatus(ticaInnerStatus, Rs485Utils.getInstance().calReadDataArray(bArrWrite));
                        uploadRead(ticaInnerStatus);
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void uploadRead(TicaInnerStatus ticaInnerStatus) {
        String deviceSn;
        if (!adjustUpload(this.uploadMap.get(Integer.valueOf(ticaInnerStatus.getMachineNo())), ticaInnerStatus)) {
            Log.d(this.TAG, "upload 数据一致");
            return;
        }
        DeviceModel deviceModel = new DeviceModel();
        if (TextUtils.isEmpty(ticaInnerStatus.getDeviceSn())) {
            deviceSn = String.valueOf(ProductCodeConst.GLV) + ticaInnerStatus.getMachineNo();
        } else {
            deviceSn = ticaInnerStatus.getDeviceSn();
        }
        deviceModel.setDeviceSn(deviceSn);
        deviceModel.setProductCode(ProductCodeConst.GLV);
        ArrayList arrayList = new ArrayList();
        DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.SWITCH, getPowerAttrValue(ticaInnerStatus.isPowerSetting()));
        DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.SYS_MODE, getModeAttrValue(ticaInnerStatus.getSettingMode()));
        DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.TEMP_SETTING, String.valueOf(ticaInnerStatus.getSettingTemp()));
        DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.WIND_SPEED, getSpeedAttrValue(ticaInnerStatus.getSettingWindSpeed()));
        DeviceAttribute deviceAttribute5 = new DeviceAttribute(AttributeTagConst.TEMP, String.valueOf(ticaInnerStatus.getReturnAirTemperature()));
        arrayList.add(deviceAttribute);
        arrayList.add(deviceAttribute2);
        arrayList.add(deviceAttribute3);
        arrayList.add(deviceAttribute4);
        arrayList.add(deviceAttribute5);
        deviceModel.setAttrs(arrayList);
        MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
        this.uploadMap.put(Integer.valueOf(ticaInnerStatus.getMachineNo()), ticaInnerStatus);
    }

    private boolean adjustUpload(TicaInnerStatus ticaInnerStatus, TicaInnerStatus ticaInnerStatus2) {
        return ticaInnerStatus == null || !ticaInnerStatus.equals(ticaInnerStatus2);
    }

    public void writeSceneMultiple(List<Integer> list, TicaInnerStatus ticaInnerStatus) {
        int i = 0;
        boolean z = list == null;
        if (list != null) {
            for (Integer num : list) {
                double d = i;
                double dPow = Math.pow(2.0d, num.intValue() - 1);
                Double.isNaN(d);
                i = (int) (d + dPow);
                if (num.intValue() == this.machineNo) {
                    z = true;
                }
            }
        }
        Log.d("AirControlHandler", "====ticaInnerStatus:" + ticaInnerStatus + "===" + z + "writeMachineNum" + i);
        byte[] bArrWriteStatusToBytes = writeStatusToBytes(ticaInnerStatus, i);
        try {
            if (Rs485Utils.getInstance().returnCheck(Rs485Executor.getInstance().write(bArrWriteStatusToBytes, 300), bArrWriteStatusToBytes)) {
                if (z) {
                    EventBus.getDefault().post(ticaInnerStatus);
                }
                updateHash(list);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void uploadSceneWrite(String str, TicaInnerStatus ticaInnerStatus, boolean z) {
        DeviceModel deviceModel = new DeviceModel();
        deviceModel.setDeviceSn(str);
        deviceModel.setProductCode(ProductCodeConst.GLV);
        ArrayList arrayList = new ArrayList();
        if (z) {
            arrayList.add(new DeviceAttribute(AttributeTagConst.SWITCH, "off"));
            deviceModel.setAttrs(arrayList);
            MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
            return;
        }
        DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.SWITCH, "on");
        DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.SYS_MODE, getModeAttrValue(ticaInnerStatus.getSettingMode()));
        DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.TEMP_SETTING, String.valueOf(ticaInnerStatus.getSettingTemp()));
        DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.WIND_SPEED, getSpeedAttrValue(ticaInnerStatus.getSettingWindSpeed()));
        arrayList.add(deviceAttribute);
        arrayList.add(deviceAttribute2);
        arrayList.add(deviceAttribute3);
        arrayList.add(deviceAttribute4);
        deviceModel.setAttrs(arrayList);
        MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
    }

    private void updateHash(List<Integer> list) {
        synchronized (this.hashMap) {
            for (Integer num : this.hashMap.keySet()) {
                if (list == null) {
                    updateTica(num.intValue());
                    return;
                } else if (list.contains(num)) {
                    updateTica(num.intValue());
                }
            }
        }
    }

    private void updateTica(int i) {
        TicaInnerStatus ticaInnerStatus = this.hashMap.get(Integer.valueOf(i));
        ticaInnerStatus.setSettingMode(this.ticaInnerStatus.getSettingMode());
        ticaInnerStatus.setPowerSetting(this.ticaInnerStatus.isPowerSetting());
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void uploadDeviceBug() {
        byte[] readSendBytes = Rs485Utils.getInstance().getReadSendBytes(3, 3, 10, 7);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(readSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, readSendBytes)) {
                int[] intArray = Rs485Utils.getInstance().toIntArray(Rs485Utils.getInstance().calReadDataArray(bArrWrite));
                String deviceSn = this.deviceList.get(0).getDeviceSn();
                if (TextUtils.isEmpty(deviceSn)) {
                    deviceSn = "82001";
                }
                DeviceModel deviceModel = new DeviceModel();
                deviceModel.setDeviceSn(deviceSn);
                deviceModel.setProductCode(ProductCodeConst.GLV);
                ArrayList arrayList = new ArrayList();
                DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.GLV_1_FAULT_1, String.valueOf(intArray[0]));
                DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.GLV_1_FAULT_2, String.valueOf(intArray[4]));
                DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.GLV_1_FAULT_3, String.valueOf(intArray[5]));
                DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.GLV_1_FAULT_4, String.valueOf(intArray[6]));
                arrayList.add(deviceAttribute);
                arrayList.add(deviceAttribute2);
                arrayList.add(deviceAttribute3);
                arrayList.add(deviceAttribute4);
                deviceModel.setAttrs(arrayList);
                MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void setMachineNo(int i) {
        this.machineNo = i;
    }

    public TicaInnerStatus getShowTicaStatus(int i) {
        return this.hashMap.get(Integer.valueOf(i));
    }

    public void setTicaInnerStatus(TicaInnerStatus ticaInnerStatus) {
        this.ticaInnerStatus = ticaInnerStatus;
    }

    private byte[] writeStatusToBytes(TicaInnerStatus ticaInnerStatus, int i) {
        byte[] bArr = new byte[25];
        bArr[0] = 3;
        bArr[1] = 16;
        Rs485Utils.getInstance().int2Bytes(bArr, 2, 0);
        Rs485Utils.getInstance().int2Bytes(bArr, 4, 9);
        bArr[6] = 18;
        byte[] bArr2 = new byte[18];
        Rs485Utils.getInstance().int2Bytes(bArr2, 0, ticaInnerStatus.getSettingMode());
        Rs485Utils.getInstance().int2Bytes(bArr2, 2, ticaInnerStatus.getSettingTemp());
        Rs485Utils.getInstance().int2Bytes(bArr2, 4, ticaInnerStatus.getSettingWindSpeed());
        if (ticaInnerStatus.isSwingSetting()) {
            bArr2[7] = (byte) Rs485Utils.getInstance().setBitToOne(bArr2[7], 2);
        } else {
            Rs485Utils.getInstance();
            bArr2[7] = (byte) Rs485Utils.setBitToZero(bArr2[7], 2);
        }
        if (ticaInnerStatus.isSleepSetting()) {
            bArr2[7] = (byte) Rs485Utils.getInstance().setBitToOne(bArr2[7], 3);
        } else {
            Rs485Utils.getInstance();
            bArr2[7] = (byte) Rs485Utils.setBitToZero(bArr2[7], 3);
        }
        if (ticaInnerStatus.isElectricAuxiliaryHeatingSetting()) {
            bArr2[7] = (byte) Rs485Utils.getInstance().setBitToOne(bArr2[7], 4);
        } else {
            Rs485Utils.getInstance();
            bArr2[7] = (byte) Rs485Utils.setBitToZero(bArr2[7], 4);
        }
        if (ticaInnerStatus.isPowerSetting()) {
            bArr2[7] = (byte) Rs485Utils.getInstance().setBitToOne(bArr2[7], 7);
        } else {
            Rs485Utils.getInstance();
            bArr2[7] = (byte) Rs485Utils.setBitToZero(bArr2[7], 7);
        }
        if (i == 0) {
            i = 255;
        }
        Rs485Utils.getInstance().int2Bytes(bArr2, 10, i);
        System.arraycopy(bArr2, 0, bArr, 7, 18);
        return Rs485Utils.getInstance().getSendBuf(bArr);
    }

    public TicaInnerStatus convertToTicaInnerStatus(TicaInnerStatus ticaInnerStatus, byte[] bArr) {
        int[] intArray = Rs485Utils.getInstance().toIntArray(bArr);
        if (intArray != null) {
            ticaInnerStatus.setUnitType(intArray[0]);
            ticaInnerStatus.setUnitAbility(intArray[1]);
            ticaInnerStatus.setProgramEdition(intArray[2] / 10.0f);
            ticaInnerStatus.setModeRun(intArray[3]);
            ticaInnerStatus.setIntakeTemperature(intArray[4] / 10.0f);
            ticaInnerStatus.setMidDiskTemperature(intArray[5] / 10.0f);
            ticaInnerStatus.setOutletTemperature(intArray[6] / 10.0f);
            ticaInnerStatus.setReturnAirTemperature(intArray[7] / 10.0f);
            ticaInnerStatus.setWindSpeedStatus(intArray[8] & 7);
            ticaInnerStatus.setElectricAuxiliaryHeatingStatus(Rs485Utils.getInstance().getBit(intArray[8], 3));
            ticaInnerStatus.setWaterPumpStatus(Rs485Utils.getInstance().getBit(intArray[8], 6));
            ticaInnerStatus.setTH1Error(Rs485Utils.getInstance().getBit(intArray[9], 0));
            ticaInnerStatus.setTH2Error(Rs485Utils.getInstance().getBit(intArray[9], 1));
            ticaInnerStatus.setTH3Error(Rs485Utils.getInstance().getBit(intArray[9], 2));
            ticaInnerStatus.setTH4Error(Rs485Utils.getInstance().getBit(intArray[9], 3));
            ticaInnerStatus.setPatternConflict(Rs485Utils.getInstance().getBit(intArray[9], 5));
            ticaInnerStatus.setCommunicationFailure(Rs485Utils.getInstance().getBit(intArray[9], 6));
            ticaInnerStatus.setWaterLevelFailure(Rs485Utils.getInstance().getBit(intArray[9], 7));
            ticaInnerStatus.setSettingMode(intArray[10]);
            ticaInnerStatus.setSettingTemp(intArray[11]);
            ticaInnerStatus.setSettingWindSpeed(intArray[12]);
            if (Rs485Utils.getInstance().getBit(intArray[13], 2) == 1) {
                ticaInnerStatus.setSwingSetting(true);
            } else {
                ticaInnerStatus.setSwingSetting(false);
            }
            if (Rs485Utils.getInstance().getBit(intArray[13], 3) == 1) {
                ticaInnerStatus.setSleepSetting(true);
            } else {
                ticaInnerStatus.setSleepSetting(false);
            }
            if (Rs485Utils.getInstance().getBit(intArray[13], 4) == 1) {
                ticaInnerStatus.setElectricAuxiliaryHeatingSetting(true);
            } else {
                ticaInnerStatus.setElectricAuxiliaryHeatingSetting(false);
            }
            if (Rs485Utils.getInstance().getBit(intArray[13], 7) == 1) {
                ticaInnerStatus.setPowerSetting(true);
            } else {
                ticaInnerStatus.setPowerSetting(false);
            }
            synchronized (this.hashMap) {
                this.hashMap.put(Integer.valueOf(ticaInnerStatus.getMachineNo()), ticaInnerStatus);
            }
        }
        return ticaInnerStatus;
    }
}
