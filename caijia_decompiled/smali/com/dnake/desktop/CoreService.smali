.class public Lcom/dnake/desktop/CoreService;
.super Landroid/app/Service;
.source "CoreService.java"


# instance fields
.field private mServer:Lcom/yanzhenjie/andserver/Server;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method private startServer()V
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/dnake/desktop/CoreService;->mServer:Lcom/yanzhenjie/andserver/Server;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/Server;->startup()V

    return-void
.end method

.method private stopServer()V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/dnake/desktop/CoreService;->mServer:Lcom/yanzhenjie/andserver/Server;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/Server;->shutdown()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 3

    .line 42
    invoke-static {p0}, Lcom/yanzhenjie/andserver/AndServer;->webServer(Landroid/content/Context;)Lcom/yanzhenjie/andserver/Server$Builder;

    move-result-object v0

    const/16 v1, 0x22b8

    .line 43
    invoke-interface {v0, v1}, Lcom/yanzhenjie/andserver/Server$Builder;->port(I)Lcom/yanzhenjie/andserver/Server$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v2, 0xa

    .line 44
    invoke-interface {v0, v2, v1}, Lcom/yanzhenjie/andserver/Server$Builder;->timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/Server$Builder;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/CoreService$1;

    invoke-direct {v1, p0}, Lcom/dnake/desktop/CoreService$1;-><init>(Lcom/dnake/desktop/CoreService;)V

    .line 45
    invoke-interface {v0, v1}, Lcom/yanzhenjie/andserver/Server$Builder;->listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/Server$Builder;

    move-result-object v0

    .line 69
    invoke-interface {v0}, Lcom/yanzhenjie/andserver/Server$Builder;->build()Lcom/yanzhenjie/andserver/Server;

    move-result-object v0

    iput-object v0, p0, Lcom/dnake/desktop/CoreService;->mServer:Lcom/yanzhenjie/andserver/Server;

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 80
    invoke-direct {p0}, Lcom/dnake/desktop/CoreService;->stopServer()V

    .line 81
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 74
    invoke-direct {p0}, Lcom/dnake/desktop/CoreService;->startServer()V

    const/4 p1, 0x1

    return p1
.end method
