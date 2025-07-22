package org.eclipse.paho.client.mqttv3.internal.wire;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.dex */
public class CountingInputStream extends InputStream {
    private int counter = 0;

    /* renamed from: in */
    private InputStream f309in;

    public CountingInputStream(InputStream inputStream) {
        this.f309in = inputStream;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i = this.f309in.read();
        if (i != -1) {
            this.counter++;
        }
        return i;
    }

    public int getCounter() {
        return this.counter;
    }

    public void resetCounter() {
        this.counter = 0;
    }
}
