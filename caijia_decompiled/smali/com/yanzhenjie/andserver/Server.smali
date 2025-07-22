.class public interface abstract Lcom/yanzhenjie/andserver/Server;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/Server$ServerListener;,
        Lcom/yanzhenjie/andserver/Server$ProxyBuilder;,
        Lcom/yanzhenjie/andserver/Server$Builder;
    }
.end annotation


# virtual methods
.method public abstract getInetAddress()Ljava/net/InetAddress;
.end method

.method public abstract getPort()I
.end method

.method public abstract isRunning()Z
.end method

.method public abstract shutdown()V
.end method

.method public abstract startup()V
.end method
