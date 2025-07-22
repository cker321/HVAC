.class public interface abstract Lcom/yanzhenjie/andserver/Server$ServerListener;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ServerListener"
.end annotation


# virtual methods
.method public abstract onException(Ljava/lang/Exception;)V
.end method

.method public abstract onStarted()V
.end method

.method public abstract onStopped()V
.end method
