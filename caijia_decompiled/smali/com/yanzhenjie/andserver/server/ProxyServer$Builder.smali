.class public Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;
.super Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
.source "ProxyServer.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/Server$ProxyBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/server/ProxyServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/yanzhenjie/andserver/server/BasicServer$Builder<",
        "Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;",
        "Lcom/yanzhenjie/andserver/server/ProxyServer;",
        ">;",
        "Lcom/yanzhenjie/andserver/Server$ProxyBuilder<",
        "Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;",
        "Lcom/yanzhenjie/andserver/server/ProxyServer;",
        ">;"
    }
.end annotation


# instance fields
.field private mHostList:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/httpcore/HttpHost;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 186
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;-><init>()V

    .line 184
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->mHostList:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;)Ljava/util/Map;
    .locals 0

    .line 181
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->mHostList:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic addProxy(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->addProxy(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addProxy(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->mHostList:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Lorg/apache/httpcore/HttpHost;->create(Ljava/lang/String;)Lorg/apache/httpcore/HttpHost;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public bridge synthetic build()Lcom/yanzhenjie/andserver/Server;
    .locals 1

    .line 181
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->build()Lcom/yanzhenjie/andserver/server/ProxyServer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/yanzhenjie/andserver/server/BasicServer;
    .locals 1

    .line 181
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->build()Lcom/yanzhenjie/andserver/server/ProxyServer;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/yanzhenjie/andserver/server/ProxyServer;
    .locals 2

    .line 197
    new-instance v0, Lcom/yanzhenjie/andserver/server/ProxyServer;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/server/ProxyServer;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;Lcom/yanzhenjie/andserver/server/ProxyServer$1;)V

    return-object v0
.end method

.method public bridge synthetic inetAddress(Ljava/net/InetAddress;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->inetAddress(Ljava/net/InetAddress;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method

.method public bridge synthetic listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method

.method public bridge synthetic port(I)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->port(I)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method

.method public bridge synthetic serverSocketFactory(Ljavax/net/ServerSocketFactory;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->serverSocketFactory(Ljavax/net/ServerSocketFactory;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method

.method public bridge synthetic sslContext(Ljavax/net/ssl/SSLContext;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->sslContext(Ljavax/net/ssl/SSLContext;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method

.method public bridge synthetic sslSocketInitializer(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->sslSocketInitializer(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method

.method public bridge synthetic timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .locals 0

    .line 181
    invoke-super {p0, p1, p2}, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/Server$ProxyBuilder;

    return-object p1
.end method
