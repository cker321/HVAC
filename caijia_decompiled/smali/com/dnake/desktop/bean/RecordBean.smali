.class public Lcom/dnake/desktop/bean/RecordBean;
.super Ljava/lang/Object;
.source "RecordBean.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private co2:F

.field private humidity:F

.field private pm25:F

.field private temp:F

.field private voc:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 61
    :cond_1
    check-cast p1, Lcom/dnake/desktop/bean/RecordBean;

    .line 62
    iget v2, p1, Lcom/dnake/desktop/bean/RecordBean;->pm25:F

    iget v3, p0, Lcom/dnake/desktop/bean/RecordBean;->pm25:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    iget v2, p1, Lcom/dnake/desktop/bean/RecordBean;->co2:F

    iget v3, p0, Lcom/dnake/desktop/bean/RecordBean;->co2:F

    .line 63
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    iget v2, p1, Lcom/dnake/desktop/bean/RecordBean;->voc:F

    iget v3, p0, Lcom/dnake/desktop/bean/RecordBean;->voc:F

    .line 64
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    iget v2, p1, Lcom/dnake/desktop/bean/RecordBean;->humidity:F

    iget v3, p0, Lcom/dnake/desktop/bean/RecordBean;->humidity:F

    .line 65
    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-nez v2, :cond_2

    iget p1, p1, Lcom/dnake/desktop/bean/RecordBean;->temp:F

    iget v2, p0, Lcom/dnake/desktop/bean/RecordBean;->temp:F

    .line 66
    invoke-static {p1, v2}, Ljava/lang/Float;->compare(FF)I

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getCo2()F
    .locals 1

    .line 26
    iget v0, p0, Lcom/dnake/desktop/bean/RecordBean;->co2:F

    return v0
.end method

.method public getHumidity()F
    .locals 1

    .line 42
    iget v0, p0, Lcom/dnake/desktop/bean/RecordBean;->humidity:F

    return v0
.end method

.method public getPm25()F
    .locals 1

    .line 18
    iget v0, p0, Lcom/dnake/desktop/bean/RecordBean;->pm25:F

    return v0
.end method

.method public getTemp()F
    .locals 1

    .line 50
    iget v0, p0, Lcom/dnake/desktop/bean/RecordBean;->temp:F

    return v0
.end method

.method public getVoc()F
    .locals 1

    .line 34
    iget v0, p0, Lcom/dnake/desktop/bean/RecordBean;->voc:F

    return v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    .line 71
    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->pm25:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->co2:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->voc:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->humidity:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->temp:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public setCo2(F)V
    .locals 0

    .line 30
    iput p1, p0, Lcom/dnake/desktop/bean/RecordBean;->co2:F

    return-void
.end method

.method public setHumidity(F)V
    .locals 0

    .line 46
    iput p1, p0, Lcom/dnake/desktop/bean/RecordBean;->humidity:F

    return-void
.end method

.method public setPm25(F)V
    .locals 0

    .line 22
    iput p1, p0, Lcom/dnake/desktop/bean/RecordBean;->pm25:F

    return-void
.end method

.method public setTemp(F)V
    .locals 0

    .line 54
    iput p1, p0, Lcom/dnake/desktop/bean/RecordBean;->temp:F

    return-void
.end method

.method public setVoc(F)V
    .locals 0

    .line 38
    iput p1, p0, Lcom/dnake/desktop/bean/RecordBean;->voc:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RecordBean{pm25="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->pm25:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", co2="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->co2:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", voc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->voc:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", humidity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->humidity:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", temp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/RecordBean;->temp:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
