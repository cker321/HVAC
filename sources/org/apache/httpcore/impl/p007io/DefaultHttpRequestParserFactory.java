package org.apache.httpcore.impl.p007io;

import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpRequestFactory;
import org.apache.httpcore.config.MessageConstraints;
import org.apache.httpcore.impl.DefaultHttpRequestFactory;
import org.apache.httpcore.message.BasicLineParser;
import org.apache.httpcore.message.LineParser;
import org.apache.httpcore.p008io.HttpMessageParser;
import org.apache.httpcore.p008io.HttpMessageParserFactory;
import org.apache.httpcore.p008io.SessionInputBuffer;

/* loaded from: classes.dex */
public class DefaultHttpRequestParserFactory implements HttpMessageParserFactory<HttpRequest> {
    public static final DefaultHttpRequestParserFactory INSTANCE = new DefaultHttpRequestParserFactory();
    private final LineParser lineParser;
    private final HttpRequestFactory requestFactory;

    public DefaultHttpRequestParserFactory(LineParser lineParser, HttpRequestFactory httpRequestFactory) {
        this.lineParser = lineParser == null ? BasicLineParser.INSTANCE : lineParser;
        this.requestFactory = httpRequestFactory == null ? DefaultHttpRequestFactory.INSTANCE : httpRequestFactory;
    }

    public DefaultHttpRequestParserFactory() {
        this(null, null);
    }

    @Override // org.apache.httpcore.p008io.HttpMessageParserFactory
    public HttpMessageParser<HttpRequest> create(SessionInputBuffer sessionInputBuffer, MessageConstraints messageConstraints) {
        return new DefaultHttpRequestParser(sessionInputBuffer, this.lineParser, this.requestFactory, messageConstraints);
    }
}
