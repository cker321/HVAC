.class public Lcom/dnake/desktop/bean/NtWriteResult;
.super Ljava/lang/Object;
.source "NtWriteResult.java"


# instance fields
.field address:I

.field value:F

.field writeWind:Z


# direct methods
.method public constructor <init>(IFZ)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lcom/dnake/desktop/bean/NtWriteResult;->address:I

    .line 14
    iput p2, p0, Lcom/dnake/desktop/bean/NtWriteResult;->value:F

    .line 15
    iput-boolean p3, p0, Lcom/dnake/desktop/bean/NtWriteResult;->writeWind:Z

    return-void
.end method


# virtual methods
.method public getAddress()I
    .locals 1

    .line 19
    iget v0, p0, Lcom/dnake/desktop/bean/NtWriteResult;->address:I

    return v0
.end method

.method public getValue()F
    .locals 1

    .line 23
    iget v0, p0, Lcom/dnake/desktop/bean/NtWriteResult;->value:F

    return v0
.end method

.method public isWriteWind()Z
    .locals 1

    .line 27
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/NtWriteResult;->writeWind:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NtWriteResult{address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/NtWriteResult;->address:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/NtWriteResult;->value:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", writeWind="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/NtWriteResult;->writeWind:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
