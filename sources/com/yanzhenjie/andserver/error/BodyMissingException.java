package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class BodyMissingException extends BasicException {
    private static final String MESSAGE = "RequestBody is missing.";

    public BodyMissingException() {
        super(400, MESSAGE);
    }

    public BodyMissingException(Throwable th) {
        super(400, MESSAGE, th);
    }
}
