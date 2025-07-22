package com.landleaf.smarthome.net.mqtt;

import android.util.Log;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.FloorModel;
import com.landleaf.smarthome.model.SceneControlBean;
import com.landleaf.smarthome.net.http.ApiFactory;
import com.landleaf.smarthome.net.http.NetResponse;
import com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel;
import com.landleaf.smarthome.util.LogUtils;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.ArrayList;
import java.util.List;
import org.greenrobot.eventbus.EventBus;

/* loaded from: classes.dex */
public class MqttMsgHandler {
    public void handlerDeviceUpdateMsg(MqttMsgBodyModel mqttMsgBodyModel) {
    }

    public void handlerDeviceWriteMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        int productCode = mqttMsgBodyModel.getPayload().getData().getProductCode();
        mqttMsgBodyModel.getPayload().getData().getDeviceSn();
        if (productCode != 7107 && productCode != 8200) {
            MqttExecutor.getInstance().sendCommonReturnMsg(mqttMsgBodyModel);
        }
        EventBus.getDefault().post(mqttMsgBodyModel);
    }

    public void handlerDeviceReadMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        int productCode = mqttMsgBodyModel.getPayload().getData().getProductCode();
        String deviceSn = mqttMsgBodyModel.getPayload().getData().getDeviceSn();
        DeviceModel deviceModel = new DeviceModel();
        ArrayList arrayList = new ArrayList();
        DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.TEMP, "24");
        DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.HUMIDITY, "45");
        arrayList.add(deviceAttribute);
        arrayList.add(deviceAttribute2);
        deviceModel.setAttrs(arrayList);
        MqttExecutor.getInstance().sendDeviceReadMsg(mqttMsgBodyModel, deviceModel);
        LogUtils.m18d(productCode + "," + deviceSn);
    }

    public void handlerSceneSetMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        MqttExecutor.getInstance().sendCommonReturnMsg(mqttMsgBodyModel);
        EventBus.getDefault().post(new SceneControlBean(mqttMsgBodyModel.getPayload().getData().getSceneNo() - 1, true));
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public void handlerConfigUpdateMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        MqttExecutor.getInstance().sendCommonReturnMsg(mqttMsgBodyModel);
        String updateType = mqttMsgBodyModel.getPayload().getData().getUpdateType();
        if (updateType != null) {
            char c = 65535;
            switch (updateType.hashCode()) {
                case -880559643:
                    if (updateType.equals(MqttConst.CONFIG_APK_UPDATE)) {
                        c = 0;
                        break;
                    }
                    break;
                case 2424563:
                    if (updateType.equals(MqttConst.CONFIG_NEWS)) {
                        c = 4;
                        break;
                    }
                    break;
                case 79702124:
                    if (updateType.equals(MqttConst.CONFIG_SCENE)) {
                        c = 1;
                        break;
                    }
                    break;
                case 1416954838:
                    if (updateType.equals(MqttConst.CONFIG_TIMING_SCENE)) {
                        c = 2;
                        break;
                    }
                    break;
                case 2112508957:
                    if (updateType.equals(MqttConst.CONFIG_FLOOR_ROOM_DEVICE)) {
                        c = 3;
                        break;
                    }
                    break;
            }
            if (c == 1) {
                ApiFactory.getNetApi().getSceneList().subscribe();
                return;
            }
            if (c == 2) {
                ApiFactory.getNetApi().getTimingSceneList().subscribe();
            } else if (c == 3) {
                ApiFactory.getNetApi().getFloorDeviceList().subscribeOn(Schedulers.m42io()).subscribe(new Consumer<NetResponse<List<FloorModel>>>() { // from class: com.landleaf.smarthome.net.mqtt.MqttMsgHandler.1
                    @Override // io.reactivex.functions.Consumer
                    public void accept(NetResponse<List<FloorModel>> netResponse) throws Exception {
                        EventBus.getDefault().postSticky(netResponse.data.get(0).getRooms());
                    }
                }, new Consumer<Throwable>() { // from class: com.landleaf.smarthome.net.mqtt.MqttMsgHandler.2
                    @Override // io.reactivex.functions.Consumer
                    public void accept(Throwable th) throws Exception {
                        LogUtils.m18d("getFloorDeviceList:" + th.toString());
                    }
                });
            } else {
                if (c != 4) {
                    return;
                }
                ApiFactory.getNetApi().getNewsList().subscribe();
            }
        }
    }

    public void handlerSecurityAlarmMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        Log.d("MqttMsgHandler", "data:" + mqttMsgBodyModel);
    }
}
