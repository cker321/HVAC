package org.apache.httpcore.impl.p007io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.httpcore.p008io.BufferInfo;
import org.apache.httpcore.p008io.SessionInputBuffer;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class IdentityInputStream extends InputStream {
    private boolean closed = false;

    /* renamed from: in */
    private final SessionInputBuffer f298in;

    public IdentityInputStream(SessionInputBuffer sessionInputBuffer) {
        this.f298in = (SessionInputBuffer) Args.notNull(sessionInputBuffer, "Session input buffer");
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        SessionInputBuffer sessionInputBuffer = this.f298in;
        if (sessionInputBuffer instanceof BufferInfo) {
            return ((BufferInfo) sessionInputBuffer).length();
        }
        return 0;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.closed = true;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this.closed) {
            return -1;
        }
        return this.f298in.read();
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (this.closed) {
            return -1;
        }
        return this.f298in.read(bArr, i, i2);
    }
}
