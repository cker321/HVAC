.class public Lcom/dnake/desktop/controller/SettingController;
.super Ljava/lang/Object;
.source "SettingController.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method infoUpdate()Lcom/dnake/desktop/bean/RegisterInfo;
    .locals 8

    .line 25
    new-instance v0, Lcom/dnake/desktop/bean/RegisterInfo;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/RegisterInfo;-><init>()V

    .line 26
    new-instance v1, Lcom/dnake/desktop/dnake/v700/dxml;

    invoke-direct {v1}, Lcom/dnake/desktop/dnake/v700/dxml;-><init>()V

    const-string v2, "/dnake/cfg/sys.xml"

    .line 27
    invoke-virtual {v1, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->load(Ljava/lang/String;)Ljava/lang/Boolean;

    const/4 v2, 0x0

    const-string v3, "/sys/talk/building"

    .line 28
    invoke-virtual {v1, v3, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->getInt(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "/sys/talk/unit"

    .line 29
    invoke-virtual {v1, v4, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->getInt(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "/sys/talk/floor"

    .line 30
    invoke-virtual {v1, v5, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->getInt(Ljava/lang/String;I)I

    move-result v5

    const-string v6, "/sys/talk/family"

    .line 31
    invoke-virtual {v1, v6, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 32
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "SettingController"

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/RegisterInfo;->setFloorId(Ljava/lang/String;)V

    .line 34
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/RegisterInfo;->setUnitId(Ljava/lang/String;)V

    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v2

    const-string v1, "%02d"

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/RegisterInfo;->setRoomId(Ljava/lang/String;)V

    .line 36
    sget-object v1, Lcom/dnake/desktop/costant/VariableConstant;->HOUSE_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/RegisterInfo;->setRoomType(Ljava/lang/String;)V

    .line 37
    sget-object v1, Lcom/dnake/desktop/costant/VariableConstant;->DEVICE_IP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/RegisterInfo;->setIpAddress(Ljava/lang/String;)V

    .line 38
    sget-object v1, Lcom/dnake/desktop/costant/VariableConstant;->DEVICE_ID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/RegisterInfo;->setDeviceID(Ljava/lang/String;)V

    return-object v0
.end method

.method public getAirStatus()Lcom/dnake/desktop/bean/TicaInnerStatus;
    .locals 2

    .line 200
    const-string v0, "SettingController"
    const-string v1, "getAirStatus called"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    new-instance v0, Lcom/dnake/desktop/bean/TicaInnerStatus;
    invoke-direct {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;-><init>()V

    .line 202
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPower(I)V
    const/16 v1, 0x19
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setTemp(I)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setMode(I)V
    const/4 v1, 0x2
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setFanSpeed(I)V

    return-object v0
.end method

.method public getWindStatus()Lcom/dnake/desktop/bean/WindStatus;
    .locals 2

    .line 210
    const-string v0, "SettingController"
    const-string v1, "getWindStatus called"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    new-instance v0, Lcom/dnake/desktop/bean/WindStatus;
    invoke-direct {v0}, Lcom/dnake/desktop/bean/WindStatus;-><init>()V

    .line 212
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/WindStatus;->setPower(I)V
    const/16 v1, 0x19
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/WindStatus;->setTemp(I)V
    const/16 v1, 0x32
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/WindStatus;->setHumidity(I)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/WindStatus;->setMode(I)V
    const/4 v1, 0x2
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/WindStatus;->setFanSpeed(I)V

    return-object v0
.end method

.method public controlAir(Lcom/dnake/desktop/bean/TicaInnerStatus;)Ljava/lang/String;
    .locals 2

    .line 220
    const-string v0, "SettingController"
    const-string v1, "controlAir called"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    const-string v0, "{\"code\":0,\"message\":\"success\",\"data\":null}"

    return-object v0
.end method

.method public controlWind(Lcom/dnake/desktop/bean/WindStatus;)Ljava/lang/String;
    .locals 2

    .line 230
    const-string v0, "SettingController"
    const-string v1, "controlWind called"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    const-string v0, "{\"code\":0,\"message\":\"success\",\"data\":null}"

    return-object v0
.end method
