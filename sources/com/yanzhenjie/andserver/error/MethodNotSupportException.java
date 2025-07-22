package com.yanzhenjie.andserver.error;

import com.yanzhenjie.andserver.http.HttpMethod;
import java.util.List;

/* loaded from: classes.dex */
public class MethodNotSupportException extends BasicException {
    private static final String MESSAGE = "The request method [%s] is not supported.";
    private List<HttpMethod> mMethods;

    public MethodNotSupportException(HttpMethod httpMethod) {
        super(405, String.format(MESSAGE, httpMethod.value()));
    }

    public MethodNotSupportException(HttpMethod httpMethod, Throwable th) {
        super(405, String.format(MESSAGE, httpMethod.value()), th);
    }

    public List<HttpMethod> getMethods() {
        return this.mMethods;
    }

    public void setMethods(List<HttpMethod> list) {
        this.mMethods = list;
    }
}
