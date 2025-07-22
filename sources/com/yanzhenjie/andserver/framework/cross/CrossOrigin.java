package com.yanzhenjie.andserver.framework.cross;

import com.yanzhenjie.andserver.http.HttpMethod;

/* loaded from: classes.dex */
public class CrossOrigin {
    private boolean allowCredentials;
    private String[] allowedHeaders;
    private String[] exposedHeaders;
    private long maxAge;
    private HttpMethod[] methods;
    private String[] origins;

    public String[] getOrigins() {
        return this.origins;
    }

    public void setOrigins(String[] strArr) {
        this.origins = strArr;
    }

    public String[] getAllowedHeaders() {
        return this.allowedHeaders;
    }

    public void setAllowedHeaders(String[] strArr) {
        this.allowedHeaders = strArr;
    }

    public String[] getExposedHeaders() {
        return this.exposedHeaders;
    }

    public void setExposedHeaders(String[] strArr) {
        this.exposedHeaders = strArr;
    }

    public HttpMethod[] getMethods() {
        return this.methods;
    }

    public void setMethods(HttpMethod[] httpMethodArr) {
        this.methods = httpMethodArr;
    }

    public boolean isAllowCredentials() {
        return this.allowCredentials;
    }

    public void setAllowCredentials(boolean z) {
        this.allowCredentials = z;
    }

    public long getMaxAge() {
        return this.maxAge;
    }

    public void setMaxAge(long j) {
        this.maxAge = j;
    }
}
