.class public Lcom/landleaf/smarthome/net/mqtt/MqttClient;
.super Ljava/lang/Object;
.source "MqttClient.java"


# static fields
.field private static volatile singleton:Lcom/landleaf/smarthome/net/mqtt/MqttClient;


# instance fields
.field private context:Landroid/content/Context;

.field private mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/landleaf/smarthome/net/mqtt/MqttClient;)Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    return-object p0
.end method

.method static synthetic access$100(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->reconnect(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttClient;
    .locals 2

    .line 31
    sget-object v0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    if-nez v0, :cond_1

    .line 32
    const-class v0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    monitor-enter v0

    .line 33
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    if-nez v1, :cond_0

    .line 34
    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    invoke-direct {v1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;-><init>()V

    sput-object v1, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    .line 36
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 38
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    return-object v0
.end method

.method private reconnect(Ljava/lang/String;)V
    .locals 1

    const-string v0, "reconnect \u91cd\u8fde"

    .line 90
    invoke-static {v0}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->disConnect()V

    .line 92
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->connect(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized connect(Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    .line 42
    :try_start_0
    invoke-virtual {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->isConnect()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    if-eqz v0, :cond_1

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->disConnect()V

    .line 45
    :cond_1
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;-><init>()V

    const/4 v1, 0x1

    .line 47
    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setCleanSession(Z)V

    const-string v2, "admin"

    .line 48
    invoke-virtual {v0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setUserName(Ljava/lang/String;)V

    const-string v2, "public"

    .line 49
    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setPassword([C)V

    const/16 v2, 0xa

    .line 51
    invoke-virtual {v0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setConnectionTimeout(I)V

    const/16 v2, 0x14

    .line 53
    invoke-virtual {v0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setKeepAliveInterval(I)V

    .line 55
    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setAutomaticReconnect(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :try_start_1
    new-instance v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const-string v2, "tcp://47.103.96.246:9883"

    new-instance v3, Lorg/eclipse/paho/client/mqttv3/persist/MemoryPersistence;

    invoke-direct {v3}, Lorg/eclipse/paho/client/mqttv3/persist/MemoryPersistence;-><init>()V

    invoke-direct {v1, v2, p1, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V

    iput-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v2, 0x0

    .line 58
    new-instance v3, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;

    invoke-direct {v3, p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    .line 77
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

    invoke-direct {v1, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 79
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 80
    invoke-direct {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->reconnect(Ljava/lang/String;)V

    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8fde\u63a5\u5931\u8d25"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public disConnect()V
    .locals 1

    .line 185
    :try_start_0
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnect()Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    .line 187
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->close()V

    const/4 v0, 0x0

    .line 188
    iput-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 191
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public isConnect()Z
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 123
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->isConnected()Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 125
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return v1
.end method

.method public publishMessage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 141
    :try_start_0
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;-><init>()V

    .line 142
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setPayload([B)V

    .line 143
    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    if-eqz v1, :cond_0

    .line 144
    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/screen/service/screen/to/cloud/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    new-instance v3, Lcom/landleaf/smarthome/net/mqtt/MqttClient$3;

    invoke-direct {v3, p0, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttClient$3;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V

    invoke-virtual {v1, p1, v0, v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 157
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public publishUploadMessage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 163
    :try_start_0
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;-><init>()V

    .line 164
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setPayload([B)V

    .line 165
    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    if-eqz v1, :cond_0

    .line 166
    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/screen/upload/screen/to/cloud/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    new-instance v3, Lcom/landleaf/smarthome/net/mqtt/MqttClient$4;

    invoke-direct {v3, p0, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttClient$4;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V

    invoke-virtual {v1, p1, v0, v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 179
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public subscribeTopic(Ljava/lang/String;)V
    .locals 4

    const-string v0, "subscribeTopic \u8ba2\u9605topic"

    .line 99
    invoke-static {v0}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    .line 101
    :try_start_0
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->mqtAsyncClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/screen/service/cloud/to/screen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-instance v3, Lcom/landleaf/smarthome/net/mqtt/MqttClient$2;

    invoke-direct {v3, p0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient$2;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;)V

    invoke-virtual {v0, p1, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe(Ljava/lang/String;ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 114
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method
