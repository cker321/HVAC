.class public Lcom/yanzhenjie/andserver/server/WebServer$Builder;
.super Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
.source "WebServer.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/Server$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/server/WebServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/yanzhenjie/andserver/server/BasicServer$Builder<",
        "Lcom/yanzhenjie/andserver/server/WebServer$Builder;",
        "Lcom/yanzhenjie/andserver/server/WebServer;",
        ">;",
        "Lcom/yanzhenjie/andserver/Server$Builder<",
        "Lcom/yanzhenjie/andserver/server/WebServer$Builder;",
        "Lcom/yanzhenjie/andserver/server/WebServer;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private group:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 58
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->context:Landroid/content/Context;

    .line 60
    iput-object p2, p0, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->group:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/yanzhenjie/andserver/server/WebServer$1;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/yanzhenjie/andserver/server/WebServer$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/yanzhenjie/andserver/server/WebServer$Builder;)Landroid/content/Context;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/yanzhenjie/andserver/server/WebServer$Builder;)Ljava/lang/String;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->group:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic build()Lcom/yanzhenjie/andserver/Server;
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->build()Lcom/yanzhenjie/andserver/server/WebServer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/yanzhenjie/andserver/server/BasicServer;
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/server/WebServer$Builder;->build()Lcom/yanzhenjie/andserver/server/WebServer;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/yanzhenjie/andserver/server/WebServer;
    .locals 2

    .line 65
    new-instance v0, Lcom/yanzhenjie/andserver/server/WebServer;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/server/WebServer;-><init>(Lcom/yanzhenjie/andserver/server/WebServer$Builder;Lcom/yanzhenjie/andserver/server/WebServer$1;)V

    return-object v0
.end method

.method public bridge synthetic inetAddress(Ljava/net/InetAddress;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->inetAddress(Ljava/net/InetAddress;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method

.method public bridge synthetic listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method

.method public bridge synthetic port(I)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->port(I)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method

.method public bridge synthetic serverSocketFactory(Ljavax/net/ServerSocketFactory;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->serverSocketFactory(Ljavax/net/ServerSocketFactory;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method

.method public bridge synthetic sslContext(Ljavax/net/ssl/SSLContext;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->sslContext(Ljavax/net/ssl/SSLContext;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method

.method public bridge synthetic sslSocketInitializer(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->sslSocketInitializer(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method

.method public bridge synthetic timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/Server$Builder;
    .locals 0

    .line 52
    invoke-super {p0, p1, p2}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$Builder;

    return-object p1
.end method
