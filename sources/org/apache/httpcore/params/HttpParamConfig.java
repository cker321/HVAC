package org.apache.httpcore.params;

import java.nio.charset.Charset;
import java.nio.charset.CodingErrorAction;
import org.apache.httpcore.config.ConnectionConfig;
import org.apache.httpcore.config.MessageConstraints;
import org.apache.httpcore.config.SocketConfig;

@Deprecated
/* loaded from: classes.dex */
public final class HttpParamConfig {
    private HttpParamConfig() {
    }

    public static SocketConfig getSocketConfig(HttpParams httpParams) {
        return SocketConfig.custom().setSoTimeout(httpParams.getIntParameter(CoreConnectionPNames.SO_TIMEOUT, 0)).setSoReuseAddress(httpParams.getBooleanParameter(CoreConnectionPNames.SO_REUSEADDR, false)).setSoKeepAlive(httpParams.getBooleanParameter(CoreConnectionPNames.SO_KEEPALIVE, false)).setSoLinger(httpParams.getIntParameter(CoreConnectionPNames.SO_LINGER, -1)).setTcpNoDelay(httpParams.getBooleanParameter(CoreConnectionPNames.TCP_NODELAY, true)).build();
    }

    public static MessageConstraints getMessageConstraints(HttpParams httpParams) {
        return MessageConstraints.custom().setMaxHeaderCount(httpParams.getIntParameter(CoreConnectionPNames.MAX_HEADER_COUNT, -1)).setMaxLineLength(httpParams.getIntParameter(CoreConnectionPNames.MAX_LINE_LENGTH, -1)).build();
    }

    public static ConnectionConfig getConnectionConfig(HttpParams httpParams) {
        MessageConstraints messageConstraints = getMessageConstraints(httpParams);
        String str = (String) httpParams.getParameter(CoreProtocolPNames.HTTP_ELEMENT_CHARSET);
        return ConnectionConfig.custom().setCharset(str != null ? Charset.forName(str) : null).setMalformedInputAction((CodingErrorAction) httpParams.getParameter(CoreProtocolPNames.HTTP_MALFORMED_INPUT_ACTION)).setMalformedInputAction((CodingErrorAction) httpParams.getParameter(CoreProtocolPNames.HTTP_UNMAPPABLE_INPUT_ACTION)).setMessageConstraints(messageConstraints).build();
    }
}
