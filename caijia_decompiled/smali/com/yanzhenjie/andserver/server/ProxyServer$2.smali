.class Lcom/yanzhenjie/andserver/server/ProxyServer$2;
.super Ljava/lang/Object;
.source "ProxyServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/server/ProxyServer;->shutdown()V
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

    .line 162
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$2;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$2;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$300(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$2;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$300(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->stopServer()V

    .line 167
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$2;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$802(Lcom/yanzhenjie/andserver/server/ProxyServer;Z)Z

    .line 168
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/ProxyServer$2$1;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$2$1;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer$2;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->post(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
