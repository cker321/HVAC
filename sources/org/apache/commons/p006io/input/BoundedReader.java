package org.apache.commons.p006io.input;

import java.io.IOException;
import java.io.Reader;

/* loaded from: classes.dex */
public class BoundedReader extends Reader {
    private static final int INVALID = -1;
    private int charsRead = 0;
    private int markedAt = -1;
    private final int maxCharsFromTargetReader;
    private int readAheadLimit;
    private final Reader target;

    public BoundedReader(Reader reader, int i) throws IOException {
        this.target = reader;
        this.maxCharsFromTargetReader = i;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.target.close();
    }

    @Override // java.io.Reader
    public void reset() throws IOException {
        this.charsRead = this.markedAt;
        this.target.reset();
    }

    @Override // java.io.Reader
    public void mark(int i) throws IOException {
        int i2 = this.charsRead;
        this.readAheadLimit = i - i2;
        this.markedAt = i2;
        this.target.mark(i);
    }

    @Override // java.io.Reader
    public int read() throws IOException {
        int i = this.charsRead;
        if (i >= this.maxCharsFromTargetReader) {
            return -1;
        }
        int i2 = this.markedAt;
        if (i2 >= 0 && i - i2 >= this.readAheadLimit) {
            return -1;
        }
        this.charsRead++;
        return this.target.read();
    }

    @Override // java.io.Reader
    public int read(char[] cArr, int i, int i2) throws IOException {
        for (int i3 = 0; i3 < i2; i3++) {
            int i4 = read();
            if (i4 == -1) {
                if (i3 == 0) {
                    return -1;
                }
                return i3;
            }
            cArr[i + i3] = (char) i4;
        }
        return i2;
    }
}
