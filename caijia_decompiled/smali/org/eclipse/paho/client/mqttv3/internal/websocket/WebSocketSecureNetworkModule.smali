.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;
.super Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;
.source "WebSocketSecureNetworkModule.java"


# static fields
.field private static final CLASS_NAME:Ljava/lang/String;


# instance fields
.field private customWebSocketHeaders:Ljava/util/Properties;

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

    .line 34
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->CLASS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Properties;)V
    .locals 1

    .line 53
    invoke-direct {p0, p1, p3, p4, p5}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;-><init>(Ljavax/net/ssl/SSLSocketFactory;Ljava/lang/String;ILjava/lang/String;)V

    .line 35
    sget-object p1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->CLASS_NAME:Ljava/lang/String;

    const-string v0, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    invoke-static {v0, p1}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object p1

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    .line 50
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/ExtendedByteArrayOutputStream;

    invoke-direct {p1, p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/ExtendedByteArrayOutputStream;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;)V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->outputStream:Ljava/io/ByteArrayOutputStream;

    .line 54
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->uri:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->host:Ljava/lang/String;

    .line 56
    iput p4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->port:I

    .line 57
    iput-object p6, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->customWebSocketHeaders:Ljava/util/Properties;

    .line 58
    new-instance p1, Ljava/io/PipedInputStream;

    invoke-direct {p1}, Ljava/io/PipedInputStream;-><init>()V

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->pipedInputStream:Ljava/io/PipedInputStream;

    .line 59
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->log:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

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

    .line 80
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->pipedInputStream:Ljava/io/PipedInputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->outputStream:Ljava/io/ByteArrayOutputStream;

    return-object v0
.end method

.method public getServerURI()Ljava/lang/String;
    .locals 2

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "wss://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->port:I

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

    .line 76
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->getInputStream()Ljava/io/InputStream;

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

    .line 72
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->getOutputStream()Ljava/io/OutputStream;

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

    .line 63
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->start()V

    .line 64
    new-instance v7, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;

    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->uri:Ljava/lang/String;

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->host:Ljava/lang/String;

    iget v5, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->port:I

    iget-object v6, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->customWebSocketHeaders:Ljava/util/Properties;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;ILjava/util/Properties;)V

    .line 65
    invoke-virtual {v7}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->execute()V

    .line 66
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->getSocketInputStream()Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->pipedInputStream:Ljava/io/PipedInputStream;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;-><init>(Ljava/io/InputStream;Ljava/io/PipedInputStream;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->webSocketReceiver:Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    const-string v1, "WssSocketReceiver"

    .line 67
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

    .line 89
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;

    const-string v1, "1000"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/16 v2, 0x8

    const/4 v3, 0x1

    invoke-direct {v0, v2, v3, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;-><init>(BZ[B)V

    .line 90
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->encodeFrame()[B

    move-result-object v0

    .line 91
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->getSocketOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 92
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->getSocketOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 94
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketSecureNetworkModule;->webSocketReceiver:Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;

    if-eqz v0, :cond_0

    .line 95
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketReceiver;->stop()V

    .line 97
    :cond_0
    invoke-super {p0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->stop()V

    return-void
.end method
