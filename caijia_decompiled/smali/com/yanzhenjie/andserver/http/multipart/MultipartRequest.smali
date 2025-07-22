.class public interface abstract Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;
.super Ljava/lang/Object;
.source "MultipartRequest.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpRequest;


# virtual methods
.method public abstract getFile(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;
.end method

.method public abstract getFileMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFileNames()Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFiles(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMultiFileMap()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMultipartContentType(Ljava/lang/String;)Ljava/lang/String;
.end method
