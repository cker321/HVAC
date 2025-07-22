.class public Lorg/apache/httpcore/impl/pool/BasicConnFactory;
.super Ljava/lang/Object;
.source "BasicConnFactory.java"

# interfaces
.implements Lorg/apache/httpcore/pool/ConnFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/pool/ConnFactory<",
        "Lorg/apache/httpcore/HttpHost;",
        "Lorg/apache/httpcore/HttpClientConnection;",
        ">;"
    }
.end annotation


# instance fields
.field private final connFactory:Lorg/apache/httpcore/HttpConnectionFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/HttpConnectionFactory<",
            "+",
            "Lorg/apache/httpcore/HttpClientConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final connectTimeout:I

.field private final plainfactory:Ljavax/net/SocketFactory;

.field private final sconfig:Lorg/apache/httpcore/config/SocketConfig;

.field private final sslfactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 135
    sget-object v4, Lorg/apache/httpcore/config/SocketConfig;->DEFAULT:Lorg/apache/httpcore/config/SocketConfig;

    sget-object v5, Lorg/apache/httpcore/config/ConnectionConfig;->DEFAULT:Lorg/apache/httpcore/config/ConnectionConfig;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;ILorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V

    return-void
.end method

.method public constructor <init>(ILorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V
    .locals 6

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 121
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;ILorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V

    return-void
.end method

.method public constructor <init>(Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;ILorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V
    .locals 0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->plainfactory:Ljavax/net/SocketFactory;

    .line 109
    iput-object p2, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sslfactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 110
    iput p3, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->connectTimeout:I

    if-eqz p4, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    sget-object p4, Lorg/apache/httpcore/config/SocketConfig;->DEFAULT:Lorg/apache/httpcore/config/SocketConfig;

    :goto_0
    iput-object p4, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    .line 112
    new-instance p1, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;

    if-eqz p5, :cond_1

    goto :goto_1

    :cond_1
    sget-object p5, Lorg/apache/httpcore/config/ConnectionConfig;->DEFAULT:Lorg/apache/httpcore/config/ConnectionConfig;

    :goto_1
    invoke-direct {p1, p5}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;-><init>(Lorg/apache/httpcore/config/ConnectionConfig;)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->connFactory:Lorg/apache/httpcore/HttpConnectionFactory;

    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Lorg/apache/httpcore/params/HttpParams;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "HTTP params"

    .line 80
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->plainfactory:Ljavax/net/SocketFactory;

    .line 82
    iput-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sslfactory:Ljavax/net/ssl/SSLSocketFactory;

    const-string p1, "http.connection.timeout"

    const/4 v0, 0x0

    .line 83
    invoke-interface {p2, p1, v0}, Lorg/apache/httpcore/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->connectTimeout:I

    .line 84
    invoke-static {p2}, Lorg/apache/httpcore/params/HttpParamConfig;->getSocketConfig(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/SocketConfig;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    .line 85
    new-instance p1, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;

    .line 86
    invoke-static {p2}, Lorg/apache/httpcore/params/HttpParamConfig;->getConnectionConfig(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/ConnectionConfig;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;-><init>(Lorg/apache/httpcore/config/ConnectionConfig;)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->connFactory:Lorg/apache/httpcore/HttpConnectionFactory;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V
    .locals 6

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    .line 128
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;ILorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/params/HttpParams;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 95
    invoke-direct {p0, v0, p1}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Lorg/apache/httpcore/params/HttpParams;)V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/httpcore/impl/pool/BasicConnFactory;)I
    .locals 0

    .line 64
    iget p0, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->connectTimeout:I

    return p0
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    check-cast p1, Lorg/apache/httpcore/HttpHost;

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->create(Lorg/apache/httpcore/HttpHost;)Lorg/apache/httpcore/HttpClientConnection;

    move-result-object p1

    return-object p1
.end method

.method protected create(Ljava/net/Socket;Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/HttpClientConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "http.socket.buffer-size"

    const/16 v1, 0x2000

    .line 143
    invoke-interface {p2, v0, v1}, Lorg/apache/httpcore/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p2

    .line 144
    new-instance v0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    invoke-direct {v0, p2}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;-><init>(I)V

    .line 145
    invoke-virtual {v0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->bind(Ljava/net/Socket;)V

    return-object v0
.end method

.method public create(Lorg/apache/httpcore/HttpHost;)Lorg/apache/httpcore/HttpClientConnection;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    .line 153
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "https"

    if-eqz v2, :cond_1

    .line 154
    iget-object v0, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->plainfactory:Ljavax/net/SocketFactory;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    goto :goto_1

    .line 156
    :cond_1
    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 157
    iget-object v0, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sslfactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_2

    goto :goto_0

    .line 158
    :cond_2
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    .line 162
    :goto_1
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v2

    .line 163
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getPort()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    .line 165
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v4, 0x50

    goto :goto_2

    .line 167
    :cond_3
    invoke-virtual {p1}, Lorg/apache/httpcore/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    const/16 v4, 0x1bb

    .line 171
    :cond_4
    :goto_2
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->getSoTimeout()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 172
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->getSndBufSize()I

    move-result p1

    if-lez p1, :cond_5

    .line 173
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->getSndBufSize()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSendBufferSize(I)V

    .line 175
    :cond_5
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->getRcvBufSize()I

    move-result p1

    if-lez p1, :cond_6

    .line 176
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->getRcvBufSize()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setReceiveBufferSize(I)V

    .line 178
    :cond_6
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->isTcpNoDelay()Z

    move-result p1

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 179
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->getSoLinger()I

    move-result p1

    if-ltz p1, :cond_7

    const/4 v1, 0x1

    .line 181
    invoke-virtual {v0, v1, p1}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 183
    :cond_7
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->sconfig:Lorg/apache/httpcore/config/SocketConfig;

    invoke-virtual {p1}, Lorg/apache/httpcore/config/SocketConfig;->isSoKeepAlive()Z

    move-result p1

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 186
    new-instance p1, Ljava/net/InetSocketAddress;

    invoke-direct {p1, v2, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 188
    :try_start_0
    new-instance v1, Lorg/apache/httpcore/impl/pool/BasicConnFactory$1;

    invoke-direct {v1, p0, v0, p1}, Lorg/apache/httpcore/impl/pool/BasicConnFactory$1;-><init>(Lorg/apache/httpcore/impl/pool/BasicConnFactory;Ljava/net/Socket;Ljava/net/InetSocketAddress;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    iget-object p1, p0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;->connFactory:Lorg/apache/httpcore/HttpConnectionFactory;

    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpConnectionFactory;->createConnection(Ljava/net/Socket;)Lorg/apache/httpcore/HttpConnection;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/HttpClientConnection;

    return-object p1

    :catch_0
    move-exception p1

    .line 196
    invoke-virtual {p1}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "method contract violation only checked exceptions are wrapped: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    invoke-virtual {p1}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 196
    invoke-static {v0, v1}, Lorg/apache/httpcore/util/Asserts;->check(ZLjava/lang/String;)V

    .line 199
    invoke-virtual {p1}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Ljava/io/IOException;

    throw p1

    .line 160
    :cond_8
    new-instance p1, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " scheme is not supported"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
