package org.apache.httpcore;

/* loaded from: classes.dex */
public interface HttpEntityEnclosingRequest extends HttpRequest {
    boolean expectContinue();

    HttpEntity getEntity();

    void setEntity(HttpEntity httpEntity);
}
