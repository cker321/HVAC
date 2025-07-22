package org.apache.httpcore.impl.p007io;

import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.message.BasicLineFormatter;
import org.apache.httpcore.message.LineFormatter;
import org.apache.httpcore.p008io.HttpMessageWriter;
import org.apache.httpcore.p008io.HttpMessageWriterFactory;
import org.apache.httpcore.p008io.SessionOutputBuffer;

/* loaded from: classes.dex */
public class DefaultHttpRequestWriterFactory implements HttpMessageWriterFactory<HttpRequest> {
    public static final DefaultHttpRequestWriterFactory INSTANCE = new DefaultHttpRequestWriterFactory();
    private final LineFormatter lineFormatter;

    public DefaultHttpRequestWriterFactory(LineFormatter lineFormatter) {
        this.lineFormatter = lineFormatter == null ? BasicLineFormatter.INSTANCE : lineFormatter;
    }

    public DefaultHttpRequestWriterFactory() {
        this(null);
    }

    @Override // org.apache.httpcore.p008io.HttpMessageWriterFactory
    public HttpMessageWriter<HttpRequest> create(SessionOutputBuffer sessionOutputBuffer) {
        return new DefaultHttpRequestWriter(sessionOutputBuffer, this.lineFormatter);
    }
}
