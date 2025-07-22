package com.yanzhenjie.andserver.framework;

import android.text.TextUtils;
import com.yanzhenjie.andserver.error.BasicException;
import com.yanzhenjie.andserver.error.MethodNotSupportException;
import com.yanzhenjie.andserver.framework.body.StringBody;
import com.yanzhenjie.andserver.http.HttpMethod;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;
import java.util.List;

/* loaded from: classes.dex */
public interface ExceptionResolver {
    public static final ExceptionResolver DEFAULT = new ExceptionResolver() { // from class: com.yanzhenjie.andserver.framework.ExceptionResolver.1
        @Override // com.yanzhenjie.andserver.framework.ExceptionResolver
        public void onResolve(HttpRequest httpRequest, HttpResponse httpResponse, Throwable th) {
            if (th instanceof BasicException) {
                httpResponse.setStatus(((BasicException) th).getStatusCode());
            } else {
                httpResponse.setStatus(500);
            }
            httpResponse.setBody(new StringBody(th.getMessage()));
        }
    };

    void onResolve(HttpRequest httpRequest, HttpResponse httpResponse, Throwable th);

    public static class ResolverWrapper implements ExceptionResolver {
        private final ExceptionResolver mResolver;

        public ResolverWrapper(ExceptionResolver exceptionResolver) {
            this.mResolver = exceptionResolver;
        }

        @Override // com.yanzhenjie.andserver.framework.ExceptionResolver
        public void onResolve(HttpRequest httpRequest, HttpResponse httpResponse, Throwable th) {
            List<HttpMethod> methods;
            if ((th instanceof MethodNotSupportException) && (methods = ((MethodNotSupportException) th).getMethods()) != null && methods.size() > 0) {
                httpResponse.setHeader("Allow", TextUtils.join(", ", methods));
            }
            this.mResolver.onResolve(httpRequest, httpResponse, th);
        }
    }
}
