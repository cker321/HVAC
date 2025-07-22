.class public interface abstract Lcom/yanzhenjie/andserver/http/session/SessionManager;
.super Ljava/lang/Object;
.source "SessionManager.java"


# virtual methods
.method public abstract add(Lcom/yanzhenjie/andserver/http/session/Session;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract changeSessionId(Lcom/yanzhenjie/andserver/http/session/Session;)V
.end method

.method public abstract createSession()Lcom/yanzhenjie/andserver/http/session/Session;
.end method

.method public abstract findSession(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/session/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation
.end method

.method public abstract remove(Lcom/yanzhenjie/andserver/http/session/Session;)V
.end method
