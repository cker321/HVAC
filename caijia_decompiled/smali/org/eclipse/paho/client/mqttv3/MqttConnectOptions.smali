.class public Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;
.super Ljava/lang/Object;
.source "MqttConnectOptions.java"


# static fields
.field public static final CLEAN_SESSION_DEFAULT:Z = true

.field public static final CONNECTION_TIMEOUT_DEFAULT:I = 0x1e

.field public static final KEEP_ALIVE_INTERVAL_DEFAULT:I = 0x3c

.field public static final MAX_INFLIGHT_DEFAULT:I = 0xa

.field public static final MQTT_VERSION_3_1:I = 0x3

.field public static final MQTT_VERSION_3_1_1:I = 0x4

.field public static final MQTT_VERSION_DEFAULT:I


# instance fields
.field private automaticReconnect:Z

.field private cleanSession:Z

.field private connectionTimeout:I

.field private customWebSocketHeaders:Ljava/util/Properties;

.field private executorServiceTimeout:I

.field private httpsHostnameVerificationEnabled:Z

.field private keepAliveInterval:I

.field private maxInflight:I

.field private maxReconnectDelay:I

.field private mqttVersion:I

.field private password:[C

.field private serverURIs:[Ljava/lang/String;

.field private socketFactory:Ljavax/net/SocketFactory;

.field private sslClientProps:Ljava/util/Properties;

.field private sslHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private userName:Ljava/lang/String;

.field private willDestination:Ljava/lang/String;

.field private willMessage:Lorg/eclipse/paho/client/mqttv3/MqttMessage;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3c

    .line 60
    iput v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->keepAliveInterval:I

    const/16 v0, 0xa

    .line 61
    iput v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->maxInflight:I

    const/4 v0, 0x0

    .line 62
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willDestination:Ljava/lang/String;

    .line 63
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willMessage:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    .line 67
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->sslClientProps:Ljava/util/Properties;

    const/4 v1, 0x1

    .line 68
    iput-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->httpsHostnameVerificationEnabled:Z

    .line 69
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->sslHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 70
    iput-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->cleanSession:Z

    const/16 v2, 0x1e

    .line 71
    iput v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->connectionTimeout:I

    .line 72
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->serverURIs:[Ljava/lang/String;

    const/4 v2, 0x0

    .line 73
    iput v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->mqttVersion:I

    .line 74
    iput-boolean v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->automaticReconnect:Z

    const v2, 0x1f400

    .line 75
    iput v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->maxReconnectDelay:I

    .line 76
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->customWebSocketHeaders:Ljava/util/Properties;

    .line 79
    iput v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->executorServiceTimeout:I

    return-void
.end method

.method private validateWill(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    .line 204
    invoke-static {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->validate(Ljava/lang/String;Z)V

    return-void

    .line 201
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method


# virtual methods
.method public getConnectionTimeout()I
    .locals 1

    .line 308
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->connectionTimeout:I

    return v0
.end method

.method public getCustomWebSocketHeaders()Ljava/util/Properties;
    .locals 1

    .line 697
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->customWebSocketHeaders:Ljava/util/Properties;

    return-object v0
.end method

.method public getDebug()Ljava/util/Properties;
    .locals 4

    .line 665
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 666
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getMqttVersion()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "MqttVersion"

    invoke-virtual {v0, v2, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isCleanSession()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "CleanSession"

    invoke-virtual {v0, v2, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ConTimeout"

    invoke-virtual {v0, v2, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 669
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getKeepAliveInterval()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "KeepAliveInterval"

    invoke-virtual {v0, v2, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 670
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getUserName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "null"

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getUserName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    const-string v3, "UserName"

    invoke-virtual {v0, v3, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getWillDestination()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    move-object v1, v2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getWillDestination()Ljava/lang/String;

    move-result-object v1

    :goto_1
    const-string v3, "WillDestination"

    invoke-virtual {v0, v3, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v1

    const-string v3, "SocketFactory"

    if-nez v1, :cond_2

    .line 673
    invoke-virtual {v0, v3, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 675
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    :goto_2
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLProperties()Ljava/util/Properties;

    move-result-object v1

    const-string v3, "SSLProperties"

    if-nez v1, :cond_3

    .line 678
    invoke-virtual {v0, v3, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 680
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3
    return-object v0
.end method

.method public getExecutorServiceTimeout()I
    .locals 1

    .line 646
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->executorServiceTimeout:I

    return v0
.end method

.method public getKeepAliveInterval()I
    .locals 1

    .line 235
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->keepAliveInterval:I

    return v0
.end method

.method public getMaxInflight()I
    .locals 1

    .line 281
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->maxInflight:I

    return v0
.end method

.method public getMaxReconnectDelay()I
    .locals 1

    .line 144
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->maxReconnectDelay:I

    return v0
.end method

.method public getMqttVersion()I
    .locals 1

    .line 245
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->mqttVersion:I

    return v0
.end method

.method public getPassword()[C
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->password:[C

    return-object v0
.end method

.method public getSSLHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    .line 472
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->sslHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public getSSLProperties()Ljava/util/Properties;
    .locals 1

    .line 378
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->sslClientProps:Ljava/util/Properties;

    return-object v0
.end method

.method public getServerURIs()[Ljava/lang/String;
    .locals 1

    .line 534
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->serverURIs:[Ljava/lang/String;

    return-object v0
.end method

.method public getSocketFactory()Ljavax/net/SocketFactory;
    .locals 1

    .line 335
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getWillDestination()Ljava/lang/String;
    .locals 1

    .line 358
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willDestination:Ljava/lang/String;

    return-object v0
.end method

.method public getWillMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;
    .locals 1

    .line 369
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willMessage:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    return-object v0
.end method

.method public isAutomaticReconnect()Z
    .locals 1

    .line 622
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->automaticReconnect:Z

    return v0
.end method

.method public isCleanSession()Z
    .locals 1

    .line 497
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->cleanSession:Z

    return v0
.end method

.method public isHttpsHostnameVerificationEnabled()Z
    .locals 1

    .line 459
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->httpsHostnameVerificationEnabled:Z

    return v0
.end method

.method public setAutomaticReconnect(Z)V
    .locals 0

    .line 642
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->automaticReconnect:Z

    return-void
.end method

.method public setCleanSession(Z)V
    .locals 0

    .line 525
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->cleanSession:Z

    return-void
.end method

.method public setConnectionTimeout(I)V
    .locals 0

    if-ltz p1, :cond_0

    .line 325
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->connectionTimeout:I

    return-void

    .line 323
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public setCustomWebSocketHeaders(Ljava/util/Properties;)V
    .locals 0

    .line 693
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->customWebSocketHeaders:Ljava/util/Properties;

    return-void
.end method

.method public setExecutorServiceTimeout(I)V
    .locals 0

    .line 657
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->executorServiceTimeout:I

    return-void
.end method

.method public setHttpsHostnameVerificationEnabled(Z)V
    .locals 0

    .line 463
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->httpsHostnameVerificationEnabled:Z

    return-void
.end method

.method public setKeepAliveInterval(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    if-ltz p1, :cond_0

    .line 270
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->keepAliveInterval:I

    return-void

    .line 268
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public setMaxInflight(I)V
    .locals 0

    if-ltz p1, :cond_0

    .line 298
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->maxInflight:I

    return-void

    .line 296
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public setMaxReconnectDelay(I)V
    .locals 0

    .line 154
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->maxReconnectDelay:I

    return-void
.end method

.method public setMqttVersion(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    if-eqz p1, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    goto :goto_0

    .line 608
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 609
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "An incorrect version was used \""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\". Acceptable version options are "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p1, 0x0

    .line 610
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " and "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 608
    invoke-direct {v2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 612
    :cond_1
    :goto_0
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->mqttVersion:I

    return-void
.end method

.method public setPassword([C)V
    .locals 0

    .line 116
    invoke-virtual {p1}, [C->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [C

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->password:[C

    return-void
.end method

.method public setSSLHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 0

    .line 487
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->sslHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public setSSLProperties(Ljava/util/Properties;)V
    .locals 0

    .line 455
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->sslClientProps:Ljava/util/Properties;

    return-void
.end method

.method public setServerURIs([Ljava/lang/String;)V
    .locals 3

    .line 588
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    .line 591
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->serverURIs:[Ljava/lang/String;

    return-void

    .line 588
    :cond_0
    aget-object v2, p1, v1

    .line 589
    invoke-static {v2}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->validateURI(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public setSocketFactory(Ljavax/net/SocketFactory;)V
    .locals 0

    .line 348
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->socketFactory:Ljavax/net/SocketFactory;

    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0

    .line 135
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->userName:Ljava/lang/String;

    return-void
.end method

.method protected setWill(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;IZ)V
    .locals 0

    .line 220
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willDestination:Ljava/lang/String;

    .line 221
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willMessage:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    .line 222
    invoke-virtual {p2, p3}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setQos(I)V

    .line 223
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willMessage:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-virtual {p1, p4}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setRetained(Z)V

    .line 225
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->willMessage:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setMutable(Z)V

    return-void
.end method

.method public setWill(Ljava/lang/String;[BIZ)V
    .locals 1

    .line 192
    invoke-direct {p0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->validateWill(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-direct {v0, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;-><init>([B)V

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setWill(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;IZ)V

    return-void
.end method

.method public setWill(Lorg/eclipse/paho/client/mqttv3/MqttTopic;[BIZ)V
    .locals 1

    .line 172
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->getName()Ljava/lang/String;

    move-result-object p1

    .line 173
    invoke-direct {p0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->validateWill(Ljava/lang/String;Ljava/lang/Object;)V

    .line 174
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-direct {v0, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;-><init>([B)V

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setWill(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;IZ)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 701
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getDebug()Ljava/util/Properties;

    move-result-object v0

    const-string v1, "Connection options"

    invoke-static {v0, v1}, Lorg/eclipse/paho/client/mqttv3/util/Debug;->dumpProperties(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
