.class public interface abstract Lcom/yanzhenjie/andserver/http/session/Session;
.super Ljava/lang/Object;
.source "Session.java"


# virtual methods
.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getAttributeNames()Ljava/util/Enumeration;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCreatedTime()J
.end method

.method public abstract getId()Ljava/lang/String;
.end method

.method public abstract getLastAccessedTime()J
.end method

.method public abstract getMaxInactiveInterval()I
.end method

.method public abstract invalidate()V
.end method

.method public abstract isNew()Z
.end method

.method public abstract isValid()Z
.end method

.method public abstract removeAttribute(Ljava/lang/String;)V
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract setMaxInactiveInterval(I)V
.end method
