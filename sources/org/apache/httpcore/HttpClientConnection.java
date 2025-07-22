package org.apache.httpcore;

import java.io.IOException;

/* loaded from: classes.dex */
public interface HttpClientConnection extends HttpConnection {
    void flush() throws IOException;

    boolean isResponseAvailable(int i) throws IOException;

    void receiveResponseEntity(HttpResponse httpResponse) throws IOException, HttpException;

    HttpResponse receiveResponseHeader() throws IOException, HttpException;

    void sendRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws IOException, HttpException;

    void sendRequestHeader(HttpRequest httpRequest) throws IOException, HttpException;
}
