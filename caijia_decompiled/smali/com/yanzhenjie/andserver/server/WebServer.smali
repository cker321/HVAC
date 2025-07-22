.class public Lcom/yanzhenjie/andserver/server/WebServer;
.super Lcom/yanzhenjie/andserver/server/BasicServer;
.source "WebServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/server/WebServer$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/yanzhenjie/andserver/server/BasicServer<",
        "Lcom/yanzhenjie/andserver/server/WebServer$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mGroup:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/yanzhenjie/andserver/server/WebServer$Builder;)V
    .locals 1

    .line 39
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer$Builder;)V

    .line 40
    invoke-static {p1}, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->access$100(Lcom/yanzhenjie/andserver/server/WebServer$Builder;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/WebServer;->mContext:Landroid/content/Context;

    .line 41
    invoke-static {p1}, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->access$200(Lcom/yanzhenjie/andserver/server/WebServer$Builder;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/WebServer;->mGroup:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/yanzhenjie/andserver/server/WebServer$Builder;Lcom/yanzhenjie/andserver/server/WebServer$1;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/server/WebServer;-><init>(Lcom/yanzhenjie/andserver/server/WebServer$Builder;)V

    return-void
.end method

.method public static newBuilder(Landroid/content/Context;Ljava/lang/String;)Lcom/yanzhenjie/andserver/server/WebServer$Builder;
    .locals 2

    .line 32
    new-instance v0, Lcom/yanzhenjie/andserver/server/WebServer$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/yanzhenjie/andserver/server/WebServer$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/yanzhenjie/andserver/server/WebServer$1;)V

    return-object v0
.end method


# virtual methods
.method protected requestHandler()Lorg/apache/httpcore/protocol/HttpRequestHandler;
    .locals 3

    .line 46
    new-instance v0, Lcom/yanzhenjie/andserver/DispatcherHandler;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/WebServer;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/yanzhenjie/andserver/DispatcherHandler;-><init>(Landroid/content/Context;)V

    .line 47
    new-instance v1, Lcom/yanzhenjie/andserver/ComponentRegister;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/WebServer;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/yanzhenjie/andserver/ComponentRegister;-><init>(Landroid/content/Context;)V

    .line 48
    iget-object v2, p0, Lcom/yanzhenjie/andserver/server/WebServer;->mGroup:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/yanzhenjie/andserver/ComponentRegister;->register(Lcom/yanzhenjie/andserver/register/Register;Ljava/lang/String;)V

    return-object v0
.end method
