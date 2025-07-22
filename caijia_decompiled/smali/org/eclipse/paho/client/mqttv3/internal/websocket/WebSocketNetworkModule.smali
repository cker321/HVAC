.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;
.super Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;
.source "WebSocketNetworkModule.java"


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;


# instance fields
.field private customWebsocketHeaders:Ljava/util/Properties;

.field private host:Ljava/lang/String;

.field private log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

.field private outputStream:Ljava/io/ByteArrayOutputStream;

.field private pipedInputStream:Ljava/io/PipedInputStream;

.field private port:I

.field recievedPayload:Ljava/nio/ByteBuffer;

.field private uri:Ljava/lang/String;

.field private webSocketReceiver:Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljavax/net/SocketFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Properties;)V
    .locals 1

    .line 54
    invoke-direct {p0, p1, p3, p4, p5}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;-><init>(Ljavax/net/SocketFactory;Ljava/lang/String;ILjava/lang/String;)V

    .line 36
    sget-object p1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->CLASS_NAME:Ljava/lang/String;

    const-string v0, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v0, p1}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object p1

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    .line 51
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/ExtendedByteArrayOutputStream;

    invoke-direct {p1, p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/ExtendedByteArrayOutputStream;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;)V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->outputStream:Ljava/io/ByteArrayOutputStream;

    .line 55
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->uri:Ljava/lang/String;

    .line 56
    iput-object p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->host:Ljava/lang/String;

    .line 57
    iput p4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->port:I

    .line 58
    iput-object p6, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->customWebsocketHeaders:Ljava/util/Properties;

    .line 59
    new-instance p1, Ljava/io/PipedInputStream;

    invoke-direct {p1}, Ljava/io/PipedInputStream;-><init>()V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->pipedInputStream:Ljava/io/PipedInputStream;

    .line 61
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    invoke-interface {p1, p5}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->setResourceName(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->pipedInputStream:Ljava/io/PipedInputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->outputStream:Ljava/io/ByteArrayOutputStream;

    return-object v0
.end method

.method public getServerURI()Ljava/lang/String;
    .locals 2

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ws://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getSocketInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method getSocketOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public start()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 65
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;->start()V

    .line 66
    new-instance v7, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->getSocketInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->getSocketOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->uri:Ljava/lang/String;

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->host:Ljava/lang/String;

    iget v5, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->port:I

    iget-object v6, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->customWebsocketHeaders:Ljava/util/Properties;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;ILjava/util/Properties;)V

    .line 67
    invoke-virtual {v7}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->execute()V

    .line 68
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->getSocketInputStream()Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->pipedInputStream:Ljava/io/PipedInputStream;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;-><init>(Ljava/io/InputStream;Ljava/io/PipedInputStream;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->webSocketReceiver:Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    const-string v1, "webSocketReceiver"

    .line 69
    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->start(Ljava/lang/String;)V

    return-void
.end method

.method public stop()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;

    const-string v1, "1000"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/16 v2, 0x8

    const/4 v3, 0x1

    invoke-direct {v0, v2, v3, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;-><init>(BZ[B)V

    .line 94
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->encodeFrame()[B

    move-result-object v0

    .line 95
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->getSocketOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 96
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->getSocketOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 98
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketNetworkModule;->webSocketReceiver:Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->stop()V

    .line 101
    :cond_0
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;->stop()V

    return-void
.end method
