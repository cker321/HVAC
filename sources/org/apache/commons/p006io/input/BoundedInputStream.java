package org.apache.commons.p006io.input;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.dex */
public class BoundedInputStream extends InputStream {

    /* renamed from: in */
    private final InputStream f285in;
    private long mark;
    private final long max;
    private long pos;
    private boolean propagateClose;

    public BoundedInputStream(InputStream inputStream, long j) {
        this.pos = 0L;
        this.mark = -1L;
        this.propagateClose = true;
        this.max = j;
        this.f285in = inputStream;
    }

    public BoundedInputStream(InputStream inputStream) {
        this(inputStream, -1L);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        long j = this.max;
        if (j >= 0 && this.pos >= j) {
            return -1;
        }
        int i = this.f285in.read();
        this.pos++;
        return i;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        long j = this.max;
        if (j >= 0 && this.pos >= j) {
            return -1;
        }
        long j2 = this.max;
        int i3 = this.f285in.read(bArr, i, (int) (j2 >= 0 ? Math.min(i2, j2 - this.pos) : i2));
        if (i3 == -1) {
            return -1;
        }
        this.pos += i3;
        return i3;
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        long j2 = this.max;
        if (j2 >= 0) {
            j = Math.min(j, j2 - this.pos);
        }
        long jSkip = this.f285in.skip(j);
        this.pos += jSkip;
        return jSkip;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        long j = this.max;
        if (j < 0 || this.pos < j) {
            return this.f285in.available();
        }
        return 0;
    }

    public String toString() {
        return this.f285in.toString();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.propagateClose) {
            this.f285in.close();
        }
    }

    @Override // java.io.InputStream
    public synchronized void reset() throws IOException {
        this.f285in.reset();
        this.pos = this.mark;
    }

    @Override // java.io.InputStream
    public synchronized void mark(int i) {
        this.f285in.mark(i);
        this.mark = this.pos;
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this.f285in.markSupported();
    }

    public boolean isPropagateClose() {
        return this.propagateClose;
    }

    public void setPropagateClose(boolean z) {
        this.propagateClose = z;
    }
}
