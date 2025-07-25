package org.eclipse.paho.client.mqttv3;

/* loaded from: classes.dex */
public interface IMqttAsyncClient extends AutoCloseable {
    @Override // java.lang.AutoCloseable
    void close() throws MqttException;

    IMqttToken connect() throws MqttException;

    IMqttToken connect(Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    IMqttToken connect(MqttConnectOptions mqttConnectOptions) throws MqttException;

    IMqttToken connect(MqttConnectOptions mqttConnectOptions, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    void deleteBufferedMessage(int i);

    IMqttToken disconnect() throws MqttException;

    IMqttToken disconnect(long j) throws MqttException;

    IMqttToken disconnect(long j, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    IMqttToken disconnect(Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    void disconnectForcibly() throws MqttException;

    void disconnectForcibly(long j) throws MqttException;

    void disconnectForcibly(long j, long j2) throws MqttException;

    MqttMessage getBufferedMessage(int i);

    int getBufferedMessageCount();

    String getClientId();

    int getInFlightMessageCount();

    IMqttDeliveryToken[] getPendingDeliveryTokens();

    String getServerURI();

    boolean isConnected();

    void messageArrivedComplete(int i, int i2) throws MqttException;

    IMqttDeliveryToken publish(String str, MqttMessage mqttMessage) throws MqttException;

    IMqttDeliveryToken publish(String str, MqttMessage mqttMessage, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    IMqttDeliveryToken publish(String str, byte[] bArr, int i, boolean z) throws MqttException;

    IMqttDeliveryToken publish(String str, byte[] bArr, int i, boolean z, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    void reconnect() throws MqttException;

    boolean removeMessage(IMqttDeliveryToken iMqttDeliveryToken) throws MqttException;

    void setBufferOpts(DisconnectedBufferOptions disconnectedBufferOptions);

    void setCallback(MqttCallback mqttCallback);

    void setManualAcks(boolean z);

    IMqttToken subscribe(String str, int i) throws MqttException;

    IMqttToken subscribe(String str, int i, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    IMqttToken subscribe(String str, int i, Object obj, IMqttActionListener iMqttActionListener, IMqttMessageListener iMqttMessageListener) throws MqttException;

    IMqttToken subscribe(String str, int i, IMqttMessageListener iMqttMessageListener) throws MqttException;

    IMqttToken subscribe(String[] strArr, int[] iArr) throws MqttException;

    IMqttToken subscribe(String[] strArr, int[] iArr, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    IMqttToken subscribe(String[] strArr, int[] iArr, Object obj, IMqttActionListener iMqttActionListener, IMqttMessageListener[] iMqttMessageListenerArr) throws MqttException;

    IMqttToken subscribe(String[] strArr, int[] iArr, IMqttMessageListener[] iMqttMessageListenerArr) throws MqttException;

    IMqttToken unsubscribe(String str) throws MqttException;

    IMqttToken unsubscribe(String str, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;

    IMqttToken unsubscribe(String[] strArr) throws MqttException;

    IMqttToken unsubscribe(String[] strArr, Object obj, IMqttActionListener iMqttActionListener) throws MqttException;
}
