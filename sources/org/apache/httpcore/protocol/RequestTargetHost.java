package org.apache.httpcore.protocol;

import java.io.IOException;
import java.net.InetAddress;
import org.apache.httpcore.HttpConnection;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpHost;
import org.apache.httpcore.HttpInetConnection;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpRequestInterceptor;
import org.apache.httpcore.HttpVersion;
import org.apache.httpcore.ProtocolException;
import org.apache.httpcore.ProtocolVersion;
import org.apache.httpcore.util.Args;

/* loaded from: classes.dex */
public class RequestTargetHost implements HttpRequestInterceptor {
    @Override // org.apache.httpcore.HttpRequestInterceptor
    public void process(HttpRequest httpRequest, HttpContext httpContext) throws IOException, HttpException {
        Args.notNull(httpRequest, "HTTP request");
        HttpCoreContext httpCoreContextAdapt = HttpCoreContext.adapt(httpContext);
        ProtocolVersion protocolVersion = httpRequest.getRequestLine().getProtocolVersion();
        if ((httpRequest.getRequestLine().getMethod().equalsIgnoreCase("CONNECT") && protocolVersion.lessEquals(HttpVersion.HTTP_1_0)) || httpRequest.containsHeader("Host")) {
            return;
        }
        HttpHost targetHost = httpCoreContextAdapt.getTargetHost();
        if (targetHost == null) {
            HttpConnection connection = httpCoreContextAdapt.getConnection();
            if (connection instanceof HttpInetConnection) {
                HttpInetConnection httpInetConnection = (HttpInetConnection) connection;
                InetAddress remoteAddress = httpInetConnection.getRemoteAddress();
                int remotePort = httpInetConnection.getRemotePort();
                if (remoteAddress != null) {
                    targetHost = new HttpHost(remoteAddress.getHostName(), remotePort);
                }
            }
            if (targetHost == null) {
                if (!protocolVersion.lessEquals(HttpVersion.HTTP_1_0)) {
                    throw new ProtocolException("Target host missing");
                }
                return;
            }
        }
        httpRequest.addHeader("Host", targetHost.toHostString());
    }
}
