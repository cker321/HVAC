.class public interface abstract Lorg/apache/httpcore/message/LineParser;
.super Ljava/lang/Object;
.source "LineParser.java"


# virtual methods
.method public abstract hasProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Z
.end method

.method public abstract parseHeader(Lorg/apache/httpcore/util/CharArrayBuffer;)Lorg/apache/httpcore/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method

.method public abstract parseProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/ProtocolVersion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method

.method public abstract parseRequestLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/RequestLine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method

.method public abstract parseStatusLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/StatusLine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method
