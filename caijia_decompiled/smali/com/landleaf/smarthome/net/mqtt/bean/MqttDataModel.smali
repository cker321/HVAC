.class public Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;
.super Ljava/lang/Object;
.source "MqttDataModel.java"


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
.field private deviceSn:Ljava/lang/String;

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private productCode:I

.field private sceneNo:I

.field private updateType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceSn()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->deviceSn:Ljava/lang/String;

    return-object v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->items:Ljava/util/List;

    return-object v0
.end method

.method public getProductCode()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->productCode:I

    return v0
.end method

.method public getSceneNo()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->sceneNo:I

    return v0
.end method

.method public getUpdateType()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->updateType:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceSn(Ljava/lang/String;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method public setItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 49
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->items:Ljava/util/List;

    return-void
.end method

.method public setProductCode(I)V
    .locals 0

    .line 41
    iput p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->productCode:I

    return-void
.end method

.method public setSceneNo(I)V
    .locals 0

    .line 57
    iput p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->sceneNo:I

    return-void
.end method

.method public setUpdateType(Ljava/lang/String;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->updateType:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MqttDataModel{deviceSn=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->deviceSn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", productCode="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->productCode:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", items="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->items:Ljava/util/List;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", sceneNo="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->sceneNo:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", updateType=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->updateType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
