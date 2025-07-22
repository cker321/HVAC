.class public Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;
.super Lorg/apache/httpcore/impl/BHttpConnectionBase;
.source "DefaultBHttpClientConnection.java"

# interfaces
.implements Lorg/apache/httpcore/HttpClientConnection;


# instance fields
.field private final requestWriter:Lorg/apache/httpcore/io/HttpMessageWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/io/HttpMessageWriter<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final responseParser:Lorg/apache/httpcore/io/HttpMessageParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/io/HttpMessageParser<",
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

    .line 112
    invoke-direct/range {v0 .. v9}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V

    return-void
.end method

.method public constructor <init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/nio/charset/CharsetDecoder;",
            "Ljava/nio/charset/CharsetEncoder;",
            "Lorg/apache/httpcore/config/MessageConstraints;",
            "Lorg/apache/httpcore/entity/ContentLengthStrategy;",
            "Lorg/apache/httpcore/entity/ContentLengthStrategy;",
            "Lorg/apache/httpcore/io/HttpMessageWriterFactory<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;",
            "Lorg/apache/httpcore/io/HttpMessageParserFactory<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .line 95
    invoke-direct/range {p0 .. p7}, Lorg/apache/httpcore/impl/BHttpConnectionBase;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;)V

    if-eqz p8, :cond_0

    goto :goto_0

    .line 97
    :cond_0
    sget-object p8, Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriterFactory;->INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpRequestWriterFactory;

    .line 98
    :goto_0
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->getSessionOutputBuffer()Lorg/apache/httpcore/io/SessionOutputBuffer;

    move-result-object p1

    invoke-interface {p8, p1}, Lorg/apache/httpcore/io/HttpMessageWriterFactory;->create(Lorg/apache/httpcore/io/SessionOutputBuffer;)Lorg/apache/httpcore/io/HttpMessageWriter;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->requestWriter:Lorg/apache/httpcore/io/HttpMessageWriter;

    if-eqz p9, :cond_1

    goto :goto_1

    .line 99
    :cond_1
    sget-object p9, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;->INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;

    .line 100
    :goto_1
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->getSessionInputBuffer()Lorg/apache/httpcore/io/SessionInputBuffer;

    move-result-object p1

    invoke-interface {p9, p1, p5}, Lorg/apache/httpcore/io/HttpMessageParserFactory;->create(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/io/HttpMessageParser;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->responseParser:Lorg/apache/httpcore/io/HttpMessageParser;

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

    .line 108
    invoke-direct/range {v0 .. v9}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V

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

    .line 123
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

    .line 182
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->ensureOpen()V

    .line 183
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->doFlush()V

    return-void
.end method

.method public isResponseAvailable(I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->ensureOpen()V

    .line 130
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->awaitInput(I)Z

    move-result p1
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method protected onRequestSubmitted(Lorg/apache/httpcore/HttpRequest;)V
    .locals 0

    return-void
.end method

.method protected onResponseReceived(Lorg/apache/httpcore/HttpResponse;)V
    .locals 0

    return-void
.end method

.method public receiveResponseEntity(Lorg/apache/httpcore/HttpResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP response"

    .line 174
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 175
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->ensureOpen()V

    .line 176
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->prepareInput(Lorg/apache/httpcore/HttpMessage;)Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    .line 177
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpResponse;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    return-void
.end method

.method public receiveResponseHeader()Lorg/apache/httpcore/HttpResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->ensureOpen()V

    .line 163
    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->responseParser:Lorg/apache/httpcore/io/HttpMessageParser;

    invoke-interface {v0}, Lorg/apache/httpcore/io/HttpMessageParser;->parse()Lorg/apache/httpcore/HttpMessage;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpResponse;

    .line 164
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->onResponseReceived(Lorg/apache/httpcore/HttpResponse;)V

    .line 165
    invoke-interface {v0}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-lt v1, v2, :cond_0

    .line 166
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->incrementResponseCount()V

    :cond_0
    return-object v0
.end method

.method public sendRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 149
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 150
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->ensureOpen()V

    .line 151
    invoke-interface {p1}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 155
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->prepareOutput(Lorg/apache/httpcore/HttpMessage;)Ljava/io/OutputStream;

    move-result-object p1

    .line 156
    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 157
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    return-void
.end method

.method public sendRequestHeader(Lorg/apache/httpcore/HttpRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 139
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->ensureOpen()V

    .line 141
    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->requestWriter:Lorg/apache/httpcore/io/HttpMessageWriter;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/io/HttpMessageWriter;->write(Lorg/apache/httpcore/HttpMessage;)V

    .line 142
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->onRequestSubmitted(Lorg/apache/httpcore/HttpRequest;)V

    .line 143
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->incrementRequestCount()V

    return-void
.end method
