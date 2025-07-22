package org.apache.httpcore;

import java.io.IOException;
import org.apache.httpcore.protocol.HttpContext;

/* loaded from: classes.dex */
public interface HttpRequestInterceptor {
    void process(HttpRequest httpRequest, HttpContext httpContext) throws IOException, HttpException;
}
