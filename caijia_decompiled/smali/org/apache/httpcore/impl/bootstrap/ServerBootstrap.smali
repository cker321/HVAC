.class public Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
.super Ljava/lang/Object;
.source "ServerBootstrap.java"


# instance fields
.field private connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

.field private connectionConfig:Lorg/apache/httpcore/config/ConnectionConfig;

.field private connectionFactory:Lorg/apache/httpcore/HttpConnectionFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/HttpConnectionFactory<",
            "+",
            "Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;",
            ">;"
        }
    .end annotation
.end field

.field private exceptionLogger:Lorg/apache/httpcore/ExceptionLogger;

.field private expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

.field private handlerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/httpcore/protocol/HttpRequestHandler;",
            ">;"
        }
    .end annotation
.end field

.field private handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

.field private httpProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

.field private listenerPort:I

.field private localAddress:Ljava/net/InetAddress;

.field private requestFirst:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lorg/apache/httpcore/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private requestLast:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lorg/apache/httpcore/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

.field private responseFirst:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lorg/apache/httpcore/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseLast:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lorg/apache/httpcore/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private serverInfo:Ljava/lang/String;

.field private serverSocketFactory:Ljavax/net/ServerSocketFactory;

.field private socketConfig:Lorg/apache/httpcore/config/SocketConfig;

.field private sslContext:Ljavax/net/ssl/SSLContext;

.field private sslSetupHandler:Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bootstrap()Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 1

    .line 91
    new-instance v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;-><init>()V

    return-object v0
.end method


