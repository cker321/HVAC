.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;
.super Ljava/lang/Object;
.source "WebSocketReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;


# instance fields
.field private input:Ljava/io/InputStream;

.field private final lifecycle:Ljava/lang/Object;

.field private log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private pipedOutputStream:Ljava/io/PipedOutputStream;

.field private receiverThread:Ljava/lang/Thread;

.field private volatile receiving:Z

.field private running:Z

.field private stopping:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/PipedInputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    .line 33
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->stopping:Z

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->lifecycle:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiverThread:Ljava/lang/Thread;

    .line 41
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->input:Ljava/io/InputStream;

    .line 42
    new-instance p1, Ljava/io/PipedOutputStream;

    invoke-direct {p1}, Ljava/io/PipedOutputStream;-><init>()V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->pipedOutputStream:Ljava/io/PipedOutputStream;

    .line 43
    invoke-virtual {p2, p1}, Ljava/io/PipedInputStream;->connect(Ljava/io/PipedOutputStream;)V

    return-void
.end method

.method private closeOutputStream()V
    .locals 1

    .line 129
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->pipedOutputStream:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Ljava/io/PipedOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method public isReceiving()Z
    .locals 1

    .line 145
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiving:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 136
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    return v0
.end method

.method public run()V
    .locals 5

    .line 99
    :goto_0
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->input:Ljava/io/InputStream;

    if-nez v0, :cond_0

    goto :goto_4

    .line 102
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "run"

    const-string v3, "852"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiving:Z

    .line 104
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->input:Ljava/io/InputStream;

    invoke-direct {v0, v2}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;-><init>(Ljava/io/InputStream;)V

    .line 105
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->isCloseFlag()Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v2, 0x0

    .line 106
    :goto_2
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->getPayload()[B

    move-result-object v3

    array-length v3, v3

    if-lt v2, v3, :cond_2

    .line 110
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->pipedOutputStream:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Ljava/io/PipedOutputStream;->flush()V

    goto :goto_3

    .line 107
    :cond_2
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->pipedOutputStream:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->getPayload()[B

    move-result-object v4

    aget-byte v4, v4, v2

    invoke-virtual {v3, v4}, Ljava/io/PipedOutputStream;->write(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 112
    :cond_3
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->stopping:Z

    if-eqz v0, :cond_4

    .line 117
    :goto_3
    iput-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiving:Z

    goto :goto_0

    .line 113
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Server sent a WebSocket Frame with the Stop OpCode"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :catch_0
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->stop()V

    goto :goto_0

    :catch_1
    nop

    goto :goto_0

    :cond_5
    :goto_4
    return-void
.end method

.method public start(Ljava/lang/String;)V
    .locals 4

    .line 53
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "start"

    const-string v3, "855"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v0

    .line 55
    :try_start_0
    iget-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 56
    iput-boolean v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    .line 57
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiverThread:Ljava/lang/Thread;

    .line 58
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 54
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public stop()V
    .locals 6

    const/4 v0, 0x1

    .line 69
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->stopping:Z

    .line 71
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->lifecycle:Ljava/lang/Object;

    monitor-enter v1

    .line 73
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v4, "stop"

    const-string v5, "850"

    invoke-interface {v2, v3, v4, v5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-boolean v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 75
    iput-boolean v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->running:Z

    .line 76
    iput-boolean v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiving:Z

    .line 78
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->closeOutputStream()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 71
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    .line 82
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiverThread:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiverThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 86
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    .line 91
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->receiverThread:Ljava/lang/Thread;

    .line 93
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->CLASS_NAME:Ljava/lang/String;

    const-string v2, "stop"

    const-string v3, "851"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception v0

    .line 71
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
