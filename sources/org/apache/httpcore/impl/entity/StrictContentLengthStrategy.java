package org.apache.httpcore.impl.entity;

import org.apache.httpcore.Header;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpMessage;
import org.apache.httpcore.HttpVersion;
import org.apache.httpcore.ProtocolException;
import org.apache.httpcore.entity.ContentLengthStrategy;
import org.apache.httpcore.protocol.HTTP;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class StrictContentLengthStrategy implements ContentLengthStrategy {
    public static final StrictContentLengthStrategy INSTANCE = new StrictContentLengthStrategy();
    private final int implicitLen;

    public StrictContentLengthStrategy(int i) {
        this.implicitLen = i;
    }

    public StrictContentLengthStrategy() {
        this(-1);
    }

    @Override // org.apache.httpcore.entity.ContentLengthStrategy
    public long determineLength(HttpMessage httpMessage) throws NumberFormatException, HttpException {
        Args.notNull(httpMessage, "HTTP message");
        Header firstHeader = httpMessage.getFirstHeader("Transfer-Encoding");
        if (firstHeader != null) {
            String value = firstHeader.getValue();
            if (HTTP.CHUNK_CODING.equalsIgnoreCase(value)) {
                if (!httpMessage.getProtocolVersion().lessEquals(HttpVersion.HTTP_1_0)) {
                    return -2L;
                }
                throw new ProtocolException("Chunked transfer encoding not allowed for " + httpMessage.getProtocolVersion());
            }
            if (HTTP.IDENTITY_CODING.equalsIgnoreCase(value)) {
                return -1L;
            }
            throw new ProtocolException("Unsupported transfer encoding: " + value);
        }
        Header firstHeader2 = httpMessage.getFirstHeader("Content-Length");
        if (firstHeader2 != null) {
            String value2 = firstHeader2.getValue();
            try {
                long j = Long.parseLong(value2);
                if (j >= 0) {
                    return j;
                }
                throw new ProtocolException("Negative content length: " + value2);
            } catch (NumberFormatException unused) {
                throw new ProtocolException("Invalid content length: " + value2);
            }
        }
        return this.implicitLen;
    }
}
