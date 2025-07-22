package com.yanzhenjie.andserver.error;

import com.yanzhenjie.andserver.util.MediaType;

/* loaded from: classes.dex */
public class ContentNotSupportedException extends BasicException {
    private static final String MESSAGE = "The content type [%s] is not supported.";

    public ContentNotSupportedException(MediaType mediaType) {
        super(415, String.format(MESSAGE, mediaType));
    }

    public ContentNotSupportedException(MediaType mediaType, Throwable th) {
        super(415, String.format(MESSAGE, mediaType), th);
    }
}
