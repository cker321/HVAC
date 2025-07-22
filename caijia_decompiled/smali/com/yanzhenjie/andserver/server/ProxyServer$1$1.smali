.class Lcom/yanzhenjie/andserver/server/ProxyServer$1$1;
.super Ljava/lang/Object;
.source "ProxyServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/server/ProxyServer$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/yanzhenjie/andserver/server/ProxyServer$1;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/server/ProxyServer$1;)V
    .locals 0

    .line 135
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1$1;->this$1:Lcom/yanzhenjie/andserver/server/ProxyServer$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1$1;->this$1:Lcom/yanzhenjie/andserver/server/ProxyServer$1;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$900(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/Server$ServerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1$1;->this$1:Lcom/yanzhenjie/andserver/server/ProxyServer$1;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$900(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/Server$ServerListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/Server$ServerListener;->onStarted()V

    :cond_0
    return-void
.end method
