.class public Lorg/eclipse/paho/client/mqttv3/MqttClient;
.super Ljava/lang/Object;
.source "MqttClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/IMqttClient;


# instance fields
.field protected aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

.field protected timeToWait:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 138
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/persist/MqttDefaultFilePersistence;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/persist/MqttDefaultFilePersistence;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const-wide/16 v0, -0x1

    .line 64
    iput-wide v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->timeToWait:J

    .line 227
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-direct {v0, p1, p2, p3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const-wide/16 v0, -0x1

    .line 64
    iput-wide v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->timeToWait:J

    .line 317
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    new-instance v6, Lorg/eclipse/paho/client/mqttv3/ScheduledExecutorPingSender;

    invoke-direct {v6, p4}, Lorg/eclipse/paho/client/mqttv3/ScheduledExecutorPingSender;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    move-object v2, v0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    return-void
.end method

.method public static generateClientId()Ljava/lang/String;
    .locals 1

    .line 703
    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->generateClientId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 613
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->close(Z)V

    return-void
.end method

.method public close(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 620
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->close(Z)V

    return-void
.end method

.method public connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 324
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)V

    return-void
.end method

.method public connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 331
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getTimeToWait()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion(J)V

    return-void
.end method

.method public connectWithResult(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 338
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    .line 339
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getTimeToWait()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion(J)V

    return-object p1
.end method

.method public disconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 347
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnect()Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion()V

    return-void
.end method

.method public disconnect(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 354
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnect(JLjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion()V

    return-void
.end method

.method public disconnectForcibly()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 363
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnectForcibly()V

    return-void
.end method

.method public disconnectForcibly(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 372
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnectForcibly(J)V

    return-void
.end method

.method public disconnectForcibly(JJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 381
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnectForcibly(JJ)V

    return-void
.end method

.method public disconnectForcibly(JJZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 397
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    move-wide v1, p1

    move-wide v3, p3

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnectForcibly(JJZ)V

    return-void
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    .line 629
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentServerURI()Ljava/lang/String;
    .locals 1

    .line 658
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getCurrentServerURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDebug()Lorg/eclipse/paho/client/mqttv3/util/Debug;
    .locals 1

    .line 719
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getDebug()Lorg/eclipse/paho/client/mqttv3/util/Debug;

    move-result-object v0

    return-object v0
.end method

.method public getPendingDeliveryTokens()[Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    .locals 1

    .line 636
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getPendingDeliveryTokens()[Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;

    move-result-object v0

    return-object v0
.end method

.method public getServerURI()Ljava/lang/String;
    .locals 1

    .line 643
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getServerURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimeToWait()J
    .locals 2

    .line 606
    iget-wide v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->timeToWait:J

    return-wide v0
.end method

.method public getTopic(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    .locals 1

    .line 665
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getTopic(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/MqttTopic;

    move-result-object p1

    return-object p1
.end method

.method public isConnected()Z
    .locals 1

    .line 672
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->isConnected()Z

    move-result v0

    return v0
.end method

.method public messageArrivedComplete(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 690
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->messageArrivedComplete(II)V

    return-void
.end method

.method public publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttPersistenceException;
        }
    .end annotation

    .line 570
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;

    move-result-object p1

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getTimeToWait()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;->waitForCompletion(J)V

    return-void
.end method

.method public publish(Ljava/lang/String;[BIZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttPersistenceException;
        }
    .end annotation

    .line 559
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-direct {v0, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;-><init>([B)V

    .line 560
    invoke-virtual {v0, p3}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setQos(I)V

    .line 561
    invoke-virtual {v0, p4}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setRetained(Z)V

    .line 562
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V

    return-void
.end method

.method public reconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 711
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnect()V

    return-void
.end method

.method public setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V
    .locals 1

    .line 679
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V

    return-void
.end method

.method public setManualAcks(Z)V
    .locals 1

    .line 686
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->setManualAcks(Z)V

    return-void
.end method

.method public setTimeToWait(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    .line 597
    iput-wide p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->timeToWait:J

    return-void

    .line 595
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public subscribe(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput v0, p1, v2

    .line 404
    invoke-virtual {p0, v1, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I)V

    return-void
.end method

.method public subscribe(Ljava/lang/String;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput p2, p1, v2

    .line 422
    invoke-virtual {p0, v1, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I)V

    return-void
.end method

.method public subscribe(Ljava/lang/String;ILorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput p2, p1, v2

    new-array p2, v0, [Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    aput-object p3, p2, v2

    .line 454
    invoke-virtual {p0, v1, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V

    return-void
.end method

.method public subscribe(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput v0, p1, v2

    new-array v0, v0, [Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    aput-object p2, v0, v2

    .line 436
    invoke-virtual {p0, v1, p1, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V

    return-void
.end method

.method public subscribe([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 411
    array-length v0, p1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v0, :cond_0

    .line 415
    invoke-virtual {p0, p1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I)V

    return-void

    :cond_0
    const/4 v3, 0x1

    .line 413
    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public subscribe([Ljava/lang/String;[I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 429
    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V

    return-void
.end method

.method public subscribe([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 459
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    .line 460
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getTimeToWait()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion(J)V

    .line 461
    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->getGrantedQos()[I

    move-result-object p1

    const/4 p3, 0x0

    const/4 v0, 0x0

    .line 462
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_2

    .line 465
    array-length p1, p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    aget p1, p2, p3

    const/16 p2, 0x80

    if-eq p1, p2, :cond_0

    goto :goto_1

    .line 466
    :cond_0
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttException;

    invoke-direct {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw p1

    :cond_1
    :goto_1
    return-void

    .line 463
    :cond_2
    aget v1, p1, v0

    aput v1, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public subscribe([Ljava/lang/String;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 443
    array-length v0, p1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v0, :cond_0

    .line 447
    invoke-virtual {p0, p1, v1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V

    return-void

    :cond_0
    const/4 v3, 0x1

    .line 445
    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public subscribeWithResponse(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput v0, p1, v2

    .line 474
    invoke-virtual {p0, v1, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribeWithResponse(Ljava/lang/String;I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput p2, p1, v2

    .line 488
    invoke-virtual {p0, v1, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribeWithResponse(Ljava/lang/String;ILorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput p2, p1, v2

    new-array p2, v0, [Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    aput-object p3, p2, v2

    .line 496
    invoke-virtual {p0, v1, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribeWithResponse(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-array p1, v0, [I

    aput v0, p1, v2

    new-array v0, v0, [Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    aput-object p2, v0, v2

    .line 481
    invoke-virtual {p0, v1, p1, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribeWithResponse([Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 503
    array-length v0, p1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v0, :cond_0

    .line 507
    invoke-virtual {p0, p1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v3, 0x1

    .line 505
    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public subscribeWithResponse([Ljava/lang/String;[I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 526
    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribeWithResponse([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 534
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    .line 535
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getTimeToWait()J

    move-result-wide p2

    invoke-interface {p1, p2, p3}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion(J)V

    return-object p1
.end method

.method public subscribeWithResponse([Ljava/lang/String;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 515
    array-length v0, p1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v0, :cond_0

    .line 519
    invoke-virtual {p0, p1, v1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribeWithResponse([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v3, 0x1

    .line 517
    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 543
    invoke-virtual {p0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->unsubscribe([Ljava/lang/String;)V

    return-void
.end method

.method public unsubscribe([Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 551
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->aClient:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->unsubscribe([Ljava/lang/String;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getTimeToWait()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->waitForCompletion(J)V

    return-void
.end method
