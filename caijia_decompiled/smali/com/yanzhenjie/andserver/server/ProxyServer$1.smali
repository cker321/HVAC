.class Lcom/yanzhenjie/andserver/server/ProxyServer$1;
.super Ljava/lang/Object;
.source "ProxyServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/server/ProxyServer;->startup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/server/ProxyServer;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 116
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$100(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljavax/net/ServerSocketFactory;

    move-result-object v0

    if-nez v0, :cond_1

    .line 118
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$200(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$200(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getServerSocketFactory()Ljavax/net/ssl/SSLServerSocketFactory;

    move-result-object v0

    goto :goto_0

    .line 121
    :cond_0
    invoke-static {}, Ljavax/net/ServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object v0

    :cond_1
    :goto_0
    move-object v5, v0

    .line 125
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    new-instance v8, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$400(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljava/net/InetAddress;

    move-result-object v2

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    .line 126
    invoke-static {v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$500(Lcom/yanzhenjie/andserver/server/ProxyServer;)I

    move-result v3

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    .line 127
    invoke-static {v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$600(Lcom/yanzhenjie/andserver/server/ProxyServer;)I

    move-result v4

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    .line 129
    invoke-static {v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$700(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    move-result-object v6

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    .line 130
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;->requestHandler()Lorg/apache/httpcore/protocol/HttpRequestHandler;

    move-result-object v7

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;-><init>(Ljava/net/InetAddress;IILjavax/net/ServerSocketFactory;Lcom/yanzhenjie/andserver/SSLSocketInitializer;Lorg/apache/httpcore/protocol/HttpRequestHandler;)V

    .line 125
    invoke-static {v0, v8}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$302(Lcom/yanzhenjie/andserver/server/ProxyServer;Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    .line 132
    :try_start_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$300(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->startServer()V

    .line 133
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$802(Lcom/yanzhenjie/andserver/server/ProxyServer;Z)Z

    .line 135
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/ProxyServer$1$1;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$1$1;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer$1;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->post(Ljava/lang/Runnable;)V

    .line 143
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/ProxyServer$1$2;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$1$2;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer$1;)V

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->addShutdownHook(Ljava/lang/Thread;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 150
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method
