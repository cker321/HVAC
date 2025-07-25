.class public Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;
.super Ljava/lang/Object;
.source "WebSocketFrame.java"


# static fields
.field public static final frameLengthOverhead:I = 0x6


# instance fields
.field private closeFlag:Z

.field private fin:Z

.field private opcode:B

.field private payload:[B


# direct methods
.method public constructor <init>(BZ[B)V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->closeFlag:Z

    .line 59
    iput-byte p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->opcode:B

    .line 60
    iput-boolean p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->fin:Z

    if-eqz p3, :cond_0

    .line 62
    invoke-virtual {p3}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->closeFlag:Z

    .line 141
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    int-to-byte v1, v1

    .line 142
    invoke-direct {p0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->setFinAndOpCode(B)V

    .line 143
    iget-byte v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->opcode:B

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/16 v4, 0x8

    if-ne v1, v2, :cond_9

    .line 144
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    int-to-byte v1, v1

    and-int/lit16 v5, v1, 0x80

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    const/16 v3, 0x7f

    and-int/2addr v1, v3

    int-to-byte v1, v1

    if-ne v1, v3, :cond_1

    const/16 v2, 0x8

    goto :goto_1

    :cond_1
    const/16 v3, 0x7e

    if-ne v1, v3, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-lez v2, :cond_3

    const/4 v1, 0x0

    :cond_3
    :goto_2
    add-int/lit8 v2, v2, -0x1

    if-gez v2, :cond_8

    const/4 v2, 0x0

    if-eqz v5, :cond_4

    const/4 v2, 0x4

    new-array v3, v2, [B

    .line 169
    invoke-virtual {p1, v3, v0, v2}, Ljava/io/InputStream;->read([BII)I

    goto :goto_3

    :cond_4
    move-object v3, v2

    .line 172
    :goto_3
    new-array v2, v1, [B

    iput-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    move v4, v1

    const/4 v2, 0x0

    :goto_4
    if-ne v2, v1, :cond_7

    if-eqz v5, :cond_6

    .line 184
    :goto_5
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    array-length v1, p1

    if-lt v0, v1, :cond_5

    goto :goto_6

    .line 185
    :cond_5
    aget-byte v1, p1, v0

    rem-int/lit8 v2, v0, 0x4

    aget-byte v2, v3, v2

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_6
    :goto_6
    return-void

    .line 177
    :cond_7
    iget-object v6, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    invoke-virtual {p1, v6, v2, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    add-int/2addr v2, v6

    sub-int/2addr v4, v6

    goto :goto_4

    .line 161
    :cond_8
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v3

    int-to-byte v3, v3

    and-int/lit16 v3, v3, 0xff

    mul-int/lit8 v4, v2, 0x8

    shl-int/2addr v3, v4

    or-int/2addr v1, v3

    goto :goto_2

    :cond_9
    if-ne v1, v4, :cond_a

    .line 191
    iput-boolean v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->closeFlag:Z

    return-void

    .line 193
    :cond_a
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid Frame: Opcode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->opcode:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_8

    :goto_7
    throw p1

    :goto_8
    goto :goto_7
.end method

.method public constructor <init>([B)V
    .locals 6

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->closeFlag:Z

    .line 74
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 78
    invoke-direct {p0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->setFinAndOpCode(B)V

    .line 81
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v2, v1, 0x80

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x7f

    and-int/2addr v1, v3

    int-to-byte v1, v1

    if-ne v1, v3, :cond_1

    const/16 v3, 0x8

    goto :goto_1

    :cond_1
    const/16 v3, 0x7e

    if-ne v1, v3, :cond_2

    const/4 v3, 0x2

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    add-int/lit8 v3, v3, -0x1

    if-gtz v3, :cond_6

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    const/4 v3, 0x4

    new-array v4, v3, [B

    .line 103
    invoke-virtual {p1, v4, v0, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    move-object v3, v4

    .line 105
    :cond_3
    new-array v4, v1, [B

    iput-object v4, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    .line 106
    invoke-virtual {p1, v4, v0, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_5

    .line 110
    :goto_2
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    array-length v1, p1

    if-lt v0, v1, :cond_4

    goto :goto_3

    .line 111
    :cond_4
    aget-byte v1, p1, v0

    rem-int/lit8 v2, v0, 0x4

    aget-byte v2, v3, v2

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    return-void

    .line 95
    :cond_6
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    and-int/lit16 v4, v4, 0xff

    mul-int/lit8 v5, v3, 0x8

    shl-int/2addr v4, v5

    or-int/2addr v1, v4

    goto :goto_1
.end method

.method public static appendFinAndOpCode(Ljava/nio/ByteBuffer;BZ)V
    .locals 0

    if-eqz p2, :cond_0

    const/16 p2, 0x80

    int-to-byte p2, p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    and-int/lit8 p1, p1, 0xf

    or-int/2addr p1, p2

    int-to-byte p1, p1

    .line 297
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private static appendLength(Ljava/nio/ByteBuffer;IZ)V
    .locals 2

    if-ltz p1, :cond_3

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const/16 p2, -0x80

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    const v1, 0xffff

    if-le p1, v1, :cond_1

    or-int/lit8 p2, p2, 0x7f

    int-to-byte p2, p2

    .line 259
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 260
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 261
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 262
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 263
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    shr-int/lit8 p2, p1, 0x18

    and-int/lit16 p2, p2, 0xff

    int-to-byte p2, p2

    .line 264
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    shr-int/lit8 p2, p1, 0x10

    and-int/lit16 p2, p2, 0xff

    int-to-byte p2, p2

    .line 265
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    shr-int/lit8 p2, p1, 0x8

    and-int/lit16 p2, p2, 0xff

    int-to-byte p2, p2

    .line 266
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    .line 267
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    :cond_1
    const/16 v0, 0x7e

    if-lt p1, v0, :cond_2

    or-int/2addr p2, v0

    int-to-byte p2, p2

    .line 269
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    shr-int/lit8 p2, p1, 0x8

    int-to-byte p2, p2

    .line 270
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    .line 271
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1

    :cond_2
    or-int/2addr p1, p2

    int-to-byte p1, p1

    .line 273
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :goto_1
    return-void

    .line 254
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Length cannot be negative"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static appendLengthAndMask(Ljava/nio/ByteBuffer;I[B)V
    .locals 1

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    .line 237
    invoke-static {p0, p1, v0}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->appendLength(Ljava/nio/ByteBuffer;IZ)V

    .line 238
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 240
    invoke-static {p0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->appendLength(Ljava/nio/ByteBuffer;IZ)V

    :goto_0
    return-void
.end method

.method public static generateMaskingKey()[B
    .locals 6

    .line 307
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    const/16 v1, 0xff

    .line 308
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v2

    .line 309
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v3

    .line 310
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v4

    .line 311
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v0

    const/4 v1, 0x4

    new-array v1, v1, [B

    int-to-byte v2, v2

    const/4 v5, 0x0

    aput-byte v2, v1, v5

    int-to-byte v2, v3

    const/4 v3, 0x1

    aput-byte v2, v1, v3

    int-to-byte v2, v4

    const/4 v3, 0x2

    aput-byte v2, v1, v3

    int-to-byte v0, v0

    const/4 v2, 0x3

    aput-byte v0, v1, v2

    return-object v1
.end method

.method private setFinAndOpCode(B)V
    .locals 1

    and-int/lit16 v0, p1, 0x80

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 123
    :goto_0
    iput-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->fin:Z

    and-int/lit8 p1, p1, 0xf

    int-to-byte p1, p1

    .line 128
    iput-byte p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->opcode:B

    return-void
.end method


# virtual methods
.method public encodeFrame()[B
    .locals 6

    .line 204
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    array-length v1, v0

    add-int/lit8 v1, v1, 0x6

    .line 206
    array-length v2, v0

    const v3, 0xffff

    if-le v2, v3, :cond_0

    add-int/lit8 v1, v1, 0x8

    goto :goto_0

    .line 208
    :cond_0
    array-length v0, v0

    const/16 v2, 0x7e

    if-lt v0, v2, :cond_1

    add-int/lit8 v1, v1, 0x2

    .line 212
    :cond_1
    :goto_0
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 213
    iget-byte v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->opcode:B

    iget-boolean v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->fin:Z

    invoke-static {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->appendFinAndOpCode(Ljava/nio/ByteBuffer;BZ)V

    .line 214
    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->generateMaskingKey()[B

    move-result-object v1

    .line 215
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    array-length v2, v2

    invoke-static {v0, v2, v1}, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->appendLengthAndMask(Ljava/nio/ByteBuffer;I[B)V

    const/4 v2, 0x0

    .line 217
    :goto_1
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    array-length v4, v3

    if-lt v2, v4, :cond_2

    .line 221
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 222
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0

    .line 218
    :cond_2
    aget-byte v4, v3, v2

    rem-int/lit8 v5, v2, 0x4

    aget-byte v5, v1, v5

    xor-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v2

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public getOpcode()B
    .locals 1

    .line 33
    iget-byte v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->opcode:B

    return v0
.end method

.method public getPayload()[B
    .locals 1

    .line 41
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->payload:[B

    return-object v0
.end method

.method public isCloseFlag()Z
    .locals 1

    .line 45
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->closeFlag:Z

    return v0
.end method

.method public isFin()Z
    .locals 1

    .line 37
    iget-boolean v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/websocket/WebSocketFrame;->fin:Z

    return v0
.end method
