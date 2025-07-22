.class public Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;
.super Ljava/lang/Object;
.source "CommsReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;
    }
.end annotation


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;


# instance fields
.field private clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

.field private clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

.field private current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

.field private in:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;

.field private final lifecycle:Ljava/lang/Object;

.field private log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private recThread:Ljava/lang/Thread;

.field private receiverFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

.field private threadName:Ljava/lang/String;

.field private tokenStore:Lorg/eclipse/paho/client/mqttv3/internal/CommsTokenStore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;Lorg/eclipse/paho/client/mqttv3/internal/ClientState;Lorg/eclipse/paho/client/mqttv3/internal/CommsTokenStore;Ljava/io/InputStream;)V
    .locals 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    .line 43
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 44
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 45
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    .line 50
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    .line 52
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->tokenStore:Lorg/eclipse/paho/client/mqttv3/internal/CommsTokenStore;

    .line 53
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->recThread:Ljava/lang/Thread;

    .line 56
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;

    invoke-direct {v0, p2, p4}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientState;Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->in:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;

    .line 57
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    .line 58
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    .line 59
    iput-object p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->tokenStore:Lorg/eclipse/paho/client/mqttv3/internal/CommsTokenStore;

    .line 60
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object p1

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->setResourceName(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public isReceiving()Z
    .locals 3

    .line 237
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 238
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RECEIVING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 237
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

    .line 223
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 224
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RECEIVING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-ne v1, v2, :cond_1

    .line 225
    :cond_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 223
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

.method public run()V
    .locals 9

    .line 114
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->recThread:Ljava/lang/Thread;

    .line 115
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->threadName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 120
    :try_start_0
    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 119
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_f

    .line 125
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_d

    .line 126
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 125
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_c

    const/4 v0, 0x0

    move-object v2, v0

    .line 128
    :goto_0
    :try_start_3
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-ne v1, v3, :cond_a

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->in:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_d

    if-nez v1, :cond_0

    goto/16 :goto_7

    .line 131
    :cond_0
    :try_start_4
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "run"

    const-string v5, "852"

    invoke-interface {v1, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->in:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->available()I

    move-result v1

    if-lez v1, :cond_1

    .line 133
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1
    :try_end_4
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 134
    :try_start_5
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RECEIVING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 133
    monitor-exit v1

    goto :goto_1

    :catchall_0
    move-exception v3

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v3

    .line 137
    :cond_1
    :goto_1
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->in:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->readMqttWireMessage()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object v1

    .line 138
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v3
    :try_end_6
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 139
    :try_start_7
    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 138
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 143
    :try_start_8
    instance-of v3, v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttAck;

    if-eqz v3, :cond_5

    .line 144
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->tokenStore:Lorg/eclipse/paho/client/mqttv3/internal/CommsTokenStore;

    invoke-virtual {v3, v1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsTokenStore;->getToken(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)Lorg/eclipse/paho/client/mqttv3/MqttToken;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 146
    monitor-enter v2
    :try_end_8
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 151
    :try_start_9
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    check-cast v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttAck;

    invoke-virtual {v3, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->notifyReceivedAck(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttAck;)V

    .line 146
    monitor-exit v2

    goto :goto_3

    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :try_start_a
    throw v1

    .line 153
    :cond_2
    instance-of v3, v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubRec;

    if-nez v3, :cond_4

    instance-of v3, v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubComp;

    if-nez v3, :cond_4

    instance-of v1, v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPubAck;

    if-eqz v1, :cond_3

    goto :goto_2

    .line 162
    :cond_3
    new-instance v1, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/4 v3, 0x6

    invoke-direct {v1, v3}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw v1

    .line 158
    :cond_4
    :goto_2
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "run"

    const-string v5, "857"

    invoke-interface {v1, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_5
    if-eqz v1, :cond_6

    .line 167
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    invoke-virtual {v3, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->notifyReceivedMsg(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)V

    goto :goto_3

    .line 171
    :cond_6
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnected()Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnecting()Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_3

    .line 172
    :cond_7
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Connection is lost."

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_a
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 202
    :cond_8
    :goto_3
    :try_start_b
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_d

    .line 203
    :try_start_c
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 202
    monitor-exit v1

    goto :goto_5

    :catchall_2
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :try_start_d
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_d

    :catchall_3
    move-exception v1

    .line 138
    :try_start_e
    monitor-exit v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    :try_start_f
    throw v1
    :try_end_f
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_f .. :try_end_f} :catch_1
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    :catchall_4
    move-exception v0

    goto/16 :goto_6

    :catch_0
    move-exception v1

    .line 188
    :try_start_10
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v5, "run"

    const-string v6, "853"

    invoke-interface {v3, v4, v5, v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-eq v3, v4, :cond_9

    .line 190
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v3
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    .line 191
    :try_start_11
    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 190
    monitor-exit v3
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 196
    :try_start_12
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v3}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isDisconnecting()Z

    move-result v3

    if-nez v3, :cond_9

    .line 197
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v4, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 v5, 0x7d6d

    invoke-direct {v4, v5, v1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(ILjava/lang/Throwable;)V

    invoke-virtual {v3, v2, v4}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->shutdownConnection(Lorg/eclipse/paho/client/mqttv3/MqttToken;Lorg/eclipse/paho/client/mqttv3/MqttException;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    goto :goto_4

    :catchall_5
    move-exception v0

    .line 190
    :try_start_13
    monitor-exit v3
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    :try_start_14
    throw v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    .line 202
    :cond_9
    :goto_4
    :try_start_15
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_d

    .line 203
    :try_start_16
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 202
    monitor-exit v1

    goto :goto_5

    :catchall_6
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    :try_start_17
    throw v0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_d

    :catch_1
    move-exception v1

    .line 179
    :try_start_18
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v5, "run"

    const-string v6, "856"

    const/4 v7, 0x0

    move-object v8, v1

    invoke-interface/range {v3 .. v8}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 180
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v3
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    .line 181
    :try_start_19
    sget-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 180
    monitor-exit v3
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_9

    .line 184
    :try_start_1a
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->clientComms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v3, v2, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->shutdownConnection(Lorg/eclipse/paho/client/mqttv3/MqttToken;Lorg/eclipse/paho/client/mqttv3/MqttException;)V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4

    .line 202
    :try_start_1b
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_d

    .line 203
    :try_start_1c
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 202
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_8

    .line 206
    :goto_5
    :try_start_1d
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_d

    .line 207
    :try_start_1e
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 206
    monitor-exit v1

    move-object v1, v3

    goto/16 :goto_0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_7

    :try_start_1f
    throw v0
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_d

    :catchall_8
    move-exception v0

    .line 202
    :try_start_20
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_8

    :try_start_21
    throw v0
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_d

    :catchall_9
    move-exception v0

    .line 180
    :try_start_22
    monitor-exit v3
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_9

    :try_start_23
    throw v0
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_4

    .line 202
    :goto_6
    :try_start_24
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_d

    .line 203
    :try_start_25
    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 202
    monitor-exit v1
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_a

    .line 205
    :try_start_26
    throw v0
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_d

    :catchall_a
    move-exception v0

    .line 202
    :try_start_27
    monitor-exit v1
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_a

    :try_start_28
    throw v0
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_d

    .line 211
    :cond_a
    :goto_7
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1

    .line 212
    :try_start_29
    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 211
    monitor-exit v1
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_b

    .line 216
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->recThread:Ljava/lang/Thread;

    .line 218
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "run"

    const-string v3, "854"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_b
    move-exception v0

    .line 211
    :try_start_2a
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_b

    throw v0

    :catchall_c
    move-exception v1

    .line 125
    :try_start_2b
    monitor-exit v0
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_c

    :try_start_2c
    throw v1
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_d

    :catchall_d
    move-exception v0

    .line 211
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1

    .line 212
    :try_start_2d
    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 211
    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_e

    .line 214
    throw v0

    :catchall_e
    move-exception v0

    .line 211
    :try_start_2e
    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_e

    throw v0

    :catchall_f
    move-exception v1

    .line 119
    :try_start_2f
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_f

    goto :goto_9

    :goto_8
    throw v1

    :goto_9
    goto :goto_8
.end method

.method public start(Ljava/lang/String;Ljava/util/concurrent/ExecutorService;)V
    .locals 3

    .line 69
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->threadName:Ljava/lang/String;

    .line 72
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "start"

    const-string v2, "855"

    invoke-interface {p1, v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter p1

    .line 74
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->current_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-ne v0, v1, :cond_1

    .line 75
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    if-nez p2, :cond_0

    .line 77
    new-instance p2, Ljava/lang/Thread;

    invoke-direct {p2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 79
    :cond_0
    invoke-interface {p2, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p2

    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->receiverFuture:Ljava/util/concurrent/Future;

    .line 73
    :cond_1
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    const-wide/16 p1, 0x64

    .line 84
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

    .line 73
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

    .line 93
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 94
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->receiverFuture:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    .line 95
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->receiverFuture:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 98
    :cond_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v3, "stop"

    const-string v4, "850"

    invoke-interface {v1, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 100
    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->target_state:Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver$State;

    .line 93
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->isRunning()Z

    move-result v0

    if-nez v0, :cond_2

    .line 107
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "stop"

    const-string v3, "851"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const-wide/16 v0, 0x64

    .line 104
    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    nop

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 93
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :goto_1
    throw v1

    :goto_2
    goto :goto_1
.end method
