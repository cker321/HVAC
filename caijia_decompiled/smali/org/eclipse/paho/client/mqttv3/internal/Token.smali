.class public Lorg/eclipse/paho/client/mqttv3/internal/Token;
.super Ljava/lang/Object;
.source "Token.java"


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;


# instance fields
.field private callback:Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;

.field private client:Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

.field private volatile completed:Z

.field private exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

.field private key:Ljava/lang/String;

.field private log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field protected message:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

.field private messageID:I

.field private notified:Z

.field private pendingComplete:Z

.field private response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

.field private final responseLock:Ljava/lang/Object;

.field private sent:Z

.field private final sentLock:Ljava/lang/Object;

.field private topics:[Ljava/lang/String;

.field private userContext:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    .line 35
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->pendingComplete:Z

    .line 36
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    .line 38
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    .line 39
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 41
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->message:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    .line 42
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    .line 43
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    .line 44
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->topics:[Ljava/lang/String;

    .line 48
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->client:Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    .line 49
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->callback:Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;

    .line 51
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->userContext:Ljava/lang/Object;

    .line 53
    iput v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->messageID:I

    .line 54
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->notified:Z

    .line 57
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    invoke-interface {v0, p1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->setResourceName(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public checkResult()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 69
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getException()Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 70
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getException()Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v0

    throw v0
.end method

.method public getActionCallback()Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;
    .locals 1

    .line 96
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->callback:Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;

    return-object v0
.end method

.method public getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;
    .locals 1

    .line 281
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->client:Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    return-object v0
.end method

.method public getException()Lorg/eclipse/paho/client/mqttv3/MqttException;
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    return-object v0
.end method

.method public getGrantedQos()[I
    .locals 3

    const/4 v0, 0x0

    new-array v0, v0, [I

    .line 376
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    instance-of v2, v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSuback;

    if-eqz v2, :cond_0

    .line 377
    check-cast v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSuback;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSuback;->getGrantedQos()[I

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 339
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;
    .locals 1

    .line 306
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->message:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    return-object v0
.end method

.method public getMessageID()I
    .locals 1

    .line 61
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->messageID:I

    return v0
.end method

.method public getResponse()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;
    .locals 1

    .line 391
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    return-object v0
.end method

.method public getSessionPresent()Z
    .locals 2

    .line 384
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    instance-of v1, v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnack;

    if-eqz v1, :cond_0

    .line 385
    check-cast v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnack;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnack;->getSessionPresent()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getTopics()[Ljava/lang/String;
    .locals 1

    .line 319
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->topics:[Ljava/lang/String;

    return-object v0
.end method

.method public getUserContext()Ljava/lang/Object;
    .locals 1

    .line 327
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->userContext:Ljava/lang/Object;

    return-object v0
.end method

.method public getWireMessage()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;
    .locals 1

    .line 310
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    return-object v0
.end method

.method public isComplete()Z
    .locals 1

    .line 80
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    return v0
.end method

.method protected isCompletePending()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->pendingComplete:Z

    return v0
.end method

.method protected isInUse()Z
    .locals 1

    .line 88
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->isComplete()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotified()Z
    .locals 1

    .line 349
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->notified:Z

    return v0
.end method

.method protected markComplete(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttException;)V
    .locals 6

    .line 178
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v4, 0x2

    aput-object p2, v2, v4

    const-string v4, "markComplete"

    const-string v5, "404"

    invoke-interface {v0, v1, v4, v5, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 182
    :try_start_0
    instance-of v1, p1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttAck;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 183
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->message:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    .line 185
    :cond_0
    iput-boolean v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->pendingComplete:Z

    .line 186
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    .line 187
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    .line 180
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected notifyComplete()V
    .locals 7

    .line 197
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "notifyComplete"

    const-string v6, "404"

    invoke-interface {v0, v1, v3, v6, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 199
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 204
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->pendingComplete:Z

    if-eqz v1, :cond_0

    .line 205
    iput-boolean v5, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    .line 206
    iput-boolean v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->pendingComplete:Z

    goto :goto_0

    .line 208
    :cond_0
    iput-boolean v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->pendingComplete:Z

    .line 211
    :goto_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 199
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 213
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    monitor-enter v1

    .line 214
    :try_start_1
    iput-boolean v5, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    .line 215
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 213
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    .line 199
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method protected notifySent()V
    .locals 7

    .line 269
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "notifySent"

    const-string v6, "403"

    invoke-interface {v0, v1, v4, v6, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 270
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 271
    :try_start_0
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    .line 272
    iput-boolean v5, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    .line 270
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 274
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    monitor-enter v1

    .line 275
    :try_start_1
    iput-boolean v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    .line 276
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 274
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    .line 270
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method public reset()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 290
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->isInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 295
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "reset"

    const-string v5, "410"

    invoke-interface {v0, v1, v3, v5, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 297
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->client:Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    .line 298
    iput-boolean v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    .line 299
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    .line 300
    iput-boolean v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    .line 301
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    .line 302
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->userContext:Ljava/lang/Object;

    return-void

    .line 292
    :cond_0
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 v1, 0x7dc9

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw v0
.end method

.method public setActionCallback(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->callback:Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;

    return-void
.end method

.method protected setClient(Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;)V
    .locals 0

    .line 285
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->client:Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    return-void
.end method

.method public setException(Lorg/eclipse/paho/client/mqttv3/MqttException;)V
    .locals 1

    .line 343
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 344
    :try_start_0
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    .line 343
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 335
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->key:Ljava/lang/String;

    return-void
.end method

.method public setMessage(Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V
    .locals 0

    .line 315
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->message:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    return-void
.end method

.method public setMessageID(I)V
    .locals 0

    .line 65
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->messageID:I

    return-void
.end method

.method public setNotified(Z)V
    .locals 0

    .line 353
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->notified:Z

    return-void
.end method

.method public setTopics([Ljava/lang/String;)V
    .locals 0

    .line 323
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->topics:[Ljava/lang/String;

    return-void
.end method

.method public setUserContext(Ljava/lang/Object;)V
    .locals 0

    .line 331
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->userContext:Ljava/lang/Object;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 357
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "key="

    .line 358
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, " ,topics="

    .line 359
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getTopics()[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    .line 361
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getTopics()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-lt v1, v2, :cond_0

    goto :goto_1

    .line 362
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getTopics()[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const-string v1, " ,usercontext="

    .line 365
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getUserContext()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v1, " ,isComplete="

    .line 366
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->isComplete()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, " ,isNotified="

    .line 367
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->isNotified()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, " ,exception="

    .line 368
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getException()Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v1, " ,actioncallback="

    .line 369
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getActionCallback()Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 371
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public waitForCompletion()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    .line 100
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->waitForCompletion(J)V

    return-void
.end method

.method public waitForCompletion(J)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 106
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const/4 v3, 0x2

    aput-object p0, v2, v3

    const-string v6, "waitForCompletion"

    const-string v7, "407"

    invoke-interface {v0, v1, v6, v7, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 108
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->waitForResponse(J)Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object p1

    if-nez p1, :cond_1

    .line 109
    iget-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    if-eqz p1, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object p2, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    new-array v0, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    aput-object p0, v0, v5

    const-string v1, "406"

    invoke-interface {p1, p2, v6, v1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 112
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 p2, 0x7d00

    invoke-direct {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    .line 113
    throw p1

    .line 115
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->checkResult()Z

    return-void
.end method

.method protected waitForResponse()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    .line 127
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->waitForResponse(J)Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object v0

    return-object v0
.end method

.method protected waitForResponse(J)Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 134
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "waitForResponse"

    const-string v4, "400"

    const/4 v5, 0x7

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v8, 0x1

    aput-object v6, v5, v8

    iget-boolean v6, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const/4 v9, 0x2

    aput-object v6, v5, v9

    const/4 v6, 0x3

    iget-boolean v10, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    aput-object v10, v5, v6

    const/4 v6, 0x4

    iget-object v10, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    if-nez v10, :cond_0

    const-string v10, "false"

    goto :goto_0

    :cond_0
    const-string v10, "true"

    :goto_0
    aput-object v10, v5, v6

    const/4 v6, 0x5

    iget-object v10, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    aput-object v10, v5, v6

    const/4 v6, 0x6

    aput-object p0, v5, v6

    iget-object v6, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    invoke-interface/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 136
    :cond_1
    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    if-eqz v1, :cond_2

    goto :goto_2

    .line 137
    :cond_2
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, 0x0

    if-nez v1, :cond_4

    .line 140
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const-string v5, "waitForResponse"

    const-string v6, "408"

    new-array v10, v9, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v7

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v8

    invoke-interface {v1, v4, v5, v6, v10}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    cmp-long v1, p1, v2

    if-gtz v1, :cond_3

    .line 143
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    goto :goto_1

    .line 145
    :cond_3
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    invoke-virtual {v1, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 148
    :try_start_2
    new-instance v4, Lorg/eclipse/paho/client/mqttv3/MqttException;

    invoke-direct {v4, v1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(Ljava/lang/Throwable;)V

    iput-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    .line 151
    :cond_4
    :goto_1
    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->completed:Z

    if-nez v1, :cond_1

    .line 152
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    if-nez v1, :cond_5

    cmp-long v1, p1, v2

    if-lez v1, :cond_1

    .line 132
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 166
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object p2, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    new-array v0, v9, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v7

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    aput-object v1, v0, v8

    const-string v1, "waitForResponse"

    const-string v2, "402"

    invoke-interface {p1, p2, v1, v2, v0}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 167
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->response:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    return-object p1

    .line 154
    :cond_5
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "waitForResponse"

    const-string v4, "401"

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    invoke-interface/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 155
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    throw p1

    :catchall_0
    move-exception p1

    .line 132
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public waitUntilSent()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 237
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    monitor-enter v0

    .line 238
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->responseLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 239
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    if-nez v2, :cond_3

    .line 238
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 243
    :catch_0
    :goto_0
    :try_start_2
    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    if-eqz v1, :cond_2

    .line 253
    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sent:Z

    if-nez v1, :cond_1

    .line 254
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    if-nez v1, :cond_0

    const/4 v1, 0x6

    .line 255
    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v1

    throw v1

    .line 257
    :cond_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    throw v1

    .line 237
    :cond_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    .line 246
    :cond_2
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/Token;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "waitUntilSent"

    const-string v4, "409"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v1, v2, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 248
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->sentLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 240
    :cond_3
    :try_start_4
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/Token;->exception:Lorg/eclipse/paho/client/mqttv3/MqttException;

    throw v2

    :catchall_0
    move-exception v2

    .line 238
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v2

    :catchall_1
    move-exception v1

    .line 237
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method
