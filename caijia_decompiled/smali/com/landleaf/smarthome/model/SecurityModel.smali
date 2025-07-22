.class public Lcom/landleaf/smarthome/model/SecurityModel;
.super Ljava/lang/Object;
.source "SecurityModel.java"


# instance fields
.field private alarmDevice:Ljava/lang/String;

.field private alarmId:I

.field private alarmTime:J

.field private alarmType:I

.field private alarmZone:I

.field private context:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlarmDevice()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmDevice:Ljava/lang/String;

    return-object v0
.end method

.method public getAlarmId()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmId:I

    return v0
.end method

.method public getAlarmTime()J
    .locals 2

    .line 45
    iget-wide v0, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmTime:J

    return-wide v0
.end method

.method public getAlarmType()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmType:I

    return v0
.end method

.method public getAlarmZone()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmZone:I

    return v0
.end method

.method public getContext()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SecurityModel;->context:Ljava/lang/String;

    return-object v0
.end method

.method public setAlarmDevice(Ljava/lang/String;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmDevice:Ljava/lang/String;

    return-void
.end method

.method public setAlarmId(I)V
    .locals 0

    .line 57
    iput p1, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmId:I

    return-void
.end method

.method public setAlarmTime(J)V
    .locals 0

    .line 49
    iput-wide p1, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmTime:J

    return-void
.end method

.method public setAlarmType(I)V
    .locals 0

    .line 41
    iput p1, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmType:I

    return-void
.end method

.method public setAlarmZone(I)V
    .locals 0

    .line 33
    iput p1, p0, Lcom/landleaf/smarthome/model/SecurityModel;->alarmZone:I

    return-void
.end method

.method public setContext(Ljava/lang/String;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SecurityModel;->context:Ljava/lang/String;

    return-void
.end method
