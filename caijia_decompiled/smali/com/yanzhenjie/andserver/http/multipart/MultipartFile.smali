.class public interface abstract Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;
.super Ljava/lang/Object;
.source "MultipartFile.java"


# virtual methods
.method public abstract getBytes()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getContentType()Lcom/yanzhenjie/andserver/util/MediaType;
.end method

.method public abstract getFilename()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getSize()J
.end method

.method public abstract getStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract transferTo(Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method
