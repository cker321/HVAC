package com.yanzhenjie.andserver;

import java.net.InetAddress;
import java.util.concurrent.TimeUnit;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;

/* loaded from: classes.dex */
public interface Server {

    public interface Builder<T extends Builder, S extends Server> {
        S build();

        T inetAddress(InetAddress inetAddress);

        T listener(ServerListener serverListener);

        T port(int i);

        T serverSocketFactory(ServerSocketFactory serverSocketFactory);

        T sslContext(SSLContext sSLContext);

        T sslSocketInitializer(SSLSocketInitializer sSLSocketInitializer);

        T timeout(int i, TimeUnit timeUnit);
    }

    public interface ProxyBuilder<T extends ProxyBuilder, S extends Server> {
        T addProxy(String str, String str2);

        S build();

        T inetAddress(InetAddress inetAddress);

        T listener(ServerListener serverListener);

        T port(int i);

        T serverSocketFactory(ServerSocketFactory serverSocketFactory);

        T sslContext(SSLContext sSLContext);

        T sslSocketInitializer(SSLSocketInitializer sSLSocketInitializer);

        T timeout(int i, TimeUnit timeUnit);
    }

    public interface ServerListener {
        void onException(Exception exc);

        void onStarted();

        void onStopped();
    }

    InetAddress getInetAddress();

    int getPort();

    boolean isRunning();

    void shutdown();

    void startup();
}
