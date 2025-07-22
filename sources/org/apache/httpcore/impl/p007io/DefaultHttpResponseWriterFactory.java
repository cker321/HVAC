package org.apache.httpcore.impl.p007io;

import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.message.BasicLineFormatter;
import org.apache.httpcore.message.LineFormatter;
import org.apache.httpcore.p008io.HttpMessageWriter;
import org.apache.httpcore.p008io.HttpMessageWriterFactory;
import org.apache.httpcore.p008io.SessionOutputBuffer;

/* loaded from: classes.dex */
public class DefaultHttpResponseWriterFactory implements HttpMessageWriterFactory<HttpResponse> {
    public static final DefaultHttpResponseWriterFactory INSTANCE = new DefaultHttpResponseWriterFactory();
    private final LineFormatter lineFormatter;

    public DefaultHttpResponseWriterFactory(LineFormatter lineFormatter) {
        this.lineFormatter = lineFormatter == null ? BasicLineFormatter.INSTANCE : lineFormatter;
    }

    public DefaultHttpResponseWriterFactory() {
        this(null);
    }

    @Override // org.apache.httpcore.p008io.HttpMessageWriterFactory
    public HttpMessageWriter<HttpResponse> create(SessionOutputBuffer sessionOutputBuffer) {
        return new DefaultHttpResponseWriter(sessionOutputBuffer, this.lineFormatter);
    }
}
