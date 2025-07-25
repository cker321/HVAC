package com.yanzhenjie.andserver.http;

import com.yanzhenjie.andserver.util.MediaType;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.dex */
public interface ResponseBody {
    long contentLength();

    MediaType contentType();

    boolean isRepeatable();

    void writeTo(OutputStream outputStream) throws IOException;
}
