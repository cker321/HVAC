package org.apache.commons.p006io.output;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.SequenceInputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.apache.commons.p006io.input.ClosedInputStream;

/* loaded from: classes.dex */
public class ByteArrayOutputStream extends OutputStream {
    static final int DEFAULT_SIZE = 1024;
    private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    private final List<byte[]> buffers;
    private int count;
    private byte[] currentBuffer;
    private int currentBufferIndex;
    private int filledBufferSum;
    private boolean reuseBuffers;

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    public ByteArrayOutputStream() {
        this(1024);
    }

    public ByteArrayOutputStream(int i) {
        this.buffers = new ArrayList();
        this.reuseBuffers = true;
        if (i < 0) {
            throw new IllegalArgumentException("Negative initial size: " + i);
        }
        synchronized (this) {
            needNewBuffer(i);
        }
    }

    private void needNewBuffer(int i) {
        if (this.currentBufferIndex < this.buffers.size() - 1) {
            this.filledBufferSum += this.currentBuffer.length;
            int i2 = this.currentBufferIndex + 1;
            this.currentBufferIndex = i2;
            this.currentBuffer = this.buffers.get(i2);
            return;
        }
        byte[] bArr = this.currentBuffer;
        if (bArr == null) {
            this.filledBufferSum = 0;
        } else {
            i = Math.max(bArr.length << 1, i - this.filledBufferSum);
            this.filledBufferSum += this.currentBuffer.length;
        }
        this.currentBufferIndex++;
        byte[] bArr2 = new byte[i];
        this.currentBuffer = bArr2;
        this.buffers.add(bArr2);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) {
        int i3;
        if (i < 0 || i > bArr.length || i2 < 0 || (i3 = i + i2) > bArr.length || i3 < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (i2 == 0) {
            return;
        }
        synchronized (this) {
            int i4 = this.count + i2;
            int i5 = this.count - this.filledBufferSum;
            while (i2 > 0) {
                int iMin = Math.min(i2, this.currentBuffer.length - i5);
                System.arraycopy(bArr, i3 - i2, this.currentBuffer, i5, iMin);
                i2 -= iMin;
                if (i2 > 0) {
                    needNewBuffer(i4);
                    i5 = 0;
                }
            }
            this.count = i4;
        }
    }

    @Override // java.io.OutputStream
    public synchronized void write(int i) {
        int i2 = this.count - this.filledBufferSum;
        if (i2 == this.currentBuffer.length) {
            needNewBuffer(this.count + 1);
            i2 = 0;
        }
        this.currentBuffer[i2] = (byte) i;
        this.count++;
    }

    public synchronized int write(InputStream inputStream) throws IOException {
        int i;
        int i2 = this.count - this.filledBufferSum;
        int i3 = inputStream.read(this.currentBuffer, i2, this.currentBuffer.length - i2);
        i = 0;
        while (i3 != -1) {
            i += i3;
            i2 += i3;
            this.count += i3;
            if (i2 == this.currentBuffer.length) {
                needNewBuffer(this.currentBuffer.length);
                i2 = 0;
            }
            i3 = inputStream.read(this.currentBuffer, i2, this.currentBuffer.length - i2);
        }
        return i;
    }

    public synchronized int size() {
        return this.count;
    }

    public synchronized void reset() {
        this.count = 0;
        this.filledBufferSum = 0;
        this.currentBufferIndex = 0;
        if (this.reuseBuffers) {
            this.currentBuffer = this.buffers.get(0);
        } else {
            this.currentBuffer = null;
            int length = this.buffers.get(0).length;
            this.buffers.clear();
            needNewBuffer(length);
            this.reuseBuffers = true;
        }
    }

    public synchronized void writeTo(OutputStream outputStream) throws IOException {
        int i = this.count;
        for (byte[] bArr : this.buffers) {
            int iMin = Math.min(bArr.length, i);
            outputStream.write(bArr, 0, iMin);
            i -= iMin;
            if (i == 0) {
                break;
            }
        }
    }

    public static InputStream toBufferedInputStream(InputStream inputStream) throws IOException {
        return toBufferedInputStream(inputStream, 1024);
    }

    public static InputStream toBufferedInputStream(InputStream inputStream, int i) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i);
        byteArrayOutputStream.write(inputStream);
        return byteArrayOutputStream.toInputStream();
    }

    public synchronized InputStream toInputStream() {
        int i = this.count;
        if (i == 0) {
            return new ClosedInputStream();
        }
        ArrayList arrayList = new ArrayList(this.buffers.size());
        for (byte[] bArr : this.buffers) {
            int iMin = Math.min(bArr.length, i);
            arrayList.add(new ByteArrayInputStream(bArr, 0, iMin));
            i -= iMin;
            if (i == 0) {
                break;
            }
        }
        this.reuseBuffers = false;
        return new SequenceInputStream(Collections.enumeration(arrayList));
    }

    public synchronized byte[] toByteArray() {
        int i = this.count;
        if (i == 0) {
            return EMPTY_BYTE_ARRAY;
        }
        byte[] bArr = new byte[i];
        int i2 = 0;
        for (byte[] bArr2 : this.buffers) {
            int iMin = Math.min(bArr2.length, i);
            System.arraycopy(bArr2, 0, bArr, i2, iMin);
            i2 += iMin;
            i -= iMin;
            if (i == 0) {
                break;
            }
        }
        return bArr;
    }

    @Deprecated
    public String toString() {
        return new String(toByteArray(), Charset.defaultCharset());
    }

    public String toString(String str) throws UnsupportedEncodingException {
        return new String(toByteArray(), str);
    }

    public String toString(Charset charset) {
        return new String(toByteArray(), charset);
    }
}
