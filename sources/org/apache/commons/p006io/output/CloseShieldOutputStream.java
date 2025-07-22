package org.apache.commons.p006io.output;

import java.io.OutputStream;

/* loaded from: classes.dex */
public class CloseShieldOutputStream extends ProxyOutputStream {
    public CloseShieldOutputStream(OutputStream outputStream) {
        super(outputStream);
    }

    @Override // org.apache.commons.p006io.output.ProxyOutputStream, java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.out = new ClosedOutputStream();
    }
}
