.class public Lcom/landleaf/smarthome/model/TimingModel;
.super Ljava/lang/Object;
.source "TimingModel.java"


# instance fields
.field private enabled:I

.field private endDate:Ljava/lang/String;

.field private executeTime:Ljava/lang/String;

.field private sceneId:Ljava/lang/String;

.field private sceneName:Ljava/lang/String;

.field private skipHoliday:I

.field private startDate:Ljava/lang/String;

.field private timingId:Ljava/lang/String;

.field private type:I

.field private weekday:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getEnabled()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->enabled:I

    return v0
.end method

.method public getEndDate()Ljava/lang/String;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->endDate:Ljava/lang/String;

    return-object v0
.end method

.method public getExecuteTime()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->executeTime:Ljava/lang/String;

    return-object v0
.end method

.method public getSceneId()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->sceneId:Ljava/lang/String;

    return-object v0
.end method

.method public getSceneName()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->sceneName:Ljava/lang/String;

    return-object v0
.end method

.method public getSkipHoliday()I
    .locals 1

    .line 85
    iget v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->skipHoliday:I

    return v0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->startDate:Ljava/lang/String;

    return-object v0
.end method

.method public getTimingId()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->timingId:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 69
    iget v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->type:I

    return v0
.end method

.method public getWeekday()Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/landleaf/smarthome/model/TimingModel;->weekday:Ljava/lang/String;

    return-object v0
.end method

.method public setEnabled(I)V
    .locals 0

    .line 81
    iput p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->enabled:I

    return-void
.end method

.method public setEndDate(Ljava/lang/String;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->endDate:Ljava/lang/String;

    return-void
.end method

.method public setExecuteTime(Ljava/lang/String;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->executeTime:Ljava/lang/String;

    return-void
.end method

.method public setSceneId(Ljava/lang/String;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->sceneId:Ljava/lang/String;

    return-void
.end method

.method public setSceneName(Ljava/lang/String;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->sceneName:Ljava/lang/String;

    return-void
.end method

.method public setSkipHoliday(I)V
    .locals 0

    .line 89
    iput p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->skipHoliday:I

    return-void
.end method

.method public setStartDate(Ljava/lang/String;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->startDate:Ljava/lang/String;

    return-void
.end method

.method public setTimingId(Ljava/lang/String;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->timingId:Ljava/lang/String;

    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 73
    iput p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->type:I

    return-void
.end method

.method public setWeekday(Ljava/lang/String;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/landleaf/smarthome/model/TimingModel;->weekday:Ljava/lang/String;

    return-void
.end method
