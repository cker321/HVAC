package com.landleaf.smarthome.net.mqtt;

import com.landleaf.smarthome.MockData;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.SceneModel;
import com.landleaf.smarthome.model.SecurityModel;
import com.landleaf.smarthome.net.mqtt.bean.MqttDataModel;
import com.landleaf.smarthome.net.mqtt.bean.MqttHeaderModel;
import com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel;
import com.landleaf.smarthome.net.mqtt.bean.MqttPayloadModel;
import com.landleaf.smarthome.util.JsonUtils;
import com.landleaf.smarthome.util.SpUtils;
import java.util.List;

/* loaded from: classes.dex */
public class MqttExecutor {
    private static volatile MqttExecutor singleton;
    private String clientId;

    private MqttExecutor() {
    }

    public static MqttExecutor getInstance() {
        if (singleton == null) {
            synchronized (MqttExecutor.class) {
                if (singleton == null) {
                    singleton = new MqttExecutor();
                }
            }
        }
        return singleton;
    }

    public void connect(String str) {
        this.clientId = str;
        MqttClient.getInstance().connect(str);
    }

    public void disConnect() {
        MqttClient.getInstance().disConnect();
    }

    public void sendCommonReturnMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        if (mqttMsgBodyModel.getHeader().getAckCode() == 1) {
            return;
        }
        mqttMsgBodyModel.getHeader().setAckCode(1);
        mqttMsgBodyModel.getPayload().setCode(200);
        mqttMsgBodyModel.getPayload().setMessage("success");
        sedMsg(mqttMsgBodyModel);
    }

    public void sendCommonReturnMsg(MqttMsgBodyModel mqttMsgBodyModel, int i, String str) {
        if (mqttMsgBodyModel.getHeader().getAckCode() == 1) {
            return;
        }
        mqttMsgBodyModel.getHeader().setAckCode(1);
        mqttMsgBodyModel.getPayload().setCode(i);
        mqttMsgBodyModel.getPayload().setMessage(str);
        sedMsg(mqttMsgBodyModel);
    }

    public void sendDeviceReadMsg(MqttMsgBodyModel mqttMsgBodyModel, DeviceModel deviceModel) {
        mqttMsgBodyModel.getPayload().getData().setItems(deviceModel.getAtts());
        sendCommonReturnMsg(mqttMsgBodyModel);
    }

    public void sendDeviceUpdateMsg(DeviceModel deviceModel) {
        MqttMsgBodyModel commonMqttRequestMsgModel = getCommonMqttRequestMsgModel();
        commonMqttRequestMsgModel.getHeader().setAckCode(1);
        commonMqttRequestMsgModel.getHeader().setName(MqttConst.METHOD_DEVICE_UPDATE);
        MqttDataModel data = commonMqttRequestMsgModel.getPayload().getData();
        data.setItems(deviceModel.getAtts());
        data.setProductCode(deviceModel.getProductCode());
        data.setDeviceSn(deviceModel.getDeviceSn());
        sendUploadStatusMsg(commonMqttRequestMsgModel);
    }

    public void sendSecurityAlarmMsg(List<SecurityModel> list) {
        MqttMsgBodyModel commonMqttRequestMsgModel = getCommonMqttRequestMsgModel();
        commonMqttRequestMsgModel.getHeader().setAckCode(1);
        commonMqttRequestMsgModel.getHeader().setName(MqttConst.METHOD_SECURITY_ALARM);
        commonMqttRequestMsgModel.getPayload().getData().setItems(MockData.getSecurityList());
        sedMsg(commonMqttRequestMsgModel);
    }

    public void sendSceneUpdateMsg(SceneModel sceneModel) {
        MqttMsgBodyModel commonMqttRequestMsgModel = getCommonMqttRequestMsgModel();
        commonMqttRequestMsgModel.getHeader().setAckCode(1);
        commonMqttRequestMsgModel.getHeader().setName(MqttConst.METHOD_SCENE_UPDATE);
        commonMqttRequestMsgModel.getPayload().getData().setSceneNo(1);
        sedMsg(commonMqttRequestMsgModel);
    }

    public void sedMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        MqttClient.getInstance().publishMessage(this.clientId, JsonUtils.objToJson(mqttMsgBodyModel));
    }

    public void sendUploadStatusMsg(MqttMsgBodyModel mqttMsgBodyModel) {
        MqttClient.getInstance().publishUploadMessage(this.clientId, JsonUtils.objToJson(mqttMsgBodyModel));
    }

    private MqttMsgBodyModel getCommonMqttRequestMsgModel() {
        MqttMsgBodyModel mqttMsgBodyModel = new MqttMsgBodyModel();
        MqttHeaderModel mqttHeaderModel = new MqttHeaderModel();
        mqttHeaderModel.setAckCode(0);
        mqttHeaderModel.setMessageId(String.valueOf(getNewMsgId()));
        mqttHeaderModel.setScreenMac(this.clientId);
        mqttMsgBodyModel.setHeader(mqttHeaderModel);
        MqttPayloadModel mqttPayloadModel = new MqttPayloadModel();
        mqttPayloadModel.setData(new MqttDataModel());
        mqttMsgBodyModel.setPayload(mqttPayloadModel);
        return mqttMsgBodyModel;
    }

    private int getNewMsgId() {
        int i = SpUtils.readInt("msgID", 1);
        int i2 = i < 65500 ? i : 1;
        SpUtils.save("msgID", Integer.valueOf(i2 + 1));
        return i2;
    }
}
