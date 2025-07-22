.class public Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;
.super Ljava/lang/Object;
.source "CommsCallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;
    }
.end annotation


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;

.field private static final INBOUND_QUEUE_SIZE:I = 0xa


# instance fields
.field private callbackFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private callbackThread:Ljava/lang/Thread;

.field private callbacks:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/String;",
            "Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;",
            ">;"
        }
    .end annotation
.end field

.field private clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

.field private clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

.field private final completeQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lorg/eclipse/paho/client/mqttv3/MqttToken;",
            ">;"
        }
    .end annotation
.end field

.field private current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

.field private final lifecycle:Ljava/lang/Object;

.field private final log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private manualAcks:Z

.field private final messageQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;",
            ">;"
        }
    .end annotation
.end field

.field private mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

.field private reconnectInternalCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;

.field private final spaceAvailable:Ljava/lang/Object;

.field private target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

.field private threadName:Ljava/lang/String;

.field private final workAvailable:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)V
    .locals 2

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    .line 62
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    .line 63
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    .line 69
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    .line 70
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 72
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->manualAcks:Z

    .line 75
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    .line 76
    new-instance v0, Ljava/util/Vector;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    .line 77
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    .line 78
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    .line 79
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object p1

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->setResourceName(Ljava/lang/String;)V

    return-void
.end method

