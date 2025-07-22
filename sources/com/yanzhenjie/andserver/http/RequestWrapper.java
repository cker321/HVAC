package com.yanzhenjie.andserver.http;

import com.yanzhenjie.andserver.http.cookie.Cookie;
import com.yanzhenjie.andserver.http.session.Session;
import com.yanzhenjie.andserver.util.MediaType;
import com.yanzhenjie.andserver.util.MultiValueMap;
import java.util.List;
import java.util.Locale;

/* loaded from: classes.dex */
public class RequestWrapper implements HttpRequest {
    private HttpRequest mRequest;

    public RequestWrapper(HttpRequest httpRequest) {
        this.mRequest = httpRequest;
    }

    public HttpRequest getRequest() {
        return this.mRequest;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public HttpMethod getMethod() {
        return this.mRequest.getMethod();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getURI() {
        return this.mRequest.getURI();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getPath() {
        return this.mRequest.getPath();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getQueryNames() {
        return this.mRequest.getQueryNames();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getQuery(String str) {
        return this.mRequest.getQuery(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getQueries(String str) {
        return this.mRequest.getQueries(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MultiValueMap<String, String> getQuery() {
        return this.mRequest.getQuery();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getHeaderNames() {
        return this.mRequest.getHeaderNames();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getHeader(String str) {
        return this.mRequest.getHeader(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getHeaders(String str) {
        return this.mRequest.getHeaders(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public long getDateHeader(String str) {
        return this.mRequest.getDateHeader(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public int getIntHeader(String str) {
        return this.mRequest.getIntHeader(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MediaType getAccept() {
        return this.mRequest.getAccept();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<MediaType> getAccepts() {
        return this.mRequest.getAccepts();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Locale getAcceptLanguage() {
        return this.mRequest.getAcceptLanguage();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<Locale> getAcceptLanguages() {
        return this.mRequest.getAcceptLanguages();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getCookieValue(String str) {
        return this.mRequest.getCookieValue(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Cookie getCookie(String str) {
        return this.mRequest.getCookie(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<Cookie> getCookies() {
        return this.mRequest.getCookies();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public long getContentLength() {
        return this.mRequest.getContentLength();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MediaType getContentType() {
        return this.mRequest.getContentType();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getParameterNames() {
        return this.mRequest.getParameterNames();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getParameter(String str) {
        return this.mRequest.getParameter(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getParameters(String str) {
        return this.mRequest.getParameters(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MultiValueMap<String, String> getParameter() {
        return this.mRequest.getParameter();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public RequestBody getBody() throws UnsupportedOperationException {
        return this.mRequest.getBody();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Session getValidSession() {
        return this.mRequest.getValidSession();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Session getSession() {
        return this.mRequest.getSession();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String changeSessionId() {
        return this.mRequest.changeSessionId();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public boolean isSessionValid() {
        return this.mRequest.isSessionValid();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public RequestDispatcher getRequestDispatcher(String str) {
        return this.mRequest.getRequestDispatcher(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public HttpContext getContext() {
        return this.mRequest.getContext();
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public Object getAttribute(String str) {
        return this.mRequest.getAttribute(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public void setAttribute(String str, Object obj) {
        this.mRequest.setAttribute(str, obj);
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public Object removeAttribute(String str) {
        return this.mRequest.removeAttribute(str);
    }
}
