.class public Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;
.super Lorg/apache/httpcore/impl/io/AbstractMessageParser;
.source "DefaultHttpRequestParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/httpcore/impl/io/AbstractMessageParser<",
        "Lorg/apache/httpcore/HttpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field private final lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

.field private final requestFactory:Lorg/apache/httpcore/HttpRequestFactory;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;)V
    .locals 2

    .line 120
    sget-object v0, Lorg/apache/httpcore/config/MessageConstraints;->DEFAULT:Lorg/apache/httpcore/config/MessageConstraints;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v1, v0}, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpRequestFactory;Lorg/apache/httpcore/config/MessageConstraints;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)V
    .locals 1

    const/4 v0, 0x0

    .line 113
    invoke-direct {p0, p1, v0, v0, p2}, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpRequestFactory;Lorg/apache/httpcore/config/MessageConstraints;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpRequestFactory;Lorg/apache/httpcore/config/MessageConstraints;)V
    .locals 0

    .line 101
    invoke-direct {p0, p1, p2, p4}, Lorg/apache/httpcore/impl/io/AbstractMessageParser;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/config/MessageConstraints;)V

    if-eqz p3, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    sget-object p3, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;

    :goto_0
    iput-object p3, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->requestFactory:Lorg/apache/httpcore/HttpRequestFactory;

    .line 104
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 p2, 0x80

    invoke-direct {p1, p2}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpRequestFactory;Lorg/apache/httpcore/params/HttpParams;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 78
    invoke-direct {p0, p1, p2, p4}, Lorg/apache/httpcore/impl/io/AbstractMessageParser;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/params/HttpParams;)V

    const-string p1, "Request factory"

    .line 79
    invoke-static {p3, p1}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/HttpRequestFactory;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->requestFactory:Lorg/apache/httpcore/HttpRequestFactory;

    .line 80
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 p2, 0x80

    invoke-direct {p1, p2}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    return-void
.end method


# virtual methods
.method protected bridge synthetic parseHead(Lorg/apache/httpcore/io/SessionInputBuffer;)Lorg/apache/httpcore/HttpMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;,
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->parseHead(Lorg/apache/httpcore/io/SessionInputBuffer;)Lorg/apache/httpcore/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method protected parseHead(Lorg/apache/httpcore/io/SessionInputBuffer;)Lorg/apache/httpcore/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;,
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    .line 128
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->clear()V

    .line 129
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {p1, v0}, Lorg/apache/httpcore/io/SessionInputBuffer;->readLine(Lorg/apache/httpcore/util/CharArrayBuffer;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 133
    new-instance p1, Lorg/apache/httpcore/message/ParserCursor;

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v1

    invoke-direct {p1, v0, v1}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    .line 134
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineParser:Lorg/apache/httpcore/message/LineParser;

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->lineBuf:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {v0, v1, p1}, Lorg/apache/httpcore/message/LineParser;->parseRequestLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    .line 135
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParser;->requestFactory:Lorg/apache/httpcore/HttpRequestFactory;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpRequestFactory;->newHttpRequest(Lorg/apache/httpcore/RequestLine;)Lorg/apache/httpcore/HttpRequest;

    move-result-object p1

    return-object p1

    .line 131
    :cond_0
    new-instance p1, Lorg/apache/httpcore/ConnectionClosedException;

    const-string v0, "Client closed connection"

    invoke-direct {p1, v0}, Lorg/apache/httpcore/ConnectionClosedException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
