.class public interface abstract Lorg/apache/httpcore/protocol/HttpRequestHandler;
.super Ljava/lang/Object;
.source "HttpRequestHandler.java"


# virtual methods
.method public abstract handle(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
