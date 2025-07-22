.class public Lcom/dnake/desktop/ServerManager;
.super Landroid/content/BroadcastReceiver;
.source "ServerManager.java"


# static fields
.field private static final ACTION:Ljava/lang/String; = "com.yanzhenjie.andserver.receiver"

.field private static final CMD_KEY:Ljava/lang/String; = "CMD_KEY"

.field private static final CMD_VALUE_ERROR:I = 0x2

.field private static final CMD_VALUE_START:I = 0x1

.field private static final CMD_VALUE_STOP:I = 0x4

.field private static final MESSAGE_KEY:Ljava/lang/String; = "MESSAGE_KEY"


# instance fields
.field private mActivity:Lcom/dnake/desktop/MainActivity;

.field private mService:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/MainActivity;)V
    .locals 2

    .line 78
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    .line 80
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/dnake/desktop/CoreService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/dnake/desktop/ServerManager;->mService:Landroid/content/Intent;

    return-void
.end method

.method public static onServerError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x2

    .line 52
    invoke-static {p0, v0, p1}, Lcom/dnake/desktop/ServerManager;->sendBroadcast(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public static onServerStart(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 43
    invoke-static {p0, v0, p1}, Lcom/dnake/desktop/ServerManager;->sendBroadcast(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method public static onServerStop(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x4

    .line 61
    invoke-static {p0, v0}, Lcom/dnake/desktop/ServerManager;->sendBroadcast(Landroid/content/Context;I)V

    return-void
.end method

.method private static sendBroadcast(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-static {p0, p1, v0}, Lcom/dnake/desktop/ServerManager;->sendBroadcast(Landroid/content/Context;ILjava/lang/String;)V

    return-void
.end method

.method private static sendBroadcast(Landroid/content/Context;ILjava/lang/String;)V
    .locals 2

    .line 69
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.yanzhenjie.andserver.receiver"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "CMD_KEY"

    .line 70
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "MESSAGE_KEY"

    .line 71
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 108
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.yanzhenjie.andserver.receiver"

    .line 109
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x0

    const-string v0, "CMD_KEY"

    .line 110
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 v0, 0x1

    const-string v1, "MESSAGE_KEY"

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 p2, 0x4

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    iget-object p1, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    invoke-virtual {p1}, Lcom/dnake/desktop/MainActivity;->onServerStop()V

    goto :goto_0

    .line 118
    :cond_1
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 119
    iget-object p2, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    invoke-virtual {p2, p1}, Lcom/dnake/desktop/MainActivity;->onServerError(Ljava/lang/String;)V

    goto :goto_0

    .line 113
    :cond_2
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 114
    iget-object p2, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    invoke-virtual {p2, p1}, Lcom/dnake/desktop/MainActivity;->onServerStart(Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public register()V
    .locals 2

    .line 87
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.yanzhenjie.andserver.receiver"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 88
    iget-object v1, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    invoke-virtual {v1, p0, v0}, Lcom/dnake/desktop/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public startServer()V
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    iget-object v1, p0, Lcom/dnake/desktop/ServerManager;->mService:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public stopServer()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    iget-object v1, p0, Lcom/dnake/desktop/ServerManager;->mService:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/MainActivity;->stopService(Landroid/content/Intent;)Z

    return-void
.end method

.method public unRegister()V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/dnake/desktop/ServerManager;->mActivity:Lcom/dnake/desktop/MainActivity;

    invoke-virtual {v0, p0}, Lcom/dnake/desktop/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method
