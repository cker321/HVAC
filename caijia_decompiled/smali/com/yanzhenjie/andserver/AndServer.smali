.class public Lcom/yanzhenjie/andserver/AndServer;
.super Ljava/lang/Object;
.source "AndServer.java"


# static fields
.field public static final INFO:Ljava/lang/String;

.field public static final TAG:Ljava/lang/String; = "AndServer"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "2.1.6"

    aput-object v2, v0, v1

    const-string v1, "AndServer/%1$s"

    .line 31
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/AndServer;->INFO:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static proxyServer()Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 1

    .line 63
    invoke-static {}, Lcom/yanzhenjie/andserver/server/ProxyServer;->newBuilder()Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static serverBuilder(Landroid/content/Context;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 72
    invoke-static {p0}, Lcom/yanzhenjie/andserver/AndServer;->webServer(Landroid/content/Context;)Lcom/yanzhenjie/andserver/Server$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static serverBuilder(Landroid/content/Context;Ljava/lang/String;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 81
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/AndServer;->webServer(Landroid/content/Context;Ljava/lang/String;)Lcom/yanzhenjie/andserver/Server$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static webServer(Landroid/content/Context;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 1

    const-string v0, "default"

    .line 40
    invoke-static {p0, v0}, Lcom/yanzhenjie/andserver/server/WebServer;->newBuilder(Landroid/content/Context;Ljava/lang/String;)Lcom/yanzhenjie/andserver/server/WebServer$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static webServer(Landroid/content/Context;Ljava/lang/String;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 53
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/server/WebServer;->newBuilder(Landroid/content/Context;Ljava/lang/String;)Lcom/yanzhenjie/andserver/server/WebServer$Builder;

    move-result-object p0

    return-object p0
.end method
