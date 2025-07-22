.class public interface abstract Lcom/yanzhenjie/andserver/http/ResponseBody;
.super Ljava/lang/Object;
.source "ResponseBody.java"


# virtual methods
.method public abstract contentLength()J
.end method

.method public abstract contentType()Lcom/yanzhenjie/andserver/util/MediaType;
.end method

.method public abstract isRepeatable()Z
.end method

.method public abstract writeTo(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
