.class public abstract Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
.super Ljava/lang/Object;
.source "BasicServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/server/BasicServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/yanzhenjie/andserver/server/BasicServer$Builder;",
        "S:",
        "Lcom/yanzhenjie/andserver/server/BasicServer;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field inetAddress:Ljava/net/InetAddress;

.field listener:Lcom/yanzhenjie/andserver/Server$ServerListener;

.field mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

.field mSocketFactory:Ljavax/net/ServerSocketFactory;

.field port:I

.field sslContext:Ljavax/net/ssl/SSLContext;

.field timeout:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract build()Lcom/yanzhenjie/andserver/server/BasicServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation
.end method

.method public inetAddress(Ljava/net/InetAddress;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/InetAddress;",
            ")TT;"
        }
    .end annotation

    .line 214
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->inetAddress:Ljava/net/InetAddress;

    return-object p0
.end method

.method public listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/Server$ServerListener;",
            ")TT;"
        }
    .end annotation

    .line 245
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->listener:Lcom/yanzhenjie/andserver/Server$ServerListener;

    return-object p0
.end method

.method public port(I)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 219
    iput p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->port:I

    return-object p0
.end method

.method public serverSocketFactory(Ljavax/net/ServerSocketFactory;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ServerSocketFactory;",
            ")TT;"
        }
    .end annotation

    .line 230
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->mSocketFactory:Ljavax/net/ServerSocketFactory;

    return-object p0
.end method

.method public sslContext(Ljavax/net/ssl/SSLContext;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLContext;",
            ")TT;"
        }
    .end annotation

    .line 235
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->sslContext:Ljavax/net/ssl/SSLContext;

    return-object p0
.end method

.method public sslSocketInitializer(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/SSLSocketInitializer;",
            ")TT;"
        }
    .end annotation

    .line 240
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->mSSLSocketInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    return-object p0
.end method

.method public timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/server/BasicServer$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    int-to-long v0, p1

    .line 224
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    const-wide/32 v0, 0x7fffffff

    .line 225
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    long-to-int p2, p1

    iput p2, p0, Lcom/yanzhenjie/andserver/server/BasicServer$Builder;->timeout:I

    return-object p0
.end method
