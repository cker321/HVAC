package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class HeaderMissingException extends BasicException {
    private static final String MESSAGE = "Missing header [%s] for method parameter.";

    public HeaderMissingException(String str) {
        super(400, String.format(MESSAGE, str));
    }

    public HeaderMissingException(String str, Throwable th) {
        super(400, String.format(MESSAGE, str), th);
    }

    public HeaderMissingException(Throwable th) {
        super(400, String.format(MESSAGE, ""), th);
    }
}
