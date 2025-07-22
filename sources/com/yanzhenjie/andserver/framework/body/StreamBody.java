package com.yanzhenjie.andserver.framework.body;

import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.util.IOUtils;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.dex */
public class StreamBody implements ResponseBody {
    private long mLength;
    private MediaType mMediaType;
    private InputStream mStream;

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public boolean isRepeatable() {
        return false;
    }

    public StreamBody(InputStream inputStream) {
        this(inputStream, MediaType.APPLICATION_OCTET_STREAM);
    }

    public StreamBody(InputStream inputStream, long j) {
        this(inputStream, j, MediaType.APPLICATION_OCTET_STREAM);
    }

    public StreamBody(InputStream inputStream, MediaType mediaType) {
        this(inputStream, 0L, mediaType);
    }

    public StreamBody(InputStream inputStream, long j, MediaType mediaType) {
        this.mStream = inputStream;
        this.mLength = j;
        this.mMediaType = mediaType;
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public long contentLength() throws IOException {
        if (this.mLength == 0) {
            InputStream inputStream = this.mStream;
            if (inputStream instanceof FileInputStream) {
                try {
                    long size = ((FileInputStream) inputStream).getChannel().size();
                    this.mLength = size;
                    return size;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return this.mLength;
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public MediaType contentType() {
        return this.mMediaType;
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public void writeTo(OutputStream outputStream) throws IOException {
        IOUtils.write(this.mStream, outputStream);
        IOUtils.closeQuietly(this.mStream);
    }
}
