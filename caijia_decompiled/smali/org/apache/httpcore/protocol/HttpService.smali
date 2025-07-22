.class public Lorg/apache/httpcore/protocol/HttpService;
.super Ljava/lang/Object;
.source "HttpService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;
    }
.end annotation


# instance fields
.field private volatile connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

.field private volatile expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

.field private volatile handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

.field private volatile params:Lorg/apache/httpcore/params/HttpParams;

.field private volatile processor:Lorg/apache/httpcore/protocol/HttpProcessor;

.field private volatile responseFactory:Lorg/apache/httpcore/HttpResponseFactory;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->params:Lorg/apache/httpcore/params/HttpParams;

    .line 82
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->processor:Lorg/apache/httpcore/protocol/HttpProcessor;

    .line 83
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    .line 84
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    .line 85
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    .line 86
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    .line 162
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/HttpService;->setHttpProcessor(Lorg/apache/httpcore/protocol/HttpProcessor;)V

    .line 163
    invoke-virtual {p0, p2}, Lorg/apache/httpcore/protocol/HttpService;->setConnReuseStrategy(Lorg/apache/httpcore/ConnectionReuseStrategy;)V

    .line 164
    invoke-virtual {p0, p3}, Lorg/apache/httpcore/protocol/HttpService;->setResponseFactory(Lorg/apache/httpcore/HttpResponseFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 213
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/protocol/HttpService;-><init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V
    .locals 1

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->params:Lorg/apache/httpcore/params/HttpParams;

    .line 82
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->processor:Lorg/apache/httpcore/protocol/HttpProcessor;

    .line 83
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    .line 84
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    .line 85
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    .line 86
    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    const-string v0, "HTTP processor"

    .line 187
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/protocol/HttpProcessor;

    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService;->processor:Lorg/apache/httpcore/protocol/HttpProcessor;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 188
    :cond_0
    sget-object p2, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;

    :goto_0
    iput-object p2, p0, Lorg/apache/httpcore/protocol/HttpService;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    if-eqz p3, :cond_1

    goto :goto_1

    .line 190
    :cond_1
    sget-object p3, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;

    :goto_1
    iput-object p3, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    .line 192
    iput-object p4, p0, Lorg/apache/httpcore/protocol/HttpService;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    .line 193
    iput-object p5, p0, Lorg/apache/httpcore/protocol/HttpService;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;Lorg/apache/httpcore/params/HttpParams;)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 138
    new-instance v4, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v4, p4}, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;)V

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/protocol/HttpService;-><init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V

    .line 143
    iput-object p5, p0, Lorg/apache/httpcore/protocol/HttpService;->params:Lorg/apache/httpcore/params/HttpParams;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;Lorg/apache/httpcore/params/HttpParams;)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 110
    new-instance v4, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v4, p4}, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/protocol/HttpService;-><init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V

    .line 115
    iput-object p6, p0, Lorg/apache/httpcore/protocol/HttpService;->params:Lorg/apache/httpcore/params/HttpParams;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    .line 226
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/protocol/HttpService;-><init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V

    return-void
.end method

.method private canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 373
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object p1

    const-string v1, "HEAD"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    .line 376
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


