package com.yanzhenjie.andserver.http;

/* loaded from: classes.dex */
public class StandardContext implements HttpContext {
    private org.apache.httpcore.protocol.HttpContext mContext;

    public StandardContext(org.apache.httpcore.protocol.HttpContext httpContext) {
        this.mContext = httpContext;
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public Object getAttribute(String str) {
        return this.mContext.getAttribute(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public void setAttribute(String str, Object obj) {
        this.mContext.setAttribute(str, obj);
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public Object removeAttribute(String str) {
        return this.mContext.removeAttribute(str);
    }
}
