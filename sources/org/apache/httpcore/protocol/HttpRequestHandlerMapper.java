package org.apache.httpcore.protocol;

import org.apache.httpcore.HttpRequest;

/* loaded from: classes.dex */
public interface HttpRequestHandlerMapper {
    HttpRequestHandler lookup(HttpRequest httpRequest);
}
