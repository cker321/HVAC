.class public interface abstract Lorg/apache/httpcore/io/HttpMessageParserFactory;
.super Ljava/lang/Object;
.source "HttpMessageParserFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/apache/httpcore/HttpMessage;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract create(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/io/HttpMessageParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/io/SessionInputBuffer;",
            "Lorg/apache/httpcore/config/MessageConstraints;",
            ")",
            "Lorg/apache/httpcore/io/HttpMessageParser<",
            "TT;>;"
        }
    .end annotation
.end method
