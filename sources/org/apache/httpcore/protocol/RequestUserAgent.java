package org.apache.httpcore.protocol;

import java.io.IOException;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpRequestInterceptor;
import org.apache.httpcore.params.CoreProtocolPNames;
import org.apache.httpcore.params.HttpParams;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class RequestUserAgent implements HttpRequestInterceptor {
    private final String userAgent;

    public RequestUserAgent(String str) {
        this.userAgent = str;
    }

    public RequestUserAgent() {
        this(null);
    }

    @Override // org.apache.httpcore.HttpRequestInterceptor
    public void process(HttpRequest httpRequest, HttpContext httpContext) throws IOException, HttpException {
        Args.notNull(httpRequest, "HTTP request");
        if (httpRequest.containsHeader("User-Agent")) {
            return;
        }
        HttpParams params = httpRequest.getParams();
        String str = params != null ? (String) params.getParameter(CoreProtocolPNames.USER_AGENT) : null;
        if (str == null) {
            str = this.userAgent;
        }
        if (str != null) {
            httpRequest.addHeader("User-Agent", str);
        }
    }
}
