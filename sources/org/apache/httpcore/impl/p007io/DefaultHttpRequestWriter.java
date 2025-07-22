package org.apache.httpcore.impl.p007io;

import java.io.IOException;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.message.LineFormatter;
import org.apache.httpcore.p008io.SessionOutputBuffer;

/* loaded from: classes.dex */
public class DefaultHttpRequestWriter extends AbstractMessageWriter<HttpRequest> {
    public DefaultHttpRequestWriter(SessionOutputBuffer sessionOutputBuffer, LineFormatter lineFormatter) {
        super(sessionOutputBuffer, lineFormatter);
    }

    public DefaultHttpRequestWriter(SessionOutputBuffer sessionOutputBuffer) {
        this(sessionOutputBuffer, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.apache.httpcore.impl.p007io.AbstractMessageWriter
    public void writeHeadLine(HttpRequest httpRequest) throws IOException {
        this.lineFormatter.formatRequestLine(this.lineBuf, httpRequest.getRequestLine());
        this.sessionBuffer.writeLine(this.lineBuf);
    }
}
