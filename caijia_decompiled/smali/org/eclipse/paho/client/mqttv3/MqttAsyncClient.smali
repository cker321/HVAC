.class public Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;
.super Ljava/lang/Object;
.source "MqttAsyncClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;,
        Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectCallback;,
        Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;
    }
.end annotation


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;

.field private static final CLIENT_ID_PREFIX:Ljava/lang/String; = "paho"

.field private static final DISCONNECT_TIMEOUT:J = 0x2710L

.field private static final MAX_HIGH_SURROGATE:C = '\udbff'

.field private static final MIN_HIGH_SURROGATE:C = '\ud800'

.field private static final QUIESCE_TIMEOUT:J = 0x7530L

.field private static final clientLock:Ljava/lang/Object;

.field private static reconnectDelay:I


# instance fields
.field private clientId:Ljava/lang/String;

.field protected comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

.field private connOpts:Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

.field private executorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

.field private persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

.field private reconnectTimer:Ljava/util/Timer;

.field private reconnecting:Z

.field private serverURI:Ljava/lang/String;

.field private topics:Ljava/util/Hashtable;

.field private userContext:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 96
    const-class v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/16 v0, 0x3e8

    .line 113
    sput v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectDelay:I

    .line 116
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 212
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/persist/MqttDefaultFilePersistence;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/persist/MqttDefaultFilePersistence;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 317
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/TimerPingSender;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/TimerPingSender;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 322
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 438
    invoke-direct/range {v0 .. v6}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;Ljava/util/concurrent/ScheduledExecutorService;Lorg/eclipse/paho/client/mqttv3/internal/HighResolutionTimer;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;Ljava/util/concurrent/ScheduledExecutorService;Lorg/eclipse/paho/client/mqttv3/internal/HighResolutionTimer;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    move-object v6, p0

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    .line 553
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v4, v3}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v3

    iput-object v3, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v4, 0x0

    .line 115
    iput-boolean v4, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnecting:Z

    .line 558
    invoke-interface {v3, p2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->setResourceName(Ljava/lang/String;)V

    if-eqz v1, :cond_5

    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 565
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    if-lt v3, v7, :cond_3

    const v3, 0xffff

    if-gt v5, v3, :cond_2

    .line 574
    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->validateURI(Ljava/lang/String;)V

    .line 576
    iput-object v0, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->serverURI:Ljava/lang/String;

    .line 577
    iput-object v1, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    .line 579
    iput-object v2, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    if-nez v2, :cond_0

    .line 581
    new-instance v3, Lorg/eclipse/paho/client/mqttv3/persist/MemoryPersistence;

    invoke-direct {v3}, Lorg/eclipse/paho/client/mqttv3/persist/MemoryPersistence;-><init>()V

    iput-object v3, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    :cond_0
    if-nez p6, :cond_1

    .line 585
    new-instance v3, Lorg/eclipse/paho/client/mqttv3/internal/SystemHighResolutionTimer;

    invoke-direct {v3}, Lorg/eclipse/paho/client/mqttv3/internal/SystemHighResolutionTimer;-><init>()V

    move-object v7, p5

    move-object v5, v3

    goto :goto_1

    :cond_1
    move-object v7, p5

    move-object/from16 v5, p6

    .line 588
    :goto_1
    iput-object v7, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->executorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 591
    iget-object v3, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v7, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v1, v9, v4

    aput-object v0, v9, v8

    const/4 v4, 0x2

    aput-object v2, v9, v4

    const-string v2, "MqttAsyncClient"

    const-string v4, "101"

    invoke-interface {v3, v7, v2, v4, v9}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 593
    iget-object v2, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    invoke-interface {v2, p2, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;->open(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    new-instance v7, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v2, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    iget-object v4, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->executorService:Ljava/util/concurrent/ScheduledExecutorService;

    move-object v0, v7

    move-object v1, p0

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;-><init>(Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/MqttPingSender;Ljava/util/concurrent/ExecutorService;Lorg/eclipse/paho/client/mqttv3/internal/HighResolutionTimer;)V

    iput-object v7, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    .line 595
    iget-object v0, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    invoke-interface {v0}, Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;->close()V

    .line 596
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, v6, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->topics:Ljava/util/Hashtable;

    return-void

    .line 571
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ClientId longer than 65535 characters"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    move-object v7, p5

    .line 566
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->Character_isHighSurrogate(C)Z

    move-result v9

    if-eqz v9, :cond_4

    add-int/lit8 v3, v3, 0x1

    :cond_4
    add-int/lit8 v5, v5, 0x1

    add-int/2addr v3, v8

    goto :goto_0

    .line 561
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null clientId"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method protected static Character_isHighSurrogate(C)Z
    .locals 1

    const v0, 0xd800

    if-lt p0, v0, :cond_0

    const v0, 0xdbff

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic access$0(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;
    .locals 0

    .line 97
    iget-object p0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    return-object p0
.end method

.method static synthetic access$1()Ljava/lang/String;
    .locals 1

    .line 96
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$10()Ljava/lang/Object;
    .locals 1

    .line 116
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$11(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Ljava/util/Timer;
    .locals 0

    .line 112
    iget-object p0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectTimer:Ljava/util/Timer;

    return-object p0
.end method

.method static synthetic access$2(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)V
    .locals 0

    .line 1423
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->attemptReconnect()V

    return-void
.end method

.method static synthetic access$3(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Z)V
    .locals 0

    .line 115
    iput-boolean p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnecting:Z

    return-void
.end method

.method static synthetic access$4(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)V
    .locals 0

    .line 1438
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->startReconnectCycle()V

    return-void
.end method

.method static synthetic access$5(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)V
    .locals 0

    .line 1446
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->stopReconnectCycle()V

    return-void
.end method

.method static synthetic access$6()I
    .locals 1

    .line 113
    sget v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectDelay:I

    return v0
.end method

.method static synthetic access$7(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;
    .locals 0

    .line 110
    iget-object p0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connOpts:Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    return-object p0
.end method

.method static synthetic access$8(I)V
    .locals 0

    .line 113
    sput p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectDelay:I

    return-void
.end method

.method static synthetic access$9(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Ljava/lang/String;
    .locals 0

    .line 104
    iget-object p0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    return-object p0
.end method

.method private attemptReconnect()V
    .locals 7

    .line 1426
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "attemptReconnect"

    const-string v4, "500"

    invoke-interface {v0, v1, v3, v4, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1428
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connOpts:Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->userContext:Ljava/lang/Object;

    new-instance v2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;

    invoke-direct {v2, p0, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;-><init>(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/MqttSecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v6, v0

    .line 1434
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v5, 0x0

    const-string v3, "attemptReconnect"

    const-string v4, "804"

    invoke-interface/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v6, v0

    .line 1431
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v5, 0x0

    const-string v3, "attemptReconnect"

    const-string v4, "804"

    invoke-interface/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private createNetworkModule(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .line 660
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "createNetworkModule"

    const-string v4, "115"

    invoke-interface {v0, v1, v3, v4, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 663
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->createInstance(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    move-result-object p1

    return-object p1
.end method

.method public static generateClientId()Ljava/lang/String;
    .locals 3

    .line 1298
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "paho"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getHostName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x3a

    .line 669
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/16 v0, 0x2f

    .line 671
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    :cond_0
    if-ne v0, v1, :cond_1

    .line 674
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    :cond_1
    const/4 v1, 0x0

    .line 676
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private startReconnectCycle()V
    .locals 5

    .line 1441
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget v3, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectDelay:I

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-string v3, "startReconnectCycle"

    const-string v4, "503"

    invoke-interface {v0, v1, v3, v4, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1442
    new-instance v0, Ljava/util/Timer;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MQTT Reconnect: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectTimer:Ljava/util/Timer;

    .line 1443
    new-instance v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;-><init>(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;)V

    sget v2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectDelay:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    return-void
.end method

.method private stopReconnectCycle()V
    .locals 5

    .line 1449
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "stopReconnectCycle"

    const-string v4, "504"

    invoke-interface {v0, v1, v3, v4, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1450
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1451
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connOpts:Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isAutomaticReconnect()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1452
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectTimer:Ljava/util/Timer;

    if-eqz v1, :cond_0

    .line 1453
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    const/4 v1, 0x0

    .line 1454
    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectTimer:Ljava/util/Timer;

    :cond_0
    const/16 v1, 0x3e8

    .line 1456
    sput v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnectDelay:I

    .line 1450
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private subscribeBase([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 1069
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v1, 0x5

    invoke-interface {v0, v1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->isLoggable(I)Z

    move-result v0

    const-string v1, "subscribe"

    if-eqz v0, :cond_2

    .line 1070
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 1071
    :goto_0
    array-length v4, p1

    if-lt v3, v4, :cond_0

    .line 1078
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v4, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v2

    const/4 v0, 0x1

    aput-object p3, v5, v0

    const/4 v0, 0x2

    aput-object p4, v5, v0

    const-string v0, "106"

    invoke-interface {v3, v4, v1, v0, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    if-lez v3, :cond_1

    const-string v4, ", "

    .line 1073
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_1
    const-string v4, "topic="

    .line 1075
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    aget-object v4, p1, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v4, " qos="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    aget v4, p2, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1081
    :cond_2
    :goto_1
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 1082
    invoke-virtual {v0, p4}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setActionCallback(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)V

    .line 1083
    invoke-virtual {v0, p3}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setUserContext(Ljava/lang/Object;)V

    .line 1084
    iget-object p3, v0, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {p3, p1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->setTopics([Ljava/lang/String;)V

    .line 1086
    new-instance p3, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSubscribe;

    invoke-direct {p3, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSubscribe;-><init>([Ljava/lang/String;[I)V

    .line 1088
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p1, p3, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->sendNoWait(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 1090
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object p2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string p3, "109"

    invoke-interface {p1, p2, v1, p3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public checkPing(Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 999
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "ping"

    const-string v2, "117"

    invoke-interface {p1, v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1001
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->checkForActivity(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/MqttToken;

    move-result-object p1

    .line 1003
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "118"

    invoke-interface {p2, v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1603
    invoke-virtual {p0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->close(Z)V

    return-void
.end method

.method public close(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 1614
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "close"

    const-string v3, "113"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1615
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->close(Z)V

    .line 1617
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "114"

    invoke-interface {p1, v0, v2, v1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public connect()Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 697
    invoke-virtual {p0, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object v0

    return-object v0
.end method

.method public connect(Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .line 688
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;-><init>()V

    invoke-virtual {p0, v0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 708
    invoke-virtual {p0, p1, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .line 722
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnected()Z

    move-result v0

    if-nez v0, :cond_7

    .line 725
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_6

    .line 728
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isDisconnecting()Z

    move-result v0

    if-nez v0, :cond_5

    .line 731
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isClosed()Z

    move-result v0

    if-nez v0, :cond_4

    if-nez p1, :cond_0

    .line 735
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    invoke-direct {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;-><init>()V

    :cond_0
    move-object v4, p1

    .line 737
    iput-object v4, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->connOpts:Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    .line 738
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->userContext:Ljava/lang/Object;

    .line 739
    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isAutomaticReconnect()Z

    move-result p1

    .line 743
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Object;

    .line 744
    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isCleanSession()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v9, 0x0

    aput-object v3, v2, v9

    const/4 v3, 0x1

    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x2

    .line 745
    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getKeepAliveInterval()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x3

    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getUserName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x4

    .line 746
    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getPassword()[C

    move-result-object v5

    const-string v6, "[null]"

    const-string v7, "[notnull]"

    if-nez v5, :cond_1

    move-object v5, v6

    goto :goto_0

    :cond_1
    move-object v5, v7

    :goto_0
    aput-object v5, v2, v3

    const/4 v3, 0x5

    .line 747
    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getWillMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object v5

    if-nez v5, :cond_2

    goto :goto_1

    :cond_2
    move-object v6, v7

    :goto_1
    aput-object v6, v2, v3

    const/4 v3, 0x6

    aput-object p2, v2, v3

    const/4 v3, 0x7

    aput-object p3, v2, v3

    const-string v3, "connect"

    const-string v5, "103"

    .line 743
    invoke-interface {v0, v1, v3, v5, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 748
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->serverURI:Ljava/lang/String;

    invoke-virtual {p0, v1, v4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->createNetworkModules(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)[Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setNetworkModules([Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;)V

    .line 749
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectCallback;

    invoke-direct {v1, p0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectCallback;-><init>(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Z)V

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setReconnectCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;)V

    .line 753
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 754
    new-instance v10, Lorg/eclipse/paho/client/mqttv3/internal/ConnectActionListener;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    .line 755
    iget-boolean v8, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->reconnecting:Z

    move-object v0, v10

    move-object v1, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    .line 754
    invoke-direct/range {v0 .. v8}, Lorg/eclipse/paho/client/mqttv3/internal/ConnectActionListener;-><init>(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Lorg/eclipse/paho/client/mqttv3/MqttToken;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;Z)V

    .line 756
    invoke-virtual {p1, v10}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setActionCallback(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)V

    .line 757
    invoke-virtual {p1, p0}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setUserContext(Ljava/lang/Object;)V

    .line 761
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    instance-of p3, p2, Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;

    if-eqz p3, :cond_3

    .line 762
    check-cast p2, Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;

    invoke-virtual {v10, p2}, Lorg/eclipse/paho/client/mqttv3/internal/ConnectActionListener;->setMqttCallbackExtended(Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;)V

    .line 765
    :cond_3
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p2, v9}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setNetworkModuleIndex(I)V

    .line 766
    invoke-virtual {v10}, Lorg/eclipse/paho/client/mqttv3/internal/ConnectActionListener;->connect()V

    return-object p1

    .line 732
    :cond_4
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 p2, 0x7d6f

    invoke-direct {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw p1

    .line 729
    :cond_5
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 p2, 0x7d66

    invoke-direct {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw p1

    .line 726
    :cond_6
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 p2, 0x7d6e

    invoke-direct {p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw p1

    :cond_7
    const/16 p1, 0x7d64

    .line 723
    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object p1

    throw p1
.end method

.method protected createNetworkModules(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)[Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .line 627
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const-string v5, "createNetworkModules"

    const-string v6, "116"

    invoke-interface {v0, v1, v5, v6, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 630
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getServerURIs()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v4

    goto :goto_0

    .line 634
    :cond_0
    array-length v1, v0

    if-nez v1, :cond_1

    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v4

    .line 640
    :cond_1
    :goto_0
    array-length p1, v0

    new-array p1, p1, [Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    .line 641
    :goto_1
    array-length v1, v0

    if-lt v4, v1, :cond_2

    .line 645
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "108"

    invoke-interface {p2, v0, v5, v1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    .line 642
    :cond_2
    aget-object v1, v0, v4

    invoke-direct {p0, v1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->createNetworkModule(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    move-result-object v1

    aput-object v1, p1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method public deleteBufferedMessage(I)V
    .locals 1

    .line 1582
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->deleteBufferedMessage(I)V

    return-void
.end method

.method public disconnect()Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 788
    invoke-virtual {p0, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnect(Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object v0

    return-object v0
.end method

.method public disconnect(J)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 797
    invoke-virtual {p0, p1, p2, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnect(JLjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public disconnect(JLjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 810
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    const-string v3, "disconnect"

    const-string v4, "104"

    invoke-interface {v0, v1, v3, v4, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 812
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 813
    invoke-virtual {v0, p4}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setActionCallback(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)V

    .line 814
    invoke-virtual {v0, p3}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setUserContext(Ljava/lang/Object;)V

    .line 816
    new-instance p3, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;

    invoke-direct {p3}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;-><init>()V

    .line 818
    :try_start_0
    iget-object p4, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p4, p3, p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->disconnect(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;JLorg/eclipse/paho/client/mqttv3/MqttToken;)V
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    .line 825
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object p2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string p3, "108"

    invoke-interface {p1, p2, v3, p3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :catch_0
    move-exception p1

    .line 821
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v4, 0x0

    const-string v2, "disconnect"

    const-string v3, "105"

    move-object v5, p1

    invoke-interface/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 822
    throw p1
.end method

.method public disconnect(Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const-wide/16 v0, 0x7530

    .line 779
    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnect(JLjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public disconnectForcibly()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const-wide/16 v0, 0x7530

    const-wide/16 v2, 0x2710

    .line 836
    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnectForcibly(JJ)V

    return-void
.end method

.method public disconnectForcibly(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const-wide/16 v0, 0x7530

    .line 846
    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->disconnectForcibly(JJ)V

    return-void
.end method

.method public disconnectForcibly(JJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 857
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->disconnectForcibly(JJ)V

    return-void
.end method

.method public disconnectForcibly(JJZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 881
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    move-wide v1, p1

    move-wide v3, p3

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->disconnectForcibly(JJZ)V

    return-void
.end method

.method public getBufferedMessage(I)Lorg/eclipse/paho/client/mqttv3/MqttMessage;
    .locals 1

    .line 1572
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getBufferedMessage(I)Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object p1

    return-object p1
.end method

.method public getBufferedMessageCount()I
    .locals 1

    .line 1561
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getBufferedMessageCount()I

    move-result v0

    return v0
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    .line 899
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentServerURI()Ljava/lang/String;
    .locals 2

    .line 924
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getNetworkModules()[Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getNetworkModuleIndex()I

    move-result v1

    aget-object v0, v0, v1

    invoke-interface {v0}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;->getServerURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDebug()Lorg/eclipse/paho/client/mqttv3/util/Debug;
    .locals 3

    .line 1627
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/util/Debug;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/util/Debug;-><init>(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)V

    return-object v0
.end method

.method public getInFlightMessageCount()I
    .locals 1

    .line 1594
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getActualInFlight()I

    move-result v0

    return v0
.end method

.method public getPendingDeliveryTokens()[Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    .locals 1

    .line 1308
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getPendingDeliveryTokens()[Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;

    move-result-object v0

    return-object v0
.end method

.method public getServerURI()Ljava/lang/String;
    .locals 1

    .line 908
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->serverURI:Ljava/lang/String;

    return-object v0
.end method

.method protected getTopic(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    .locals 2

    const/4 v0, 0x0

    .line 976
    invoke-static {p1, v0}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->validate(Ljava/lang/String;Z)V

    .line 978
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->topics:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/paho/client/mqttv3/MqttTopic;

    if-nez v0, :cond_0

    .line 980
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttTopic;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-direct {v0, p1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;-><init>(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)V

    .line 981
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->topics:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    .line 890
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnected()Z

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

    .line 1280
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->messageArrivedComplete(II)V

    return-void
.end method

.method public publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttPersistenceException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1348
    invoke-virtual {p0, p1, p2, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;

    move-result-object p1

    return-object p1
.end method

.method public publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttPersistenceException;
        }
    .end annotation

    .line 1363
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v4, 0x1

    aput-object p3, v2, v4

    const/4 v5, 0x2

    aput-object p4, v2, v5

    const-string v5, "publish"

    const-string v6, "111"

    invoke-interface {v0, v1, v5, v6, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1366
    invoke-static {p1, v3}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->validate(Ljava/lang/String;Z)V

    .line 1368
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;-><init>(Ljava/lang/String;)V

    .line 1369
    invoke-virtual {v0, p4}, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;->setActionCallback(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)V

    .line 1370
    invoke-virtual {v0, p3}, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;->setUserContext(Ljava/lang/Object;)V

    .line 1371
    invoke-virtual {v0, p2}, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;->setMessage(Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V

    .line 1372
    iget-object p3, v0, Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    new-array p4, v4, [Ljava/lang/String;

    aput-object p1, p4, v3

    invoke-virtual {p3, p4}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->setTopics([Ljava/lang/String;)V

    .line 1374
    new-instance p3, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;

    invoke-direct {p3, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttPublish;-><init>(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V

    .line 1375
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p1, p3, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->sendNoWait(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 1378
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object p2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string p3, "112"

    invoke-interface {p1, p2, v5, p3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public publish(Ljava/lang/String;[BIZ)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttPersistenceException;
        }
    .end annotation

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 1336
    invoke-virtual/range {v0 .. v6}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->publish(Ljava/lang/String;[BIZLjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;

    move-result-object p1

    return-object p1
.end method

.method public publish(Ljava/lang/String;[BIZLjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttPersistenceException;
        }
    .end annotation

    .line 1321
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-direct {v0, p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;-><init>([B)V

    .line 1322
    invoke-virtual {v0, p3}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setQos(I)V

    .line 1323
    invoke-virtual {v0, p4}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->setRetained(Z)V

    .line 1324
    invoke-virtual {p0, p1, v0, p5, p6}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->publish(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;

    move-result-object p1

    return-object p1
.end method

.method public reconnect()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 1392
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->clientId:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "reconnect"

    const-string v4, "500"

    invoke-interface {v0, v1, v3, v4, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1395
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnected()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1398
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1401
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isDisconnecting()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1404
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1408
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->stopReconnectCycle()V

    .line 1410
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->attemptReconnect()V

    return-void

    .line 1405
    :cond_0
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 v1, 0x7d6f

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw v0

    .line 1402
    :cond_1
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 v1, 0x7d66

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw v0

    .line 1399
    :cond_2
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttException;

    const/16 v1, 0x7d6e

    invoke-direct {v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttException;-><init>(I)V

    throw v0

    :cond_3
    const/16 v0, 0x7d64

    .line 1396
    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v0

    throw v0
.end method

.method public removeMessage(Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 1257
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->removeMessage(Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;)Z

    move-result p1

    return p1
.end method

.method public setBufferOpts(Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;)V
    .locals 2

    .line 1552
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v1, Lorg/eclipse/paho/client/mqttv3/internal/DisconnectedMessageBuffer;

    invoke-direct {v1, p1}, Lorg/eclipse/paho/client/mqttv3/internal/DisconnectedMessageBuffer;-><init>(Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setDisconnectedMessageBuffer(Lorg/eclipse/paho/client/mqttv3/internal/DisconnectedMessageBuffer;)V

    return-void
.end method

.method public setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V
    .locals 1

    .line 1266
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->mqttCallback:Lorg/eclipse/paho/client/mqttv3/MqttCallback;

    .line 1267
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V

    return-void
.end method

.method public setManualAcks(Z)V
    .locals 1

    .line 1276
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setManualAcks(Z)V

    return-void
.end method

.method public subscribe(Ljava/lang/String;I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
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

    const/4 p2, 0x0

    .line 1027
    invoke-virtual {p0, v1, p1, p2, p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribe(Ljava/lang/String;ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
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

    .line 1017
    invoke-virtual {p0, v1, p1, p3, p4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribe(Ljava/lang/String;ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v2, v1

    new-array v3, v0, [I

    aput p2, v3, v1

    new-array v6, v0, [Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    aput-object p5, v6, v1

    move-object v1, p0

    move-object v4, p3

    move-object v5, p4

    .line 1105
    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribe(Ljava/lang/String;ILorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v2, v1

    new-array v3, v0, [I

    aput p2, v3, v1

    new-array v6, v0, [Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;

    aput-object p3, v6, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    .line 1117
    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribe([Ljava/lang/String;[I)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1037
    invoke-virtual {p0, p1, p2, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 1050
    array-length v0, p1

    array-length v1, p2

    if-ne v0, v1, :cond_1

    .line 1055
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    .line 1061
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribeBase([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1

    .line 1055
    :cond_0
    aget-object v2, p1, v1

    const/4 v3, 0x1

    .line 1057
    invoke-static {v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->validate(Ljava/lang/String;Z)V

    .line 1058
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v3, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->removeMessageListener(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1051
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    if-eqz p5, :cond_0

    .line 1135
    array-length v0, p5

    array-length v1, p2

    if-ne v0, v1, :cond_5

    :cond_0
    array-length v0, p2

    array-length v1, p1

    if-ne v0, v1, :cond_5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1140
    :goto_0
    array-length v2, p1

    if-lt v1, v2, :cond_2

    .line 1152
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribeBase([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p2

    .line 1155
    array-length p3, p1

    :goto_1
    if-ge v0, p3, :cond_1

    aget-object p4, p1, v0

    .line 1156
    iget-object p5, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p5, p4}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->removeMessageListener(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1158
    :cond_1
    throw p2

    .line 1141
    :cond_2
    aget-object v2, p1, v1

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->validate(Ljava/lang/String;Z)V

    if-eqz p5, :cond_4

    .line 1142
    aget-object v2, p5, v1

    if-nez v2, :cond_3

    goto :goto_2

    .line 1146
    :cond_3
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    aget-object v3, p1, v1

    aget-object v4, p5, v1

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setMessageListener(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)V

    goto :goto_3

    .line 1143
    :cond_4
    :goto_2
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    aget-object v3, p1, v1

    invoke-virtual {v2, v3}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->removeMessageListener(Ljava/lang/String;)V

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1136
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method public subscribe([Ljava/lang/String;[I[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 1129
    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->subscribe([Ljava/lang/String;[ILjava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;[Lorg/eclipse/paho/client/mqttv3/IMqttMessageListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public unsubscribe(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
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

    const/4 p1, 0x0

    .line 1184
    invoke-virtual {p0, v0, p1, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->unsubscribe([Ljava/lang/String;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public unsubscribe(Ljava/lang/String;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
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

    .line 1173
    invoke-virtual {p0, v0, p2, p3}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->unsubscribe([Ljava/lang/String;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public unsubscribe([Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1195
    invoke-virtual {p0, p1, v0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->unsubscribe([Ljava/lang/String;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;

    move-result-object p1

    return-object p1
.end method

.method public unsubscribe([Ljava/lang/String;Ljava/lang/Object;Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)Lorg/eclipse/paho/client/mqttv3/IMqttToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 1211
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v1, 0x5

    invoke-interface {v0, v1}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->isLoggable(I)Z

    move-result v0

    const-string v1, "unsubscribe"

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    const-string v0, ""

    const/4 v4, 0x0

    .line 1213
    :goto_0
    array-length v5, p1

    if-lt v4, v5, :cond_0

    .line 1221
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v5, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v0, v6, v2

    aput-object p2, v6, v3

    const/4 v0, 0x2

    aput-object p3, v6, v0

    const-string v0, "107"

    invoke-interface {v4, v5, v1, v0, v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    if-lez v4, :cond_1

    .line 1215
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ", "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1217
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v0, p1, v4

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1224
    :cond_2
    :goto_1
    array-length v0, p1

    const/4 v4, 0x0

    :goto_2
    if-lt v4, v0, :cond_4

    .line 1233
    array-length v5, p1

    :goto_3
    if-lt v2, v5, :cond_3

    .line 1237
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/eclipse/paho/client/mqttv3/MqttToken;-><init>(Ljava/lang/String;)V

    .line 1238
    invoke-virtual {v0, p3}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setActionCallback(Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;)V

    .line 1239
    invoke-virtual {v0, p2}, Lorg/eclipse/paho/client/mqttv3/MqttToken;->setUserContext(Ljava/lang/Object;)V

    .line 1240
    iget-object p2, v0, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {p2, p1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->setTopics([Ljava/lang/String;)V

    .line 1242
    new-instance p2, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttUnsubscribe;

    invoke-direct {p2, p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttUnsubscribe;-><init>([Ljava/lang/String;)V

    .line 1244
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->sendNoWait(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 1246
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object p2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->CLASS_NAME:Ljava/lang/String;

    const-string p3, "110"

    invoke-interface {p1, p2, v1, p3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 1233
    :cond_3
    aget-object v0, p1, v2

    .line 1234
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v3, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->removeMessageListener(Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1224
    :cond_4
    aget-object v5, p1, v4

    .line 1229
    invoke-static {v5, v3}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;->validate(Ljava/lang/String;Z)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method
