.class public Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;
.super Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;
.source "SSLNetworkModule.java"


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;


# instance fields
.field private enabledCiphers:[Ljava/lang/String;

.field private handshakeTimeoutSecs:I

.field private host:Ljava/lang/String;

.field private hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private httpsHostnameVerificationEnabled:Z

.field private log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private port:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 68
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;-><init>(Ljavax/net/SocketFactory;Ljava/lang/String;ILjava/lang/String;)V

    .line 42
    sget-object p1, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->CLASS_NAME:Ljava/lang/String;

    const-string v0, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v0, p1}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object p1

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->httpsHostnameVerificationEnabled:Z

    .line 69
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->host:Ljava/lang/String;

    .line 70
    iput p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->port:I

    .line 71
    invoke-interface {p1, p4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->setResourceName(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getEnabledCiphers()[Ljava/lang/String;
    .locals 1

    .line 80
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    return-object v0
.end method

.method public getSSLHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    .line 116
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public getServerURI()Ljava/lang/String;
    .locals 2

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ssl://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isHttpsHostnameVerificationEnabled()Z
    .locals 1

    .line 124
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->httpsHostnameVerificationEnabled:Z

    return v0
.end method

.method public setEnabledCiphers([Ljava/lang/String;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 92
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    .line 94
    :cond_0
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    if-eqz p1, :cond_4

    .line 95
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->isLoggable(I)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x0

    const-string v0, ""

    const/4 v1, 0x0

    .line 97
    :goto_0
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    array-length v2, v2

    if-lt v1, v2, :cond_1

    .line 104
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->CLASS_NAME:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, p1

    const-string p1, "setEnabledCiphers"

    const-string v0, "260"

    invoke-interface {v1, v2, p1, v0, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    if-lez v1, :cond_2

    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ","

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 101
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    aget-object v0, v0, v1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 106
    :cond_3
    :goto_1
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    check-cast p1, Ljavax/net/ssl/SSLSocket;

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    :cond_4
    return-void
.end method

.method public setHttpsHostnameVerificationEnabled(Z)V
    .locals 0

    .line 128
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->httpsHostnameVerificationEnabled:Z

    return-void
.end method

.method public setSSLHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public setSSLhandshakeTimeout(I)V
    .locals 0

    .line 111
    invoke-super {p0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;->setConnectTimeout(I)V

    .line 112
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->handshakeTimeoutSecs:I

    return-void
.end method

.method public start()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 132
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;->start()V

    .line 133
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->enabledCiphers:[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setEnabledCiphers([Ljava/lang/String;)V

    .line 134
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getSoTimeout()I

    move-result v0

    .line 136
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    iget v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->handshakeTimeoutSecs:I

    mul-int/lit16 v2, v2, 0x3e8

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 140
    :try_start_0
    new-instance v1, Ljavax/net/ssl/SSLParameters;

    invoke-direct {v1}, Ljavax/net/ssl/SSLParameters;-><init>()V

    .line 141
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 142
    new-instance v3, Ljavax/net/ssl/SNIHostName;

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->host:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljavax/net/ssl/SNIHostName;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLParameters;->setServerNames(Ljava/util/List;)V

    .line 144
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v1}, Ljavax/net/ssl/SSLSocket;->setSSLParameters(Ljavax/net/ssl/SSLParameters;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 150
    :goto_0
    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->httpsHostnameVerificationEnabled:Z

    if-eqz v1, :cond_0

    .line 152
    :try_start_1
    new-instance v1, Ljavax/net/ssl/SSLParameters;

    invoke-direct {v1}, Ljavax/net/ssl/SSLParameters;-><init>()V

    const-string v2, "HTTPS"

    .line 153
    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLParameters;->setEndpointIdentificationAlgorithm(Ljava/lang/String;)V

    .line 154
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2, v1}, Ljavax/net/ssl/SSLSocket;->setSSLParameters(Ljavax/net/ssl/SSLParameters;)V
    :try_end_1
    .catch Ljava/lang/NoSuchMethodError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    nop

    .line 159
    :cond_0
    :goto_1
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 160
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->httpsHostnameVerificationEnabled:Z

    if-nez v1, :cond_2

    .line 161
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v1

    .line 162
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->host:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_2

    .line 163
    :cond_1
    invoke-interface {v1}, Ljavax/net/ssl/SSLSession;->invalidate()V

    .line 164
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 165
    new-instance v0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Host: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->host:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", Peer Host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljavax/net/ssl/SSLSession;->getPeerHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_2
    :goto_2
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->socket:Ljava/net/Socket;

    invoke-virtual {v1, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    return-void
.end method
