package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class MultipartException extends BasicException {
    public MultipartException(String str) {
        super(400, str);
    }

    public MultipartException(String str, Throwable th) {
        super(400, str, th);
    }
}
