package org.eclipse.paho.client.mqttv3;

/* loaded from: classes.dex */
public class MqttMessage {
    private int messageId;
    private byte[] payload;
    private boolean mutable = true;
    private int qos = 1;
    private boolean retained = false;
    private boolean dup = false;

    public static void validateQos(int i) {
        if (i < 0 || i > 2) {
            throw new IllegalArgumentException();
        }
    }

    public MqttMessage() throws IllegalStateException {
        setPayload(new byte[0]);
    }

    public MqttMessage(byte[] bArr) throws IllegalStateException {
        setPayload(bArr);
    }

    public byte[] getPayload() {
        return this.payload;
    }

    public void clearPayload() throws IllegalStateException {
        checkMutable();
        this.payload = new byte[0];
    }

    public void setPayload(byte[] bArr) throws IllegalStateException {
        checkMutable();
        if (bArr == null) {
            throw null;
        }
        this.payload = (byte[]) bArr.clone();
    }

    public boolean isRetained() {
        return this.retained;
    }

    public void setRetained(boolean z) throws IllegalStateException {
        checkMutable();
        this.retained = z;
    }

    public int getQos() {
        return this.qos;
    }

    public void setQos(int i) throws IllegalStateException {
        checkMutable();
        validateQos(i);
        this.qos = i;
    }

    public String toString() {
        return new String(this.payload);
    }

    protected void setMutable(boolean z) {
        this.mutable = z;
    }

    protected void checkMutable() throws IllegalStateException {
        if (!this.mutable) {
            throw new IllegalStateException();
        }
    }

    protected void setDuplicate(boolean z) {
        this.dup = z;
    }

    public boolean isDuplicate() {
        return this.dup;
    }

    public void setId(int i) {
        this.messageId = i;
    }

    public int getId() {
        return this.messageId;
    }
}
