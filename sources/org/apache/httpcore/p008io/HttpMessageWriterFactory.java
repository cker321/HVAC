package org.apache.httpcore.p008io;

import org.apache.httpcore.HttpMessage;

/* loaded from: classes.dex */
public interface HttpMessageWriterFactory<T extends HttpMessage> {
    HttpMessageWriter<T> create(SessionOutputBuffer sessionOutputBuffer);
}
