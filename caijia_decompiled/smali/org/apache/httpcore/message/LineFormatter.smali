.class public interface abstract Lorg/apache/httpcore/message/LineFormatter;
.super Ljava/lang/Object;
.source "LineFormatter.java"


# virtual methods
.method public abstract appendProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/ProtocolVersion;)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method

.method public abstract formatHeader(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/Header;)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method

.method public abstract formatRequestLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/RequestLine;)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method

.method public abstract formatStatusLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/StatusLine;)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method
