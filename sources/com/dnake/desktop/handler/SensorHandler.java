package com.dnake.desktop.handler;

import com.dnake.desktop.bean.RecordBean;
import com.dnake.desktop.bean.SensorModel;
import com.dnake.desktop.bean.SensorType;
import com.dnake.desktop.callback.Rs485Callback;
import com.dnake.desktop.dnake.Rs485Executor;
import com.dnake.desktop.utils.Rs485Utils;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.device.ProductCodeConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.net.mqtt.MqttExecutor;
import java.util.ArrayList;
import org.greenrobot.eventbus.EventBus;

/* loaded from: classes.dex */
public class SensorHandler implements Rs485Callback {
    public static final int MT_DATA_LENGTH_MULTIPLE = 24;
    public static final int MT_DATA_LENGTH_Z2GC = 5;
    public static final byte MT_FUNCTION_CODE_READ = 4;
    public static final byte MT_FUNCTION_CODE_YINGJIANG_READ = 3;
    public static final int MT_INDEX_CO2 = 10;
    public static final int MT_INDEX_HUMIDITY = 9;
    public static final int MT_INDEX_PM25 = 0;
    public static final int MT_INDEX_TEMP = 8;
    public static final int MT_INDEX_VOC = 11;
    public static final int MT_START_ADDRESS = 0;
    public static final int YJ_INDEX_CO2 = 3;
    public static final int YJ_INDEX_HUMIDITY = 1;
    public static final int YJ_INDEX_PM25 = 4;
    public static final int YJ_INDEX_TEMP = 0;
    public static final int YJ_INDEX_VOC = 2;
    public static final int YJ_START_ADDRESS = 1;
    private final byte SENSOR_ADDRESS = 1;
    private String deviceSn = "11011";
    private RecordBean preRecord;

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void uploadDeviceBug() {
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void write(int i, int i2) {
    }

    public void setDeviceSn(String str) {
        this.deviceSn = str;
    }

    @Override // com.dnake.desktop.callback.Rs485Callback
    public void read() {
        SensorModel sensorModel = new SensorModel(SensorType.Z2_GC, (byte) 1);
        byte[] sensorSendBytes = getSensorSendBytes(sensorModel);
        try {
            byte[] bArrWrite = Rs485Executor.getInstance().write(sensorSendBytes, 300);
            if (Rs485Utils.getInstance().returnCheck(bArrWrite, sensorSendBytes)) {
                RecordBean data = parseData(sensorModel.getSensorType(), bArrWrite);
                EventBus.getDefault().post(data);
                upload(data);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void upload(RecordBean recordBean) {
        if (adjustUpload(recordBean)) {
            DeviceModel deviceModel = new DeviceModel();
            deviceModel.setDeviceSn(this.deviceSn);
            deviceModel.setProductCode(ProductCodeConst.SENSOR);
            ArrayList arrayList = new ArrayList();
            DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.TEMP, String.valueOf(recordBean.getTemp()));
            DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.HUMIDITY, String.valueOf(recordBean.getHumidity()));
            DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.VOC, String.valueOf(recordBean.getVoc()));
            DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.CO2, String.valueOf(recordBean.getCo2()));
            DeviceAttribute deviceAttribute5 = new DeviceAttribute(AttributeTagConst.PM25, String.valueOf(recordBean.getPm25()));
            arrayList.add(deviceAttribute);
            arrayList.add(deviceAttribute2);
            arrayList.add(deviceAttribute3);
            arrayList.add(deviceAttribute4);
            arrayList.add(deviceAttribute5);
            deviceModel.setAttrs(arrayList);
            MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
            this.preRecord = recordBean;
        }
    }

    private boolean adjustUpload(RecordBean recordBean) {
        RecordBean recordBean2 = this.preRecord;
        return recordBean2 == null || !recordBean2.equals(recordBean);
    }

    private RecordBean parseData(SensorType sensorType, byte[] bArr) {
        RecordBean recordBean = new RecordBean();
        byte[] bArrCalReadDataArray = Rs485Utils.getInstance().calReadDataArray(bArr);
        if (sensorType == SensorType.Z2_GC) {
            int[] intArray = Rs485Utils.getInstance().toIntArray(bArrCalReadDataArray);
            recordBean.setTemp(intArray[0] / 10.0f);
            recordBean.setHumidity(intArray[1]);
            recordBean.setVoc(intArray[2] / 100.0f);
            recordBean.setCo2(intArray[3]);
            recordBean.setPm25(intArray[4]);
        }
        if (sensorType == SensorType.MULTIPLE_SENSOR) {
            float[] floatArray = Rs485Utils.getInstance().toFloatArray(bArrCalReadDataArray);
            recordBean.setTemp(floatArray[8]);
            recordBean.setHumidity(floatArray[9]);
            recordBean.setVoc(floatArray[11]);
            recordBean.setCo2(floatArray[10]);
            recordBean.setPm25(floatArray[0]);
        }
        return recordBean;
    }

    /* renamed from: com.dnake.desktop.handler.SensorHandler$1 */
    static /* synthetic */ class C05211 {
        static final /* synthetic */ int[] $SwitchMap$com$dnake$desktop$bean$SensorType;

        static {
            int[] iArr = new int[SensorType.values().length];
            $SwitchMap$com$dnake$desktop$bean$SensorType = iArr;
            try {
                iArr[SensorType.MULTIPLE_SENSOR.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$dnake$desktop$bean$SensorType[SensorType.SIMPLE_SENSOR.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$dnake$desktop$bean$SensorType[SensorType.Z2_GC.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    private byte[] getSensorSendBytes(SensorModel sensorModel) {
        int i = C05211.$SwitchMap$com$dnake$desktop$bean$SensorType[sensorModel.getSensorType().ordinal()];
        if (i == 1 || i == 2) {
            return Rs485Utils.getInstance().getReadSendBytes(sensorModel.getSlaveAddress(), 4, 0, 24);
        }
        if (i != 3) {
            return null;
        }
        return Rs485Utils.getInstance().getReadSendBytes(sensorModel.getSlaveAddress(), 3, 1, 5);
    }
}
