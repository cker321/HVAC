.class public Lcom/yanzhenjie/andserver/ProxyHandler;
.super Ljava/lang/Object;
.source "ProxyHandler.java"

# interfaces
.implements Lorg/apache/httpcore/protocol/HttpRequestHandler;


# static fields
.field private static final BUFFER:I = 0x2000

.field private static final HOP_BY_HOP:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mHostList:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/httpcore/HttpHost;",
            ">;"
        }
    .end annotation
.end field

.field private final mHttpExecutor:Lorg/apache/httpcore/protocol/HttpRequestExecutor;

.field private final mRequestProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

.field private final mSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 68
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Host"

    .line 69
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Content-Length"

    .line 70
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Transfer-Encoding"

    .line 71
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Connection"

    .line 72
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Proxy-Authenticate"

    .line 73
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "TE"

    .line 74
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x5

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Trailer"

    .line 75
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x6

    aput-object v2, v1, v3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "Upgrade"

    .line 76
    invoke-virtual {v3, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x7

    aput-object v2, v1, v3

    .line 68
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/ProxyHandler;->HOP_BY_HOP:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/httpcore/HttpHost;",
            ">;)V"
        }
    .end annotation

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 83
    new-instance v0, Lorg/apache/httpcore/protocol/HttpRequestExecutor;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mHttpExecutor:Lorg/apache/httpcore/protocol/HttpRequestExecutor;

    .line 84
    new-instance v0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x5

    new-array v1, v1, [Lorg/apache/httpcore/HttpRequestInterceptor;

    new-instance v2, Lorg/apache/httpcore/protocol/RequestContent;

    invoke-direct {v2}, Lorg/apache/httpcore/protocol/RequestContent;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lorg/apache/httpcore/protocol/RequestTargetHost;

    invoke-direct {v2}, Lorg/apache/httpcore/protocol/RequestTargetHost;-><init>()V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lorg/apache/httpcore/protocol/RequestConnControl;

    invoke-direct {v2}, Lorg/apache/httpcore/protocol/RequestConnControl;-><init>()V

    const/4 v4, 0x2

    aput-object v2, v1, v4

    new-instance v2, Lorg/apache/httpcore/protocol/RequestUserAgent;

    sget-object v4, Lcom/yanzhenjie/andserver/AndServer;->INFO:Ljava/lang/String;

    invoke-direct {v2, v4}, Lorg/apache/httpcore/protocol/RequestUserAgent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x3

    aput-object v2, v1, v4

    new-instance v2, Lorg/apache/httpcore/protocol/RequestExpectContinue;

    invoke-direct {v2, v3}, Lorg/apache/httpcore/protocol/RequestExpectContinue;-><init>(Z)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/httpcore/HttpRequestInterceptor;)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mRequestProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

    .line 92
    iput-object p1, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mHostList:Ljava/util/Map;

    return-void
.end method

.method private createSocket(Lorg/apache/httpcore/HttpHost;)Ljava/net/Socket;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    const v1, 0xea60

    .line 147
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    const/4 v1, 0x1

    .line 148
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setReuseAddress(Z)V

    .line 149
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 150
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setKeepAlive(Z)V

    const/16 v2, 0x2000

    .line 151
    invoke-virtual {v0, v2}, Ljava/net/Socket;->setReceiveBufferSize(I)V

    .line 152
    invoke-virtual {v0, v2}, Ljava/net/Socket;->setSendBufferSize(I)V

    const/4 v2, 0x0

    .line 153
    invoke-virtual {v0, v1, v2}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 155
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v2

    .line 156
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    .line 157
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getPort()I

    move-result p1

    .line 159
    invoke-direct {p0, v2, v3, p1}, Lcom/yanzhenjie/andserver/ProxyHandler;->resolveAddress(Ljava/lang/String;Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v4

    const/16 v5, 0x2710

    .line 160
    invoke-virtual {v0, v4, v5}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    const-string v4, "https"

    .line 162
    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 163
    iget-object v2, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, v0, v3, p1, v1}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object p1

    check-cast p1, Ljavax/net/ssl/SSLSocket;

    .line 165
    :try_start_0
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 166
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object p1

    .line 168
    :cond_0
    new-instance v0, Ljavax/net/ssl/SSLHandshakeException;

    const-string v1, "SSL session not available."

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLHandshakeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 171
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 172
    throw v0

    :cond_1
    return-object v0
.end method

