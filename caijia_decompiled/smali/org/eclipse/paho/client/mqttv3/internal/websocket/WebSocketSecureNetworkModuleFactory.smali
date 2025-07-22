.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModuleFactory;
.super Ljava/lang/Object;
.source "WebSocketSecureNetworkModuleFactory.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createNetworkModule(Ljava/net/URI;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 46
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 47
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/16 v0, 0x1bb

    const/16 v4, 0x1bb

    goto :goto_0

    :cond_0
    move v4, v0

    .line 51
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v0

    const/4 v7, 0x0

    if-nez v0, :cond_2

    .line 54
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;-><init>()V

    .line 55
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLProperties()Ljava/util/Properties;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 57
    invoke-virtual {v0, v1, v7}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->initialize(Ljava/util/Properties;Ljava/lang/String;)V

    .line 59
    :cond_1
    invoke-virtual {v0, v7}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->createSocketFactory(Ljava/lang/String;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    move-object v8, v0

    move-object v0, v1

    goto :goto_1

    .line 61
    :cond_2
    instance-of v1, v0, Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v1, :cond_4

    move-object v8, v7

    .line 66
    :goto_1
    new-instance v9, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;

    move-object v1, v0

    check-cast v1, Ljavax/net/ssl/SSLSocketFactory;

    .line 67
    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getCustomWebSocketHeaders()Ljava/util/Properties;

    move-result-object v6

    move-object v0, v9

    move-object v5, p3

    .line 66
    invoke-direct/range {v0 .. v6}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;-><init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Properties;)V

    .line 68
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result p1

    invoke-virtual {v9, p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->setSSLhandshakeTimeout(I)V

    .line 69
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object p1

    invoke-virtual {v9, p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->setSSLHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 70
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isHttpsHostnameVerificationEnabled()Z

    move-result p1

    invoke-virtual {v9, p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->setHttpsHostnameVerificationEnabled(Z)V

    if-eqz v8, :cond_3

    .line 73
    invoke-virtual {v8, v7}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->getEnabledCipherSuites(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 75
    invoke-virtual {v9, p1}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setEnabledCiphers([Ljava/lang/String;)V

    :cond_3
    return-object v9

    :cond_4
    const/16 p1, 0x7d69

    .line 62
    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object p1

    throw p1
.end method

.method public getSupportedUriSchemes()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "wss"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public validateURI(Ljava/net/URI;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    return-void
.end method
