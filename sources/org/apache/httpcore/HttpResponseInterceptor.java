package org.apache.httpcore;

import java.io.IOException;
import org.apache.httpcore.protocol.HttpContext;

/* loaded from: classes.dex */
public interface HttpResponseInterceptor {
    void process(HttpResponse httpResponse, HttpContext httpContext) throws IOException, HttpException;
}
