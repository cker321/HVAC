.class public Lcom/landleaf/smarthome/model/SceneControlBean;
.super Ljava/lang/Object;
.source "SceneControlBean.java"


# instance fields
.field delayControl:Z

.field modeIndex:I

.field remoteControl:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->modeIndex:I

    .line 14
    iput-boolean p2, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->remoteControl:Z

    return-void
.end method


# virtual methods
.method public getModeIndex()I
    .locals 1

    .line 26
    iget v0, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->modeIndex:I

    return v0
.end method

.method public isDelayControl()Z
    .locals 1

    .line 18
    iget-boolean v0, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->delayControl:Z

    return v0
.end method

.method public isRemountControl()Z
    .locals 1

    .line 30
    iget-boolean v0, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->remoteControl:Z

    return v0
.end method

.method public setDelayControl(Z)V
    .locals 0

    .line 22
    iput-boolean p1, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->delayControl:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SceneControlBean{modeIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->modeIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", remoteControl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/landleaf/smarthome/model/SceneControlBean;->remoteControl:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
