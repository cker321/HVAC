.class public interface abstract Lorg/apache/httpcore/HttpServerConnection;
.super Ljava/lang/Object;
.source "HttpServerConnection.java"

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

.method public abstract receiveRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract receiveRequestHeader()Lorg/apache/httpcore/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sendResponseEntity(Lorg/apache/httpcore/HttpResponse;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sendResponseHeader(Lorg/apache/httpcore/HttpResponse;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
