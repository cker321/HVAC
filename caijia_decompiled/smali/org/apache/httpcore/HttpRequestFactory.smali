.class public interface abstract Lorg/apache/httpcore/HttpRequestFactory;
.super Ljava/lang/Object;
.source "HttpRequestFactory.java"


# virtual methods
.method public abstract newHttpRequest(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/MethodNotSupportedException;
        }
    .end annotation
.end method

.method public abstract newHttpRequest(Lorg/apache/httpcore/RequestLine;)Lorg/apache/httpcore/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/MethodNotSupportedException;
        }
    .end annotation
.end method
