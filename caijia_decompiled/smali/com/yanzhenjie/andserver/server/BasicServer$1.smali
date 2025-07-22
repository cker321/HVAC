.class Lcom/yanzhenjie/andserver/server/BasicServer$1;
.super Ljava/lang/Object;
.source "BasicServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/server/BasicServer;->startup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/server/BasicServer;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/server/BasicServer;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    invoke-static {}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->bootstrap()Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget-object v2, v2, Lcom/yanzhenjie/andserver/server/BasicServer;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    .line 84
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setServerSocketFactory(Ljavax/net/ServerSocketFactory;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    .line 86
    invoke-static {}, Lorg/apache/httpcore/config/SocketConfig;->custom()Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    const/4 v3, 0x1

    .line 87
    invoke-virtual {v2, v3}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoKeepAlive(Z)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    .line 88
    invoke-virtual {v2, v3}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoReuseAddress(Z)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    .line 89
    invoke-virtual {v2, v3}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setTcpNoDelay(Z)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    iget-object v4, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget v4, v4, Lcom/yanzhenjie/andserver/server/BasicServer;->mTimeout:I

    .line 90
    invoke-virtual {v2, v4}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoTimeout(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    const/16 v4, 0x2000

    .line 91
    invoke-virtual {v2, v4}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setBacklogSize(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    .line 92
    invoke-virtual {v2, v4}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setRcvBufSize(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    .line 93
    invoke-virtual {v2, v4}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSndBufSize(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    const/4 v4, 0x0

    .line 94
    invoke-virtual {v2, v4}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoLinger(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v2

    .line 95
    invoke-virtual {v2}, Lorg/apache/httpcore/config/SocketConfig$Builder;->build()Lorg/apache/httpcore/config/SocketConfig;

    move-result-object v2

    .line 85
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setSocketConfig(Lorg/apache/httpcore/config/SocketConfig;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget-object v2, v2, Lcom/yanzhenjie/andserver/server/BasicServer;->mInetAddress:Ljava/net/InetAddress;

    .line 97
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setLocalAddress(Ljava/net/InetAddress;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget v2, v2, Lcom/yanzhenjie/andserver/server/BasicServer;->mPort:I

    .line 98
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setListenerPort(I)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget-object v2, v2, Lcom/yanzhenjie/andserver/server/BasicServer;->mSSLContext:Ljavax/net/ssl/SSLContext;

    .line 99
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setSslContext(Ljavax/net/ssl/SSLContext;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    new-instance v2, Lcom/yanzhenjie/andserver/server/BasicServer$SSLSetup;

    iget-object v4, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget-object v4, v4, Lcom/yanzhenjie/andserver/server/BasicServer;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    invoke-direct {v2, v4}, Lcom/yanzhenjie/andserver/server/BasicServer$SSLSetup;-><init>(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)V

    .line 100
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setSslSetupHandler(Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    sget-object v2, Lcom/yanzhenjie/andserver/AndServer;->INFO:Ljava/lang/String;

    .line 101
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setServerInfo(Ljava/lang/String;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    const-string v2, "*"

    iget-object v4, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    .line 102
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/server/BasicServer;->requestHandler()Lorg/apache/httpcore/protocol/HttpRequestHandler;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->registerHandler(Ljava/lang/String;Lorg/apache/httpcore/protocol/HttpRequestHandler;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    sget-object v2, Lorg/apache/httpcore/ExceptionLogger;->NO_OP:Lorg/apache/httpcore/ExceptionLogger;

    .line 103
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->setExceptionLogger(Lorg/apache/httpcore/ExceptionLogger;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    move-result-object v1

    .line 104
    invoke-virtual {v1}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->create()Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    move-result-object v1

    .line 83
    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/server/BasicServer;->access$002(Lcom/yanzhenjie/andserver/server/BasicServer;Lorg/apache/httpcore/impl/bootstrap/HttpServer;)Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    .line 106
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/BasicServer;->access$000(Lcom/yanzhenjie/andserver/server/BasicServer;)Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/bootstrap/HttpServer;->start()V

    .line 107
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iput-boolean v3, v0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    .line 109
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/BasicServer$1$1;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/BasicServer$1$1;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer$1;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->post(Ljava/lang/Runnable;)V

    .line 117
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/BasicServer$1$2;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/BasicServer$1$2;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer$1;)V

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->addShutdownHook(Ljava/lang/Thread;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 124
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v1

    new-instance v2, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;

    invoke-direct {v2, p0, v0}, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer$1;Ljava/lang/Exception;)V

    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/util/Executors;->post(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
