package com.yanzhenjie.andserver.framework;

import com.yanzhenjie.andserver.http.HttpRequest;

/* loaded from: classes.dex */
public interface LastModified {
    long getLastModified(HttpRequest httpRequest) throws Throwable;
}
