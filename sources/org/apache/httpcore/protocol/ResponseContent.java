package org.apache.httpcore.protocol;

import java.io.IOException;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.HttpResponseInterceptor;
import org.apache.httpcore.HttpVersion;
import org.apache.httpcore.ProtocolException;
import org.apache.httpcore.ProtocolVersion;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class ResponseContent implements HttpResponseInterceptor {
    private final boolean overwrite;

    public ResponseContent() {
        this(false);
    }

    public ResponseContent(boolean z) {
        this.overwrite = z;
    }

    @Override // org.apache.httpcore.HttpResponseInterceptor
    public void process(HttpResponse httpResponse, HttpContext httpContext) throws IOException, HttpException {
        Args.notNull(httpResponse, "HTTP response");
        if (this.overwrite) {
            httpResponse.removeHeaders("Transfer-Encoding");
            httpResponse.removeHeaders("Content-Length");
        } else {
            if (httpResponse.containsHeader("Transfer-Encoding")) {
                throw new ProtocolException("Transfer-encoding header already present");
            }
            if (httpResponse.containsHeader("Content-Length")) {
                throw new ProtocolException("Content-Length header already present");
            }
        }
        ProtocolVersion protocolVersion = httpResponse.getStatusLine().getProtocolVersion();
        HttpEntity entity = httpResponse.getEntity();
        if (entity != null) {
            long contentLength = entity.getContentLength();
            if (entity.isChunked() && !protocolVersion.lessEquals(HttpVersion.HTTP_1_0)) {
                httpResponse.addHeader("Transfer-Encoding", HTTP.CHUNK_CODING);
            } else if (contentLength >= 0) {
                httpResponse.addHeader("Content-Length", Long.toString(entity.getContentLength()));
            }
            if (entity.getContentType() != null && !httpResponse.containsHeader("Content-Type")) {
                httpResponse.addHeader(entity.getContentType());
            }
            if (entity.getContentEncoding() == null || httpResponse.containsHeader("Content-Encoding")) {
                return;
            }
            httpResponse.addHeader(entity.getContentEncoding());
            return;
        }
        int statusCode = httpResponse.getStatusLine().getStatusCode();
        if (statusCode == 204 || statusCode == 304 || statusCode == 205) {
            return;
        }
        httpResponse.addHeader("Content-Length", "0");
    }
}
