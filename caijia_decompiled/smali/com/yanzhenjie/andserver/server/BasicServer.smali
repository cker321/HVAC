.class public abstract Lcom/yanzhenjie/andserver/server/BasicServer;
.super Ljava/lang/Object;
.source "BasicServer.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/Server;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/server/BasicServer$Builder;,
        Lcom/yanzhenjie/andserver/server/BasicServer$SSLSetup;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/yanzhenjie/andserver/server/BasicServer$Builder;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/yanzhenjie/andserver/Server;"
    }
.end annotation


# static fields
.field static final BUFFER:I = 0x2000


# instance fields
.field protected isRunning:Z

.field private mHttpServer:Lorg/apache/httpcore/impl/bootstrap/HttpServer;

.field protected final mInetAddress:Ljava/net/InetAddress;

.field protected final mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

.field protected final mPort:I

.field protected final mSSLContext:Ljavax/net/ssl/SSLContext;

.field protected final mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

.field protected final mSocketFactory:Ljavax/net/ServerSocketFactory;

.field protected final mTimeout:I


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/server/BasicServer$Builder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->inetAddress:Ljava/net/InetAddress;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mInetAddress:Ljava/net/InetAddress;

    .line 60
    iget v0, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->port:I

    iput v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mPort:I

    .line 61
    iget v0, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->timeout:I

    iput v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mTimeout:I

    .line 62
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    .line 63
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->sslContext:Ljavax/net/ssl/SSLContext;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mSSLContext:Ljavax/net/ssl/SSLContext;

    .line 64
    iget-object v0, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    .line 65
    iget-object p1, p1, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->listener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mListener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    return-void
.end method

.method static synthetic access$000(Lcom/yanzhenjie/andserver/server/BasicServer;)Lorg/apache/httpcore/impl/bootstrap/HttpServer;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mHttpServer:Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    return-object p0
.end method

.method static synthetic access$002(Lcom/yanzhenjie/andserver/server/BasicServer;Lorg/apache/httpcore/impl/bootstrap/HttpServer;)Lorg/apache/httpcore/impl/bootstrap/HttpServer;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mHttpServer:Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    return-object p1
.end method


# virtual methods
.method public getInetAddress()Ljava/net/InetAddress;
    .locals 2

    .line 186
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mHttpServer:Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/bootstrap/HttpServer;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The server has not been started yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPort()I
    .locals 2

    .line 194
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->mHttpServer:Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/bootstrap/HttpServer;->getLocalPort()I

    move-result v0

    return v0

    .line 197
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The server has not been started yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isRunning()Z
    .locals 1

    .line 70
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    return v0
.end method

.method protected abstract requestHandler()Lorg/apache/httpcore/protocol/HttpRequestHandler;
.end method

.method public shutdown()V
    .locals 2

    .line 147
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    if-nez v0, :cond_0

    return-void

    .line 151
    :cond_0
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/BasicServer$2;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/BasicServer$2;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public startup()V
    .locals 2

    .line 75
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer;->isRunning:Z

    if-eqz v0, :cond_0

    return-void

    .line 79
    :cond_0
    invoke-static {}, Lcom/yanzhenjie/andserver/util/Executors;->getInstance()Lcom/yanzhenjie/andserver/util/Executors;

    move-result-object v0

    new-instance v1, Lcom/yanzhenjie/andserver/server/BasicServer$1;

    invoke-direct {v1, p0}, Lcom/yanzhenjie/andserver/server/BasicServer$1;-><init>(Lcom/yanzhenjie/andserver/server/BasicServer;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/util/Executors;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
