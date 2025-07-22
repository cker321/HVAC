.class interface abstract Lcom/yanzhenjie/andserver/http/session/Store;
.super Ljava/lang/Object;
.source "Store.java"


# virtual methods
.method public abstract getSession(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/session/StandardSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation
.end method

.method public abstract remove(Lcom/yanzhenjie/andserver/http/session/StandardSession;)Z
.end method

.method public abstract replace(Lcom/yanzhenjie/andserver/http/session/StandardSession;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
