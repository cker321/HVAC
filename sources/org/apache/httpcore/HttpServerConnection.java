package org.apache.httpcore;

import java.io.IOException;

/* loaded from: classes.dex */
public interface HttpServerConnection extends HttpConnection {
    void flush() throws IOException;

    void receiveRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws IOException, HttpException;

    HttpRequest receiveRequestHeader() throws IOException, HttpException;

    void sendResponseEntity(HttpResponse httpResponse) throws IOException, HttpException;

    void sendResponseHeader(HttpResponse httpResponse) throws IOException, HttpException;
}
