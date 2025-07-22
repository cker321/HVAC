package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class ContentNotAcceptableException extends BasicException {
    private static final String MESSAGE = "Could not find acceptable representation.";

    public ContentNotAcceptableException() {
        super(406, MESSAGE);
    }

    public ContentNotAcceptableException(String str, Throwable th) {
        super(406, str, th);
    }
}