# virtual methods
.method public final addInterceptorFirst(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 201
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestFirst:Ljava/util/LinkedList;

    if-nez v0, :cond_1

    .line 202
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestFirst:Ljava/util/LinkedList;

    .line 204
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestFirst:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    return-object p0
.end method

.method public final addInterceptorFirst(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 161
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseFirst:Ljava/util/LinkedList;

    if-nez v0, :cond_1

    .line 162
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseFirst:Ljava/util/LinkedList;

    .line 164
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseFirst:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    return-object p0
.end method

.method public final addInterceptorLast(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 221
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestLast:Ljava/util/LinkedList;

    if-nez v0, :cond_1

    .line 222
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestLast:Ljava/util/LinkedList;

    .line 224
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestLast:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return-object p0
.end method

.method public final addInterceptorLast(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 181
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseLast:Ljava/util/LinkedList;

    if-nez v0, :cond_1

    .line 182
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseLast:Ljava/util/LinkedList;

    .line 184
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseLast:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    return-object p0
.end method

.method public create()Lorg/apache/httpcore/impl/bootstrap/HttpServer;
    .locals 17

    move-object/from16 v0, p0

    .line 362
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->httpProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

    const/4 v2, 0x0

    if-nez v1, :cond_5

    .line 365
    invoke-static {}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->create()Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    move-result-object v1

    .line 366
    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestFirst:Ljava/util/LinkedList;

    if-eqz v3, :cond_0

    .line 367
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/httpcore/HttpRequestInterceptor;

    .line 368
    invoke-virtual {v1, v4}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addFirst(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    goto :goto_0

    .line 371
    :cond_0
    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseFirst:Ljava/util/LinkedList;

    if-eqz v3, :cond_1

    .line 372
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 373
    invoke-virtual {v1, v4}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addFirst(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    goto :goto_1

    .line 377
    :cond_1
    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->serverInfo:Ljava/lang/String;

    if-nez v3, :cond_2

    const-string v3, "Apache-HttpCore/1.1"

    :cond_2
    const/4 v4, 0x4

    new-array v4, v4, [Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 382
    new-instance v5, Lorg/apache/httpcore/protocol/ResponseDate;

    invoke-direct {v5}, Lorg/apache/httpcore/protocol/ResponseDate;-><init>()V

    aput-object v5, v4, v2

    const/4 v5, 0x1

    new-instance v6, Lorg/apache/httpcore/protocol/ResponseServer;

    invoke-direct {v6, v3}, Lorg/apache/httpcore/protocol/ResponseServer;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v3, 0x2

    new-instance v5, Lorg/apache/httpcore/protocol/ResponseContent;

    invoke-direct {v5}, Lorg/apache/httpcore/protocol/ResponseContent;-><init>()V

    aput-object v5, v4, v3

    const/4 v3, 0x3

    new-instance v5, Lorg/apache/httpcore/protocol/ResponseConnControl;

    invoke-direct {v5}, Lorg/apache/httpcore/protocol/ResponseConnControl;-><init>()V

    aput-object v5, v4, v3

    invoke-virtual {v1, v4}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addAll([Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    .line 387
    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->requestLast:Ljava/util/LinkedList;

    if-eqz v3, :cond_3

    .line 388
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/httpcore/HttpRequestInterceptor;

    .line 389
    invoke-virtual {v1, v4}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    goto :goto_2

    .line 392
    :cond_3
    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseLast:Ljava/util/LinkedList;

    if-eqz v3, :cond_4

    .line 393
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 394
    invoke-virtual {v1, v4}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    goto :goto_3

    .line 397
    :cond_4
    invoke-virtual {v1}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->build()Lorg/apache/httpcore/protocol/HttpProcessor;

    move-result-object v1

    :cond_5
    move-object v4, v1

    .line 400
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    if-nez v1, :cond_6

    .line 402
    new-instance v1, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;

    invoke-direct {v1}, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;-><init>()V

    .line 403
    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->handlerMap:Ljava/util/Map;

    if-eqz v3, :cond_6

    .line 404
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 405
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/httpcore/protocol/HttpRequestHandler;

    invoke-virtual {v1, v6, v5}, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->register(Ljava/lang/String;Lorg/apache/httpcore/protocol/HttpRequestHandler;)V

    goto :goto_4

    :cond_6
    move-object v7, v1

    .line 411
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    if-nez v1, :cond_7

    .line 413
    sget-object v1, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;

    :cond_7
    move-object v5, v1

    .line 416
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    if-nez v1, :cond_8

    .line 418
    sget-object v1, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;

    :cond_8
    move-object v6, v1

    .line 421
    new-instance v13, Lorg/apache/httpcore/protocol/HttpService;

    iget-object v8, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    move-object v3, v13

    invoke-direct/range {v3 .. v8}, Lorg/apache/httpcore/protocol/HttpService;-><init>(Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/ConnectionReuseStrategy;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)V

    .line 425
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->serverSocketFactory:Ljavax/net/ServerSocketFactory;

    if-nez v1, :cond_a

    .line 427
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->sslContext:Ljavax/net/ssl/SSLContext;

    if-eqz v1, :cond_9

    .line 428
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getServerSocketFactory()Ljavax/net/ssl/SSLServerSocketFactory;

    move-result-object v1

    goto :goto_5

    .line 430
    :cond_9
    invoke-static {}, Ljavax/net/ServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object v1

    :cond_a
    :goto_5
    move-object v12, v1

    .line 434
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connectionFactory:Lorg/apache/httpcore/HttpConnectionFactory;

    if-nez v1, :cond_c

    .line 436
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connectionConfig:Lorg/apache/httpcore/config/ConnectionConfig;

    if-eqz v1, :cond_b

    .line 437
    new-instance v1, Lorg/apache/httpcore/impl/DefaultBHttpServerConnectionFactory;

    iget-object v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connectionConfig:Lorg/apache/httpcore/config/ConnectionConfig;

    invoke-direct {v1, v3}, Lorg/apache/httpcore/impl/DefaultBHttpServerConnectionFactory;-><init>(Lorg/apache/httpcore/config/ConnectionConfig;)V

    goto :goto_6

    .line 439
    :cond_b
    sget-object v1, Lorg/apache/httpcore/impl/DefaultBHttpServerConnectionFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultBHttpServerConnectionFactory;

    :cond_c
    :goto_6
    move-object v14, v1

    .line 443
    iget-object v1, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->exceptionLogger:Lorg/apache/httpcore/ExceptionLogger;

    if-nez v1, :cond_d

    .line 445
    sget-object v1, Lorg/apache/httpcore/ExceptionLogger;->NO_OP:Lorg/apache/httpcore/ExceptionLogger;

    :cond_d
    move-object/from16 v16, v1

    .line 448
    new-instance v1, Lorg/apache/httpcore/impl/bootstrap/HttpServer;

    iget v3, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->listenerPort:I

    .line 449
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v9

    iget-object v10, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->localAddress:Ljava/net/InetAddress;

    iget-object v2, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->socketConfig:Lorg/apache/httpcore/config/SocketConfig;

    if-eqz v2, :cond_e

    goto :goto_7

    :cond_e
    sget-object v2, Lorg/apache/httpcore/config/SocketConfig;->DEFAULT:Lorg/apache/httpcore/config/SocketConfig;

    :goto_7
    move-object v11, v2

    iget-object v15, v0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->sslSetupHandler:Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;

    move-object v8, v1

    invoke-direct/range {v8 .. v16}, Lorg/apache/httpcore/impl/bootstrap/HttpServer;-><init>(ILjava/net/InetAddress;Lorg/apache/httpcore/config/SocketConfig;Ljavax/net/ServerSocketFactory;Lorg/apache/httpcore/protocol/HttpService;Lorg/apache/httpcore/HttpConnectionFactory;Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;Lorg/apache/httpcore/ExceptionLogger;)V

    return-object v1
.end method

.method public final registerHandler(Ljava/lang/String;Lorg/apache/httpcore/protocol/HttpRequestHandler;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 1

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    .line 288
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->handlerMap:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 289
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->handlerMap:Ljava/util/Map;

    .line 291
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->handlerMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :goto_0
    return-object p0
.end method

.method public final setConnectionConfig(Lorg/apache/httpcore/config/ConnectionConfig;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 134
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connectionConfig:Lorg/apache/httpcore/config/ConnectionConfig;

    return-object p0
.end method

.method public final setConnectionFactory(Lorg/apache/httpcore/HttpConnectionFactory;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/HttpConnectionFactory<",
            "+",
            "Lorg/apache/httpcore/impl/DefaultBHttpServerConnection;",
            ">;)",
            "Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;"
        }
    .end annotation

    .line 312
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connectionFactory:Lorg/apache/httpcore/HttpConnectionFactory;

    return-object p0
.end method

.method public final setConnectionReuseStrategy(Lorg/apache/httpcore/ConnectionReuseStrategy;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 248
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->connStrategy:Lorg/apache/httpcore/ConnectionReuseStrategy;

    return-object p0
.end method

.method public final setExceptionLogger(Lorg/apache/httpcore/ExceptionLogger;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 356
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->exceptionLogger:Lorg/apache/httpcore/ExceptionLogger;

    return-object p0
.end method

.method public final setExpectationVerifier(Lorg/apache/httpcore/protocol/HttpExpectationVerifier;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 301
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->expectationVerifier:Lorg/apache/httpcore/protocol/HttpExpectationVerifier;

    return-object p0
.end method

.method public final setHandlerMapper(Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 268
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->handlerMapper:Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;

    return-object p0
.end method

.method public final setHttpProcessor(Lorg/apache/httpcore/protocol/HttpProcessor;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 144
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->httpProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

    return-object p0
.end method

.method public final setListenerPort(I)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 100
    iput p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->listenerPort:I

    return-object p0
.end method

.method public final setLocalAddress(Ljava/net/InetAddress;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 110
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->localAddress:Ljava/net/InetAddress;

    return-object p0
.end method

.method public final setResponseFactory(Lorg/apache/httpcore/HttpResponseFactory;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 258
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    return-object p0
.end method

.method public final setServerInfo(Ljava/lang/String;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 238
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->serverInfo:Ljava/lang/String;

    return-object p0
.end method

.method public final setServerSocketFactory(Ljavax/net/ServerSocketFactory;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 332
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->serverSocketFactory:Ljavax/net/ServerSocketFactory;

    return-object p0
.end method

.method public final setSocketConfig(Lorg/apache/httpcore/config/SocketConfig;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 120
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->socketConfig:Lorg/apache/httpcore/config/SocketConfig;

    return-object p0
.end method

.method public final setSslContext(Ljavax/net/ssl/SSLContext;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 346
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->sslContext:Ljavax/net/ssl/SSLContext;

    return-object p0
.end method

.method public final setSslSetupHandler(Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;)Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;
    .locals 0

    .line 322
    iput-object p1, p0, Lorg/apache/httpcore/impl/bootstrap/ServerBootstrap;->sslSetupHandler:Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;

    return-object p0
.end method
