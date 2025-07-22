package org.apache.httpcore;

import org.apache.httpcore.protocol.HttpContext;

/* loaded from: classes.dex */
public interface HttpResponseFactory {
    HttpResponse newHttpResponse(ProtocolVersion protocolVersion, int i, HttpContext httpContext);

    HttpResponse newHttpResponse(StatusLine statusLine, HttpContext httpContext);
}
