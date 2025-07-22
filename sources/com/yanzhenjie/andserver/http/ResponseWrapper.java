package com.yanzhenjie.andserver.http;

import com.yanzhenjie.andserver.http.cookie.Cookie;
import java.util.List;

/* loaded from: classes.dex */
public class ResponseWrapper implements HttpResponse {
    private HttpResponse mResponse;

    public ResponseWrapper(HttpResponse httpResponse) {
        this.mResponse = httpResponse;
    }

    public HttpResponse getResponse() {
        return this.mResponse;
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setStatus(int i) {
        this.mResponse.setStatus(i);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public int getStatus() {
        return this.mResponse.getStatus();
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setHeader(String str, String str2) {
        this.mResponse.setHeader(str, str2);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addHeader(String str, String str2) {
        this.mResponse.addHeader(str, str2);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public String getHeader(String str) {
        return this.mResponse.getHeader(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setDateHeader(String str, long j) {
        this.mResponse.setDateHeader(str, j);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addDateHeader(String str, long j) {
        this.mResponse.addDateHeader(str, j);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setIntHeader(String str, int i) {
        this.mResponse.setIntHeader(str, i);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addIntHeader(String str, int i) {
        this.mResponse.addIntHeader(str, i);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public boolean containsHeader(String str) {
        return this.mResponse.containsHeader(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public List<String> getHeaders(String str) {
        return this.mResponse.getHeaders(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public List<String> getHeaderNames() {
        return this.mResponse.getHeaderNames();
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addCookie(Cookie cookie) {
        this.mResponse.addCookie(cookie);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void sendRedirect(String str) {
        this.mResponse.sendRedirect(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setBody(ResponseBody responseBody) {
        this.mResponse.setBody(responseBody);
    }
}
