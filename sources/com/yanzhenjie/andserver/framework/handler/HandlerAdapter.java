package com.yanzhenjie.andserver.framework.handler;

import com.yanzhenjie.andserver.http.HttpRequest;

/* loaded from: classes.dex */
public interface HandlerAdapter {
    RequestHandler getHandler(HttpRequest httpRequest);

    boolean intercept(HttpRequest httpRequest);
}
