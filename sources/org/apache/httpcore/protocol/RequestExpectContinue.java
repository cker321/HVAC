package org.apache.httpcore.protocol;

import java.io.IOException;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.HttpEntityEnclosingRequest;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpRequestInterceptor;
import org.apache.httpcore.HttpVersion;
import org.apache.httpcore.ProtocolVersion;
import org.apache.httpcore.params.CoreProtocolPNames;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class RequestExpectContinue implements HttpRequestInterceptor {
    private final boolean activeByDefault;

    @Deprecated
    public RequestExpectContinue() {
        this(false);
    }

    public RequestExpectContinue(boolean z) {
        this.activeByDefault = z;
    }

    @Override // org.apache.httpcore.HttpRequestInterceptor
    public void process(HttpRequest httpRequest, HttpContext httpContext) throws IOException, HttpException {
        Args.notNull(httpRequest, "HTTP request");
        if (httpRequest.containsHeader("Expect") || !(httpRequest instanceof HttpEntityEnclosingRequest)) {
            return;
        }
        ProtocolVersion protocolVersion = httpRequest.getRequestLine().getProtocolVersion();
        HttpEntity entity = ((HttpEntityEnclosingRequest) httpRequest).getEntity();
        if (entity == null || entity.getContentLength() == 0 || protocolVersion.lessEquals(HttpVersion.HTTP_1_0) || !httpRequest.getParams().getBooleanParameter(CoreProtocolPNames.USE_EXPECT_CONTINUE, this.activeByDefault)) {
            return;
        }
        httpRequest.addHeader("Expect", HTTP.EXPECT_CONTINUE);
    }
}
