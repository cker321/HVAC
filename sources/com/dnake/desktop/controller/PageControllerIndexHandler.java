package com.dnake.desktop.controller;

import com.yanzhenjie.andserver.framework.MessageConverter;
import com.yanzhenjie.andserver.framework.cross.CrossOrigin;
import com.yanzhenjie.andserver.framework.handler.MappingHandler;
import com.yanzhenjie.andserver.framework.mapping.Addition;
import com.yanzhenjie.andserver.framework.mapping.Mapping;
import com.yanzhenjie.andserver.framework.view.ObjectView;
import com.yanzhenjie.andserver.framework.view.View;
import com.yanzhenjie.andserver.http.HttpContext;
import com.yanzhenjie.andserver.http.HttpMethod;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;
import com.yanzhenjie.andserver.http.multipart.MultipartRequest;

/* loaded from: classes.dex */
public final class PageControllerIndexHandler extends MappingHandler {
    private Object mHost;

    public PageControllerIndexHandler(Object obj, Mapping mapping, Addition addition, CrossOrigin crossOrigin) {
        super(obj, mapping, addition, crossOrigin);
        this.mHost = obj;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MappingHandler
    protected View onHandle(HttpRequest httpRequest, HttpResponse httpResponse) throws Throwable {
        String path = httpRequest.getPath();
        HttpMethod method = httpRequest.getMethod();
        Object attribute = httpRequest.getAttribute(HttpContext.HTTP_MESSAGE_CONVERTER);
        if (attribute != null && (attribute instanceof MessageConverter)) {
        }
        if (httpRequest instanceof MultipartRequest) {
        }
        if (method.allowBody()) {
            httpRequest.getBody();
        }
        getPathVariable(path);
        return new ObjectView(false, ((PageController) this.mHost).index());
    }
}
