.class Lcom/yanzhenjie/andserver/server/BasicServer$2;
.super Ljava/lang/Object;
.source "BasicServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/server/BasicServer;->shutdown()V
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

    .line 151
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$2;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 154
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$2;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/BasicServer;->access$000(Lcom/yanzhenjie/andserver/server/BasicServer;)Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$2;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/server/BasicServer;->access$000(Lcom/yanzhenjie/andserver/server/BasicServer;)Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    move-result-object v0

    const-wide/16 v1, 0x3

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/httpcore/impl/bootstrap/HttpServer;->shutdown(JLjava/util/concurrent/TimeUnit;)V

    .line 156
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$2;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    .line 157
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/BasicServer$2$1;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/BasicServer$2$1;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer$2;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->post(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
