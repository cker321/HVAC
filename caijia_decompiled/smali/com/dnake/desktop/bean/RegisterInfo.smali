.class public Lcom/dnake/desktop/bean/RegisterInfo;
.super Ljava/lang/Object;
.source "RegisterInfo.java"


# instance fields
.field deviceID:Ljava/lang/String;

.field floorId:Ljava/lang/String;

.field ipAddress:Ljava/lang/String;

.field roomId:Ljava/lang/String;

.field roomType:Ljava/lang/String;

.field unitId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeviceID()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/dnake/desktop/bean/RegisterInfo;->deviceID:Ljava/lang/String;

    return-object v0
.end method

.method public getFloorId()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/dnake/desktop/bean/RegisterInfo;->floorId:Ljava/lang/String;

    return-object v0
.end method

.method public getIpAddress()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/dnake/desktop/bean/RegisterInfo;->ipAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/dnake/desktop/bean/RegisterInfo;->roomId:Ljava/lang/String;

    return-object v0
.end method

.method public getRoomType()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/dnake/desktop/bean/RegisterInfo;->roomType:Ljava/lang/String;

    return-object v0
.end method

.method public getUnitId()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/dnake/desktop/bean/RegisterInfo;->unitId:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceID(Ljava/lang/String;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->deviceID:Ljava/lang/String;

    return-void
.end method

.method public setFloorId(Ljava/lang/String;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->floorId:Ljava/lang/String;

    return-void
.end method

.method public setIpAddress(Ljava/lang/String;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->ipAddress:Ljava/lang/String;

    return-void
.end method

.method public setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->roomId:Ljava/lang/String;

    return-void
.end method

.method public setRoomType(Ljava/lang/String;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->roomType:Ljava/lang/String;

    return-void
.end method

.method public setUnitId(Ljava/lang/String;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->unitId:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RegisterInfo{floorId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/bean/RegisterInfo;->floorId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", unitId=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/bean/RegisterInfo;->unitId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", roomType=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/bean/RegisterInfo;->roomType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", roomId=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/bean/RegisterInfo;->roomId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", ipAddress=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/bean/RegisterInfo;->ipAddress:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", deviceID=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/bean/RegisterInfo;->deviceID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
