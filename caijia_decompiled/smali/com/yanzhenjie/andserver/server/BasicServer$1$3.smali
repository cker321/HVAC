.class Lcom/yanzhenjie/andserver/server/BasicServer$1$3;
.super Ljava/lang/Object;
.source "BasicServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/server/BasicServer$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/yanzhenjie/andserver/server/BasicServer$1;

.field final synthetic val$e:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/server/BasicServer$1;Ljava/lang/Exception;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;->this$1:Lcom/yanzhenjie/andserver/server/BasicServer$1;

    iput-object p2, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;->val$e:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;->this$1:Lcom/yanzhenjie/andserver/server/BasicServer$1;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/BasicServer;->mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;->this$1:Lcom/yanzhenjie/andserver/server/BasicServer$1;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/BasicServer$1;->this$0:Lcom/yanzhenjie/andserver/server/BasicServer;

    iget-object v0, v0, Lcom/yanzhenjie/andserver/server/BasicServer;->mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$1$3;->val$e:Ljava/lang/Exception;

    invoke-interface {v0, v1}, Lcom/yanzhenjie/andserver/Server$ServerListener;->onException(Ljava/lang/Exception;)V

    :cond_0
    return-void
.end method
