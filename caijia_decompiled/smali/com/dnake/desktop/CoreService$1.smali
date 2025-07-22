.class Lcom/dnake/desktop/CoreService$1;
.super Ljava/lang/Object;
.source "CoreService.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/Server$ServerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/CoreService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/CoreService;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/CoreService;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/dnake/desktop/CoreService$1;->this$0:Lcom/dnake/desktop/CoreService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onException(Ljava/lang/Exception;)V
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dnake/desktop/CoreService$1;->this$0:Lcom/dnake/desktop/CoreService;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/dnake/desktop/ServerManager;->onServerError(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public onStarted()V
    .locals 3

    .line 48
    invoke-static {}, Lcom/dnake/desktop/utils/NetUtils;->getLocalIPAddress()Ljava/net/InetAddress;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    iget-object v1, p0, Lcom/dnake/desktop/CoreService$1;->this$0:Lcom/dnake/desktop/CoreService;

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/dnake/desktop/ServerManager;->onServerStart(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 53
    :cond_0
    new-instance v0, Lcom/dnake/desktop/dnake/v700/dxml;

    invoke-direct {v0}, Lcom/dnake/desktop/dnake/v700/dxml;-><init>()V

    const-string v1, "/dnake/cfg/sys_lan.xml"

    .line 54
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/dnake/v700/dxml;->load(Ljava/lang/String;)Ljava/lang/Boolean;

    const-string v1, "/sys/lan/ip"

    const-string v2, ""

    .line 55
    invoke-virtual {v0, v1, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->getText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/dnake/desktop/CoreService$1;->this$0:Lcom/dnake/desktop/CoreService;

    invoke-static {v1, v0}, Lcom/dnake/desktop/ServerManager;->onServerStart(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public onStopped()V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/dnake/desktop/CoreService$1;->this$0:Lcom/dnake/desktop/CoreService;

    invoke-static {v0}, Lcom/dnake/desktop/ServerManager;->onServerStop(Landroid/content/Context;)V

    return-void
.end method
