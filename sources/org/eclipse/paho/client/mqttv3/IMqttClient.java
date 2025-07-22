package org.eclipse.paho.client.mqttv3;

/* loaded from: classes.dex */
public interface IMqttClient extends AutoCloseable {
    @Override // java.lang.AutoCloseable
    void close() throws MqttException;

    void connect() throws MqttException;

    void connect(MqttConnectOptions mqttConnectOptions) throws MqttException;

    IMqttToken connectWithResult(MqttConnectOptions mqttConnectOptions) throws MqttException;

    void disconnect() throws MqttException;

    void disconnect(long j) throws MqttException;

    void disconnectForcibly() throws MqttException;

    void disconnectForcibly(long j) throws MqttException;

    void disconnectForcibly(long j, long j2) throws MqttException;

    String getClientId();

    IMqttDeliveryToken[] getPendingDeliveryTokens();

    String getServerURI();

    MqttTopic getTopic(String str);

    boolean isConnected();

    void messageArrivedComplete(int i, int i2) throws MqttException;

    void publish(String str, MqttMessage mqttMessage) throws MqttException;

    void publish(String str, byte[] bArr, int i, boolean z) throws MqttException;

    void reconnect() throws MqttException;

    void setCallback(MqttCallback mqttCallback);

    void setManualAcks(boolean z);

    void subscribe(String str) throws MqttException;

    void subscribe(String str, int i) throws MqttException;

    void subscribe(String str, int i, IMqttMessageListener iMqttMessageListener) throws MqttException;

    void subscribe(String str, IMqttMessageListener iMqttMessageListener) throws MqttException;

    void subscribe(String[] strArr) throws MqttException;

    void subscribe(String[] strArr, int[] iArr) throws MqttException;

    void subscribe(String[] strArr, int[] iArr, IMqttMessageListener[] iMqttMessageListenerArr) throws MqttException;

    void subscribe(String[] strArr, IMqttMessageListener[] iMqttMessageListenerArr) throws MqttException;

    IMqttToken subscribeWithResponse(String str) throws MqttException;

    IMqttToken subscribeWithResponse(String str, int i) throws MqttException;

    IMqttToken subscribeWithResponse(String str, int i, IMqttMessageListener iMqttMessageListener) throws MqttException;

    IMqttToken subscribeWithResponse(String str, IMqttMessageListener iMqttMessageListener) throws MqttException;

    IMqttToken subscribeWithResponse(String[] strArr) throws MqttException;

    IMqttToken subscribeWithResponse(String[] strArr, int[] iArr) throws MqttException;

    IMqttToken subscribeWithResponse(String[] strArr, int[] iArr, IMqttMessageListener[] iMqttMessageListenerArr) throws MqttException;

    IMqttToken subscribeWithResponse(String[] strArr, IMqttMessageListener[] iMqttMessageListenerArr) throws MqttException;

    void unsubscribe(String str) throws MqttException;

    void unsubscribe(String[] strArr) throws MqttException;
}
