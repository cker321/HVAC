.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModuleFactory;
.super Ljava/lang/Object;
.source "WebSocketNetworkModuleFactory.java"

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
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 43
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 44
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/16 v0, 0x50

    const/16 v4, 0x50

    goto :goto_0

    :cond_0
    move v4, v0

    .line 48
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v0

    if-nez v0, :cond_1

    .line 50
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    goto :goto_1

    .line 51
    :cond_1
    instance-of v1, v0, Ljavax/net/ssl/SSLSocketFactory;

    if-nez v1, :cond_2

    :goto_1
    move-object v1, v0

    .line 54
    new-instance v7, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    .line 55
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getCustomWebSocketHeaders()Ljava/util/Properties;

    move-result-object v6

    move-object v0, v7

    move-object v5, p3

    .line 54
    invoke-direct/range {v0 .. v6}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;-><init>(Ljavax/net/SocketFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Properties;)V

    .line 56
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result p1

    invoke-virtual {v7, p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->setConnectTimeout(I)V

    return-object v7

    :cond_2
    const/16 p1, 0x7d69

    .line 52
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

    const-string v1, "ws"

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
