package org.apache.commons.p006io.filefilter;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Arrays;

/* loaded from: classes.dex */
public class MagicNumberFileFilter extends AbstractFileFilter implements Serializable {
    private static final long serialVersionUID = -547733176983104172L;
    private final long byteOffset;
    private final byte[] magicNumbers;

    public MagicNumberFileFilter(byte[] bArr) {
        this(bArr, 0L);
    }

    public MagicNumberFileFilter(String str) {
        this(str, 0L);
    }

    public MagicNumberFileFilter(String str, long j) {
        if (str == null) {
            throw new IllegalArgumentException("The magic number cannot be null");
        }
        if (str.isEmpty()) {
            throw new IllegalArgumentException("The magic number must contain at least one byte");
        }
        if (j < 0) {
            throw new IllegalArgumentException("The offset cannot be negative");
        }
        this.magicNumbers = str.getBytes(Charset.defaultCharset());
        this.byteOffset = j;
    }

    public MagicNumberFileFilter(byte[] bArr, long j) {
        if (bArr == null) {
            throw new IllegalArgumentException("The magic number cannot be null");
        }
        if (bArr.length == 0) {
            throw new IllegalArgumentException("The magic number must contain at least one byte");
        }
        if (j < 0) {
            throw new IllegalArgumentException("The offset cannot be negative");
        }
        byte[] bArr2 = new byte[bArr.length];
        this.magicNumbers = bArr2;
        System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        this.byteOffset = j;
    }

    @Override // org.apache.commons.p006io.filefilter.AbstractFileFilter, org.apache.commons.p006io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) throws IOException {
        if (file != null && file.isFile() && file.canRead()) {
            try {
                RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
                try {
                    byte[] bArr = new byte[this.magicNumbers.length];
                    randomAccessFile.seek(this.byteOffset);
                    if (randomAccessFile.read(bArr) == this.magicNumbers.length) {
                        boolean zEquals = Arrays.equals(this.magicNumbers, bArr);
                        randomAccessFile.close();
                        return zEquals;
                    }
                    randomAccessFile.close();
                    return false;
                } finally {
                }
            } catch (IOException unused) {
            }
        }
        return false;
    }

    @Override // org.apache.commons.p006io.filefilter.AbstractFileFilter
    public String toString() {
        return super.toString() + "(" + new String(this.magicNumbers, Charset.defaultCharset()) + "," + this.byteOffset + ")";
    }
}
