package org.eclipse.paho.client.mqttv3.internal.wire;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.dex */
public class MultiByteArrayInputStream extends InputStream {
    private byte[] bytesA;
    private byte[] bytesB;
    private int lengthA;
    private int lengthB;
    private int offsetA;
    private int offsetB;
    private int pos = 0;

    public MultiByteArrayInputStream(byte[] bArr, int i, int i2, byte[] bArr2, int i3, int i4) {
        this.bytesA = (byte[]) bArr.clone();
        this.bytesB = (byte[]) bArr2.clone();
        this.offsetA = i;
        this.offsetB = i3;
        this.lengthA = i2;
        this.lengthB = i4;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i;
        int i2 = this.pos;
        int i3 = this.lengthA;
        if (i2 < i3) {
            i = this.bytesA[this.offsetA + i2];
        } else {
            if (i2 >= this.lengthB + i3) {
                return -1;
            }
            i = this.bytesB[(this.offsetB + i2) - i3];
        }
        if (i < 0) {
            i += 256;
        }
        this.pos++;
        return i;
    }
}
