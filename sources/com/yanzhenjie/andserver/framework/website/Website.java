package com.yanzhenjie.andserver.framework.website;

import com.yanzhenjie.andserver.framework.ETag;
import com.yanzhenjie.andserver.framework.LastModified;
import com.yanzhenjie.andserver.framework.handler.HandlerAdapter;
import com.yanzhenjie.andserver.framework.handler.RequestHandler;
import com.yanzhenjie.andserver.framework.view.BodyView;
import com.yanzhenjie.andserver.framework.view.View;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;
import com.yanzhenjie.andserver.http.ResponseBody;
import java.io.IOException;

/* loaded from: classes.dex */
public abstract class Website implements HandlerAdapter, ETag, LastModified {
    public abstract ResponseBody getBody(HttpRequest httpRequest) throws IOException;

    public String getETag(HttpRequest httpRequest) throws Throwable {
        return null;
    }

    public long getLastModified(HttpRequest httpRequest) throws Throwable {
        return 0L;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.HandlerAdapter
    public RequestHandler getHandler(HttpRequest httpRequest) {
        return new RequestHandler() { // from class: com.yanzhenjie.andserver.framework.website.Website.1
            @Override // com.yanzhenjie.andserver.framework.ETag
            public String getETag(HttpRequest httpRequest2) throws Throwable {
                return Website.this.getETag(httpRequest2);
            }

            @Override // com.yanzhenjie.andserver.framework.LastModified
            public long getLastModified(HttpRequest httpRequest2) throws Throwable {
                return Website.this.getLastModified(httpRequest2);
            }

            @Override // com.yanzhenjie.andserver.framework.handler.RequestHandler
            public View handle(HttpRequest httpRequest2, HttpResponse httpResponse) throws Throwable {
                return new BodyView(Website.this.getBody(httpRequest2));
            }
        };
    }
}
