.class Lcom/yanzhenjie/andserver/server/ProxyServer$1$2;
.super Ljava/lang/Thread;
.source "ProxyServer.java"


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

    .line 143
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1$2;->this$1:Lcom/yanzhenjie/andserver/server/ProxyServer$1;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$1$2;->this$1:Lcom/yanzhenjie/andserver/server/ProxyServer$1;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/ProxyServer$1;->this$0:Lcom/yanzhenjie/andserver/server/ProxyServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer;->access$300(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;->stopServer()V

    return-void
.end method
