.class public Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;
.super Lorg/apache/httpcore/impl/io/AbstractMessageWriter;
.source "DefaultHttpRequestWriter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/httpcore/impl/io/AbstractMessageWriter<",
        "Lorg/apache/httpcore/HttpRequest;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionOutputBuffer;)V
    .locals 1

    const/4 v0, 0x0

    .line 58
    invoke-direct {p0, p1, v0}, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;-><init>(Lorg/apache/httpcore/io/SessionOutputBuffer;Lorg/apache/httpcore/message/LineFormatter;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionOutputBuffer;Lorg/apache/httpcore/message/LineFormatter;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;-><init>(Lorg/apache/httpcore/io/SessionOutputBuffer;Lorg/apache/httpcore/message/LineFormatter;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic writeHeadLine(Lorg/apache/httpcore/HttpMessage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    check-cast p1, Lorg/apache/httpcore/HttpRequest;

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;->writeHeadLine(Lorg/apache/httpcore/HttpRequest;)V

    return-void
.end method

.method protected writeHeadLine(Lorg/apache/httpcore/HttpRequest;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;->lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lorg/apache/httpcore/message/LineFormatter;->formatRequestLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/RequestLine;)Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 64
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;->sessionBuffer:Lorg/apache/httpcore/io/SessionOutputBuffer;

    iget-object v0, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {p1, v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->writeLine(Lorg/apache/httpcore/util/CharArrayBuffer;)V

    return-void
.end method
