.class public Lcom/dnake/desktop/bean/TicaOutStatus;
.super Ljava/lang/Object;
.source "TicaOutStatus.java"


# instance fields
.field private firstCompressorCopingTemperature:F

.field private firstCompressorStatus:F

.field private firstCrankAxleHeatDistrictStatus:I

.field private firstPypassValveStatus:I

.field private fourWayValveStatus:I

.field private id:I

.field private outdoorEnvironmentTemperature:F

.field private powerElectromagneticValveStatus:I

.field private programEdition:I

.field private runMode:I

.field private secondCompressorCopingTemperature:F

.field private secondCompressorStatus:F

.field private secondCrankAxleHeatDistrictStatus:I

.field private secondPypassValveStatus:I

.field private slaveAddr:I

.field private superCoolElectromagneticValveStatus:I

.field private systemComeSteamTemperature:F

.field private systemHighPressure:I

.field private systemLowPressure:I

.field private unitAbility:I

.field private unitType:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->id:I

    .line 33
    iput p2, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->slaveAddr:I

    return-void
.end method


# virtual methods
.method public getFirstCompressorCopingTemperature()F
    .locals 1

    .line 102
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCompressorCopingTemperature:F

    return v0
.end method

.method public getFirstCompressorStatus()F
    .locals 1

    .line 134
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCompressorStatus:F

    return v0
.end method

.method public getFirstCrankAxleHeatDistrictStatus()I
    .locals 1

    .line 158
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCrankAxleHeatDistrictStatus:I

    return v0
.end method

.method public getFirstPypassValveStatus()I
    .locals 1

    .line 150
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstPypassValveStatus:I

    return v0
.end method

.method public getFourWayValveStatus()I
    .locals 1

    .line 190
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->fourWayValveStatus:I

    return v0
.end method

.method public getId()I
    .locals 1

    .line 46
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->id:I

    return v0
.end method

.method public getOutdoorEnvironmentTemperature()F
    .locals 1

    .line 86
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->outdoorEnvironmentTemperature:F

    return v0
.end method

.method public getPowerElectromagneticValveStatus()I
    .locals 1

    .line 198
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->powerElectromagneticValveStatus:I

    return v0
.end method

.method public getProgramEdition()I
    .locals 1

    .line 70
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->programEdition:I

    return v0
.end method

.method public getRunMode()I
    .locals 1

    .line 78
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->runMode:I

    return v0
.end method

.method public getSecondCompressorCopingTemperature()F
    .locals 1

    .line 110
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCompressorCopingTemperature:F

    return v0
.end method

.method public getSecondCompressorStatus()F
    .locals 1

    .line 142
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCompressorStatus:F

    return v0
.end method

.method public getSecondCrankAxleHeatDistrictStatus()I
    .locals 1

    .line 166
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCrankAxleHeatDistrictStatus:I

    return v0
.end method

.method public getSecondPypassValveStatus()I
    .locals 1

    .line 182
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondPypassValveStatus:I

    return v0
.end method

.method public getSlaveAddr()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->slaveAddr:I

    return v0
.end method

.method public getSuperCoolElectromagneticValveStatus()I
    .locals 1

    .line 174
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->superCoolElectromagneticValveStatus:I

    return v0
.end method

.method public getSystemComeSteamTemperature()F
    .locals 1

    .line 94
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemComeSteamTemperature:F

    return v0
.end method

.method public getSystemHighPressure()I
    .locals 1

    .line 118
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemHighPressure:I

    return v0
.end method

.method public getSystemLowPressure()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemLowPressure:I

    return v0
.end method

.method public getUnitAbility()I
    .locals 1

    .line 62
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->unitAbility:I

    return v0
.end method

.method public getUnitType()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->unitType:I

    return v0
.end method

.method public setFirstCompressorCopingTemperature(F)V
    .locals 0

    .line 106
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCompressorCopingTemperature:F

    return-void
