package com.yanzhenjie.andserver.framework.body;

import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.util.IOUtils;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.dex */
public class FileBody implements ResponseBody {
    private File mBody;

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public boolean isRepeatable() {
        return true;
    }

    public FileBody(File file) {
        if (file == null) {
            throw new IllegalArgumentException("The file cannot be null.");
        }
        this.mBody = file;
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public long contentLength() {
        return this.mBody.length();
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public MediaType contentType() {
        return MediaType.getFileMediaType(this.mBody.getName());
    }

    @Override // com.yanzhenjie.andserver.http.ResponseBody
    public void writeTo(OutputStream outputStream) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(this.mBody);
        IOUtils.write(fileInputStream, outputStream);
        IOUtils.closeQuietly(fileInputStream);
    }
}
