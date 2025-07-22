.class public interface abstract Lorg/apache/httpcore/io/HttpMessageParser;
.super Ljava/lang/Object;
.source "HttpMessageParser.java"


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
.method public abstract parse()Lorg/apache/httpcore/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation
.end method
