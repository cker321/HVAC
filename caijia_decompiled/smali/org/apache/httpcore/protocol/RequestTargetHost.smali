.class public Lorg/apache/httpcore/protocol/RequestTargetHost;
.super Ljava/lang/Object;
.source "RequestTargetHost.java"

# interfaces
.implements Lorg/apache/httpcore/HttpRequestInterceptor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP request"

    .line 62
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 64
    invoke-static {p2}, Lorg/apache/httpcore/protocol/HttpCoreContext;->adapt(Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/protocol/HttpCoreContext;

    move-result-object p2

    .line 66
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/RequestLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    .line 67
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "CONNECT"

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const-string v1, "Host"

    .line 72
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 73
    invoke-virtual {p2}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getTargetHost()Lorg/apache/httpcore/HttpHost;

    move-result-object v2

    if-nez v2, :cond_3

    .line 75
    invoke-virtual {p2}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getConnection()Lorg/apache/httpcore/HttpConnection;

    move-result-object p2

    .line 76
    instance-of v3, p2, Lorg/apache/httpcore/HttpInetConnection;

    if-eqz v3, :cond_1

    .line 79
    check-cast p2, Lorg/apache/httpcore/HttpInetConnection;

    invoke-interface {p2}, Lorg/apache/httpcore/HttpInetConnection;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 80
    invoke-interface {p2}, Lorg/apache/httpcore/HttpInetConnection;->getRemotePort()I

    move-result p2

    if-eqz v3, :cond_1

    .line 82
    new-instance v2, Lorg/apache/httpcore/HttpHost;

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Lorg/apache/httpcore/HttpHost;-><init>(Ljava/lang/String;I)V

    :cond_1
    if-nez v2, :cond_3

    .line 86
    sget-object p1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    .line 89
    :cond_2
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    const-string p2, "Target host missing"

    invoke-direct {p1, p2}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 92
    :cond_3
    invoke-virtual {v2}, Lorg/apache/httpcore/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v1, p2}, Lorg/apache/httpcore/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    return-void
.end method
