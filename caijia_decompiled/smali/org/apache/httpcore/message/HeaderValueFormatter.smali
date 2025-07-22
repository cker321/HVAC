.class public interface abstract Lorg/apache/httpcore/message/HeaderValueFormatter;
.super Ljava/lang/Object;
.source "HeaderValueFormatter.java"


# virtual methods
.method public abstract formatElements(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method

.method public abstract formatHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method

.method public abstract formatNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method

.method public abstract formatParameters(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
.end method
