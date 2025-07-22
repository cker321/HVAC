.class public abstract Lorg/apache/httpcore/impl/io/AbstractMessageWriter;
.super Ljava/lang/Object;
.source "AbstractMessageWriter.java"

# interfaces
.implements Lorg/apache/httpcore/io/HttpMessageWriter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/apache/httpcore/HttpMessage;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/io/HttpMessageWriter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected final lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

.field protected final lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

.field protected final sessionBuffer:Lorg/apache/httpcore/io/SessionOutputBuffer;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionOutputBuffer;Lorg/apache/httpcore/message/LineFormatter;)V
    .locals 1

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Session input buffer"

    .line 91
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionOutputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/httpcore/io/SessionOutputBuffer;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicLineFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicLineFormatter;

    :goto_0
    iput-object p2, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

    .line 93
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 p2, 0x80

    invoke-direct {p1, p2}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionOutputBuffer;Lorg/apache/httpcore/message/LineFormatter;Lorg/apache/httpcore/params/HttpParams;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p3, "Session input buffer"

    .line 72
    invoke-static {p1, p3}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/httpcore/io/SessionOutputBuffer;

    .line 74
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 p3, 0x80

    invoke-direct {p1, p3}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicLineFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicLineFormatter;

    :goto_0
    iput-object p2, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

    return-void
.end method


# virtual methods
.method public write(Lorg/apache/httpcore/HttpMessage;)V
    .locals 4
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

    const-string v0, "HTTP message"

    .line 107
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->writeHeadLine(Lorg/apache/httpcore/HttpMessage;)V

    .line 109
    invoke-interface {p1}, Lorg/apache/httpcore/HttpMessage;->headerIterator()Lorg/apache/httpcore/HeaderIterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-interface {p1}, Lorg/apache/httpcore/HeaderIterator;->nextHeader()Lorg/apache/httpcore/Header;

    move-result-object v0

    .line 111
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/httpcore/io/SessionOutputBuffer;

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

    iget-object v3, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 112
    invoke-interface {v2, v3, v0}, Lorg/apache/httpcore/message/LineFormatter;->formatHeader(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/Header;)Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object v0

    invoke-interface {v1, v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->writeLine(Lorg/apache/httpcore/util/CharArrayBuffer;)V

    goto :goto_0

    .line 114
    :cond_0
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p1}, Lorg/apache/httpcore/util/CharArrayBuffer;->clear()V

    .line 115
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/httpcore/io/SessionOutputBuffer;

    iget-object v0, p0, Lorg/apache/httpcore/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {p1, v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->writeLine(Lorg/apache/httpcore/util/CharArrayBuffer;)V

    return-void
.end method

.method protected abstract writeHeadLine(Lorg/apache/httpcore/HttpMessage;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
