package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class NotFoundException extends BasicException {
    private static final String MESSAGE = "The resource [%s] is not found.";

    public NotFoundException() {
        super(404, String.format(MESSAGE, ""));
    }

    public NotFoundException(String str) {
        super(404, String.format(MESSAGE, str));
    }

    public NotFoundException(String str, Throwable th) {
        super(404, String.format(MESSAGE, str), th);
    }

    public NotFoundException(Throwable th) {
        super(404, String.format(MESSAGE, ""), th);
    }
}
