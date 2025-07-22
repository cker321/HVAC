.class public Lcom/dnake/desktop/bean/MqttRemoteControl;
.super Ljava/lang/Object;
.source "MqttRemoteControl.java"


# instance fields
.field private controlAddress:I

.field private controlValue:I

.field private deviceSn:Ljava/lang/String;

.field private productCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->deviceSn:Ljava/lang/String;

    .line 15
    iput p2, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->productCode:I

    return-void
.end method


# virtual methods
.method public getControlAddress()I
    .locals 1

    .line 35
    iget v0, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->controlAddress:I

    return v0
.end method

.method public getControlValue()I
    .locals 1

    .line 39
    iget v0, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->controlValue:I

    return v0
.end method

.method public getDeviceSn()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->deviceSn:Ljava/lang/String;

    return-object v0
.end method

.method public getProductCode()I
    .locals 1

    .line 31
    iget v0, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->productCode:I

    return v0
.end method

.method public setControlAddress(I)V
    .locals 0

    .line 19
    iput p1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->controlAddress:I

    return-void
.end method

.method public setControlValue(I)V
    .locals 0

    .line 23
    iput p1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->controlValue:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MqttRemoteControl{deviceSn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->deviceSn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", productCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->productCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", controlAddress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->controlAddress:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", controlValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/MqttRemoteControl;->controlValue:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
