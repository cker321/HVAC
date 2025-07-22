.class public Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModuleFactory;
.super Ljava/lang/Object;
.source "SSLNetworkModuleFactory.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createNetworkModule(Ljava/net/URI;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 46
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 47
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const/16 v1, 0x22b3

    .line 51
    :cond_0
    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 52
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 53
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 55
    :cond_2
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object p1

    const/4 v2, 0x0

    if-nez p1, :cond_4

    .line 59
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;

    invoke-direct {p1}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;-><init>()V

    .line 60
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLProperties()Ljava/util/Properties;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 62
    invoke-virtual {p1, v3, v2}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->initialize(Ljava/util/Properties;Ljava/lang/String;)V

    .line 64
    :cond_3
    invoke-virtual {p1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->createSocketFactory(Ljava/lang/String;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    move-object v5, v3

    move-object v3, p1

    move-object p1, v5

    goto :goto_1

    .line 69
    :cond_4
    instance-of v3, p1, Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v3, :cond_6

    move-object v3, v2

    .line 74
    :goto_1
    new-instance v4, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;

    check-cast p1, Ljavax/net/ssl/SSLSocketFactory;

    invoke-direct {v4, p1, v0, v1, p3}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;-><init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/lang/String;ILjava/lang/String;)V

    .line 75
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result p1

    invoke-virtual {v4, p1}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setSSLhandshakeTimeout(I)V

    .line 76
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object p1

    invoke-virtual {v4, p1}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setSSLHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 77
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isHttpsHostnameVerificationEnabled()Z

    move-result p1

    invoke-virtual {v4, p1}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setHttpsHostnameVerificationEnabled(Z)V

    if-eqz v3, :cond_5

    .line 80
    invoke-virtual {v3, v2}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->getEnabledCipherSuites(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 82
    invoke-virtual {v4, p1}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setEnabledCiphers([Ljava/lang/String;)V

    :cond_5
    return-object v4

    :cond_6
    const/16 p1, 0x7d69

    .line 70
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

    .line 31
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "ssl"

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
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 36
    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 37
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method
