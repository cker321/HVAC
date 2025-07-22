.class Lcom/yanzhenjie/andserver/DispatcherHandler$1;
.super Ljava/lang/Object;
.source "DispatcherHandler.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/RequestDispatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/DispatcherHandler;->getRequestDispatcher(Lcom/yanzhenjie/andserver/http/HttpRequest;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/DispatcherHandler;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/DispatcherHandler;)V
    .locals 0

    .line 252
    iput-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler$1;->this$0:Lcom/yanzhenjie/andserver/DispatcherHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public forward(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler$1;->this$0:Lcom/yanzhenjie/andserver/DispatcherHandler;

    invoke-static {v0, p1, p2}, Lcom/yanzhenjie/andserver/DispatcherHandler;->access$000(Lcom/yanzhenjie/andserver/DispatcherHandler;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    return-void
.end method
