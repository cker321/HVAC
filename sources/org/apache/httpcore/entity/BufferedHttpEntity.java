package org.apache.httpcore.entity;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class BufferedHttpEntity extends HttpEntityWrapper {
    private final byte[] buffer;

    @Override // org.apache.httpcore.entity.HttpEntityWrapper, org.apache.httpcore.HttpEntity
    public boolean isRepeatable() {
        return true;
    }

    public BufferedHttpEntity(HttpEntity httpEntity) throws IOException {
        super(httpEntity);
        if (!httpEntity.isRepeatable() || httpEntity.getContentLength() < 0) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            httpEntity.writeTo(byteArrayOutputStream);
            byteArrayOutputStream.flush();
            this.buffer = byteArrayOutputStream.toByteArray();
            return;
        }
        this.buffer = null;
    }

    @Override // org.apache.httpcore.entity.HttpEntityWrapper, org.apache.httpcore.HttpEntity
    public long getContentLength() {
        return this.buffer != null ? r0.length : super.getContentLength();
    }

    @Override // org.apache.httpcore.entity.HttpEntityWrapper, org.apache.httpcore.HttpEntity
    public InputStream getContent() throws IOException {
        return this.buffer != null ? new ByteArrayInputStream(this.buffer) : super.getContent();
    }

    @Override // org.apache.httpcore.entity.HttpEntityWrapper, org.apache.httpcore.HttpEntity
    public boolean isChunked() {
        return this.buffer == null && super.isChunked();
    }

    @Override // org.apache.httpcore.entity.HttpEntityWrapper, org.apache.httpcore.HttpEntity
    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        byte[] bArr = this.buffer;
        if (bArr != null) {
            outputStream.write(bArr);
        } else {
            super.writeTo(outputStream);
        }
    }

    @Override // org.apache.httpcore.entity.HttpEntityWrapper, org.apache.httpcore.HttpEntity
    public boolean isStreaming() {
        return this.buffer == null && super.isStreaming();
    }
}
