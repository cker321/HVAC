.class public interface abstract Lorg/apache/httpcore/HttpResponseInterceptor;
.super Ljava/lang/Object;
.source "HttpResponseInterceptor.java"


# virtual methods
.method public abstract process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
