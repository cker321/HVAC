.class public Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;
.super Ljava/io/InputStream;
.source "MultiByteArrayInputStream.java"


# instance fields
.field private bytesA:[B

.field private bytesB:[B

.field private lengthA:I

.field private lengthB:I

.field private offsetA:I

.field private offsetB:I

.field private pos:I


# direct methods
.method public constructor <init>([BII[BII)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->pos:I

    .line 33
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->bytesA:[B

    .line 34
    invoke-virtual {p4}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->bytesB:[B

    .line 35
    iput p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->offsetA:I

    .line 36
    iput p5, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->offsetB:I

    .line 37
    iput p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->lengthA:I

    .line 38
    iput p6, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->lengthB:I

    return-void
.end method


# virtual methods
.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->pos:I

    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->lengthA:I

    if-ge v0, v1, :cond_0

    .line 43
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->bytesA:[B

    iget v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->offsetA:I

    add-int/2addr v2, v0

    aget-byte v0, v1, v2

    goto :goto_0

    .line 44
    :cond_0
    iget v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->lengthB:I

    add-int/2addr v2, v1

    if-ge v0, v2, :cond_2

    .line 45
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->bytesB:[B

    iget v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->offsetB:I

    add-int/2addr v3, v0

    sub-int/2addr v3, v1

    aget-byte v0, v2, v3

    :goto_0
    if-gez v0, :cond_1

    add-int/lit16 v0, v0, 0x100

    .line 52
    :cond_1
    iget v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteArrayInputStream;->pos:I

    return v0

    :cond_2
    const/4 v0, -0x1

    return v0
.end method
