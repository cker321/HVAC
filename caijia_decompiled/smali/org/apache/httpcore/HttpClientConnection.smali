.class public interface abstract Lorg/apache/httpcore/HttpClientConnection;
.super Ljava/lang/Object;
.source "HttpClientConnection.java"

# interfaces
.implements Lorg/apache/httpcore/HttpConnection;


# virtual methods
.method public abstract flush()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isResponseAvailable(I)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract receiveResponseEntity(Lorg/apache/httpcore/HttpResponse;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract receiveResponseHeader()Lorg/apache/httpcore/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sendRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sendRequestHeader(Lorg/apache/httpcore/HttpRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
