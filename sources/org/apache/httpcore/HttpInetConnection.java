package org.apache.httpcore;

import java.net.InetAddress;

/* loaded from: classes.dex */
public interface HttpInetConnection extends HttpConnection {
    InetAddress getLocalAddress();

    int getLocalPort();

    InetAddress getRemoteAddress();

    int getRemotePort();
}
