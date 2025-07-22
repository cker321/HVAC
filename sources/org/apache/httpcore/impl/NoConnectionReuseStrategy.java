package org.apache.httpcore.impl;

import org.apache.httpcore.ConnectionReuseStrategy;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.protocol.HttpContext;

/* loaded from: classes.dex */
public class NoConnectionReuseStrategy implements ConnectionReuseStrategy {
    public static final NoConnectionReuseStrategy INSTANCE = new NoConnectionReuseStrategy();

    @Override // org.apache.httpcore.ConnectionReuseStrategy
    public boolean keepAlive(HttpResponse httpResponse, HttpContext httpContext) {
        return false;
    }
}
