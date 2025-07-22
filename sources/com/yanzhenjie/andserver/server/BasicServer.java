package com.yanzhenjie.andserver.server;

import com.yanzhenjie.andserver.AndServer;
import com.yanzhenjie.andserver.SSLSocketInitializer;
import com.yanzhenjie.andserver.Server;
import com.yanzhenjie.andserver.server.BasicServer.Builder;
import com.yanzhenjie.andserver.util.Executors;
import java.net.InetAddress;
import java.util.concurrent.TimeUnit;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLServerSocket;
import org.apache.httpcore.ExceptionLogger;
import org.apache.httpcore.config.SocketConfig;
import org.apache.httpcore.impl.bootstrap.HttpServer;
import org.apache.httpcore.impl.bootstrap.SSLServerSetupHandler;
import org.apache.httpcore.impl.bootstrap.ServerBootstrap;
import org.apache.httpcore.protocol.HttpRequestHandler;

/* loaded from: classes.dex */
public abstract class BasicServer<T extends Builder> implements Server {
    static final int BUFFER = 8192;
    protected boolean isRunning;
    private HttpServer mHttpServer;
    protected final InetAddress mInetAddress;
    protected final Server.ServerListener mListener;
    protected final int mPort;
    protected final SSLContext mSSLContext;
    protected final SSLSocketInitializer mSSLSocketInitializer;
    protected final ServerSocketFactory mSocketFactory;
    protected final int mTimeout;

    protected abstract HttpRequestHandler requestHandler();

    BasicServer(T t) {
        this.mInetAddress = t.inetAddress;
        this.mPort = t.port;
        this.mTimeout = t.timeout;
        this.mSocketFactory = t.mSocketFactory;
        this.mSSLContext = t.sslContext;
        this.mSSLSocketInitializer = t.mSSLSocketInitializer;
        this.mListener = t.listener;
    }

    @Override // com.yanzhenjie.andserver.Server
    public boolean isRunning() {
        return this.isRunning;
    }

    @Override // com.yanzhenjie.andserver.Server
    public void startup() {
        if (this.isRunning) {
            return;
        }
        Executors.getInstance().execute(new Runnable() { // from class: com.yanzhenjie.andserver.server.BasicServer.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    BasicServer.this.mHttpServer = ServerBootstrap.bootstrap().setServerSocketFactory(BasicServer.this.mSocketFactory).setSocketConfig(SocketConfig.custom().setSoKeepAlive(true).setSoReuseAddress(true).setTcpNoDelay(true).setSoTimeout(BasicServer.this.mTimeout).setBacklogSize(8192).setRcvBufSize(8192).setSndBufSize(8192).setSoLinger(0).build()).setLocalAddress(BasicServer.this.mInetAddress).setListenerPort(BasicServer.this.mPort).setSslContext(BasicServer.this.mSSLContext).setSslSetupHandler(new SSLSetup(BasicServer.this.mSSLSocketInitializer)).setServerInfo(AndServer.INFO).registerHandler("*", BasicServer.this.requestHandler()).setExceptionLogger(ExceptionLogger.NO_OP).create();
                    BasicServer.this.mHttpServer.start();
                    BasicServer.this.isRunning = true;
                    Executors.getInstance().post(new Runnable() { // from class: com.yanzhenjie.andserver.server.BasicServer.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (BasicServer.this.mListener != null) {
                                BasicServer.this.mListener.onStarted();
                            }
                        }
                    });
                    Runtime.getRuntime().addShutdownHook(new Thread() { // from class: com.yanzhenjie.andserver.server.BasicServer.1.2
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            BasicServer.this.mHttpServer.shutdown(3L, TimeUnit.SECONDS);
                        }
                    });
                } catch (Exception e) {
                    Executors.getInstance().post(new Runnable() { // from class: com.yanzhenjie.andserver.server.BasicServer.1.3
                        @Override // java.lang.Runnable
                        public void run() {
                            if (BasicServer.this.mListener != null) {
                                BasicServer.this.mListener.onException(e);
                            }
                        }
                    });
                }
            }
        });
    }

    @Override // com.yanzhenjie.andserver.Server
    public void shutdown() {
        if (this.isRunning) {
            Executors.getInstance().execute(new Runnable() { // from class: com.yanzhenjie.andserver.server.BasicServer.2
                @Override // java.lang.Runnable
                public void run() {
                    if (BasicServer.this.mHttpServer != null) {
                        BasicServer.this.mHttpServer.shutdown(3L, TimeUnit.SECONDS);
                        BasicServer.this.isRunning = false;
                        Executors.getInstance().post(new Runnable() { // from class: com.yanzhenjie.andserver.server.BasicServer.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (BasicServer.this.mListener != null) {
                                    BasicServer.this.mListener.onStopped();
                                }
                            }
                        });
                    }
                }
            });
        }
    }

    private static final class SSLSetup implements SSLServerSetupHandler {
        private final SSLSocketInitializer mInitializer;

        public SSLSetup(SSLSocketInitializer sSLSocketInitializer) {
            this.mInitializer = sSLSocketInitializer;
        }

        @Override // org.apache.httpcore.impl.bootstrap.SSLServerSetupHandler
        public void initialize(SSLServerSocket sSLServerSocket) throws SSLException {
            this.mInitializer.onCreated(sSLServerSocket);
        }
    }

    @Override // com.yanzhenjie.andserver.Server
    public InetAddress getInetAddress() {
        if (this.isRunning) {
            return this.mHttpServer.getInetAddress();
        }
        throw new IllegalStateException("The server has not been started yet.");
    }

    @Override // com.yanzhenjie.andserver.Server
    public int getPort() {
        if (this.isRunning) {
            return this.mHttpServer.getLocalPort();
        }
        throw new IllegalStateException("The server has not been started yet.");
    }

    protected static abstract class Builder<T extends Builder, S extends BasicServer> {
        InetAddress inetAddress;
        Server.ServerListener listener;
        SSLSocketInitializer mSSLSocketInitializer;
        ServerSocketFactory mSocketFactory;
        int port;
        SSLContext sslContext;
        int timeout;

        public abstract S build();

        Builder() {
        }

        public T inetAddress(InetAddress inetAddress) {
            this.inetAddress = inetAddress;
            return this;
        }

        public T port(int i) {
            this.port = i;
            return this;
        }

        public T timeout(int i, TimeUnit timeUnit) {
            this.timeout = (int) Math.min(timeUnit.toMillis(i), 2147483647L);
            return this;
        }

        public T serverSocketFactory(ServerSocketFactory serverSocketFactory) {
            this.mSocketFactory = serverSocketFactory;
            return this;
        }

        public T sslContext(SSLContext sSLContext) {
            this.sslContext = sSLContext;
            return this;
        }

        public T sslSocketInitializer(SSLSocketInitializer sSLSocketInitializer) {
            this.mSSLSocketInitializer = sSLSocketInitializer;
            return this;
        }

        public T listener(Server.ServerListener serverListener) {
            this.listener = serverListener;
            return this;
        }
    }
}
