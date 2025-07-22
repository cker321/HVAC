.class public Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;
.super Ljava/lang/Object;
.source "MqttMsgBodyModel.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x752e3a5b2a3005f0L


# instance fields
.field private header:Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

.field private payload:Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->header:Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    return-object v0
.end method

.method public getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel<",
            "TT;>;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->payload:Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    return-object v0
.end method

.method public setHeader(Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->header:Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    return-void
.end method

.method public setPayload(Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel<",
            "TT;>;)V"
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->payload:Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MqttMsgBodyModel{header="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->header:Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", payload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->payload:Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
