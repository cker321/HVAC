.class public Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;
.super Lorg/apache/httpcore/impl/BHttpConnectionBase;
.source "DefaultBHttpServerConnection.java"

# interfaces
.implements Lorg/apache/httpcore/HttpServerConnection;


# instance fields
.field private final requestParser:Lorg/apache/httpcore/io/HttpMessageParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/io/HttpMessageParser<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final responseWriter:Lorg/apache/httpcore/io/HttpMessageWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/io/HttpMessageWriter<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 10

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p1

    .line 111
    invoke-direct/range {v0 .. v9}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageParserFactory;Lorg/apache/httpcore/io/HttpMessageWriterFactory;)V

    return-void
.end method

.method public constructor <init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageParserFactory;Lorg/apache/httpcore/io/HttpMessageWriterFactory;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/nio/charset/CharsetDecoder;",
            "Ljava/nio/charset/CharsetEncoder;",
            "Lorg/apache/httpcore/config/MessageConstraints;",
            "Lorg/apache/httpcore/entity/ContentLengthStrategy;",
            "Lorg/apache/httpcore/entity/ContentLengthStrategy;",
            "Lorg/apache/httpcore/io/HttpMessageParserFactory<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;",
            "Lorg/apache/httpcore/io/HttpMessageWriterFactory<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;)V"
        }
    .end annotation

    move-object v8, p0

    if-eqz p6, :cond_0

    move-object v6, p6

    goto :goto_0

    .line 93
    :cond_0
    sget-object v0, Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;->INSTANCE:Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;

    move-object v6, v0

    :goto_0
    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Lorg/apache/httpcore/impl/BHttpConnectionBase;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;)V

    if-eqz p8, :cond_1

    move-object/from16 v0, p8

    goto :goto_1

    .line 96
    :cond_1
    sget-object v0, Lorg/apache/httpcore/impl/io/DefaultHttpRequestParserFactory;->INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpRequestParserFactory;

    .line 97
    :goto_1
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->getSessionInputBuffer()Lorg/apache/httpcore/io/SessionInputBuffer;

    move-result-object v1

    move-object v2, p5

    invoke-interface {v0, v1, p5}, Lorg/apache/httpcore/io/HttpMessageParserFactory;->create(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/io/HttpMessageParser;

    move-result-object v0

    iput-object v0, v8, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->requestParser:Lorg/apache/httpcore/io/HttpMessageParser;

    if-eqz p9, :cond_2

    move-object/from16 v0, p9

    goto :goto_2

    .line 98
    :cond_2
    sget-object v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;->INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;

    .line 99
    :goto_2
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->getSessionOutputBuffer()Lorg/apache/httpcore/io/SessionOutputBuffer;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/httpcore/io/HttpMessageWriterFactory;->create(Lorg/apache/httpcore/io/SessionOutputBuffer;)Lorg/apache/httpcore/io/HttpMessageWriter;

    move-result-object v0

    iput-object v0, v8, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->responseWriter:Lorg/apache/httpcore/io/HttpMessageWriter;

    return-void
.end method

.method public constructor <init>(ILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;)V
    .locals 10

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 107
    invoke-direct/range {v0 .. v9}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageParserFactory;Lorg/apache/httpcore/io/HttpMessageWriterFactory;)V

    return-void
.end method


# virtual methods
.method public bind(Ljava/net/Socket;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    invoke-super {p0, p1}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->bind(Ljava/net/Socket;)V

    return-void
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 173
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->doFlush()V

    return-void
.end method

.method protected onRequestReceived(Lorg/apache/httpcore/HttpRequest;)V
    .locals 0

    return-void
.end method

.method protected onResponseSubmitted(Lorg/apache/httpcore/HttpResponse;)V
    .locals 0

    return-void
.end method

.method public receiveRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 138
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 140
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->prepareInput(Lorg/apache/httpcore/HttpMessage;)Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    .line 141
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    return-void
.end method

.method public receiveRequestHeader()Lorg/apache/httpcore/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 129
    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->requestParser:Lorg/apache/httpcore/io/HttpMessageParser;

    invoke-interface {v0}, Lorg/apache/httpcore/io/HttpMessageParser;->parse()Lorg/apache/httpcore/HttpMessage;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpRequest;

    .line 130
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->onRequestReceived(Lorg/apache/httpcore/HttpRequest;)V

    .line 131
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->incrementRequestCount()V

    return-object v0
.end method

.method public sendResponseEntity(Lorg/apache/httpcore/HttpResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP response"

    .line 159
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 160
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 161
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 165
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->prepareOutput(Lorg/apache/httpcore/HttpMessage;)Ljava/io/OutputStream;

    move-result-object p1

    .line 166
    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 167
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    return-void
.end method

.method public sendResponseHeader(Lorg/apache/httpcore/HttpResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP response"

    .line 147
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 148
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 149
    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->responseWriter:Lorg/apache/httpcore/io/HttpMessageWriter;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/io/HttpMessageWriter;->write(Lorg/apache/httpcore/HttpMessage;)V

    .line 150
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->onResponseSubmitted(Lorg/apache/httpcore/HttpResponse;)V

    .line 151
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result p1

    const/16 v0, 0xc8

    if-lt p1, v0, :cond_0

    .line 152
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;->incrementResponseCount()V

    :cond_0
    return-void
.end method
