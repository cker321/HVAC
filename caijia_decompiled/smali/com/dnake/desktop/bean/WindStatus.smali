.class public Lcom/dnake/desktop/bean/WindStatus;
.super Ljava/lang/Object;
.source "WindStatus.java"


# instance fields
.field humiditySwitch:I

.field mode:I

.field power:I

.field showTemp:F

.field typeTemp:Z

.field windHumidity:F

.field windSpeed:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_7

    .line 83
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_3

    .line 84
    :cond_1
    check-cast p1, Lcom/dnake/desktop/bean/WindStatus;

    .line 85
    iget v2, p1, Lcom/dnake/desktop/bean/WindStatus;->showTemp:F

    iget v3, p0, Lcom/dnake/desktop/bean/WindStatus;->showTemp:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    iget v2, p1, Lcom/dnake/desktop/bean/WindStatus;->windHumidity:F

    iget v3, p0, Lcom/dnake/desktop/bean/WindStatus;->windHumidity:F

    .line 86
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    .line 87
    :goto_0
    iget v3, p0, Lcom/dnake/desktop/bean/WindStatus;->power:I

    iget v4, p1, Lcom/dnake/desktop/bean/WindStatus;->power:I

    if-ne v3, v4, :cond_3

    iget v3, p0, Lcom/dnake/desktop/bean/WindStatus;->mode:I

    iget v4, p1, Lcom/dnake/desktop/bean/WindStatus;->mode:I

    if-ne v3, v4, :cond_3

    iget v3, p0, Lcom/dnake/desktop/bean/WindStatus;->windSpeed:I

    iget v4, p1, Lcom/dnake/desktop/bean/WindStatus;->windSpeed:I

    if-ne v3, v4, :cond_3

    iget v3, p0, Lcom/dnake/desktop/bean/WindStatus;->humiditySwitch:I

    iget v4, p1, Lcom/dnake/desktop/bean/WindStatus;->humiditySwitch:I

    if-ne v3, v4, :cond_3

    const/4 v3, 0x1

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    .line 91
    :goto_1
    iget-boolean v4, p0, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    iget-boolean v5, p1, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    if-ne v4, v5, :cond_4

    if-nez v2, :cond_6

    :cond_4
    iget-boolean v2, p0, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    iget-boolean p1, p1, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    if-ne v2, p1, :cond_5

    if-eqz v3, :cond_5

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    :cond_6
    :goto_2
    return v0

    :cond_7
    :goto_3
    return v1
.end method

.method public getHumiditySwitch()I
    .locals 1

    .line 73
    iget v0, p0, Lcom/dnake/desktop/bean/WindStatus;->humiditySwitch:I

    return v0
.end method

.method public getMode()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/dnake/desktop/bean/WindStatus;->mode:I

    return v0
.end method

.method public getPower()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/dnake/desktop/bean/WindStatus;->power:I

    return v0
.end method

.method public getShowTemp()F
    .locals 1

    .line 33
    iget v0, p0, Lcom/dnake/desktop/bean/WindStatus;->showTemp:F

    return v0
.end method

.method public getWindHumidity()F
    .locals 1

    .line 41
    iget v0, p0, Lcom/dnake/desktop/bean/WindStatus;->windHumidity:F

    return v0
.end method

.method public getWindSpeed()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/dnake/desktop/bean/WindStatus;->windSpeed:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/Object;

    .line 96
    iget-boolean v1, p0, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->showTemp:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->windHumidity:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->power:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->mode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->windSpeed:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->humiditySwitch:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isTypeTemp()Z
    .locals 1

    .line 25
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    return v0
.end method

.method public setHumiditySwitch(I)V
    .locals 0

    .line 77
    iput p1, p0, Lcom/dnake/desktop/bean/WindStatus;->humiditySwitch:I

    return-void
.end method

.method public setMode(I)V
    .locals 0

    .line 61
    iput p1, p0, Lcom/dnake/desktop/bean/WindStatus;->mode:I

    return-void
.end method

.method public setPower(I)V
    .locals 0

    .line 53
    iput p1, p0, Lcom/dnake/desktop/bean/WindStatus;->power:I

    return-void
.end method

.method public setShowTemp(F)V
    .locals 0

    .line 37
    iput p1, p0, Lcom/dnake/desktop/bean/WindStatus;->showTemp:F

    return-void
.end method

.method public setTypeTemp(Z)V
    .locals 0

    .line 29
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    return-void
.end method

.method public setWindHumidity(F)V
    .locals 0

    .line 45
    iput p1, p0, Lcom/dnake/desktop/bean/WindStatus;->windHumidity:F

    return-void
.end method

.method public setWindSpeed(I)V
    .locals 0

    .line 69
    iput p1, p0, Lcom/dnake/desktop/bean/WindStatus;->windSpeed:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WindStatus{typeTemp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/WindStatus;->typeTemp:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", showTemp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->showTemp:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", windHumidity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->windHumidity:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", power="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->power:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->mode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", windSpeed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->windSpeed:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", humiditySwitch="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/WindStatus;->humiditySwitch:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
