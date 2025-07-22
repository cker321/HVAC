package com.yanzhenjie.andserver.framework.body;

import android.text.TextUtils;
import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.util.IOUtils;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import org.apache.commons.p006io.Charsets;

/* loaded from: classes.dex */
public class StringBody implements ResponseBody {
    private byte[] mBody;
    private MediaType mMediaType;

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public boolean isRepeatable() {
        return true;
    }

    public StringBody(String str) {
        this(str, MediaType.TEXT_PLAIN);
    }

    public StringBody(String str, MediaType mediaType) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("The content cannot be null or empty.");
        }
        this.mMediaType = mediaType;
        if (mediaType == null) {
            this.mMediaType = new MediaType(MediaType.TEXT_PLAIN, Charsets.UTF_8);
        }
        Charset charset = this.mMediaType.getCharset();
        this.mBody = str.getBytes(charset == null ? Charsets.UTF_8 : charset);
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public long contentLength() {
        return this.mBody.length;
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public MediaType contentType() {
        if (this.mMediaType.getCharset() == null) {
            return new MediaType(this.mMediaType.getType(), this.mMediaType.getSubtype(), Charsets.UTF_8);
        }
        return this.mMediaType;
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public void writeTo(OutputStream outputStream) throws IOException {
        IOUtils.write(outputStream, this.mBody);
    }
}
