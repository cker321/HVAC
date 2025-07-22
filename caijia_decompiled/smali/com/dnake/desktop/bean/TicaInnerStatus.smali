.class public Lcom/dnake/desktop/bean/TicaInnerStatus;
.super Ljava/lang/Object;
.source "TicaInnerStatus.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private TH1Error:I

.field private TH2Error:I

.field private TH3Error:I

.field private TH4Error:I

.field private communicationFailure:I

.field private deviceSn:Ljava/lang/String;

.field private electricAuxiliaryHeatingSetting:Z

.field private electricAuxiliaryHeatingStatus:I

.field private intakeTemperature:F

.field private machineNo:I

.field private midDiskTemperature:F

.field private modeRun:I

.field private outletTemperature:F

.field private patternConflict:I

.field private powerSetting:Z

.field private programEdition:F

.field private returnAirTemperature:F

.field private roomName:Ljava/lang/String;

.field private settingMode:I

.field private settingTemp:I

.field private settingWindSpeed:I

.field private sleepSetting:Z

.field private swingSetting:Z

.field private unitAbility:I

.field private unitType:I

.field private waterLevelFailure:I

.field private waterPumpStatus:I

.field private windSpeedStatus:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    .line 54
    iput-object p2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->roomName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    .line 48
    iput-object p2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->roomName:Ljava/lang/String;

    .line 49
    iput-object p3, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->deviceSn:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public clone()Lcom/dnake/desktop/bean/TicaInnerStatus;
    .locals 1

    .line 285
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 287
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 8
    invoke-virtual {p0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->clone()Lcom/dnake/desktop/bean/TicaInnerStatus;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 295
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 296
    :cond_1
    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 297
    iget v2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    iget v3, p1, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    if-ne v2, v3, :cond_2

    iget v2, p1, Lcom/dnake/desktop/bean/TicaInnerStatus;->returnAirTemperature:F

    iget v3, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->returnAirTemperature:F

    .line 298
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    iget v2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingMode:I

    iget v3, p1, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingMode:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingTemp:I

    iget v3, p1, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingTemp:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingWindSpeed:I

    iget v3, p1, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingWindSpeed:I

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->powerSetting:Z

    iget-boolean p1, p1, Lcom/dnake/desktop/bean/TicaInnerStatus;->powerSetting:Z

    if-ne v2, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getDeviceSn()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->deviceSn:Ljava/lang/String;

    return-object v0
.end method

.method public getIntakeTemperature()F
    .locals 1

    .line 106
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->intakeTemperature:F

    return v0
.end method

.method public getMachineNo()I
    .locals 1

    .line 66
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    return v0
.end method

.method public getMidDiskTemperature()F
    .locals 1

    .line 114
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->midDiskTemperature:F

    return v0
.end method

.method public getModeRun()I
    .locals 1

    .line 154
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->modeRun:I

    return v0
.end method

.method public getOutletTemperature()F
    .locals 1

    .line 122
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->outletTemperature:F

    return v0
.end method

.method public getProgramEdition()F
    .locals 1

    .line 98
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->programEdition:F

    return v0
.end method

.method public getReturnAirTemperature()F
    .locals 1

    .line 130
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->returnAirTemperature:F

    return v0
.end method

.method public getRoomName()Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->roomName:Ljava/lang/String;

    return-object v0
.end method

.method public getSettingMode()I
    .locals 1

    .line 226
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingMode:I

    return v0
.end method

.method public getSettingTemp()I
    .locals 1

    .line 234
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingTemp:I

    return v0
.end method

.method public getSettingWindSpeed()I
    .locals 1

    .line 242
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingWindSpeed:I

    return v0
.end method

.method public getUnitAbility()I
    .locals 1

    .line 90
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->unitAbility:I

    return v0
.end method

.method public getUnitType()I
    .locals 1

    .line 82
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->unitType:I

    return v0
.end method

.method public getWindSpeedStatus()I
    .locals 1

    .line 138
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->windSpeedStatus:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Object;

    .line 307
    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->roomName:Ljava/lang/String;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->returnAirTemperature:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingMode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingTemp:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingWindSpeed:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->powerSetting:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->deviceSn:Ljava/lang/String;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isCommunicationFailure()I
    .locals 1

    .line 210
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->communicationFailure:I

    return v0
.end method

.method public isElectricAuxiliaryHeatingSetting()Z
    .locals 1

    .line 266
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->electricAuxiliaryHeatingSetting:Z

    return v0
.end method

.method public isElectricAuxiliaryHeatingStatus()I
    .locals 1

    .line 146
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->electricAuxiliaryHeatingStatus:I

    return v0
.end method

.method public isPatternConflict()I
    .locals 1

    .line 202
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->patternConflict:I

    return v0
.end method

.method public isPowerSetting()Z
    .locals 1

    .line 274
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->powerSetting:Z

    return v0
.end method

.method public isSleepSetting()Z
    .locals 1

    .line 258
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->sleepSetting:Z

    return v0
.end method

.method public isSwingSetting()Z
    .locals 1

    .line 250
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->swingSetting:Z

    return v0
.end method

.method public isTH1Error()I
    .locals 1

    .line 170
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH1Error:I

    return v0
.end method

.method public isTH2Error()I
    .locals 1

    .line 178
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH2Error:I

    return v0
.end method

.method public isTH3Error()I
    .locals 1

    .line 186
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH3Error:I

    return v0
.end method

.method public isTH4Error()I
    .locals 1

    .line 194
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH4Error:I

    return v0
.end method

.method public isWaterLevelFailure()I
    .locals 1

    .line 218
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->waterLevelFailure:I

    return v0
.end method

.method public isWaterPumpStatus()I
    .locals 1

    .line 162
    iget v0, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->waterPumpStatus:I

    return v0
.end method

.method public setCommunicationFailure(I)V
    .locals 0

    .line 214
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->communicationFailure:I

    return-void
.end method

.method public setDeviceSn(Ljava/lang/String;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method public setElectricAuxiliaryHeatingSetting(Z)V
    .locals 0

    .line 270
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->electricAuxiliaryHeatingSetting:Z

    return-void
.end method

.method public setElectricAuxiliaryHeatingStatus(I)V
    .locals 0

    .line 150
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->electricAuxiliaryHeatingStatus:I

    return-void
.end method

.method public setIntakeTemperature(F)V
    .locals 0

    .line 110
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->intakeTemperature:F

    return-void
.end method

.method public setMachineNo(I)V
    .locals 0

    .line 70
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    return-void
.end method

.method public setMidDiskTemperature(F)V
    .locals 0

    .line 118
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->midDiskTemperature:F

    return-void
.end method

.method public setModeRun(I)V
    .locals 0

    .line 158
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->modeRun:I

    return-void
.end method

.method public setOutletTemperature(F)V
    .locals 0

    .line 126
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->outletTemperature:F

    return-void
.end method

.method public setPatternConflict(I)V
    .locals 0

    .line 206
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->patternConflict:I

    return-void
.end method

.method public setPowerSetting(Z)V
    .locals 0

    .line 278
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->powerSetting:Z

    return-void
.end method

.method public setProgramEdition(F)V
    .locals 0

    .line 102
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->programEdition:F

    return-void
.end method

.method public setReturnAirTemperature(F)V
    .locals 0

    .line 134
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->returnAirTemperature:F

    return-void
.end method

.method public setRoomName(Ljava/lang/String;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->roomName:Ljava/lang/String;

    return-void
.end method

.method public setSettingMode(I)V
    .locals 0

    .line 230
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingMode:I

    return-void
.end method

.method public setSettingTemp(I)V
    .locals 0

    .line 238
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingTemp:I

    return-void
.end method

.method public setSettingWindSpeed(I)V
    .locals 0

    .line 246
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingWindSpeed:I

    return-void
.end method

.method public setSleepSetting(Z)V
    .locals 0

    .line 262
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->sleepSetting:Z

    return-void
.end method

.method public setSwingSetting(Z)V
    .locals 0

    .line 254
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->swingSetting:Z

    return-void
.end method

.method public setTH1Error(I)V
    .locals 0

    .line 174
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH1Error:I

    return-void
.end method

.method public setTH2Error(I)V
    .locals 0

    .line 182
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH2Error:I

    return-void
.end method

.method public setTH3Error(I)V
    .locals 0

    .line 190
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH3Error:I

    return-void
.end method

.method public setTH4Error(I)V
    .locals 0

    .line 198
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->TH4Error:I

    return-void
.end method

.method public setUnitAbility(I)V
    .locals 0

    .line 94
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->unitAbility:I

    return-void
.end method

.method public setUnitType(I)V
    .locals 0

    .line 86
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->unitType:I

    return-void
.end method

.method public setWaterLevelFailure(I)V
    .locals 0

    .line 222
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->waterLevelFailure:I

    return-void
.end method

.method public setWaterPumpStatus(I)V
    .locals 0

    .line 166
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->waterPumpStatus:I

    return-void
.end method

.method public setWindSpeedStatus(I)V
    .locals 0

    .line 142
    iput p1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->windSpeedStatus:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 312
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TicaInnerStatus{machineNo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->machineNo:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", roomName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->roomName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", deviceSn=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->deviceSn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", returnAirTemperature="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->returnAirTemperature:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", settingMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", settingTemp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingTemp:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", settingWindSpeed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->settingWindSpeed:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", powerSetting="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/TicaInnerStatus;->powerSetting:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
