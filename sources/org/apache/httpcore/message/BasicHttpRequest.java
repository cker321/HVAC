package org.apache.httpcore.message;

import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpVersion;
import org.apache.httpcore.ProtocolVersion;
import org.apache.httpcore.RequestLine;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class BasicHttpRequest extends AbstractHttpMessage implements HttpRequest {
    private final String method;
    private RequestLine requestline;
    private final String uri;

    public BasicHttpRequest(String str, String str2) {
        this.method = (String) Args.notNull(str, "Method name");
        this.uri = (String) Args.notNull(str2, "Request URI");
        this.requestline = null;
    }

    public BasicHttpRequest(String str, String str2, ProtocolVersion protocolVersion) {
        this(new BasicRequestLine(str, str2, protocolVersion));
    }

    public BasicHttpRequest(RequestLine requestLine) {
        this.requestline = (RequestLine) Args.notNull(requestLine, "Request line");
        this.method = requestLine.getMethod();
        this.uri = requestLine.getUri();
    }

    @Override // org.apache.httpcore.HttpMessage
    public ProtocolVersion getProtocolVersion() {
        return getRequestLine().getProtocolVersion();
    }

    @Override // org.apache.httpcore.HttpRequest
    public RequestLine getRequestLine() {
        if (this.requestline == null) {
            this.requestline = new BasicRequestLine(this.method, this.uri, HttpVersion.HTTP_1_1);
        }
        return this.requestline;
    }

    public String toString() {
        return this.method + TokenParser.f302SP + this.uri + TokenParser.f302SP + this.headergroup;
    }
}
