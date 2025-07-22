.class public final Lorg/apache/httpcore/params/HttpParamConfig;
.super Ljava/lang/Object;
.source "HttpParamConfig.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getConnectionConfig(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/ConnectionConfig;
    .locals 3

    .line 66
    invoke-static {p0}, Lorg/apache/httpcore/params/HttpParamConfig;->getMessageConstraints(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/MessageConstraints;

    move-result-object v0

    const-string v1, "http.protocol.element-charset"

    .line 67
    invoke-interface {p0, v1}, Lorg/apache/httpcore/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 68
    invoke-static {}, Lorg/apache/httpcore/config/ConnectionConfig;->custom()Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v2

    if-eqz v1, :cond_0

    .line 69
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setCharset(Ljava/nio/charset/Charset;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v1

    const-string v2, "http.malformed.input.action"

    .line 71
    invoke-interface {p0, v2}, Lorg/apache/httpcore/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/charset/CodingErrorAction;

    .line 70
    invoke-virtual {v1, v2}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setMalformedInputAction(Ljava/nio/charset/CodingErrorAction;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v1

    const-string v2, "http.unmappable.input.action"

    .line 73
    invoke-interface {p0, v2}, Lorg/apache/httpcore/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/nio/charset/CodingErrorAction;

    .line 72
    invoke-virtual {v1, p0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setMalformedInputAction(Ljava/nio/charset/CodingErrorAction;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object p0

    .line 74
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setMessageConstraints(Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->build()Lorg/apache/httpcore/config/ConnectionConfig;

    move-result-object p0

    return-object p0
.end method

.method public static getMessageConstraints(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/MessageConstraints;
    .locals 3

    .line 59
    invoke-static {}, Lorg/apache/httpcore/config/MessageConstraints;->custom()Lorg/apache/httpcore/config/MessageConstraints$Builder;

    move-result-object v0

    const/4 v1, -0x1

    const-string v2, "http.connection.max-header-count"

    .line 60
    invoke-interface {p0, v2, v1}, Lorg/apache/httpcore/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/httpcore/config/MessageConstraints$Builder;->setMaxHeaderCount(I)Lorg/apache/httpcore/config/MessageConstraints$Builder;

    move-result-object v0

    const-string v2, "http.connection.max-line-length"

    .line 61
    invoke-interface {p0, v2, v1}, Lorg/apache/httpcore/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p0

    invoke-virtual {v0, p0}, Lorg/apache/httpcore/config/MessageConstraints$Builder;->setMaxLineLength(I)Lorg/apache/httpcore/config/MessageConstraints$Builder;

    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lorg/apache/httpcore/config/MessageConstraints$Builder;->build()Lorg/apache/httpcore/config/MessageConstraints;

    move-result-object p0

    return-object p0
.end method

.method public static getSocketConfig(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/SocketConfig;
    .locals 3

    .line 49
    invoke-static {}, Lorg/apache/httpcore/config/SocketConfig;->custom()Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "http.socket.timeout"

    .line 50
    invoke-interface {p0, v2, v1}, Lorg/apache/httpcore/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoTimeout(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v0

    const-string v2, "http.socket.reuseaddr"

    .line 51
    invoke-interface {p0, v2, v1}, Lorg/apache/httpcore/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoReuseAddress(Z)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v0

    const-string v2, "http.socket.keepalive"

    .line 52
    invoke-interface {p0, v2, v1}, Lorg/apache/httpcore/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoKeepAlive(Z)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v0

    const-string v1, "http.socket.linger"

    const/4 v2, -0x1

    .line 53
    invoke-interface {p0, v1, v2}, Lorg/apache/httpcore/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setSoLinger(I)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object v0

    const-string v1, "http.tcp.nodelay"

    const/4 v2, 0x1

    .line 54
    invoke-interface {p0, v1, v2}, Lorg/apache/httpcore/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result p0

    invoke-virtual {v0, p0}, Lorg/apache/httpcore/config/SocketConfig$Builder;->setTcpNoDelay(Z)Lorg/apache/httpcore/config/SocketConfig$Builder;

    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lorg/apache/httpcore/config/SocketConfig$Builder;->build()Lorg/apache/httpcore/config/SocketConfig;

    move-result-object p0

    return-object p0
.end method
