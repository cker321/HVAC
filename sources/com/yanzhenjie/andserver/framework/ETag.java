package com.yanzhenjie.andserver.framework;

import com.yanzhenjie.andserver.http.HttpRequest;

/* loaded from: classes.dex */
public interface ETag {
    String getETag(HttpRequest httpRequest) throws Throwable;
}
