package org.apache.httpcore.protocol;

import java.io.IOException;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.HttpResponseInterceptor;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class ResponseDate implements HttpResponseInterceptor {
    private static final HttpDateGenerator DATE_GENERATOR = new HttpDateGenerator();

    @Override // org.apache.httpcore.HttpResponseInterceptor
    public void process(HttpResponse httpResponse, HttpContext httpContext) throws IOException, HttpException {
        Args.notNull(httpResponse, "HTTP response");
        if (httpResponse.getStatusLine().getStatusCode() < 200 || httpResponse.containsHeader("Date")) {
            return;
        }
        httpResponse.setHeader("Date", DATE_GENERATOR.getCurrentDate());
    }
}
