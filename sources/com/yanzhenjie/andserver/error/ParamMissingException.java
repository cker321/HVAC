package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class ParamMissingException extends BasicException {
    private static final String MESSAGE = "Missing param [%s] for method parameter.";

    public ParamMissingException(String str) {
        super(400, String.format(MESSAGE, str));
    }

    public ParamMissingException(String str, Throwable th) {
        super(400, String.format(MESSAGE, str), th);
    }

    public ParamMissingException(Throwable th) {
        super(400, String.format(MESSAGE, ""), th);
    }
}
