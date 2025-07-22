.class public interface abstract Lorg/apache/httpcore/message/HeaderValueParser;
.super Ljava/lang/Object;
.source "HeaderValueParser.java"


# virtual methods
.method public abstract parseElements(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/HeaderElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method

.method public abstract parseHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/HeaderElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method

.method public abstract parseNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/NameValuePair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method

.method public abstract parseParameters(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/NameValuePair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method
