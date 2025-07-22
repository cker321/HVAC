package org.apache.httpcore.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import org.apache.httpcore.HttpClientConnection;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.HttpEntityEnclosingRequest;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.config.MessageConstraints;
import org.apache.httpcore.entity.ContentLengthStrategy;
import org.apache.httpcore.impl.p007io.DefaultHttpRequestWriterFactory;
import org.apache.httpcore.impl.p007io.DefaultHttpResponseParserFactory;
import org.apache.httpcore.p008io.HttpMessageParser;
import org.apache.httpcore.p008io.HttpMessageParserFactory;
import org.apache.httpcore.p008io.HttpMessageWriter;
import org.apache.httpcore.p008io.HttpMessageWriterFactory;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class DefaultBHttpClientConnection extends BHttpConnectionBase implements HttpClientConnection {
    private final HttpMessageWriter<HttpRequest> requestWriter;
    private final HttpMessageParser<HttpResponse> responseParser;

    protected void onRequestSubmitted(HttpRequest httpRequest) {
    }

    protected void onResponseReceived(HttpResponse httpResponse) {
    }

    public DefaultBHttpClientConnection(int i, int i2, CharsetDecoder charsetDecoder, CharsetEncoder charsetEncoder, MessageConstraints messageConstraints, ContentLengthStrategy contentLengthStrategy, ContentLengthStrategy contentLengthStrategy2, HttpMessageWriterFactory<HttpRequest> httpMessageWriterFactory, HttpMessageParserFactory<HttpResponse> httpMessageParserFactory) {
        super(i, i2, charsetDecoder, charsetEncoder, messageConstraints, contentLengthStrategy, contentLengthStrategy2);
        this.requestWriter = (httpMessageWriterFactory == null ? DefaultHttpRequestWriterFactory.INSTANCE : httpMessageWriterFactory).create(getSessionOutputBuffer());
        this.responseParser = (httpMessageParserFactory == null ? DefaultHttpResponseParserFactory.INSTANCE : httpMessageParserFactory).create(getSessionInputBuffer(), messageConstraints);
    }

    public DefaultBHttpClientConnection(int i, CharsetDecoder charsetDecoder, CharsetEncoder charsetEncoder, MessageConstraints messageConstraints) {
        this(i, i, charsetDecoder, charsetEncoder, messageConstraints, null, null, null, null);
    }

    public DefaultBHttpClientConnection(int i) {
        this(i, i, null, null, null, null, null, null, null);
    }

    @Override // org.apache.httpcore.impl.BHttpConnectionBase
    public void bind(Socket socket) throws IOException {
        super.bind(socket);
    }

    @Override // org.apache.httpcore.HttpClientConnection
    public boolean isResponseAvailable(int i) throws IOException {
        ensureOpen();
        try {
            return awaitInput(i);
        } catch (SocketTimeoutException unused) {
            return false;
        }
    }

    @Override // org.apache.httpcore.HttpClientConnection
    public void sendRequestHeader(HttpRequest httpRequest) throws IOException, HttpException {
        Args.notNull(httpRequest, "HTTP request");
        ensureOpen();
        this.requestWriter.write(httpRequest);
        onRequestSubmitted(httpRequest);
        incrementRequestCount();
    }

    @Override // org.apache.httpcore.HttpClientConnection
    public void sendRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws IOException, HttpException {
        Args.notNull(httpEntityEnclosingRequest, "HTTP request");
        ensureOpen();
        HttpEntity entity = httpEntityEnclosingRequest.getEntity();
        if (entity == null) {
            return;
        }
        OutputStream outputStreamPrepareOutput = prepareOutput(httpEntityEnclosingRequest);
        entity.writeTo(outputStreamPrepareOutput);
        outputStreamPrepareOutput.close();
    }

    @Override // org.apache.httpcore.HttpClientConnection
    public HttpResponse receiveResponseHeader() throws IOException, HttpException {
        ensureOpen();
        HttpResponse httpResponse = (HttpResponse) this.responseParser.parse();
        onResponseReceived(httpResponse);
        if (httpResponse.getStatusLine().getStatusCode() >= 200) {
            incrementResponseCount();
        }
        return httpResponse;
    }

    @Override // org.apache.httpcore.HttpClientConnection
    public void receiveResponseEntity(HttpResponse httpResponse) throws IOException, HttpException {
        Args.notNull(httpResponse, "HTTP response");
        ensureOpen();
        httpResponse.setEntity(prepareInput(httpResponse));
    }

    @Override // org.apache.httpcore.HttpClientConnection
    public void flush() throws IOException {
        ensureOpen();
        doFlush();
    }
}
