package org.apache.httpcore.impl.p007io;

import org.apache.httpcore.p008io.HttpTransportMetrics;

/* loaded from: classes.dex */
public class HttpTransportMetricsImpl implements HttpTransportMetrics {
    private long bytesTransferred = 0;

    @Override // org.apache.httpcore.p008io.HttpTransportMetrics
    public long getBytesTransferred() {
        return this.bytesTransferred;
    }

    public void setBytesTransferred(long j) {
        this.bytesTransferred = j;
    }

    public void incrementBytesTransferred(long j) {
        this.bytesTransferred += j;
    }

    @Override // org.apache.httpcore.p008io.HttpTransportMetrics
    public void reset() {
        this.bytesTransferred = 0L;
    }
}
