.class Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer$1;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "ProxyServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V
    .locals 9

    move-object v8, p0

    move-object v0, p1

    .line 214
    iput-object v0, v8, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    move-object v0, p0

    move v1, p2

    move v2, p3

    move-wide v3, p4

    move-object v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    return-void
.end method


# virtual methods
.method protected afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 224
    instance-of p2, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;

    if-eqz p2, :cond_0

    .line 225
    iget-object p2, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    invoke-static {p2}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->access$1100(Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;)Ljava/util/Map;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method protected beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    .locals 1

    .line 217
    instance-of p1, p2, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;

    if-eqz p1, :cond_0

    .line 218
    iget-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    invoke-static {p1}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->access$1100(Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;)Ljava/util/Map;

    move-result-object p1

    check-cast p2, Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
