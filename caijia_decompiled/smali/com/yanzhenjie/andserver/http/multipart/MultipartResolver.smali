.class public interface abstract Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;
.super Ljava/lang/Object;
.source "MultipartResolver.java"


# virtual methods
.method public abstract cleanupMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;)V
.end method

.method public abstract isMultipart(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z
.end method

.method public abstract resolveMultipart(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/yanzhenjie/andserver/error/MultipartException;
        }
    .end annotation
.end method

.method public abstract setAllFileMaxSize(J)V
.end method

.method public abstract setFileMaxSize(J)V
.end method

.method public abstract setMaxInMemorySize(I)V
.end method

.method public abstract setUploadTempDir(Ljava/io/File;)V
.end method
