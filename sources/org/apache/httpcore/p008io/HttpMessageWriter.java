package org.apache.httpcore.p008io;

import java.io.IOException;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpMessage;

/* loaded from: classes.dex */
public interface HttpMessageWriter<T extends HttpMessage> {
    void write(T t) throws IOException, HttpException;
}
