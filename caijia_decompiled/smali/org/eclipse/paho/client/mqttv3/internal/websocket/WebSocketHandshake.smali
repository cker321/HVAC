.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;
.super Ljava/lang/Object;
.source "WebSocketHandshake.java"


# static fields
.field private static final ACCEPT_SALT:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

.field private static final EMPTY:Ljava/lang/String; = ""

.field private static final HTTP_HEADER_CONNECTION:Ljava/lang/String; = "connection"

.field private static final HTTP_HEADER_CONNECTION_VALUE:Ljava/lang/String; = "upgrade"

.field private static final HTTP_HEADER_SEC_WEBSOCKET_ACCEPT:Ljava/lang/String; = "sec-websocket-accept"

.field private static final HTTP_HEADER_SEC_WEBSOCKET_PROTOCOL:Ljava/lang/String; = "sec-websocket-protocol"

.field private static final HTTP_HEADER_UPGRADE:Ljava/lang/String; = "upgrade"

.field private static final HTTP_HEADER_UPGRADE_WEBSOCKET:Ljava/lang/String; = "websocket"

.field private static final LINE_SEPARATOR:Ljava/lang/String; = "\r\n"

.field private static final SHA1_PROTOCOL:Ljava/lang/String; = "SHA1"


# instance fields
.field customWebSocketHeaders:Ljava/util/Properties;

.field host:Ljava/lang/String;

.field input:Ljava/io/InputStream;

.field output:Ljava/io/OutputStream;

.field port:I

.field uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;ILjava/util/Properties;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->input:Ljava/io/InputStream;

    .line 62
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->output:Ljava/io/OutputStream;

    .line 63
    iput-object p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->uri:Ljava/lang/String;

    .line 64
    iput-object p4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->host:Ljava/lang/String;

    .line 65
    iput p5, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->port:I

    .line 66
    iput-object p6, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->customWebSocketHeaders:Ljava/util/Properties;

    return-void
.end method

.method private getHeaders(Ljava/util/ArrayList;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 190
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x1

    .line 191
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v2, v3, :cond_0

    return-object v0

    .line 192
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, ":"

    .line 193
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    .line 194
    aget-object v4, v3, v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    aget-object v3, v3, v1

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private receiveHandshakeResponse(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->input:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 144
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 145
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    :goto_0
    const-string v3, ""

    .line 149
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 153
    invoke-direct {p0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->getHeaders(Ljava/util/ArrayList;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "connection"

    .line 155
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_3

    const-string v2, "upgrade"

    .line 156
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 160
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 161
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "websocket"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "sec-websocket-protocol"

    .line 165
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_1

    const-string v1, "sec-websocket-accept"

    .line 170
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 175
    :try_start_0
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->verifyWebSocketKey(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/paho/client/mqttv3/internal/websocket/HandshakeFailedException; {:try_start_0 .. :try_end_0} :catch_1

    return-void

    :catch_0
    move-exception p1

    goto :goto_1

    .line 179
    :catch_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "WebSocket Response header: Incorrect Sec-WebSocket-Key"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 177
    :goto_1
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p1}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "WebSocket Response header: Missing Sec-WebSocket-Accept"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 167
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "WebSocket Response header: empty sec-websocket-protocol"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string v0, "WebSocket Response header: Incorrect upgrade."

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 157
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "WebSocket Response header: Incorrect connection header"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 150
    :cond_4
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 147
    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string v0, "WebSocket Response header: Invalid response from Server, It may not support WebSockets."

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method private sendHandshakeRequest(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "\r\n"

    :try_start_0
    const-string v1, "/mqtt"

    .line 92
    new-instance v2, Ljava/net/URI;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->uri:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 93
    invoke-virtual {v2}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 94
    invoke-virtual {v2}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v1

    .line 95
    invoke-virtual {v2}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 96
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "?"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 100
    :cond_0
    new-instance v3, Ljava/io/PrintWriter;

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->output:Ljava/io/OutputStream;

    invoke-direct {v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 101
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "GET "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " HTTP/1.1"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 102
    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->port:I
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v4, 0x50

    const-string v5, "Host: "

    if-eq v1, v4, :cond_1

    .line 103
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->host:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->port:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 106
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->host:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    :goto_0
    const-string v1, "Upgrade: websocket\r\n"

    .line 109
    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "Connection: Upgrade\r\n"

    .line 110
    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Sec-WebSocket-Key: "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "Sec-WebSocket-Protocol: mqtt\r\n"

    .line 112
    invoke-virtual {v3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "Sec-WebSocket-Version: 13\r\n"

    .line 113
    invoke-virtual {v3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 115
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->customWebSocketHeaders:Ljava/util/Properties;

    if-eqz p1, :cond_3

    .line 116
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->customWebSocketHeaders:Ljava/util/Properties;

    invoke-virtual {p1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object p1

    .line 117
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 118
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_2

    .line 119
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 120
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->customWebSocketHeaders:Ljava/util/Properties;

    invoke-virtual {v4, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 121
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ": "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_1

    .line 125
    :cond_3
    :goto_2
    invoke-virtual {v2}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Authorization: Basic "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 130
    :cond_4
    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 131
    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 133
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method

.method private sha1(Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    const-string v0, "SHA1"

    .line 224
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 225
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    return-object p1
.end method

.method private verifyWebSocketKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Lorg/eclipse/paho/client/mqttv3/internal/websocket/HandshakeFailedException;
        }
    .end annotation

    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->sha1(Ljava/lang/String;)[B

    move-result-object p1

    .line 211
    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 212
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 213
    :cond_0
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/internal/websocket/HandshakeFailedException;

    invoke-direct {p1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/HandshakeFailedException;-><init>()V

    throw p1
.end method


# virtual methods
.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x10

    new-array v1, v0, [B

    .line 77
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v0

    .line 79
    invoke-direct {p0, v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->sendHandshakeRequest(Ljava/lang/String;)V

    .line 80
    invoke-direct {p0, v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketHandshake;->receiveHandshakeResponse(Ljava/lang/String;)V

    return-void
.end method
