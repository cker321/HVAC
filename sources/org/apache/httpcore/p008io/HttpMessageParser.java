package org.apache.httpcore.p008io;

import java.io.IOException;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpMessage;

/* loaded from: classes.dex */
public interface HttpMessageParser<T extends HttpMessage> {
    T parse() throws IOException, HttpException;
}
