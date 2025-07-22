package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class PathMissingException extends BasicException {
    private static final String MESSAGE = "Missing param [%s] for path parameter.";

    public PathMissingException(String str) {
        super(400, String.format(MESSAGE, str));
    }

    public PathMissingException(String str, Throwable th) {
        super(400, String.format(MESSAGE, str), th);
    }

    public PathMissingException(Throwable th) {
        super(400, String.format(MESSAGE, ""), th);
    }
}
