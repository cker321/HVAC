package com.landleaf.smarthome.net.mqtt;

import com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel;
import com.landleaf.smarthome.util.JsonUtils;
import com.landleaf.smarthome.util.LogUtils;
import com.landleaf.smarthome.util.rxutils.RxJavaUtils;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.functions.Predicate;
import io.reactivex.schedulers.Schedulers;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallbackExtended;
import org.eclipse.paho.client.mqttv3.MqttMessage;

/* loaded from: classes.dex */
public class MqttMessageCallback implements MqttCallbackExtended {
    String clientId;
    MqttMsgHandler mMsgHandler = new MqttMsgHandler();

    @Override // org.eclipse.paho.client.mqttv3.MqttCallback
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
    }

    public MqttMessageCallback(String str) {
        this.clientId = str;
    }

    @Override // org.eclipse.paho.client.mqttv3.MqttCallback
    public void connectionLost(Throwable th) {
        LogUtils.m18d("connectionLost-->" + th.getMessage());
    }

    @Override // org.eclipse.paho.client.mqttv3.MqttCallback
    public void messageArrived(final String str, final MqttMessage mqttMessage) {
        LogUtils.m18d("消息接受成功-->" + new String(mqttMessage.getPayload()));
        RxJavaUtils.createObservable(mqttMessage).filter(new Predicate() { // from class: com.landleaf.smarthome.net.mqtt.-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ
            @Override // io.reactivex.functions.Predicate
            public final boolean test(Object obj) {
                return this.f$0.lambda$messageArrived$0$MqttMessageCallback(str, (MqttMessage) obj);
            }
        }).observeOn(Schedulers.m42io()).map(new Function() { // from class: com.landleaf.smarthome.net.mqtt.-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM
            @Override // io.reactivex.functions.Function
            public final Object apply(Object obj) {
                return MqttMessageCallback.lambda$messageArrived$1((MqttMessage) obj);
            }
        }).subscribe(new Consumer() { // from class: com.landleaf.smarthome.net.mqtt.-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg
            @Override // io.reactivex.functions.Consumer
            public final void accept(Object obj) throws Exception {
                this.f$0.lambda$messageArrived$2$MqttMessageCallback(mqttMessage, (MqttMsgBodyModel) obj);
            }
        }, new Consumer() { // from class: com.landleaf.smarthome.net.mqtt.-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4
            @Override // io.reactivex.functions.Consumer
            public final void accept(Object obj) {
                LogUtils.m18d("数据异常-->" + ((Throwable) obj).getMessage());
            }
        });
    }

    public /* synthetic */ boolean lambda$messageArrived$0$MqttMessageCallback(String str, MqttMessage mqttMessage) throws Exception {
        return (MqttConst.COMMON_RESPONSE_TOPIC + this.clientId).equals(str);
    }

    static /* synthetic */ MqttMsgBodyModel lambda$messageArrived$1(MqttMessage mqttMessage) throws Exception {
        return (MqttMsgBodyModel) JsonUtils.jsonToObj(new String(mqttMessage.getPayload()), MqttMsgBodyModel.class);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public /* synthetic */ void lambda$messageArrived$2$MqttMessageCallback(org.eclipse.paho.client.mqttv3.MqttMessage r8, com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel r9) throws java.lang.Exception {
        /*
            r7 = this;
            com.landleaf.smarthome.net.mqtt.bean.MqttHeaderModel r0 = r9.getHeader()
            java.lang.String r0 = r0.getName()
            int r1 = r0.hashCode()
            r2 = 5
            r3 = 4
            r4 = 3
            r5 = 2
            r6 = 1
            switch(r1) {
                case -1949360194: goto L47;
                case -1053900595: goto L3d;
                case -633269007: goto L33;
                case 117536521: goto L29;
                case 1421288527: goto L1f;
                case 1940961242: goto L15;
                default: goto L14;
            }
        L14:
            goto L51
        L15:
            java.lang.String r1 = "FamilySceneSet"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L51
            r0 = 2
            goto L52
        L1f:
            java.lang.String r1 = "FamilyConfigUpdate"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L51
            r0 = 3
            goto L52
        L29:
            java.lang.String r1 = "DeviceWrite"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L51
            r0 = 0
            goto L52
        L33:
            java.lang.String r1 = "DeviceStatusUpdate"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L51
            r0 = 4
            goto L52
        L3d:
            java.lang.String r1 = "FamilySecurityAlarmEvent"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L51
            r0 = 5
            goto L52
        L47:
            java.lang.String r1 = "DeviceStatusRead"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L51
            r0 = 1
            goto L52
        L51:
            r0 = -1
        L52:
            if (r0 == 0) goto L7d
            if (r0 == r6) goto L77
            if (r0 == r5) goto L71
            if (r0 == r4) goto L6b
            if (r0 == r3) goto L65
            if (r0 == r2) goto L5f
            goto L9a
        L5f:
            com.landleaf.smarthome.net.mqtt.MqttMsgHandler r8 = r7.mMsgHandler
            r8.handlerSecurityAlarmMsg(r9)
            goto L9a
        L65:
            com.landleaf.smarthome.net.mqtt.MqttMsgHandler r8 = r7.mMsgHandler
            r8.handlerDeviceUpdateMsg(r9)
            goto L9a
        L6b:
            com.landleaf.smarthome.net.mqtt.MqttMsgHandler r8 = r7.mMsgHandler
            r8.handlerConfigUpdateMsg(r9)
            goto L9a
        L71:
            com.landleaf.smarthome.net.mqtt.MqttMsgHandler r8 = r7.mMsgHandler
            r8.handlerSceneSetMsg(r9)
            goto L9a
        L77:
            com.landleaf.smarthome.net.mqtt.MqttMsgHandler r8 = r7.mMsgHandler
            r8.handlerDeviceReadMsg(r9)
            goto L9a
        L7d:
            java.lang.String r9 = new java.lang.String
            byte[] r8 = r8.getPayload()
            r9.<init>(r8)
            com.landleaf.smarthome.net.mqtt.MqttMessageCallback$1 r8 = new com.landleaf.smarthome.net.mqtt.MqttMessageCallback$1
            r8.<init>()
            java.lang.reflect.Type r8 = r8.getType()
            java.lang.Object r8 = com.landleaf.smarthome.util.JsonUtils.jsonToObj(r9, r8)
            com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel r8 = (com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel) r8
            com.landleaf.smarthome.net.mqtt.MqttMsgHandler r9 = r7.mMsgHandler
            r9.handlerDeviceWriteMsg(r8)
        L9a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.landleaf.smarthome.net.mqtt.MqttMessageCallback.lambda$messageArrived$2$MqttMessageCallback(org.eclipse.paho.client.mqttv3.MqttMessage, com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel):void");
    }

    @Override // org.eclipse.paho.client.mqttv3.MqttCallbackExtended
    public void connectComplete(boolean z, String str) {
        LogUtils.m18d("重连成功");
        if (z) {
            MqttClient.getInstance().subscribeTopic(this.clientId);
        }
    }
}
