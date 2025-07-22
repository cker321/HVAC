.class public Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;
.super Ljava/lang/Object;
.source "MqttPayloadModel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private code:I

.field private data:Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel<",
            "TT;>;"
        }
    .end annotation
.end field

.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCode()I
    .locals 1

    .line 24
    iget v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->code:I

    return v0
.end method

.method public getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel<",
            "TT;>;"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->data:Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(I)V
    .locals 0

    .line 28
    iput p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->code:I

    return-void
.end method

.method public setData(Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel<",
            "TT;>;)V"
        }
    .end annotation

    .line 44
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->data:Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->message:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MqttPayloadModel{code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->data:Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
