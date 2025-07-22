package com.yanzhenjie.andserver.server;

import androidx.appcompat.widget.ActivityChooserView;
import com.yanzhenjie.andserver.AndServer;
import com.yanzhenjie.andserver.ProxyHandler;
import com.yanzhenjie.andserver.SSLSocketInitializer;
import com.yanzhenjie.andserver.Server;
import com.yanzhenjie.andserver.server.BasicServer;
import com.yanzhenjie.andserver.util.Executors;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLServerSocket;
import org.apache.httpcore.ConnectionClosedException;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpHost;
import org.apache.httpcore.impl.DefaultBHttpClientConnection;
import org.apache.httpcore.impl.DefaultBHttpServerConnection;
import org.apache.httpcore.protocol.BasicHttpContext;
import org.apache.httpcore.protocol.HttpCoreContext;
import org.apache.httpcore.protocol.HttpRequestHandler;
import org.apache.httpcore.protocol.HttpService;
import org.apache.httpcore.protocol.ImmutableHttpProcessor;
import org.apache.httpcore.protocol.ResponseConnControl;
import org.apache.httpcore.protocol.ResponseContent;
import org.apache.httpcore.protocol.ResponseDate;
import org.apache.httpcore.protocol.ResponseServer;
import org.apache.httpcore.protocol.UriHttpRequestHandlerMapper;

/* loaded from: classes.dex */
public class ProxyServer extends BasicServer<Builder> {
    public static final String PROXY_CONN_ALIVE = "http.proxy.conn.alive";
    public static final String PROXY_CONN_CLIENT = "http.proxy.conn.client";
    private boolean isRunning;
    private Map<String, HttpHost> mHostList;
    private HttpServer mHttpServer;
    private final InetAddress mInetAddress;
    private final Server.ServerListener mListener;
    private final int mPort;
    private final SSLContext mSSLContext;
    private final SSLSocketInitializer mSSLSocketInitializer;
    private final ServerSocketFactory mSocketFactory;
    private final int mTimeout;

    public static Builder newBuilder() {
        return new Builder();
    }

    private ProxyServer(Builder builder) {
        super(builder);
        this.mInetAddress = builder.inetAddress;
        this.mPort = builder.port;
        this.mTimeout = builder.timeout;
        this.mSocketFactory = builder.mSocketFactory;
        this.mSSLContext = builder.sslContext;
        this.mSSLSocketInitializer = builder.mSSLSocketInitializer;
        this.mListener = builder.listener;
        this.mHostList = builder.mHostList;
    }

    @Override // com.yanzhenjie.andserver.server.BasicServer
    protected HttpRequestHandler requestHandler() {
        return new ProxyHandler(this.mHostList);
    }

