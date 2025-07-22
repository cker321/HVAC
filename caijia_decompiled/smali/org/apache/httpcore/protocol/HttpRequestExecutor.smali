.class public Lorg/apache/httpcore/protocol/HttpRequestExecutor;
.super Ljava/lang/Object;
.source "HttpRequestExecutor.java"


# static fields
.field public static final DEFAULT_WAIT_FOR_CONTINUE:I = 0xbb8


# instance fields
.field private final waitForContinue:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0xbb8

    .line 76
    invoke-direct {p0, v0}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Wait for continue time"

    .line 72
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->waitForContinue:I

    return-void
.end method

.method private static closeConnection(Lorg/apache/httpcore/HttpClientConnection;)V
    .locals 0

    .line 142
    :try_start_0
    invoke-interface {p0}, Lorg/apache/httpcore/HttpClientConnection;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method protected canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z
    .locals 1

    .line 93
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object p1

    const-string v0, "HEAD"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return v0

    .line 96
    :cond_0
    invoke-interface {p2}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result p1

    const/16 p2, 0xc8

    if-lt p1, p2, :cond_1

    const/16 p2, 0xcc

    if-eq p1, p2, :cond_1

    const/16 p2, 0x130

    if-eq p1, p2, :cond_1

    const/16 p2, 0xcd

    if-eq p1, p2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method protected doReceiveResponse(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpClientConnection;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 265
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Client connection"

    .line 266
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP context"

    .line 267
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const/4 p3, 0x0

    const/4 v0, 0x0

    :cond_0
    :goto_0
    if-eqz p3, :cond_2

    const/16 v1, 0xc8

    if-ge v0, v1, :cond_1

    goto :goto_1

    :cond_1
    return-object p3

    .line 273
    :cond_2
    :goto_1
    invoke-interface {p2}, Lorg/apache/httpcore/HttpClientConnection;->receiveResponseHeader()Lorg/apache/httpcore/HttpResponse;

    move-result-object p3

    .line 274
    invoke-interface {p3}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x64

    if-lt v0, v1, :cond_3

    .line 278
    invoke-virtual {p0, p1, p3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 279
    invoke-interface {p2, p3}, Lorg/apache/httpcore/HttpClientConnection;->receiveResponseEntity(Lorg/apache/httpcore/HttpResponse;)V

    goto :goto_0

    .line 276
    :cond_3
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid response: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p3}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method protected doSendRequest(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpClientConnection;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 196
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Client connection"

    .line 197
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP context"

    .line 198
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.connection"

    .line 202
    invoke-interface {p3, v0, p2}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 203
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v1, "http.request_sent"

    invoke-interface {p3, v1, v0}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 205
    invoke-interface {p2, p1}, Lorg/apache/httpcore/HttpClientConnection;->sendRequestHeader(Lorg/apache/httpcore/HttpRequest;)V

    .line 206
    instance-of v0, p1, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    .line 212
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/httpcore/RequestLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v3

    .line 213
    move-object v4, p1

    check-cast v4, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    invoke-interface {v4}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v5

    if-eqz v5, :cond_3

    sget-object v5, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    .line 214
    invoke-virtual {v3, v5}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 216
    invoke-interface {p2}, Lorg/apache/httpcore/HttpClientConnection;->flush()V

    .line 219
    iget v3, p0, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->waitForContinue:I

    invoke-interface {p2, v3}, Lorg/apache/httpcore/HttpClientConnection;->isResponseAvailable(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 220
    invoke-interface {p2}, Lorg/apache/httpcore/HttpClientConnection;->receiveResponseHeader()Lorg/apache/httpcore/HttpResponse;

    move-result-object v3

    .line 221
    invoke-virtual {p0, p1, v3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 222
    invoke-interface {p2, v3}, Lorg/apache/httpcore/HttpClientConnection;->receiveResponseEntity(Lorg/apache/httpcore/HttpResponse;)V

    .line 224
    :cond_0
    invoke-interface {v3}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result p1

    const/16 v5, 0xc8

    if-ge p1, v5, :cond_2

    const/16 v5, 0x64

    if-ne p1, v5, :cond_1

    goto :goto_0

    .line 227
    :cond_1
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Unexpected response: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    invoke-interface {v3}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const/4 v0, 0x0

    move-object v2, v3

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    .line 238
    invoke-interface {p2, v4}, Lorg/apache/httpcore/HttpClientConnection;->sendRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V

    .line 241
    :cond_4
    invoke-interface {p2}, Lorg/apache/httpcore/HttpClientConnection;->flush()V

    .line 242
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, v1, p1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2
.end method

.method public execute(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpClientConnection;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 119
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Client connection"

    .line 120
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP context"

    .line 121
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 123
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->doSendRequest(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpClientConnection;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object v0

    if-nez v0, :cond_0

    .line 125
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->doReceiveResponse(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpClientConnection;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/httpcore/HttpException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v0

    :catch_0
    move-exception p1

    .line 135
    invoke-static {p2}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->closeConnection(Lorg/apache/httpcore/HttpClientConnection;)V

    .line 136
    throw p1

    :catch_1
    move-exception p1

    .line 132
    invoke-static {p2}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->closeConnection(Lorg/apache/httpcore/HttpClientConnection;)V

    .line 133
    throw p1

    :catch_2
    move-exception p1

    .line 129
    invoke-static {p2}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->closeConnection(Lorg/apache/httpcore/HttpClientConnection;)V

    .line 130
    throw p1
.end method

.method public postProcess(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP response"

    .line 309
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP processor"

    .line 310
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP context"

    .line 311
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.response"

    .line 312
    invoke-interface {p3, v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 313
    invoke-interface {p2, p1, p3}, Lorg/apache/httpcore/protocol/HttpProcessor;->process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V

    return-void
.end method

.method public preProcess(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 163
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP processor"

    .line 164
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP context"

    .line 165
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.request"

    .line 166
    invoke-interface {p3, v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 167
    invoke-interface {p2, p1, p3}, Lorg/apache/httpcore/protocol/HttpProcessor;->process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V

    return-void
.end method
