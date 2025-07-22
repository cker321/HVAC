package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class ServerInternalException extends BasicException {
    private static final String MESSAGE = "Server internal error";

    public ServerInternalException(String str) {
        super(500, String.format("%s, %s.", MESSAGE, str));
    }

    public ServerInternalException(String str, Throwable th) {
        super(500, String.format("%s, %s.", MESSAGE, str), th);
    }

    public ServerInternalException(Throwable th) {
        super(500, String.format("%s.", MESSAGE), th);
    }
}
