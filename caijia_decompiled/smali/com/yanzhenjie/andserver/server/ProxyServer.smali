.class public Lcom/yanzhenjie/andserver/server/ProxyServer;
.super Lcom/yanzhenjie/andserver/server/BasicServer;
.source "ProxyServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/server/ProxyServer$ThreadFactoryImpl;,
        Lcom/yanzhenjie/andserver/server/ProxyServer$Worker;,
        Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;,
        Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/yanzhenjie/andserver/server/BasicServer<",
        "Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final PROXY_CONN_ALIVE:Ljava/lang/String; = "http.proxy.conn.alive"

.field public static final PROXY_CONN_CLIENT:Ljava/lang/String; = "http.proxy.conn.client"


# instance fields
.field private isRunning:Z

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

.field private mHttpServer:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

.field private final mInetAddress:Ljava/net/InetAddress;

.field private final mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

.field private final mPort:I

.field private final mSSLContext:Ljavax/net/ssl/SSLContext;

.field private final mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

.field private final mSocketFactory:Ljavax/net/ServerSocketFactory;

.field private final mTimeout:I


# direct methods
.method private constructor <init>(Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;)V
    .locals 1

    .line 90
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/server/BasicServer;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer$Builder;)V

    .line 91
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->inetAddress:Ljava/net/InetAddress;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mInetAddress:Ljava/net/InetAddress;

    .line 92
    iget v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->port:I

    iput v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mPort:I

    .line 93
    iget v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->timeout:I

    iput v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mTimeout:I

    .line 94
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    .line 95
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->sslContext:Ljavax/net/ssl/SSLContext;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mSSLContext:Ljavax/net/ssl/SSLContext;

    .line 96
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    .line 97
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->listener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    .line 99
    invoke-static {p1}, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;->access$000(Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mHostList:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;Lcom/yanzhenjie/andserver/server/ProxyServer$1;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/server/ProxyServer;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;)V

    return-void
.end method

.method static synthetic access$100(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljavax/net/ServerSocketFactory;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    return-object p0
.end method

.method static synthetic access$200(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljavax/net/ssl/SSLContext;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mSSLContext:Ljavax/net/ssl/SSLContext;

    return-object p0
.end method

.method static synthetic access$300(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mHttpServer:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    return-object p0
.end method

.method static synthetic access$302(Lcom/yanzhenjie/andserver/server/ProxyServer;Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;)Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mHttpServer:Lcom/yanzhenjie/andserver/server/ProxyServer$HttpServer;

    return-object p1
.end method

.method static synthetic access$400(Lcom/yanzhenjie/andserver/server/ProxyServer;)Ljava/net/InetAddress;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mInetAddress:Ljava/net/InetAddress;

    return-object p0
.end method

.method static synthetic access$500(Lcom/yanzhenjie/andserver/server/ProxyServer;)I
    .locals 0

    .line 67
    iget p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mPort:I

    return p0
.end method

.method static synthetic access$600(Lcom/yanzhenjie/andserver/server/ProxyServer;)I
    .locals 0

    .line 67
    iget p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mTimeout:I

    return p0
.end method

.method static synthetic access$700(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/SSLSocketInitializer;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    return-object p0
.end method

.method static synthetic access$802(Lcom/yanzhenjie/andserver/server/ProxyServer;Z)Z
    .locals 0

    .line 67
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->isRunning:Z

    return p1
.end method

.method static synthetic access$900(Lcom/yanzhenjie/andserver/server/ProxyServer;)Lcom/yanzhenjie/andserver/Server$ServerListener;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    return-object p0
.end method

.method public static newBuilder()Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;
    .locals 1

    .line 73
    new-instance v0, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/server/ProxyServer$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method protected requestHandler()Lorg/apache/httpcore/protocol/HttpRequestHandler;
    .locals 2

    .line 104
    new-instance v0, Lcom/yanzhenjie/andserver/ProxyHandler;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->mHostList:Ljava/util/Map;

    invoke-direct {v0, v1}, Lcom/yanzhenjie/andserver/ProxyHandler;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public shutdown()V
    .locals 2

    .line 158
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->isRunning:Z

    if-nez v0, :cond_0

    return-void

    .line 162
    :cond_0
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/ProxyServer$2;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$2;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public startup()V
    .locals 2

    .line 109
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/ProxyServer;->isRunning:Z

    if-eqz v0, :cond_0

    return-void

    .line 113
    :cond_0
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/ProxyServer$1;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/ProxyServer$1;-><init>(Lcom/yanzhenjie/andserver/server/ProxyServer;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
