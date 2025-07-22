package com.landleaf.smarthome.net.mqtt;

import android.content.Context;
import com.landleaf.smarthome.util.LogUtils;
import org.eclipse.paho.client.mqttv3.DisconnectedBufferOptions;
import org.eclipse.paho.client.mqttv3.IMqttActionListener;
import org.eclipse.paho.client.mqttv3.IMqttToken;
import org.eclipse.paho.client.mqttv3.MqttAsyncClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

/* loaded from: classes.dex */
public class MqttClient {
    private static volatile MqttClient singleton;
    private Context context;
    private MqttAsyncClient mqtAsyncClient;

    private MqttClient() {
    }

    public static MqttClient getInstance() {
        if (singleton == null) {
            synchronized (MqttClient.class) {
                if (singleton == null) {
                    singleton = new MqttClient();
                }
            }
        }
        return singleton;
    }

    public synchronized void connect(final String str) {
        if (isConnect() || this.mqtAsyncClient != null) {
            disConnect();
        }
        MqttConnectOptions mqttConnectOptions = new MqttConnectOptions();
        mqttConnectOptions.setCleanSession(true);
        mqttConnectOptions.setUserName(MqttConst.NAME);
        mqttConnectOptions.setPassword(MqttConst.PWD.toCharArray());
        mqttConnectOptions.setConnectionTimeout(10);
        mqttConnectOptions.setKeepAliveInterval(20);
        mqttConnectOptions.setAutomaticReconnect(true);
        try {
            MqttAsyncClient mqttAsyncClient = new MqttAsyncClient(MqttConst.MQTT_URL, str, new MemoryPersistence());
            this.mqtAsyncClient = mqttAsyncClient;
            mqttAsyncClient.connect(mqttConnectOptions, null, new IMqttActionListener() { // from class: com.landleaf.smarthome.net.mqtt.MqttClient.1
                @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                public void onSuccess(IMqttToken iMqttToken) {
                    LogUtils.m18d("连接成功");
                    DisconnectedBufferOptions disconnectedBufferOptions = new DisconnectedBufferOptions();
                    disconnectedBufferOptions.setBufferEnabled(true);
                    disconnectedBufferOptions.setBufferSize(1024);
                    disconnectedBufferOptions.setPersistBuffer(false);
                    disconnectedBufferOptions.setDeleteOldestMessages(false);
                    MqttClient.this.mqtAsyncClient.setBufferOpts(disconnectedBufferOptions);
                    MqttClient.this.subscribeTopic(str);
                }

                @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                public void onFailure(IMqttToken iMqttToken, Throwable th) {
                    LogUtils.m18d("连接失败" + th.getMessage());
                    MqttClient.this.reconnect(str);
                }
            });
            this.mqtAsyncClient.setCallback(new MqttMessageCallback(str));
        } catch (Exception e) {
            e.printStackTrace();
            reconnect(str);
            LogUtils.m18d("连接失败" + e.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void reconnect(String str) {
        LogUtils.m18d("reconnect 重连");
        disConnect();
        connect(str);
    }

    public void subscribeTopic(String str) {
        LogUtils.m18d("subscribeTopic 订阅topic");
        try {
            if (this.mqtAsyncClient != null) {
                this.mqtAsyncClient.subscribe(MqttConst.COMMON_RESPONSE_TOPIC + str, 0, (Object) null, new IMqttActionListener() { // from class: com.landleaf.smarthome.net.mqtt.MqttClient.2
                    @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                    public void onSuccess(IMqttToken iMqttToken) {
                        LogUtils.m18d("subscribeTopic 订阅topic成功");
                    }

                    @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                    public void onFailure(IMqttToken iMqttToken, Throwable th) {
                        LogUtils.m18d("subscribeTopic 订阅topic失败." + iMqttToken.toString() + "," + th.toString());
                    }
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isConnect() {
        MqttAsyncClient mqttAsyncClient = this.mqtAsyncClient;
        if (mqttAsyncClient == null) {
            return false;
        }
        try {
            return mqttAsyncClient.isConnected();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void publishMessage(String str, final String str2) {
        try {
            MqttMessage mqttMessage = new MqttMessage();
            mqttMessage.setPayload(str2.getBytes());
            if (this.mqtAsyncClient != null) {
                this.mqtAsyncClient.publish(MqttConst.COMMON_REQUEST_TOPIC + str, mqttMessage, (Object) null, new IMqttActionListener() { // from class: com.landleaf.smarthome.net.mqtt.MqttClient.3
                    @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                    public void onSuccess(IMqttToken iMqttToken) {
                        LogUtils.m18d("消息发送成功-->:" + str2);
                    }

                    @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                    public void onFailure(IMqttToken iMqttToken, Throwable th) {
                        LogUtils.m18d("消息发送失败");
                    }
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void publishUploadMessage(String str, final String str2) {
        try {
            MqttMessage mqttMessage = new MqttMessage();
            mqttMessage.setPayload(str2.getBytes());
            if (this.mqtAsyncClient != null) {
                this.mqtAsyncClient.publish(MqttConst.DEVICE_UPLOAD_REQUEST_TOPIC + str, mqttMessage, (Object) null, new IMqttActionListener() { // from class: com.landleaf.smarthome.net.mqtt.MqttClient.4
                    @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                    public void onSuccess(IMqttToken iMqttToken) {
                        LogUtils.m18d("Upload消息发送成功-->:" + str2);
                    }

                    @Override // org.eclipse.paho.client.mqttv3.IMqttActionListener
                    public void onFailure(IMqttToken iMqttToken, Throwable th) {
                        LogUtils.m18d("Upload消息发送失败");
                    }
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void disConnect() {
        try {
            if (this.mqtAsyncClient != null) {
                this.mqtAsyncClient.disconnect();
                this.mqtAsyncClient.close();
                this.mqtAsyncClient = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
