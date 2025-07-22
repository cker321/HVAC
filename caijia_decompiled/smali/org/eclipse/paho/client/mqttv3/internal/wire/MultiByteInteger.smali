.class public Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;
.super Ljava/lang/Object;
.source "MultiByteInteger.java"


# instance fields
.field private length:I

.field private value:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, -0x1

    .line 27
    invoke-direct {p0, p1, v0}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;->value:I

    .line 32
    iput p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;->length:I

    return-void
.end method


# virtual methods
.method public getEncodedLength()I
    .locals 1

    .line 39
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;->length:I

    return v0
.end method

.method public getValue()I
    .locals 1

    .line 46
    iget v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MultiByteInteger;->value:I

    return v0
.end method