.method private resolveAddress(Ljava/lang/String;Ljava/lang/String;I)Ljava/net/InetSocketAddress;
    .locals 1

    if-gez p3, :cond_1

    const-string v0, "http"

    .line 181
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p3, 0x50

    goto :goto_0

    :cond_0
    const-string v0, "https"

    .line 183
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p3, 0x1bb

    .line 187
    :cond_1
    :goto_0
    new-instance p1, Ljava/net/InetSocketAddress;

    invoke-direct {p1, p2, p3}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    return-object p1
.end method


# virtual methods
.method public handle(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Host"

    .line 98
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 99
    invoke-static {v0}, Lorg/apache/httpcore/HttpHost;->create(Ljava/lang/String;)Lorg/apache/httpcore/HttpHost;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/httpcore/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v0

    .line 100
    iget-object v1, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mHostList:Ljava/util/Map;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpHost;

    if-nez v0, :cond_0

    .line 102
    new-instance p3, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getUri()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p3}, Lcom/yanzhenjie/andserver/error/NotFoundException;->getStatusCode()I

    move-result p1

    invoke-interface {p2, p1}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    .line 104
    new-instance p1, Lorg/apache/httpcore/entity/StringEntity;

    invoke-virtual {p3}, Lcom/yanzhenjie/andserver/error/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Lorg/apache/httpcore/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p1}, Lorg/apache/httpcore/HttpResponse;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    return-void

    .line 109
    :cond_0
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->headerIterator()Lorg/apache/httpcore/HeaderIterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 110
    invoke-interface {v1}, Lorg/apache/httpcore/HeaderIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/httpcore/Header;

    invoke-interface {v2}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object v2

    .line 111
    sget-object v3, Lcom/yanzhenjie/andserver/ProxyHandler;->HOP_BY_HOP:Ljava/util/Set;

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 112
    invoke-interface {p1, v2}, Lorg/apache/httpcore/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v1, "http.proxy.conn.client"

    .line 116
    invoke-interface {p3, v1}, Lorg/apache/httpcore/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    .line 117
    invoke-virtual {v1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->isStale()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 118
    :cond_3
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/ProxyHandler;->createSocket(Lorg/apache/httpcore/HttpHost;)Ljava/net/Socket;

    move-result-object v2

    .line 119
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->bind(Ljava/net/Socket;)V

    :cond_4
    const-string v2, "http.connection"

    .line 122
    invoke-interface {p3, v2, v1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "http.target_host"

    .line 123
    invoke-interface {p3, v2, v0}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    iget-object v0, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mHttpExecutor:Lorg/apache/httpcore/protocol/HttpRequestExecutor;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mRequestProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

    invoke-virtual {v0, p1, v2, p3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/protocol/HttpContext;)V

    .line 126
    iget-object v0, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mHttpExecutor:Lorg/apache/httpcore/protocol/HttpRequestExecutor;

    invoke-virtual {v0, p1, v1, p3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->execute(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpClientConnection;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;

    move-result-object p1

    .line 127
    iget-object v0, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mHttpExecutor:Lorg/apache/httpcore/protocol/HttpRequestExecutor;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/ProxyHandler;->mRequestProcessor:Lorg/apache/httpcore/protocol/HttpProcessor;

    invoke-virtual {v0, p2, v1, p3}, Lorg/apache/httpcore/protocol/HttpRequestExecutor;->postProcess(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpProcessor;Lorg/apache/httpcore/protocol/HttpContext;)V

    .line 130
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->headerIterator()Lorg/apache/httpcore/HeaderIterator;

    move-result-object v0

    :cond_5
    :goto_1
    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 131
    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/Header;

    invoke-interface {v1}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object v1

    .line 132
    sget-object v2, Lcom/yanzhenjie/andserver/ProxyHandler;->HOP_BY_HOP:Ljava/util/Set;

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 133
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    goto :goto_1

    .line 137
    :cond_6
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v0

    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setStatusLine(Lorg/apache/httpcore/StatusLine;)V

    .line 138
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getAllHeaders()[Lorg/apache/httpcore/Header;

    move-result-object v0

    invoke-interface {p2, v0}, Lorg/apache/httpcore/HttpResponse;->setHeaders([Lorg/apache/httpcore/Header;)V

    .line 139
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object p1

    invoke-interface {p2, p1}, Lorg/apache/httpcore/HttpResponse;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    .line 141
    sget-object p1, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;

    invoke-virtual {p1, p2, p3}, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;->keepAlive(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)Z

    move-result p1

    .line 142
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const-string p2, "http.proxy.conn.alive"

    invoke-interface {p3, p2, p1}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
