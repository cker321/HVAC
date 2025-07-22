package org.apache.httpcore;

import org.apache.httpcore.protocol.HttpContext;

/* loaded from: classes.dex */
public interface ConnectionReuseStrategy {
    boolean keepAlive(HttpResponse httpResponse, HttpContext httpContext);
}
