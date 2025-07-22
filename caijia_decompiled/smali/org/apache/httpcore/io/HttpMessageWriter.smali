.class public interface abstract Lorg/apache/httpcore/io/HttpMessageWriter;
.super Ljava/lang/Object;
.source "HttpMessageWriter.java"


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
.method public abstract write(Lorg/apache/httpcore/HttpMessage;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation
.end method