.end method

.method public setFirstCompressorStatus(F)V
    .locals 0

    .line 138
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCompressorStatus:F

    return-void
.end method

.method public setFirstCrankAxleHeatDistrictStatus(I)V
    .locals 0

    .line 162
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCrankAxleHeatDistrictStatus:I

    return-void
.end method

.method public setFirstPypassValveStatus(I)V
    .locals 0

    .line 154
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstPypassValveStatus:I

    return-void
.end method

.method public setFourWayValveStatus(I)V
    .locals 0

    .line 194
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->fourWayValveStatus:I

    return-void
.end method

.method public setId(I)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->id:I

    return-void
.end method

.method public setOutdoorEnvironmentTemperature(F)V
    .locals 0

    .line 90
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->outdoorEnvironmentTemperature:F

    return-void
.end method

.method public setPowerElectromagneticValveStatus(I)V
    .locals 0

    .line 202
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->powerElectromagneticValveStatus:I

    return-void
.end method

.method public setProgramEdition(I)V
    .locals 0

    .line 74
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->programEdition:I

    return-void
.end method

.method public setRunMode(I)V
    .locals 0

    .line 82
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->runMode:I

    return-void
.end method

.method public setSecondCompressorCopingTemperature(F)V
    .locals 0

    .line 114
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCompressorCopingTemperature:F

    return-void
.end method

.method public setSecondCompressorStatus(F)V
    .locals 0

    .line 146
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCompressorStatus:F

    return-void
.end method

.method public setSecondCrankAxleHeatDistrictStatus(I)V
    .locals 0

    .line 170
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCrankAxleHeatDistrictStatus:I

    return-void
.end method

.method public setSecondPypassValveStatus(I)V
    .locals 0

    .line 186
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondPypassValveStatus:I

    return-void
.end method

.method public setSlaveAddr(I)V
    .locals 0

    .line 41
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->slaveAddr:I

    return-void
.end method

.method public setSuperCoolElectromagneticValveStatus(I)V
    .locals 0

    .line 178
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->superCoolElectromagneticValveStatus:I

    return-void
.end method

.method public setSystemComeSteamTemperature(F)V
    .locals 0

    .line 98
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemComeSteamTemperature:F

    return-void
.end method

.method public setSystemHighPressure(I)V
    .locals 0

    .line 122
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemHighPressure:I

    return-void
.end method

.method public setSystemLowPressure(I)V
    .locals 0

    .line 130
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemLowPressure:I

    return-void
.end method

.method public setUnitAbility(I)V
    .locals 0

    .line 66
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->unitAbility:I

    return-void
.end method

.method public setUnitType(I)V
    .locals 0

    .line 58
    iput p1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->unitType:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TicaOutStatus{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", slaveAddr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->slaveAddr:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", unitType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->unitType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", unitAbility="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->unitAbility:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", programEdition="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->programEdition:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", runMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->runMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", outdoorEnvironmentTemperature="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->outdoorEnvironmentTemperature:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", systemComeSteamTemperature="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemComeSteamTemperature:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", firstCompressorCopingTemperature="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCompressorCopingTemperature:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", secondCompressorCopingTemperature="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCompressorCopingTemperature:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", systemHighPressure="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemHighPressure:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", systemLowPressure="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->systemLowPressure:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", firstCompressorStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCompressorStatus:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", secondCompressorStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCompressorStatus:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", firstPypassValveStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstPypassValveStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", firstCrankAxleHeatDistrictStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->firstCrankAxleHeatDistrictStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", secondCrankAxleHeatDistrictStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondCrankAxleHeatDistrictStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", superCoolElectromagneticValveStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->superCoolElectromagneticValveStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", secondPypassValveStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->secondPypassValveStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", fourWayValveStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->fourWayValveStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", powerElectromagneticValveStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/TicaOutStatus;->powerElectromagneticValveStatus:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
