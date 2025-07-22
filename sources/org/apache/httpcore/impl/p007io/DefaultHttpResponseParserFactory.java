package org.apache.httpcore.impl.p007io;

import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.HttpResponseFactory;
import org.apache.httpcore.config.MessageConstraints;
import org.apache.httpcore.impl.DefaultHttpResponseFactory;
import org.apache.httpcore.message.BasicLineParser;
import org.apache.httpcore.message.LineParser;
import org.apache.httpcore.p008io.HttpMessageParser;
import org.apache.httpcore.p008io.HttpMessageParserFactory;
import org.apache.httpcore.p008io.SessionInputBuffer;

/* loaded from: classes.dex */
public class DefaultHttpResponseParserFactory implements HttpMessageParserFactory<HttpResponse> {
    public static final DefaultHttpResponseParserFactory INSTANCE = new DefaultHttpResponseParserFactory();
    private final LineParser lineParser;
    private final HttpResponseFactory responseFactory;

    public DefaultHttpResponseParserFactory(LineParser lineParser, HttpResponseFactory httpResponseFactory) {
        this.lineParser = lineParser == null ? BasicLineParser.INSTANCE : lineParser;
        this.responseFactory = httpResponseFactory == null ? DefaultHttpResponseFactory.INSTANCE : httpResponseFactory;
    }

    public DefaultHttpResponseParserFactory() {
        this(null, null);
    }

    @Override // org.apache.httpcore.p008io.HttpMessageParserFactory
    public HttpMessageParser<HttpResponse> create(SessionInputBuffer sessionInputBuffer, MessageConstraints messageConstraints) {
        return new DefaultHttpResponseParser(sessionInputBuffer, this.lineParser, this.responseFactory, messageConstraints);
    }
}
