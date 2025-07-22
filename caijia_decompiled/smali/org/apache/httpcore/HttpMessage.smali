.class public interface abstract Lorg/apache/httpcore/HttpMessage;
.super Ljava/lang/Object;
.source "HttpMessage.java"


# virtual methods
.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addHeader(Lorg/apache/httpcore/Header;)V
.end method

.method public abstract containsHeader(Ljava/lang/String;)Z
.end method

.method public abstract getAllHeaders()[Lorg/apache/httpcore/Header;
.end method

.method public abstract getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;
.end method

.method public abstract getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;
.end method

.method public abstract getLastHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;
.end method

.method public abstract getParams()Lorg/apache/httpcore/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;
.end method

.method public abstract headerIterator()Lorg/apache/httpcore/HeaderIterator;
.end method

.method public abstract headerIterator(Ljava/lang/String;)Lorg/apache/httpcore/HeaderIterator;
.end method

.method public abstract removeHeader(Lorg/apache/httpcore/Header;)V
.end method

.method public abstract removeHeaders(Ljava/lang/String;)V
.end method

.method public abstract setHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setHeader(Lorg/apache/httpcore/Header;)V
.end method

.method public abstract setHeaders([Lorg/apache/httpcore/Header;)V
.end method

.method public abstract setParams(Lorg/apache/httpcore/params/HttpParams;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
