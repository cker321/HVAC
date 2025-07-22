.class public interface abstract Lorg/apache/httpcore/HttpRequestInterceptor;
.super Ljava/lang/Object;
.source "HttpRequestInterceptor.java"


# virtual methods
.method public abstract process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
