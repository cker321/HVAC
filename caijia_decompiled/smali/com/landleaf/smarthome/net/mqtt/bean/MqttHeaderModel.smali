.class public Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;
.super Ljava/lang/Object;
.source "MqttHeaderModel.java"


# instance fields
.field private ackCode:I

.field private messageId:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private screenMac:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAckCode()I
    .locals 1

    .line 24
    iget v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->ackCode:I

    return v0
.end method

.method public getMessageId()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getScreenMac()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->screenMac:Ljava/lang/String;

    return-object v0
.end method

.method public setAckCode(I)V
    .locals 0

    .line 28
    iput p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->ackCode:I

    return-void
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->messageId:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->name:Ljava/lang/String;

    return-void
.end method

.method public setScreenMac(Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->screenMac:Ljava/lang/String;

    return-void
.end method
