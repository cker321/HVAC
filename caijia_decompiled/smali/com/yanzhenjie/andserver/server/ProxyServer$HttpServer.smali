.class Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;
.super Ljava/lang/Object;
.source "ProxyServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/server/ProxyServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HttpServer"
.end annotation


# instance fields
.field private final mHandler:Lorg/apache/httpcore/protocol/HttpRequestHandler;

.field private mHttpService:Lorg/apache/httpcore/protocol/HttpService;

.field private final mInetAddress:Ljava/net/InetAddress;

.field private final mPort:I

.field private final mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

.field private final mServerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private mServerSocket:Ljava/net/ServerSocket;

.field private final mSocketFactory:Ljavax/net/ServerSocketFactory;

.field private final mTimeout:I

.field private final mWorkerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final mWorkerSet:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mWorkerThreads:Ljava/lang/ThreadGroup;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;IILjavax/net/ServerSocketFactory;Lcom/yanzhenjie/andserver/SSLSocketInitializer;Lorg/apache/httpcore/protocol/HttpRequestHandler;)V
    .locals 11

    move-object v9, p0

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v7, Lcom/yanzhenjie/andserver/server/ProxyServer$ThreadFactoryImpl;

    const-string v0, "HTTP-Server-"

    invoke-direct {v7, v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$ThreadFactoryImpl;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v8, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 212
    new-instance v0, Ljava/lang/ThreadGroup;

    const-string v1, "HTTP-workers"

    invoke-direct {v0, v1}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    iput-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerThreads:Ljava/lang/ThreadGroup;

    .line 213
    new-instance v10, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer$1;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v7}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v8, Lcom/yanzhenjie/andserver/server/ProxyServer$ThreadFactoryImpl;

    iget-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerThreads:Ljava/lang/ThreadGroup;

    const-string v1, "HTTP-Handlers-"

    invoke-direct {v8, v1, v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$ThreadFactoryImpl;-><init>(Ljava/lang/String;Ljava/lang/ThreadGroup;)V

    const/4 v2, 0x0

    const v3, 0x7fffffff

    const-wide/16 v4, 0x1

    move-object v0, v10

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer$1;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v10, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 229
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerSet:Ljava/util/Map;

    move-object v0, p1

    .line 236
    iput-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mInetAddress:Ljava/net/InetAddress;

    move v0, p2

    .line 237
    iput v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mPort:I

    move v0, p3

    .line 238
    iput v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mTimeout:I

    move-object v0, p4

    .line 239
    iput-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    move-object/from16 v0, p5

    .line 240
    iput-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    move-object/from16 v0, p6

    .line 241
    iput-object v0, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mHandler:Lorg/apache/httpcore/protocol/HttpRequestHandler;

    .line 243
    new-instance v0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x4

    new-array v1, v1, [Lorg/apache/httpcore/HttpResponseInterceptor;

    new-instance v2, Lorg/apache/httpcore/protocol/ResponseDate;

    invoke-direct {v2}, Lorg/apache/httpcore/protocol/ResponseDate;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lorg/apache/httpcore/protocol/ResponseServer;

    sget-object v3, Lcom/yanzhenjie/andserver/AndServer;->INFO:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/apache/httpcore/protocol/ResponseServer;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lorg/apache/httpcore/protocol/ResponseContent;

    invoke-direct {v2}, Lorg/apache/httpcore/protocol/ResponseContent;-><init>()V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lorg/apache/httpcore/protocol/ResponseConnControl;

    invoke-direct {v2}, Lorg/apache/httpcore/protocol/ResponseConnControl;-><init>()V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/httpcore/HttpResponseInterceptor;)V

    .line 249
    new-instance v1, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;

    invoke-direct {v1}, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;-><init>()V

    .line 250
    iget-object v2, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mHandler:Lorg/apache/httpcore/protocol/HttpRequestHandler;

    const-string v3, "*"

    invoke-virtual {v1, v3, v2}, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->register(Ljava/lang/String;Lorg/apache/httpcore/protocol/HttpRequestHandler;)V

    .line 252
    new-instance v2, Lorg/apache/httpcore/protocol/HttpService;

    invoke-direct {v2, v0, v1}, Lorg/apache/httpcore/protocol/HttpService;-><init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;)V

    iput-object v2, v9, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mHttpService:Lorg/apache/httpcore/protocol/HttpService;

    return-void
.end method

.method static synthetic access$1100(Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;)Ljava/util/Map;
    .locals 0

    .line 201
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerSet:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 295
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 297
    iget v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mTimeout:I

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    const/4 v1, 0x1

    .line 298
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 299
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    const/16 v2, 0x2000

    .line 300
    invoke-virtual {v0, v2}, Ljava/net/Socket;->setReceiveBufferSize(I)V

    .line 301
    invoke-virtual {v0, v2}, Ljava/net/Socket;->setSendBufferSize(I)V

    const/4 v3, 0x0

    .line 302
    invoke-virtual {v0, v1, v3}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 304
    new-instance v1, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-direct {v1, v2}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;-><init>(I)V

    .line 305
    invoke-virtual {v1, v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->bind(Ljava/net/Socket;)V

    .line 307
    new-instance v0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    invoke-direct {v0, v2}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;-><init>(I)V

    .line 308
    new-instance v2, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;

    iget-object v3, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mHttpService:Lorg/apache/httpcore/protocol/HttpService;

    invoke-direct {v2, v3, v1, v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;-><init>(Lorg/apache/httpcore/protocol/HttpService;Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;)V

    .line 310
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    return-void
.end method

.method public startServer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ServerSocketFactory;->createServerSocket()Ljava/net/ServerSocket;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerSocket:Ljava/net/ServerSocket;

    const/4 v1, 0x1

    .line 257
    invoke-virtual {v0, v1}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 258
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerSocket:Ljava/net/ServerSocket;

    new-instance v1, Ljava/net/InetSocketAddress;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mInetAddress:Ljava/net/InetAddress;

    iget v3, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mPort:I

    invoke-direct {v1, v2, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    const/16 v2, 0x2000

    invoke-virtual {v0, v1, v2}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 259
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0, v2}, Ljava/net/ServerSocket;->setReceiveBufferSize(I)V

    .line 260
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerSocket:Ljava/net/ServerSocket;

    instance-of v2, v1, Ljavax/net/ssl/SSLServerSocket;

    if-eqz v2, :cond_0

    .line 261
    check-cast v1, Ljavax/net/ssl/SSLServerSocket;

    invoke-interface {v0, v1}, Lcom/yanzhenjie/andserver/SSLSocketInitializer;->onCreated(Ljavax/net/ssl/SSLServerSocket;)V

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public stopServer()V
    .locals 4

    .line 268
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 269
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 271
    :try_start_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    :catch_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerThreads:Ljava/lang/ThreadGroup;

    invoke-virtual {v0}, Ljava/lang/ThreadGroup;->interrupt()V

    .line 277
    :try_start_1
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v1, 0x3

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 279
    :catch_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 282
    :goto_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->mWorkerSet:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 283
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;

    .line 284
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->getServerConn()Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    move-result-object v1

    .line 286
    :try_start_2
    invoke-interface {v1}, Lorg/apache/httpcore/HttpServerConnection;->shutdown()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    :catch_2
    nop

    goto :goto_1

    :cond_0
    return-void
.end method
