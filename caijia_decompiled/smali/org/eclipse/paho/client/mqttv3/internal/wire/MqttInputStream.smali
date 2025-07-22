.class public Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;
.super Ljava/io/InputStream;
.source "MqttInputStream.java"


# instance fields
.field private final CLASS_NAME:Ljava/lang/String;

.field private bais:Ljava/io/ByteArrayOutputStream;

.field private clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

.field private in:Ljava/io/DataInputStream;

.field private final log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private packet:[B

.field private packetLen:I

.field private remLen:I


# direct methods
.method public constructor <init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientState;Ljava/io/InputStream;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 37
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->CLASS_NAME:Ljava/lang/String;

    const-string v1, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    .line 38
    invoke-static {v1, v0}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    .line 48
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    .line 49
    new-instance p1, Ljava/io/DataInputStream;

    invoke-direct {p1, p2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    .line 50
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    const/4 p1, -0x1

    .line 51
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    return-void
.end method

.method private readFully()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packetLen:I

    add-int/2addr v0, v1

    .line 132
    iget v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    sub-int/2addr v2, v1

    if-ltz v2, :cond_2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_0

    return-void

    .line 139
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packet:[B

    add-int v5, v0, v1

    sub-int v6, v2, v1

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/DataInputStream;->read([BII)I

    move-result v3
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz v3, :cond_1

    .line 150
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    invoke-virtual {v4, v3}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->notifyReceivedBytes(I)V

    add-int/2addr v1, v3

    goto :goto_0

    .line 148
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :catch_0
    move-exception v0

    .line 142
    iget v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packetLen:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packetLen:I

    .line 143
    throw v0

    .line 134
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    return-void
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    return v0
.end method

.method public readMqttWireMessage()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 81
    :try_start_0
    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gez v1, :cond_1

    .line 90
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 92
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readByte()B

    move-result v1

    .line 93
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->clientState:Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    invoke-virtual {v4, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->notifyReceivedBytes(I)V

    ushr-int/lit8 v4, v1, 0x4

    and-int/lit8 v4, v4, 0xf

    int-to-byte v4, v4

    if-lt v4, v2, :cond_0

    const/16 v5, 0xe

    if-gt v4, v5, :cond_0

    .line 101
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->in:Ljava/io/DataInputStream;

    invoke-static {v4}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;->readMBI(Ljava/io/DataInputStream;)Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;->getValue()I

    move-result v4

    iput v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    .line 102
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 104
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    iget v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    int-to-long v4, v4

    invoke-static {v4, v5}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;->encodeMBI(J)[B

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 105
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    iget v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    add-int/2addr v1, v4

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packet:[B

    .line 106
    iput v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packetLen:I

    goto :goto_0

    :cond_0
    const/16 v1, 0x7d6c

    .line 99
    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v1

    throw v1

    .line 110
    :cond_1
    :goto_0
    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    if-ltz v1, :cond_2

    .line 112
    invoke-direct {p0}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->readFully()V

    const/4 v1, -0x1

    .line 115
    iput v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->remLen:I

    .line 117
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->bais:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 118
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packet:[B

    array-length v5, v1

    invoke-static {v1, v3, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 119
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->packet:[B

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;->createWireMessage([B)Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object v0

    .line 121
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttInputStream;->CLASS_NAME:Ljava/lang/String;

    const-string v5, "readMqttWireMessage"

    const-string v6, "301"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-interface {v1, v4, v5, v6, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    return-object v0
.end method