.method private handleActionComplete(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 250
    monitor-enter p1

    .line 252
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "handleActionComplete"

    const-string v3, "705"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v7}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v0, v1, v2, v3, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 253
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->notifyComplete(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 261
    :cond_0
    iget-object v0, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->notifyComplete()V

    .line 263
    iget-object v0, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->isNotified()Z

    move-result v0

    if-nez v0, :cond_2

    .line 266
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    if-eqz v0, :cond_1

    .line 267
    instance-of v0, p1, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;

    if-eqz v0, :cond_1

    .line 268
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 269
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    move-object v1, p1

    check-cast v1, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;

    invoke-interface {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttCallback;->deliveryComplete(Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;)V

    .line 272
    :cond_1
    invoke-virtual {p0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->fireActionEvent(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 276
    :cond_2
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 277
    instance-of v0, p1, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;

    if-eqz v0, :cond_3

    .line 278
    iget-object v0, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v0, v4}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->setNotified(Z)V

    .line 250
    :cond_3
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private handleMessage(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .line 412
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;->getTopicName()Ljava/lang/String;

    move-result-object v0

    .line 415
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    .line 416
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;->getMessageId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/4 v5, 0x1

    aput-object v0, v4, v5

    const-string v6, "handleMessage"

    const-string v7, "713"

    .line 415
    invoke-interface {v1, v2, v6, v7, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 417
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;->getMessageId()I

    move-result v1

    .line 418
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;->getMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object v2

    .line 417
    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->deliverMessage(Ljava/lang/String;ILorg/eclipse/paho/client/mqttv3/MqttMessage;)Z

    .line 420
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->manualAcks:Z

    if-nez v0, :cond_1

    .line 421
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;->getMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getQos()I

    move-result v0

    if-ne v0, v5, :cond_0

    .line 422
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubAck;

    invoke-direct {v1, p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubAck;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;)V

    .line 423
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 422
    invoke-virtual {v0, v1, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->internalSend(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    goto :goto_0

    .line 424
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;->getMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getQos()I

    move-result v0

    if-ne v0, v3, :cond_1

    .line 425
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->deliveryComplete(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;)V

    .line 426
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubComp;

    invoke-direct {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubComp;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;)V

    .line 427
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v1, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    .line 428
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 427
    invoke-virtual {p1, v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->internalSend(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public asyncOperationComplete(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V
    .locals 7

    .line 449
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 451
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 452
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    monitor-enter v0

    .line 454
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "asyncOperationComplete"

    const-string v4, "715"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object p1, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v5, v6

    invoke-interface {v1, v2, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 455
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 452
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 460
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->handleActionComplete(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    .line 465
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const/4 v5, 0x0

    const-string v3, "asyncOperationComplete"

    const-string v4, "719"

    move-object v6, p1

    invoke-interface/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 468
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    const/4 v1, 0x0

    new-instance v2, Lorg/eclipse/paho/client/mqttv3/MqttException;

    invoke-direct {v2, p1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->shutdownConnection(Lorg/eclipse/paho/client/mqttv3/MqttToken;Lorg/eclipse/paho/client/mqttv3/MqttException;)V

    :goto_0
    return-void
.end method

.method public connectionLost(Lorg/eclipse/paho/client/mqttv3/MqttException;)V
    .locals 7

    const-string v0, "connectionLost"

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 301
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    if-eqz v3, :cond_0

    if-eqz p1, :cond_0

    .line 303
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v5, "708"

    new-array v6, v2, [Ljava/lang/Object;

    aput-object p1, v6, v1

    invoke-interface {v3, v4, v0, v5, v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 304
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    invoke-interface {v3, p1}, Lorg/eclipse/paho/client/mqttv3/MqttCallback;->connectionLost(Ljava/lang/Throwable;)V

    .line 306
    :cond_0
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->reconnectInternalCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;

    if-eqz v3, :cond_1

    if-eqz p1, :cond_1

    .line 307
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->reconnectInternalCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;

    invoke-interface {v3, p1}, Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;->connectionLost(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 313
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const-string p1, "720"

    invoke-interface {v3, v4, v0, p1, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected deliverMessage(Ljava/lang/String;ILorg/eclipse/paho/client/mqttv3/MqttMessage;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 501
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 502
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    .line 517
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    if-eqz v0, :cond_1

    if-nez v2, :cond_1

    .line 518
    invoke-virtual {p3, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setId(I)V

    .line 519
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    invoke-interface {p2, p1, p3}, Lorg/eclipse/paho/client/mqttv3/MqttCallback;->messageArrived(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    return v1

    .line 503
    :cond_2
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 505
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    invoke-virtual {v4, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    if-nez v4, :cond_3

    goto :goto_0

    .line 509
    :cond_3
    invoke-static {v3, p1}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->isMatched(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 510
    invoke-virtual {p3, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setId(I)V

    .line 511
    invoke-interface {v4, p1, p3}, Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;->messageArrived(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public fireActionEvent(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V
    .locals 8

    if-eqz p1, :cond_1

    .line 327
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->getActionCallback()Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 329
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->getException()Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string v4, "716"

    const-string v5, "fireActionEvent"

    if-nez v1, :cond_0

    .line 331
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v6, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    .line 332
    iget-object v7, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v7}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v2

    .line 331
    invoke-interface {v1, v6, v5, v4, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 333
    invoke-interface {v0, p1}, Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;->onSuccess(Lorg/eclipse/paho/client/mqttv3/IMqttToken;)V

    goto :goto_0

    .line 336
    :cond_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v6, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    .line 337
    iget-object v7, p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v7}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->getKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v2

    .line 336
    invoke-interface {v1, v6, v5, v4, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 338
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->getException()Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;->onFailure(Lorg/eclipse/paho/client/mqttv3/IMqttToken;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected getThread()Ljava/lang/Thread;
    .locals 1

    .line 479
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackThread:Ljava/lang/Thread;

    return-object v0
.end method

.method public isQuiesced()Z
    .locals 1

    .line 401
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isQuiescing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isQuiescing()Z
    .locals 3

    .line 537
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 538
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->QUIESCING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 537
    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isRunning()Z
    .locals 3

    .line 528
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 529
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->QUIESCING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-ne v1, v2, :cond_1

    .line 530
    :cond_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 528
    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public messageArrived(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;)V
    .locals 5

    .line 354
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 359
    :cond_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    monitor-enter v0

    .line 360
    :catch_0
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isQuiescing()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v2, 0xa

    if-ge v1, v2, :cond_1

    goto :goto_1

    .line 363
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "messageArrived"

    const-string v4, "709"

    invoke-interface {v1, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    const-wide/16 v2, 0xc8

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 359
    :cond_2
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 369
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isQuiescing()Z

    move-result v0

    if-nez v0, :cond_3

    .line 370
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 372
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    monitor-enter p1

    .line 374
    :try_start_3
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "messageArrived"

    const-string v3, "710"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 372
    monitor-exit p1

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    :cond_3
    :goto_2
    return-void

    :catchall_1
    move-exception p1

    .line 359
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public messageArrivedComplete(II)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 436
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubAck;

    invoke-direct {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubAck;-><init>(I)V

    .line 437
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 436
    invoke-virtual {p2, v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->internalSend(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 439
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p2, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->deliveryComplete(I)V

    .line 440
    new-instance p2, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubComp;

    invoke-direct {p2, p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubComp;-><init>(I)V

    .line 441
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    .line 442
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 441
    invoke-virtual {p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->internalSend(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public quiesce()V
    .locals 5

    .line 388
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 389
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-ne v1, v2, :cond_0

    .line 390
    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->QUIESCING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    .line 388
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 392
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    monitor-enter v1

    .line 394
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "quiesce"

    const-string v4, "711"

    invoke-interface {v0, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 392
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

    .line 388
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method public removeMessageListener(Ljava/lang/String;)V
    .locals 1

    .line 489
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public removeMessageListeners()V
    .locals 1

    .line 493
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    return-void
.end method

.method public run()V
    .locals 8

    .line 165
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackThread:Ljava/lang/Thread;

    .line 166
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->threadName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 168
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 169
    :try_start_0
    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    .line 168
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 172
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 241
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 242
    :try_start_1
    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    .line 241
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 244
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackThread:Ljava/lang/Thread;

    return-void

    :catchall_0
    move-exception v1

    .line 241
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 176
    :cond_0
    :try_start_3
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    monitor-enter v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 177
    :try_start_4
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 178
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 180
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "run"

    const-string v5, "704"

    invoke-interface {v2, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    .line 176
    :cond_1
    monitor-exit v0

    goto :goto_1

    :catchall_1
    move-exception v2

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v2
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception v0

    goto/16 :goto_5

    .line 187
    :catch_0
    :goto_1
    :try_start_6
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 190
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    monitor-enter v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 191
    :try_start_7
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 193
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    .line 194
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->removeElementAt(I)V

    goto :goto_2

    :cond_2
    move-object v2, v1

    .line 190
    :goto_2
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    if-eqz v2, :cond_3

    .line 198
    :try_start_8
    invoke-direct {p0, v2}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->handleActionComplete(Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 203
    :cond_3
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    monitor-enter v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 204
    :try_start_9
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 208
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;

    .line 210
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->removeElementAt(I)V

    goto :goto_3

    :cond_4
    move-object v2, v1

    .line 203
    :goto_3
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    if-eqz v2, :cond_5

    .line 214
    :try_start_a
    invoke-direct {p0, v2}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->handleMessage(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_4

    :catchall_3
    move-exception v2

    .line 203
    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :try_start_c
    throw v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :catchall_4
    move-exception v2

    .line 190
    :try_start_d
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :try_start_e
    throw v2

    .line 218
    :cond_5
    :goto_4
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isQuiescing()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 219
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->checkQuiesceLock()Z
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 231
    :cond_6
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    monitor-enter v0

    .line 236
    :try_start_f
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "run"

    const-string v4, "706"

    invoke-interface {v1, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit v0

    goto/16 :goto_0

    :catchall_5
    move-exception v1

    monitor-exit v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    throw v1

    .line 226
    :goto_5
    :try_start_10
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "run"

    const-string v5, "714"

    const/4 v6, 0x0

    move-object v7, v0

    invoke-interface/range {v2 .. v7}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 228
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v3, Lorg/eclipse/paho/client/mqttv3/MqttException;

    invoke-direct {v3, v0}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v2, v1, v3}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->shutdownConnection(Lorg/eclipse/paho/client/mqttv3/MqttToken;Lorg/eclipse/paho/client/mqttv3/MqttException;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 231
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    monitor-enter v0

    .line 236
    :try_start_11
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "run"

    const-string v4, "706"

    invoke-interface {v1, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit v0

    goto/16 :goto_0

    :catchall_6
    move-exception v1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    throw v1

    :catchall_7
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    monitor-enter v1

    .line 236
    :try_start_12
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "run"

    const-string v5, "706"

    invoke-interface {v2, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->spaceAvailable:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    .line 239
    throw v0

    :catchall_8
    move-exception v0

    .line 231
    :try_start_13
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    throw v0

    :catchall_9
    move-exception v1

    .line 168
    :try_start_14
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    goto :goto_7

    :goto_6
    throw v1

    :goto_7
    goto :goto_6
.end method

.method public setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V
    .locals 0

    .line 152
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    return-void
.end method

.method public setClientState(Lorg/eclipse/paho/client/mqttv3/internal/ClientState;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    return-void
.end method

.method public setManualAcks(Z)V
    .locals 0

    .line 160
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->manualAcks:Z

    return-void
.end method

.method public setMessageListener(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V
    .locals 1

    .line 484
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbacks:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setReconnectCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;)V
    .locals 0

    .line 156
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->reconnectInternalCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;

    return-void
.end method

.method public start(Ljava/lang/String;Ljava/util/concurrent/ExecutorService;)V
    .locals 2

    .line 92
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->threadName:Ljava/lang/String;

    .line 94
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter p1

    .line 95
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-ne v0, v1, :cond_1

    .line 98
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->messageQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clear()V

    .line 99
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->completeQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clear()V

    .line 101
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    if-nez p2, :cond_0

    .line 103
    new-instance p2, Ljava/lang/Thread;

    invoke-direct {p2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 105
    :cond_0
    invoke-interface {p2, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p2

    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackFuture:Ljava/util/concurrent/Future;

    .line 94
    :cond_1
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    const-wide/16 p1, 0x64

    .line 110
    :try_start_1
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    nop

    goto :goto_1

    :catchall_0
    move-exception p2

    .line 94
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :goto_2
    throw p2

    :goto_3
    goto :goto_2
.end method

.method public stop()V
    .locals 5

    .line 122
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 123
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackFuture:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    .line 124
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackFuture:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 122
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 127
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 129
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "stop"

    const-string v3, "700"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 131
    :try_start_1
    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback$State;

    .line 130
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 133
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->callbackThread:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 134
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    monitor-enter v0

    .line 137
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "stop"

    const-string v4, "701"

    invoke-interface {v1, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->workAvailable:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 134
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    const-wide/16 v0, 0x64

    .line 142
    :try_start_3
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 143
    :catch_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->notifyQueueLock()V

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 134
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1

    .line 147
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsCallback;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "stop"

    const-string v3, "703"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :catchall_1
    move-exception v1

    .line 130
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1

    :cond_3
    :goto_2
    return-void

    :catchall_2
    move-exception v1

    .line 122
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_4

    :goto_3
    throw v1

    :goto_4
    goto :goto_3
.end method
