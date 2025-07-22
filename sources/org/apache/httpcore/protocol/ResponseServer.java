package org.apache.httpcore.protocol;

import java.io.IOException;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.HttpResponseInterceptor;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class ResponseServer implements HttpResponseInterceptor {
    private final String originServer;

    public ResponseServer(String str) {
        this.originServer = str;
    }

    public ResponseServer() {
        this(null);
    }

    @Override // org.apache.httpcore.HttpResponseInterceptor
    public void process(HttpResponse httpResponse, HttpContext httpContext) throws IOException, HttpException {
        String str;
        Args.notNull(httpResponse, "HTTP response");
        if (httpResponse.containsHeader("Server") || (str = this.originServer) == null) {
            return;
        }
        httpResponse.addHeader("Server", str);
    }
}