# virtual methods
.method protected doService(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 433
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    if-eqz v0, :cond_0

    .line 434
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;->lookup(Lorg/apache/httpcore/HttpRequest;)Lorg/apache/httpcore/protocol/HttpRequestHandler;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 437
    invoke-interface {v0, p1, p2, p3}, Lorg/apache/httpcore/protocol/HttpRequestHandler;->handle(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V

    goto :goto_1

    :cond_1
    const/16 p1, 0x1f5

    .line 439
    invoke-interface {p2, p1}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    :goto_1
    return-void
.end method

.method public getParams()Lorg/apache/httpcore/params/HttpParams;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 285
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->params:Lorg/apache/httpcore/params/HttpParams;

    return-object v0
.end method

.method protected handleException(Lorg/apache/httpcore/HttpException;Lorg/apache/httpcore/HttpResponse;)V
    .locals 1

    .line 392
    instance-of v0, p1, Lorg/apache/httpcore/MethodNotSupportedException;

    if-eqz v0, :cond_0

    const/16 v0, 0x1f5

    .line 393
    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    goto :goto_0

    .line 394
    :cond_0
    instance-of v0, p1, Lorg/apache/httpcore/UnsupportedHttpVersionException;

    if-eqz v0, :cond_1

    const/16 v0, 0x1f9

    .line 395
    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    goto :goto_0

    .line 396
    :cond_1
    instance-of v0, p1, Lorg/apache/httpcore/ProtocolException;

    if-eqz v0, :cond_2

    const/16 v0, 0x190

    .line 397
    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x1f4

    .line 399
    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    .line 401
    :goto_0
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    .line 403
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpException;->toString()Ljava/lang/String;

    move-result-object v0

    .line 405
    :cond_3
    invoke-static {v0}, Lorg/apache/httpcore/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object p1

    .line 406
    new-instance v0, Lorg/apache/httpcore/entity/ByteArrayEntity;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/entity/ByteArrayEntity;-><init>([B)V

    const-string p1, "text/plain; charset=US-ASCII"

    .line 407
    invoke-virtual {v0, p1}, Lorg/apache/httpcore/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 408
    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    return-void
.end method

.method public handleRequest(Lorg/apache/httpcore/HttpServerConnection;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    const-string v0, "http.connection"

    .line 302
    invoke-interface {p2, v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    const/16 v0, 0x1f4

    const/4 v1, 0x0

    .line 308
    :try_start_0
    invoke-interface {p1}, Lorg/apache/httpcore/HttpServerConnection;->receiveRequestHeader()Lorg/apache/httpcore/HttpRequest;

    move-result-object v2
    :try_end_0
    .catch Lorg/apache/httpcore/HttpException; {:try_start_0 .. :try_end_0} :catch_2

    .line 309
    :try_start_1
    instance-of v3, v2, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    const/16 v4, 0xc8

    if-eqz v3, :cond_3

    .line 311
    move-object v3, v2

    check-cast v3, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    invoke-interface {v3}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 312
    iget-object v3, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    sget-object v5, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    const/16 v6, 0x64

    invoke-interface {v3, v5, v6, p2}, Lorg/apache/httpcore/HttpResponseFactory;->newHttpResponse(Lorg/apache/httpcore/ProtocolVersion;ILorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object v3

    .line 314
    iget-object v5, p0, Lorg/apache/httpcore/protocol/HttpService;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;
    :try_end_1
    .catch Lorg/apache/httpcore/HttpException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v5, :cond_0

    .line 316
    :try_start_2
    iget-object v5, p0, Lorg/apache/httpcore/protocol/HttpService;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    invoke-interface {v5, v2, v3, p2}, Lorg/apache/httpcore/protocol/HttpExpectationVerifier;->verify(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    :try_end_2
    .catch Lorg/apache/httpcore/HttpException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    .line 318
    :try_start_3
    iget-object v5, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    sget-object v6, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-interface {v5, v6, v0, p2}, Lorg/apache/httpcore/HttpResponseFactory;->newHttpResponse(Lorg/apache/httpcore/ProtocolVersion;ILorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object v5

    .line 320
    invoke-virtual {p0, v3, v5}, Lorg/apache/httpcore/protocol/HttpService;->handleException(Lorg/apache/httpcore/HttpException;Lorg/apache/httpcore/HttpResponse;)V

    move-object v3, v5

    .line 323
    :cond_0
    :goto_0
    invoke-interface {v3}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v5

    if-ge v5, v4, :cond_1

    .line 326
    invoke-interface {p1, v3}, Lorg/apache/httpcore/HttpServerConnection;->sendResponseHeader(Lorg/apache/httpcore/HttpResponse;)V

    .line 327
    invoke-interface {p1}, Lorg/apache/httpcore/HttpServerConnection;->flush()V

    .line 329
    move-object v3, v2

    check-cast v3, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    invoke-interface {p1, v3}, Lorg/apache/httpcore/HttpServerConnection;->receiveRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V

    goto :goto_1

    :cond_1
    move-object v1, v3

    goto :goto_1

    .line 332
    :cond_2
    move-object v3, v2

    check-cast v3, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    invoke-interface {p1, v3}, Lorg/apache/httpcore/HttpServerConnection;->receiveRequestEntity(Lorg/apache/httpcore/HttpEntityEnclosingRequest;)V

    :cond_3
    :goto_1
    const-string v3, "http.request"

    .line 336
    invoke-interface {p2, v3, v2}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v1, :cond_4

    .line 339
    iget-object v1, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    sget-object v3, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    invoke-interface {v1, v3, v4, p2}, Lorg/apache/httpcore/HttpResponseFactory;->newHttpResponse(Lorg/apache/httpcore/ProtocolVersion;ILorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object v1

    .line 341
    iget-object v3, p0, Lorg/apache/httpcore/protocol/HttpService;->processor:Lorg/apache/httpcore/protocol/HttpProcessor;

    invoke-interface {v3, v2, p2}, Lorg/apache/httpcore/protocol/HttpProcessor;->process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V

    .line 342
    invoke-virtual {p0, v2, v1, p2}, Lorg/apache/httpcore/protocol/HttpService;->doService(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V

    .line 346
    :cond_4
    instance-of v3, v2, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    if-eqz v3, :cond_5

    .line 347
    move-object v3, v2

    check-cast v3, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    invoke-interface {v3}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v3

    .line 348
    invoke-static {v3}, Lorg/apache/httpcore/util/EntityUtils;->consume(Lorg/apache/httpcore/HttpEntity;)V
    :try_end_3
    .catch Lorg/apache/httpcore/HttpException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v2

    move-object v7, v2

    move-object v2, v1

    move-object v1, v7

    .line 352
    :goto_2
    iget-object v3, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    sget-object v4, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    .line 353
    invoke-interface {v3, v4, v0, p2}, Lorg/apache/httpcore/HttpResponseFactory;->newHttpResponse(Lorg/apache/httpcore/ProtocolVersion;ILorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object v0

    .line 355
    invoke-virtual {p0, v1, v0}, Lorg/apache/httpcore/protocol/HttpService;->handleException(Lorg/apache/httpcore/HttpException;Lorg/apache/httpcore/HttpResponse;)V

    move-object v1, v0

    :cond_5
    :goto_3
    const-string v0, "http.response"

    .line 358
    invoke-interface {p2, v0, v1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 360
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->processor:Lorg/apache/httpcore/protocol/HttpProcessor;

    invoke-interface {v0, v1, p2}, Lorg/apache/httpcore/protocol/HttpProcessor;->process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V

    .line 361
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpServerConnection;->sendResponseHeader(Lorg/apache/httpcore/HttpResponse;)V

    .line 362
    invoke-direct {p0, v2, v1}, Lorg/apache/httpcore/protocol/HttpService;->canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 363
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpServerConnection;->sendResponseEntity(Lorg/apache/httpcore/HttpResponse;)V

    .line 365
    :cond_6
    invoke-interface {p1}, Lorg/apache/httpcore/HttpServerConnection;->flush()V

    .line 367
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    invoke-interface {v0, v1, p2}, Lorg/apache/httpcore/ConnectionReuseStrategy;->keepAlive(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 368
    invoke-interface {p1}, Lorg/apache/httpcore/HttpServerConnection;->close()V

    :cond_7
    return-void
.end method

.method public setConnReuseStrategy(Lorg/apache/httpcore/ConnectionReuseStrategy;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Connection reuse strategy"

    .line 243
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 244
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    return-void
.end method

.method public setExpectationVerifier(Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 277
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    return-void
.end method

.method public setHandlerResolver(Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 269
    new-instance v0, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;)V

    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpService;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    return-void
.end method

.method public setHttpProcessor(Lorg/apache/httpcore/protocol/HttpProcessor;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "HTTP processor"

    .line 234
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 235
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService;->processor:Lorg/apache/httpcore/protocol/HttpProcessor;

    return-void
.end method

.method public setParams(Lorg/apache/httpcore/params/HttpParams;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 261
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService;->params:Lorg/apache/httpcore/params/HttpParams;

    return-void
.end method

.method public setResponseFactory(Lorg/apache/httpcore/HttpResponseFactory;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Response factory"

    .line 252
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 253
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    return-void
.end method
