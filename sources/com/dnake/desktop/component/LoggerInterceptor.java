package com.dnake.desktop.component;

import com.yanzhenjie.andserver.framework.HandlerInterceptor;
import com.yanzhenjie.andserver.framework.handler.RequestHandler;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;

/* loaded from: classes.dex */
public class LoggerInterceptor implements HandlerInterceptor {
    @Override // com.yanzhenjie.andserver.framework.HandlerInterceptor
    public boolean onIntercept(HttpRequest httpRequest, HttpResponse httpResponse, RequestHandler requestHandler) {
        httpRequest.getPath();
        httpRequest.getMethod();
        httpRequest.getParameter();
        return false;
    }
}
