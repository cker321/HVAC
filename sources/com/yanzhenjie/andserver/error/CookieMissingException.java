package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class CookieMissingException extends BasicException {
    private static final String MESSAGE = "Missing cookie [%s] for method parameter.";

    public CookieMissingException(String str) {
        super(400, String.format(MESSAGE, str));
    }

    public CookieMissingException(String str, Throwable th) {
        super(400, String.format(MESSAGE, str), th);
    }

    public CookieMissingException(Throwable th) {
        super(400, String.format(MESSAGE, ""), th);
    }
}