    @Override // com.yanzhenjie.andserver.server.BasicServer, com.yanzhenjie.andserver.Server
    public void startup() {
        if (this.isRunning) {
            return;
        }
        Executors.getInstance().execute(new Runnable() { // from class: com.yanzhenjie.andserver.server.ProxyServer.1
            @Override // java.lang.Runnable
            public void run() {
                ServerSocketFactory serverSocketFactory = ProxyServer.this.mSocketFactory;
                if (serverSocketFactory == null) {
                    serverSocketFactory = ProxyServer.this.mSSLContext != null ? ProxyServer.this.mSSLContext.getServerSocketFactory() : ServerSocketFactory.getDefault();
                }
                ServerSocketFactory serverSocketFactory2 = serverSocketFactory;
                ProxyServer proxyServer = ProxyServer.this;
                proxyServer.mHttpServer = new HttpServer(proxyServer.mInetAddress, ProxyServer.this.mPort, ProxyServer.this.mTimeout, serverSocketFactory2, ProxyServer.this.mSSLSocketInitializer, ProxyServer.this.requestHandler());
                try {
                    ProxyServer.this.mHttpServer.startServer();
                    ProxyServer.this.isRunning = true;
                    Executors.getInstance().post(new Runnable() { // from class: com.yanzhenjie.andserver.server.ProxyServer.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (ProxyServer.this.mListener != null) {
                                ProxyServer.this.mListener.onStarted();
                            }
                        }
                    });
                    Runtime.getRuntime().addShutdownHook(new Thread() { // from class: com.yanzhenjie.andserver.server.ProxyServer.1.2
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() throws InterruptedException, IOException {
                            ProxyServer.this.mHttpServer.stopServer();
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    @Override // com.yanzhenjie.andserver.server.BasicServer, com.yanzhenjie.andserver.Server
    public void shutdown() {
        if (this.isRunning) {
            Executors.getInstance().execute(new Runnable() { // from class: com.yanzhenjie.andserver.server.ProxyServer.2
                @Override // java.lang.Runnable
                public void run() throws InterruptedException, IOException {
                    if (ProxyServer.this.mHttpServer != null) {
                        ProxyServer.this.mHttpServer.stopServer();
                        ProxyServer.this.isRunning = false;
                        Executors.getInstance().post(new Runnable() { // from class: com.yanzhenjie.andserver.server.ProxyServer.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (ProxyServer.this.mListener != null) {
                                    ProxyServer.this.mListener.onStopped();
                                }
                            }
                        });
                    }
                }
            });
        }
    }

    public static class Builder extends BasicServer.Builder<Builder, ProxyServer> implements Server.ProxyBuilder<Builder, ProxyServer> {
        private Map<String, HttpHost> mHostList = new HashMap();

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder inetAddress(InetAddress inetAddress) {
            return (Server.ProxyBuilder) super.inetAddress(inetAddress);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder listener(Server.ServerListener serverListener) {
            return (Server.ProxyBuilder) super.listener(serverListener);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder port(int i) {
            return (Server.ProxyBuilder) super.port(i);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder serverSocketFactory(ServerSocketFactory serverSocketFactory) {
            return (Server.ProxyBuilder) super.serverSocketFactory(serverSocketFactory);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder sslContext(SSLContext sSLContext) {
            return (Server.ProxyBuilder) super.sslContext(sSLContext);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder sslSocketInitializer(SSLSocketInitializer sSLSocketInitializer) {
            return (Server.ProxyBuilder) super.sslSocketInitializer(sSLSocketInitializer);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public /* bridge */ /* synthetic */ Server.ProxyBuilder timeout(int i, TimeUnit timeUnit) {
            return (Server.ProxyBuilder) super.timeout(i, timeUnit);
        }

        @Override // com.yanzhenjie.andserver.Server.ProxyBuilder
        public Builder addProxy(String str, String str2) {
            this.mHostList.put(str.toLowerCase(Locale.ROOT), HttpHost.create(str2));
            return this;
        }

        @Override // com.yanzhenjie.andserver.server.BasicServer.Builder, com.yanzhenjie.andserver.Server.ProxyBuilder
        public ProxyServer build() {
            return new ProxyServer(this);
        }
    }

    private static class HttpServer implements Runnable {
        private final HttpRequestHandler mHandler;
        private HttpService mHttpService;
        private final InetAddress mInetAddress;
        private final int mPort;
        private final SSLSocketInitializer mSSLSocketInitializer;
        private ServerSocket mServerSocket;
        private final ServerSocketFactory mSocketFactory;
        private final int mTimeout;
        private final ThreadPoolExecutor mServerExecutor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new SynchronousQueue(), new ThreadFactoryImpl("HTTP-Server-"));
        private final ThreadGroup mWorkerThreads = new ThreadGroup("HTTP-workers");
        private final ThreadPoolExecutor mWorkerExecutor = new ThreadPoolExecutor(0, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED, 1, TimeUnit.SECONDS, new SynchronousQueue(), new ThreadFactoryImpl("HTTP-Handlers-", this.mWorkerThreads)) { // from class: com.yanzhenjie.andserver.server.ProxyServer.HttpServer.1
            @Override // java.util.concurrent.ThreadPoolExecutor
            protected void beforeExecute(Thread thread, Runnable runnable) {
                if (runnable instanceof Worker) {
                    HttpServer.this.mWorkerSet.put((Worker) runnable, Boolean.TRUE);
                }
            }

            @Override // java.util.concurrent.ThreadPoolExecutor
            protected void afterExecute(Runnable runnable, Throwable th) {
                if (runnable instanceof Worker) {
                    HttpServer.this.mWorkerSet.remove(runnable);
                }
            }
        };
        private final Map<Worker, Boolean> mWorkerSet = new ConcurrentHashMap();

        public HttpServer(InetAddress inetAddress, int i, int i2, ServerSocketFactory serverSocketFactory, SSLSocketInitializer sSLSocketInitializer, HttpRequestHandler httpRequestHandler) {
            this.mInetAddress = inetAddress;
            this.mPort = i;
            this.mTimeout = i2;
            this.mSocketFactory = serverSocketFactory;
            this.mSSLSocketInitializer = sSLSocketInitializer;
            this.mHandler = httpRequestHandler;
            ImmutableHttpProcessor immutableHttpProcessor = new ImmutableHttpProcessor(new ResponseDate(), new ResponseServer(AndServer.INFO), new ResponseContent(), new ResponseConnControl());
            UriHttpRequestHandlerMapper uriHttpRequestHandlerMapper = new UriHttpRequestHandlerMapper();
            uriHttpRequestHandlerMapper.register("*", this.mHandler);
            this.mHttpService = new HttpService(immutableHttpProcessor, uriHttpRequestHandlerMapper);
        }

        public void startServer() throws IOException {
            ServerSocket serverSocketCreateServerSocket = this.mSocketFactory.createServerSocket();
            this.mServerSocket = serverSocketCreateServerSocket;
            serverSocketCreateServerSocket.setReuseAddress(true);
            this.mServerSocket.bind(new InetSocketAddress(this.mInetAddress, this.mPort), 8192);
            this.mServerSocket.setReceiveBufferSize(8192);
            SSLSocketInitializer sSLSocketInitializer = this.mSSLSocketInitializer;
            if (sSLSocketInitializer != null) {
                ServerSocket serverSocket = this.mServerSocket;
                if (serverSocket instanceof SSLServerSocket) {
                    sSLSocketInitializer.onCreated((SSLServerSocket) serverSocket);
                }
            }
            this.mServerExecutor.execute(this);
        }

        public void stopServer() throws InterruptedException, IOException {
            this.mServerExecutor.shutdown();
            this.mWorkerExecutor.shutdown();
            try {
                this.mServerSocket.close();
            } catch (IOException unused) {
            }
            this.mWorkerThreads.interrupt();
            try {
                this.mWorkerExecutor.awaitTermination(3L, TimeUnit.SECONDS);
            } catch (InterruptedException unused2) {
                Thread.currentThread().interrupt();
            }
            Iterator<Worker> it = this.mWorkerSet.keySet().iterator();
            while (it.hasNext()) {
                try {
                    it.next().getServerConn().shutdown();
                } catch (IOException unused3) {
                }
            }
        }

        @Override // java.lang.Runnable
        public void run() throws IOException {
            while (!Thread.interrupted()) {
                try {
                    Socket socketAccept = this.mServerSocket.accept();
                    socketAccept.setSoTimeout(this.mTimeout);
                    socketAccept.setKeepAlive(true);
                    socketAccept.setTcpNoDelay(true);
                    socketAccept.setReceiveBufferSize(8192);
                    socketAccept.setSendBufferSize(8192);
                    socketAccept.setSoLinger(true, 0);
                    DefaultBHttpServerConnection defaultBHttpServerConnection = new DefaultBHttpServerConnection(8192);
                    defaultBHttpServerConnection.bind(socketAccept);
                    this.mWorkerExecutor.execute(new Worker(this.mHttpService, defaultBHttpServerConnection, new DefaultBHttpClientConnection(8192)));
                } catch (Exception unused) {
                    return;
                }
            }
        }
    }

    private static class Worker implements Runnable {
        private final DefaultBHttpClientConnection mClientConn;
        private final HttpService mHttpService;
        private final DefaultBHttpServerConnection mServerConn;

        public Worker(HttpService httpService, DefaultBHttpServerConnection defaultBHttpServerConnection, DefaultBHttpClientConnection defaultBHttpClientConnection) {
            this.mHttpService = httpService;
            this.mServerConn = defaultBHttpServerConnection;
            this.mClientConn = defaultBHttpClientConnection;
        }

        public DefaultBHttpServerConnection getServerConn() {
            return this.mServerConn;
        }

        @Override // java.lang.Runnable
        public void run() {
            HttpCoreContext httpCoreContextAdapt = HttpCoreContext.adapt(new BasicHttpContext());
            httpCoreContextAdapt.setAttribute(ProxyServer.PROXY_CONN_CLIENT, this.mClientConn);
            while (true) {
                try {
                    try {
                        try {
                            try {
                                try {
                                    if (Thread.interrupted()) {
                                        break;
                                    }
                                    if (!this.mServerConn.isOpen()) {
                                        this.mClientConn.close();
                                        break;
                                    }
                                    this.mHttpService.handleRequest(this.mServerConn, httpCoreContextAdapt);
                                    if (!Boolean.TRUE.equals((Boolean) httpCoreContextAdapt.getAttribute(ProxyServer.PROXY_CONN_ALIVE))) {
                                        this.mClientConn.close();
                                        this.mServerConn.close();
                                        break;
                                    }
                                } catch (ConnectionClosedException unused) {
                                    System.err.println("Client closed connection.");
                                    this.mServerConn.shutdown();
                                }
                            } catch (IOException e) {
                                System.err.println("I/O error: " + e.getMessage());
                                this.mServerConn.shutdown();
                            }
                        } catch (HttpException e2) {
                            System.err.println("Unrecoverable HTTP protocol violation: " + e2.getMessage());
                            this.mServerConn.shutdown();
                        }
                    } catch (IOException unused2) {
                    }
                } catch (Throwable th) {
                    try {
                        this.mServerConn.shutdown();
                    } catch (IOException unused3) {
                    }
                    try {
                        this.mClientConn.shutdown();
                    } catch (IOException unused4) {
                    }
                    throw th;
                }
            }
            this.mServerConn.shutdown();
            try {
                this.mClientConn.shutdown();
            } catch (IOException unused5) {
            }
        }
    }

    private static class ThreadFactoryImpl implements ThreadFactory {
        private final AtomicLong mCount;
        private final ThreadGroup mGroup;
        private final String mPrefix;

        ThreadFactoryImpl(String str, ThreadGroup threadGroup) {
            this.mPrefix = str;
            this.mGroup = threadGroup;
            this.mCount = new AtomicLong();
        }

        ThreadFactoryImpl(String str) {
            this(str, null);
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable runnable) {
            return new Thread(this.mGroup, runnable, this.mPrefix + "-" + this.mCount.incrementAndGet());
        }
    }
}
