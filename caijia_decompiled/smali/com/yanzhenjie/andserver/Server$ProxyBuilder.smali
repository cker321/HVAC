.class public interface abstract Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ProxyBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/yanzhenjie/andserver/Server$ProxyBuilder;",
        "S::",
        "Lcom/yanzhenjie/andserver/Server;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract addProxy(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract build()Lcom/yanzhenjie/andserver/Server;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation
.end method

.method public abstract inetAddress(Ljava/net/InetAddress;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/InetAddress;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract listener(Lcom/yanzhenjie/andserver/Server$ServerListener;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/Server$ServerListener;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract port(I)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation
.end method

.method public abstract serverSocketFactory(Ljavax/net/ServerSocketFactory;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ServerSocketFactory;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract sslContext(Ljavax/net/ssl/SSLContext;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLContext;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract sslSocketInitializer(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/SSLSocketInitializer;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract timeout(ILjava/util/concurrent/TimeUnit;)Lcom/yanzhenjie/andserver/Server$ProxyBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation
.end method
