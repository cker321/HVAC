package com.yanzhenjie.andserver.http;

import com.yanzhenjie.andserver.http.cookie.Cookie;
import com.yanzhenjie.andserver.http.cookie.CookieProcessor;
import com.yanzhenjie.andserver.http.cookie.StandardCookieProcessor;
import com.yanzhenjie.andserver.util.HttpDateFormat;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.apache.httpcore.Header;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.message.BasicHeader;

/* loaded from: classes.dex */
public class StandardResponse implements HttpResponse {
    private static final CookieProcessor COOKIE_PROCESSOR = new StandardCookieProcessor();
    private org.apache.httpcore.HttpResponse mResponse;

    public StandardResponse(org.apache.httpcore.HttpResponse httpResponse) {
        this.mResponse = httpResponse;
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setStatus(int i) throws IllegalStateException {
        this.mResponse.setStatusCode(i);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public int getStatus() {
        return this.mResponse.getStatusLine().getStatusCode();
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
        Header firstHeader = this.mResponse.getFirstHeader(str);
        if (firstHeader == null) {
            return null;
        }
        return firstHeader.getValue();
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setDateHeader(String str, long j) {
        setHeader(str, HttpDateFormat.formatDate(j));
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addDateHeader(String str, long j) {
        addHeader(str, HttpDateFormat.formatDate(j));
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setIntHeader(String str, int i) {
        setHeader(str, Integer.toString(i));
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addIntHeader(String str, int i) {
        addHeader(str, Integer.toString(i));
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public boolean containsHeader(String str) {
        return this.mResponse.containsHeader(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public List<String> getHeaders(String str) {
        Header[] headers = this.mResponse.getHeaders(str);
        if (headers == null || headers.length == 0) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList();
        for (Header header : headers) {
            arrayList.add(header.getValue());
        }
        return arrayList;
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public List<String> getHeaderNames() {
        Header[] allHeaders = this.mResponse.getAllHeaders();
        if (allHeaders == null || allHeaders.length == 0) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList();
        for (Header header : allHeaders) {
            arrayList.add(header.getName());
        }
        return arrayList;
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void addCookie(Cookie cookie) {
        addHeader(HttpHeaders.SET_COOKIE, COOKIE_PROCESSOR.generateHeader(cookie));
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void sendRedirect(String str) throws IllegalStateException {
        setStatus(302);
        setHeader("Location", str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpResponse
    public void setBody(ResponseBody responseBody) {
        this.mResponse.setEntity(new BodyToEntity(responseBody));
    }

    private static class BodyToEntity implements HttpEntity {
        private ResponseBody mBody;

        @Override // org.apache.httpcore.HttpEntity
        public void consumeContent() {
        }

        @Override // org.apache.httpcore.HttpEntity
        public InputStream getContent() throws IOException {
            return null;
        }

        @Override // org.apache.httpcore.HttpEntity
        public Header getContentEncoding() {
            return null;
        }

        @Override // org.apache.httpcore.HttpEntity
        public boolean isChunked() {
            return false;
        }

        @Override // org.apache.httpcore.HttpEntity
        public boolean isRepeatable() {
            return false;
        }

        @Override // org.apache.httpcore.HttpEntity
        public boolean isStreaming() {
            return false;
        }

        private BodyToEntity(ResponseBody responseBody) {
            this.mBody = responseBody;
        }

        @Override // org.apache.httpcore.HttpEntity
        public long getContentLength() {
            return this.mBody.contentLength();
        }

        @Override // org.apache.httpcore.HttpEntity
        public Header getContentType() {
            MediaType mediaTypeContentType = this.mBody.contentType();
            if (mediaTypeContentType == null) {
                return null;
            }
            return new BasicHeader("Content-Type", mediaTypeContentType.toString());
        }

        @Override // org.apache.httpcore.HttpEntity
        public void writeTo(OutputStream outputStream) throws IOException {
            this.mBody.writeTo(outputStream);
        }
    }
}
