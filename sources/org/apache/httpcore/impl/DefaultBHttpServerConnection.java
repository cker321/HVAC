package org.apache.httpcore.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.HttpEntityEnclosingRequest;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.HttpServerConnection;
import org.apache.httpcore.config.MessageConstraints;
import org.apache.httpcore.entity.ContentLengthStrategy;
import org.apache.httpcore.impl.entity.DisallowIdentityContentLengthStrategy;
import org.apache.httpcore.impl.p007io.DefaultHttpRequestParserFactory;
import org.apache.httpcore.impl.p007io.DefaultHttpResponseWriterFactory;
import org.apache.httpcore.p008io.HttpMessageParser;
import org.apache.httpcore.p008io.HttpMessageParserFactory;
import org.apache.httpcore.p008io.HttpMessageWriter;
import org.apache.httpcore.p008io.HttpMessageWriterFactory;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class DefaultBHttpServerConnection extends BHttpConnectionBase implements HttpServerConnection {
    private final HttpMessageParser<HttpRequest> requestParser;
    private final HttpMessageWriter<HttpResponse> responseWriter;

    protected void onRequestReceived(HttpRequest httpRequest) {
    }

    protected void onResponseSubmitted(HttpResponse httpResponse) {
    }

    public DefaultBHttpServerConnection(int i, int i2, CharsetDecoder charsetDecoder, CharsetEncoder charsetEncoder, MessageConstraints messageConstraints, ContentLengthStrategy contentLengthStrategy, ContentLengthStrategy contentLengthStrategy2, HttpMessageParserFactory<HttpRequest> httpMessageParserFactory, HttpMessageWriterFactory<HttpResponse> httpMessageWriterFactory) {
        super(i, i2, charsetDecoder, charsetEncoder, messageConstraints, contentLengthStrategy != null ? contentLengthStrategy : DisallowIdentityContentLengthStrategy.INSTANCE, contentLengthStrategy2);
        this.requestParser = (httpMessageParserFactory != null ? httpMessageParserFactory : DefaultHttpRequestParserFactory.INSTANCE).create(getSessionInputBuffer(), messageConstraints);
        this.responseWriter = (httpMessageWriterFactory != null ? httpMessageWriterFactory : DefaultHttpResponseWriterFactory.INSTANCE).create(getSessionOutputBuffer());
    }

    public DefaultBHttpServerConnection(int i, CharsetDecoder charsetDecoder, CharsetEncoder charsetEncoder, MessageConstraints messageConstraints) {
        this(i, i, charsetDecoder, charsetEncoder, messageConstraints, null, null, null, null);
    }

    public DefaultBHttpServerConnection(int i) {
        this(i, i, null, null, null, null, null, null, null);
    }

    @Override // org.apache.httpcore.impl.BHttpConnectionBase
    public void bind(Socket socket) throws IOException {
        super.bind(socket);
    }

    @Override // org.apache.httpcore.HttpServerConnection
    public HttpRequest receiveRequestHeader() throws IOException, HttpException {
        ensureOpen();
        HttpRequest httpRequest = (HttpRequest) this.requestParser.parse();
        onRequestReceived(httpRequest);
        incrementRequestCount();
        return httpRequest;
    }

    @Override // org.apache.httpcore.HttpServerConnection
    public void receiveRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws IOException, HttpException {
        Args.notNull(httpEntityEnclosingRequest, "HTTP request");
        ensureOpen();
        httpEntityEnclosingRequest.setEntity(prepareInput(httpEntityEnclosingRequest));
    }

    @Override // org.apache.httpcore.HttpServerConnection
    public void sendResponseHeader(HttpResponse httpResponse) throws IOException, HttpException {
        Args.notNull(httpResponse, "HTTP response");
        ensureOpen();
        this.responseWriter.write(httpResponse);
        onResponseSubmitted(httpResponse);
        if (httpResponse.getStatusLine().getStatusCode() >= 200) {
            incrementResponseCount();
        }
    }

    @Override // org.apache.httpcore.HttpServerConnection
    public void sendResponseEntity(HttpResponse httpResponse) throws IOException, HttpException {
        Args.notNull(httpResponse, "HTTP response");
        ensureOpen();
        HttpEntity entity = httpResponse.getEntity();
        if (entity == null) {
            return;
        }
        OutputStream outputStreamPrepareOutput = prepareOutput(httpResponse);
        entity.writeTo(outputStreamPrepareOutput);
        outputStreamPrepareOutput.close();
    }

    @Override // org.apache.httpcore.HttpServerConnection
    public void flush() throws IOException {
        ensureOpen();
        doFlush();
    }
}
