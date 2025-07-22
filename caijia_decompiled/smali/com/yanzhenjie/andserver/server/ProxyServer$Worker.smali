.class Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;
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
    name = "Worker"
.end annotation


# instance fields
.field private final mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

.field private final mHttpService:Lorg/apache/httpcore/protocol/HttpService;

.field private final mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpService;Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;)V
    .locals 0

    .line 324
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mHttpService:Lorg/apache/httpcore/protocol/HttpService;

    .line 326
    iput-object p2, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    .line 327
    iput-object p3, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    return-void
.end method


# virtual methods
.method public getServerConn()Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;
    .locals 1

    .line 331
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    return-object v0
.end method

.method public run()V
    .locals 4

    .line 336
    new-instance v0, Lorg/apache/httpcore/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/BasicHttpContext;-><init>()V

    .line 337
    invoke-static {v0}, Lorg/apache/httpcore/protocol/HttpCoreContext;->adapt(Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/protocol/HttpCoreContext;

    move-result-object v0

    .line 338
    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    const-string v2, "http.proxy.conn.client"

    invoke-virtual {v0, v2, v1}, Lorg/apache/httpcore/protocol/HttpCoreContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 341
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 342
    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->isOpen()Z

    move-result v1

    if-nez v1, :cond_1

    .line 343
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->close()V

    goto :goto_0

    .line 347
    :cond_1
    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mHttpService:Lorg/apache/httpcore/protocol/HttpService;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v1, v2, v0}, Lorg/apache/httpcore/protocol/HttpService;->handleRequest(Lorg/apache/httpcore/HttpServerConnection;Lorg/apache/httpcore/protocol/HttpContext;)V

    const-string v1, "http.proxy.conn.alive"

    .line 349
    invoke-virtual {v0, v1}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 350
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 351
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->close()V

    .line 352
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->close()V
    :try_end_0
    .catch Lorg/apache/httpcore/ConnectionClosedException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/httpcore/HttpException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 364
    :cond_2
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->shutdown()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 368
    :catch_0
    :goto_1
    :try_start_2
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->shutdown()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    .line 361
    :try_start_3
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecoverable HTTP protocol violation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/apache/httpcore/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 364
    :try_start_4
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->shutdown()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    :catch_2
    move-exception v0

    .line 359
    :try_start_5
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "I/O error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 364
    :try_start_6
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->shutdown()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_1

    .line 357
    :catch_3
    :try_start_7
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Client closed connection."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 364
    :try_start_8
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->shutdown()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    goto :goto_1

    :catch_4
    :goto_2
    return-void

    :goto_3
    :try_start_9
    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mServerConn:Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->shutdown()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5

    .line 368
    :catch_5
    :try_start_a
    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;->mClientConn:Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->shutdown()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6

    .line 371
    :catch_6
    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method
