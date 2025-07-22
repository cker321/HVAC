package com.yanzhenjie.andserver.http.multipart;

import androidx.appcompat.widget.ActivityChooserView;
import com.yanzhenjie.andserver.http.RequestBody;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.fileupload.UploadContext;

/* loaded from: classes.dex */
public class BodyContext implements UploadContext {
    private final RequestBody mBody;

    public BodyContext(RequestBody requestBody) {
        this.mBody = requestBody;
    }

    @Override // org.apache.commons.fileupload.RequestContext
    public String getCharacterEncoding() {
        return this.mBody.contentEncoding();
    }

    @Override // org.apache.commons.fileupload.RequestContext
    public String getContentType() {
        MediaType mediaTypeContentType = this.mBody.contentType();
        if (mediaTypeContentType == null) {
            return null;
        }
        return mediaTypeContentType.toString();
    }

    @Override // org.apache.commons.fileupload.RequestContext
    public int getContentLength() {
        long jContentLength = contentLength();
        return jContentLength > 2147483647L ? ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED : (int) jContentLength;
    }

    @Override // org.apache.commons.fileupload.UploadContext
    public long contentLength() {
        return this.mBody.length();
    }

    @Override // org.apache.commons.fileupload.RequestContext
    public InputStream getInputStream() throws IOException {
        return this.mBody.stream();
    }

    public String toString() {
        return String.format("ContentLength=%s, Mime=%s", Long.valueOf(contentLength()), getContentType());
    }
}
