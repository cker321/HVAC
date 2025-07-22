.class public interface abstract Lorg/apache/httpcore/io/HttpMessageWriterFactory;
.super Ljava/lang/Object;
.source "HttpMessageWriterFactory.java"


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
.method public abstract create(Lorg/apache/httpcore/io/SessionOutputBuffer;)Lorg/apache/httpcore/io/HttpMessageWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/io/SessionOutputBuffer;",
            ")",
            "Lorg/apache/httpcore/io/HttpMessageWriter<",
            "TT;>;"
        }
    .end annotation
.end method
