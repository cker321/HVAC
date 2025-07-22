.class public interface abstract Lcom/yanzhenjie/andserver/http/RequestBody;
.super Ljava/lang/Object;
.source "RequestBody.java"


# virtual methods
.method public abstract contentEncoding()Ljava/lang/String;
.end method

.method public abstract contentType()Lcom/yanzhenjie/andserver/util/MediaType;
.end method

.method public abstract length()J
.end method

.method public abstract stream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract string()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
