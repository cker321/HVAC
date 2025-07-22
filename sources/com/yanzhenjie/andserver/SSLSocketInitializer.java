package com.yanzhenjie.andserver;

import javax.net.ssl.SSLException;
import javax.net.ssl.SSLServerSocket;

/* loaded from: classes.dex */
public interface SSLSocketInitializer {
    void onCreated(SSLServerSocket sSLServerSocket) throws SSLException;
}
