package org.apache.httpcore.entity;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class ByteArrayEntity extends AbstractHttpEntity implements Cloneable {

    /* renamed from: b */
    private final byte[] f295b;

    @Deprecated
    protected final byte[] content;
    private final int len;
    private final int off;

    @Override // org.apache.httpcore.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    @Override // org.apache.httpcore.HttpEntity
    public boolean isStreaming() {
        return false;
    }

    public ByteArrayEntity(byte[] bArr, ContentType contentType) {
        Args.notNull(bArr, "Source byte array");
        this.content = bArr;
        this.f295b = bArr;
        this.off = 0;
        this.len = bArr.length;
        if (contentType != null) {
            setContentType(contentType.toString());
        }
    }

    public ByteArrayEntity(byte[] bArr, int i, int i2, ContentType contentType) {
        int i3;
        Args.notNull(bArr, "Source byte array");
        if (i < 0 || i > bArr.length || i2 < 0 || (i3 = i + i2) < 0 || i3 > bArr.length) {
            throw new IndexOutOfBoundsException("off: " + i + " len: " + i2 + " b.length: " + bArr.length);
        }
        this.content = bArr;
        this.f295b = bArr;
        this.off = i;
        this.len = i2;
        if (contentType != null) {
            setContentType(contentType.toString());
        }
    }

    public ByteArrayEntity(byte[] bArr) {
        this(bArr, null);
    }

    public ByteArrayEntity(byte[] bArr, int i, int i2) {
        this(bArr, i, i2, null);
    }

    @Override // org.apache.httpcore.HttpEntity
    public long getContentLength() {
        return this.len;
    }

    @Override // org.apache.httpcore.HttpEntity
    public InputStream getContent() {
        return new ByteArrayInputStream(this.f295b, this.off, this.len);
    }

    @Override // org.apache.httpcore.HttpEntity
    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        outputStream.write(this.f295b, this.off, this.len);
        outputStream.flush();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
