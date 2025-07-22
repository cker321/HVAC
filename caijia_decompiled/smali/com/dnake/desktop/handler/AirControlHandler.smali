.class public Lcom/dnake/desktop/handler/AirControlHandler;
.super Ljava/lang/Object;
.source "AirControlHandler.java"

# interfaces
.implements Lcom/dnake/desktop/callback/Rs485Callback;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final AIR_ADDRESS:I

.field private final DEFAULT_WRITE_AMOUNT:I

.field private final INNER_START_ADDRESS:I

.field private final OUTER_START_ADDRESS:I

.field private final READ_FUNCTION_CODE:I

.field private TAG:Ljava/lang/String;

.field private final WRITE_FUNCTION_CODE:I

.field private deviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;"
        }
    .end annotation
.end field

.field private final hashMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;"
        }
    .end annotation
.end field

.field private machineNo:I

.field private ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

.field uploadMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "AirControlHandler"

    .line 44
    iput-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->TAG:Ljava/lang/String;

    const/4 v0, 0x3

    .line 46
    iput v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->AIR_ADDRESS:I

    const/4 v1, 0x1

    .line 48
    iput v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    const/16 v1, 0x90

    .line 51
    iput v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->INNER_START_ADDRESS:I

    const/16 v1, 0x60

    .line 53
    iput v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->OUTER_START_ADDRESS:I

    const/16 v1, 0x10

    .line 54
    iput v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->WRITE_FUNCTION_CODE:I

    .line 55
    iput v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->READ_FUNCTION_CODE:I

    const/16 v0, 0x9

    .line 57
    iput v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->DEFAULT_WRITE_AMOUNT:I

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->uploadMap:Ljava/util/HashMap;

    return-void
.end method

.method private adjustUpload(Lcom/dnake/desktop/bean/TicaInnerStatus;Lcom/dnake/desktop/bean/TicaInnerStatus;)Z
    .locals 1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    return v0

    .line 237
    :cond_0
    invoke-virtual {p1, p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    return v0
.end method

.method private getModeAttrValue(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string p1, "cold"

    return-object p1

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    const-string p1, "hot"

    return-object p1

    :cond_1
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    const-string p1, "wind"

    return-object p1

    :cond_2
    const-string p1, "dehumidification"

    return-object p1
.end method

.method private getPowerAttrValue(Z)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_0

    const-string p1, "on"

    return-object p1

    :cond_0
    const-string p1, "off"

    return-object p1
.end method

.method private getSpeedAttrValue(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    const-string p1, "high_speed"

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string p1, "medium_speed"

    return-object p1

    :cond_1
    if-nez p1, :cond_2

    const-string p1, "low_speed"

    return-object p1

    :cond_2
    const-string p1, "auto"

    return-object p1
.end method

.method private readInnerStatus()V
    .locals 4

    .line 76
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    iget v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    add-int/lit8 v1, v1, -0x1

    const/16 v2, 0x10

    mul-int/lit8 v1, v1, 0x10

    add-int/lit16 v1, v1, 0x90

    const/4 v3, 0x3

    invoke-virtual {v0, v3, v3, v1, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 78
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v2, 0x12c

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 79
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {p0, v1, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->convertToTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;[B)Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 82
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    iget-object v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 83
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    iget v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setMachineNo(I)V

    .line 84
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x2008

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setDeviceSn(Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-direct {p0, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->uploadRead(Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 88
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private readOuterStatus()V
    .locals 4

    .line 94
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x3

    const/16 v2, 0x60

    const/16 v3, 0x10

    invoke-virtual {v0, v1, v1, v2, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 96
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v2, 0x12c

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 97
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object v0

    .line 99
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object v0

    .line 100
    new-instance v1, Lcom/dnake/desktop/bean/NtWriteResult;

    const/16 v2, 0x64

    const/4 v3, 0x4

    aget v0, v0, v3

    int-to-float v0, v0

    const/high16 v3, 0x41200000    # 10.0f

    div-float/2addr v0, v3

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcom/dnake/desktop/bean/NtWriteResult;-><init>(IFZ)V

    .line 101
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 104
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private updateHash(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 295
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    monitor-enter v0

    .line 296
    :try_start_0
    iget-object v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-nez p1, :cond_1

    .line 298
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/dnake/desktop/handler/AirControlHandler;->updateTica(I)V

    .line 299
    monitor-exit v0

    return-void

    .line 301
    :cond_1
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 302
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->updateTica(I)V

    goto :goto_0

    .line 305
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method private updateTica(I)V
    .locals 1

    .line 309
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 311
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingMode(I)V

    .line 312
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    return-void
.end method

.method private uploadRead(Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 9

    .line 208
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->uploadMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 209
    invoke-direct {p0, v0, p1}, Lcom/dnake/desktop/handler/AirControlHandler;->adjustUpload(Lcom/dnake/desktop/bean/TicaInnerStatus;Lcom/dnake/desktop/bean/TicaInnerStatus;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 210
    iget-object p1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->TAG:Ljava/lang/String;

    const-string v0, "upload \u6570\u636e\u4e00\u81f4"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 213
    :cond_0
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 214
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/16 v2, 0x2008

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    .line 215
    :goto_0
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    .line 216
    invoke-virtual {v0, v2}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 217
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 218
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result v3

    invoke-direct {p0, v3}, Lcom/dnake/desktop/handler/AirControlHandler;->getPowerAttrValue(Z)Ljava/lang/String;

    move-result-object v3

    const-string v4, "switch"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/dnake/desktop/handler/AirControlHandler;->getModeAttrValue(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "mode"

    invoke-direct {v3, v5, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingTemp()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "setting_temperature"

    invoke-direct {v4, v6, v5}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    new-instance v5, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingWindSpeed()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/dnake/desktop/handler/AirControlHandler;->getSpeedAttrValue(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "wind_speed"

    invoke-direct {v5, v7, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    new-instance v6, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getReturnAirTemperature()F

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v7

    const-string v8, "temperature"

    invoke-direct {v6, v8, v7}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 229
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    .line 230
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->uploadMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private writeStatusToBytes(Lcom/dnake/desktop/bean/TicaInnerStatus;I)[B
    .locals 10

    const/16 v0, 0x19

    new-array v0, v0, [B

    const/4 v1, 0x3

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    const/4 v3, 0x1

    const/16 v4, 0x10

    aput-byte v4, v0, v3

    .line 368
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v0, v4, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->int2Bytes([BII)V

    .line 370
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v3

    const/4 v5, 0x4

    const/16 v6, 0x9

    invoke-virtual {v3, v0, v5, v6}, Lcom/dnake/desktop/utils/Rs485Utils;->int2Bytes([BII)V

    const/16 v3, 0x12

    const/4 v6, 0x6

    aput-byte v3, v0, v6

    new-array v6, v3, [B

    .line 375
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v7

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result v8

    invoke-virtual {v7, v6, v2, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->int2Bytes([BII)V

    .line 377
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v7

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingTemp()I

    move-result v8

    invoke-virtual {v7, v6, v4, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->int2Bytes([BII)V

    .line 379
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v7

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingWindSpeed()I

    move-result v8

    invoke-virtual {v7, v6, v5, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->int2Bytes([BII)V

    .line 382
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isSwingSetting()Z

    move-result v7

    const/4 v8, 0x7

    if-eqz v7, :cond_0

    .line 383
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v7

    aget-byte v9, v6, v8

    invoke-virtual {v7, v9, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToOne(II)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v6, v8

    goto :goto_0

    .line 385
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    aget-byte v7, v6, v8

    invoke-static {v7, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToZero(II)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v6, v8

    .line 388
    :goto_0
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isSleepSetting()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 389
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget-byte v7, v6, v8

    invoke-virtual {v4, v7, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToOne(II)I

    move-result v1

    int-to-byte v1, v1

    aput-byte v1, v6, v8

    goto :goto_1

    .line 391
    :cond_1
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    aget-byte v4, v6, v8

    invoke-static {v4, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToZero(II)I

    move-result v1

    int-to-byte v1, v1

    aput-byte v1, v6, v8

    .line 394
    :goto_1
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isElectricAuxiliaryHeatingSetting()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 395
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    aget-byte v4, v6, v8

    invoke-virtual {v1, v4, v5}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToOne(II)I

    move-result v1

    int-to-byte v1, v1

    aput-byte v1, v6, v8

    goto :goto_2

    .line 397
    :cond_2
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    aget-byte v1, v6, v8

    invoke-static {v1, v5}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToZero(II)I

    move-result v1

    int-to-byte v1, v1

    aput-byte v1, v6, v8

    .line 400
    :goto_2
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 401
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object p1

    aget-byte v1, v6, v8

    invoke-virtual {p1, v1, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToOne(II)I

    move-result p1

    int-to-byte p1, p1

    aput-byte p1, v6, v8

    goto :goto_3

    .line 403
    :cond_3
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    aget-byte p1, v6, v8

    invoke-static {p1, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToZero(II)I

    move-result p1

    int-to-byte p1, p1

    aput-byte p1, v6, v8

    :goto_3
    if-nez p2, :cond_4

    const/16 p2, 0xff

    .line 408
    :cond_4
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object p1

    const/16 v1, 0xa

    invoke-virtual {p1, v6, v1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->int2Bytes([BII)V

    .line 411
    invoke-static {v6, v2, v0, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 412
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->getSendBuf([B)[B

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public convertToTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;[B)Lcom/dnake/desktop/bean/TicaInnerStatus;
    .locals 11

    .line 432
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object p2

    if-eqz p2, :cond_4

    const/4 v0, 0x0

    .line 435
    aget v1, p2, v0

    invoke-virtual {p1, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setUnitType(I)V

    const/4 v1, 0x1

    .line 437
    aget v2, p2, v1

    invoke-virtual {p1, v2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setUnitAbility(I)V

    const/4 v2, 0x2

    .line 439
    aget v3, p2, v2

    int-to-float v3, v3

    const/high16 v4, 0x41200000    # 10.0f

    div-float/2addr v3, v4

    invoke-virtual {p1, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setProgramEdition(F)V

    const/4 v3, 0x3

    .line 441
    aget v5, p2, v3

    invoke-virtual {p1, v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setModeRun(I)V

    const/4 v5, 0x4

    .line 443
    aget v6, p2, v5

    int-to-float v6, v6

    div-float/2addr v6, v4

    invoke-virtual {p1, v6}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setIntakeTemperature(F)V

    const/4 v6, 0x5

    .line 445
    aget v7, p2, v6

    int-to-float v7, v7

    div-float/2addr v7, v4

    invoke-virtual {p1, v7}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setMidDiskTemperature(F)V

    const/4 v7, 0x6

    .line 447
    aget v8, p2, v7

    int-to-float v8, v8

    div-float/2addr v8, v4

    invoke-virtual {p1, v8}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setOutletTemperature(F)V

    const/4 v8, 0x7

    .line 449
    aget v9, p2, v8

    int-to-float v9, v9

    div-float/2addr v9, v4

    invoke-virtual {p1, v9}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setReturnAirTemperature(F)V

    const/16 v4, 0x8

    .line 451
    aget v9, p2, v4

    and-int/2addr v9, v8

    invoke-virtual {p1, v9}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setWindSpeedStatus(I)V

    .line 453
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v9

    aget v10, p2, v4

    invoke-virtual {v9, v10, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v9

    invoke-virtual {p1, v9}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setElectricAuxiliaryHeatingStatus(I)V

    .line 455
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v9

    aget v4, p2, v4

    invoke-virtual {v9, v4, v7}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setWaterPumpStatus(I)V

    .line 457
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    const/16 v9, 0x9

    aget v10, p2, v9

    invoke-virtual {v4, v10, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setTH1Error(I)V

    .line 459
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget v10, p2, v9

    invoke-virtual {v4, v10, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setTH2Error(I)V

    .line 461
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget v10, p2, v9

    invoke-virtual {v4, v10, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setTH3Error(I)V

    .line 463
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget v10, p2, v9

    invoke-virtual {v4, v10, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setTH4Error(I)V

    .line 465
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget v10, p2, v9

    invoke-virtual {v4, v10, v6}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPatternConflict(I)V

    .line 467
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget v6, p2, v9

    invoke-virtual {v4, v6, v7}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setCommunicationFailure(I)V

    .line 469
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    aget v6, p2, v9

    invoke-virtual {v4, v6, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setWaterLevelFailure(I)V

    const/16 v4, 0xa

    .line 471
    aget v4, p2, v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingMode(I)V

    const/16 v4, 0xb

    .line 473
    aget v4, p2, v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingTemp(I)V

    const/16 v4, 0xc

    .line 475
    aget v4, p2, v4

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingWindSpeed(I)V

    .line 477
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    const/16 v6, 0xd

    aget v7, p2, v6

    invoke-virtual {v4, v7, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v2

    if-ne v2, v1, :cond_0

    .line 479
    invoke-virtual {p1, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSwingSetting(Z)V

    goto :goto_0

    .line 481
    :cond_0
    invoke-virtual {p1, v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSwingSetting(Z)V

    .line 484
    :goto_0
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    aget v4, p2, v6

    invoke-virtual {v2, v4, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v2

    if-ne v2, v1, :cond_1

    .line 486
    invoke-virtual {p1, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSleepSetting(Z)V

    goto :goto_1

    .line 488
    :cond_1
    invoke-virtual {p1, v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSleepSetting(Z)V

    .line 491
    :goto_1
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    aget v3, p2, v6

    invoke-virtual {v2, v3, v5}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result v2

    if-ne v2, v1, :cond_2

    .line 492
    invoke-virtual {p1, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setElectricAuxiliaryHeatingSetting(Z)V

    goto :goto_2

    .line 494
    :cond_2
    invoke-virtual {p1, v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setElectricAuxiliaryHeatingSetting(Z)V

    .line 499
    :goto_2
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    aget p2, p2, v6

    invoke-virtual {v2, p2, v8}, Lcom/dnake/desktop/utils/Rs485Utils;->getBit(II)B

    move-result p2

    if-ne p2, v1, :cond_3

    .line 500
    invoke-virtual {p1, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    goto :goto_3

    .line 502
    :cond_3
    invoke-virtual {p1, v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 506
    :goto_3
    iget-object p2, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    monitor-enter p2

    .line 507
    :try_start_0
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    monitor-exit p2

    goto :goto_4

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_4
    :goto_4
    return-object p1
.end method

.method public getShowTicaStatus(I)Lcom/dnake/desktop/bean/TicaInnerStatus;
    .locals 1

    .line 354
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    return-object p1
.end method

.method public handlerAirModeConflict(I)Z
    .locals 9

    .line 157
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    monitor-enter v0

    .line 158
    :try_start_0
    iget-object v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 159
    iget v5, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_1

    goto :goto_0

    .line 162
    :cond_1
    iget-object v5, p0, Lcom/dnake/desktop/handler/AirControlHandler;->hashMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/dnake/desktop/bean/TicaInnerStatus;

    const-string v6, "AirControlHandler"

    .line 163
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "integer:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result v4

    const/4 v6, 0x0

    if-eqz v4, :cond_0

    .line 166
    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result v3

    const/4 v4, 0x2

    if-ne p1, v4, :cond_2

    if-eq p1, v3, :cond_2

    .line 168
    monitor-exit v0

    return v6

    :cond_2
    if-ne p1, v2, :cond_3

    if-ne v3, v4, :cond_3

    .line 171
    monitor-exit v0

    return v6

    :cond_3
    const/4 v5, 0x4

    if-ne p1, v5, :cond_4

    if-ne v3, v4, :cond_4

    .line 174
    monitor-exit v0

    return v6

    :cond_4
    const/4 v5, 0x5

    if-ne p1, v5, :cond_5

    if-ne v3, v4, :cond_5

    .line 177
    monitor-exit v0

    return v6

    :cond_5
    const/4 v3, 0x0

    goto :goto_0

    .line 181
    :cond_6
    monitor-exit v0

    if-eqz v3, :cond_7

    :cond_7
    return v2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public read()V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/dnake/desktop/handler/AirControlHandler;->readInnerStatus()V

    .line 71
    invoke-direct {p0}, Lcom/dnake/desktop/handler/AirControlHandler;->readOuterStatus()V

    return-void
.end method

.method public setDeviceList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;)V"
        }
    .end annotation

    .line 65
    iput-object p1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->deviceList:Ljava/util/List;

    return-void
.end method

.method public setMachineNo(I)V
    .locals 0

    .line 350
    iput p1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    return-void
.end method

.method public setTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 0

    .line 358
    iput-object p1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    return-void
.end method

.method public upload()V
    .locals 6

    .line 190
    iget-object v0, p0, Lcom/dnake/desktop/handler/AirControlHandler;->deviceList:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 191
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 192
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    const/16 v4, 0x10

    mul-int/lit8 v3, v3, 0x10

    add-int/lit16 v3, v3, 0x90

    const/4 v5, 0x3

    invoke-virtual {v2, v5, v5, v3, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v2

    .line 194
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v3

    const/16 v4, 0x12c

    invoke-virtual {v3, v2, v4}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v3

    .line 195
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 196
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object v2

    .line 197
    invoke-virtual {p0, v1, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->convertToTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;[B)Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 198
    invoke-direct {p0, v1}, Lcom/dnake/desktop/handler/AirControlHandler;->uploadRead(Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 201
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public uploadDeviceBug()V
    .locals 9

    .line 317
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x3

    const/16 v2, 0xa

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v1, v2, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 319
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v2, 0x12c

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 320
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 321
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object v0

    .line 322
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object v0

    .line 323
    iget-object v1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->deviceList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    .line 324
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v1, "82001"

    .line 327
    :cond_0
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v3}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 328
    invoke-virtual {v3, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v1, 0x2008

    .line 329
    invoke-virtual {v3, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 330
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 332
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v5, "glv_1_fault_1"

    aget v2, v0, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v5, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v5, "glv_1_fault_2"

    const/4 v6, 0x4

    aget v6, v0, v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    new-instance v5, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v6, "glv_1_fault_3"

    const/4 v7, 0x5

    aget v7, v0, v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    new-instance v6, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v7, "glv_1_fault_4"

    const/4 v8, 0x6

    aget v0, v0, v8

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v7, v0}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    invoke-virtual {v3, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 342
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 345
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public uploadSceneWrite(Ljava/lang/String;Lcom/dnake/desktop/bean/TicaInnerStatus;Z)V
    .locals 5

    .line 271
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 272
    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 p1, 0x2008

    .line 273
    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 274
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "switch"

    if-eqz p3, :cond_0

    .line 276
    new-instance p2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string p3, "off"

    invoke-direct {p2, v1, p3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 279
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void

    .line 282
    :cond_0
    new-instance p3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v2, "on"

    invoke-direct {p3, v1, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->getModeAttrValue(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "mode"

    invoke-direct {v1, v3, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingTemp()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "setting_temperature"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingWindSpeed()I

    move-result p2

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/AirControlHandler;->getSpeedAttrValue(I)Ljava/lang/String;

    move-result-object p2

    const-string v4, "wind_speed"

    invoke-direct {v3, v4, p2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 290
    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 291
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method

.method public write(II)V
    .locals 8

    .line 110
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x2008

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v0, v2}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 114
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 115
    iget v2, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    int-to-double v4, v2

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-int v2, v4

    if-ne p1, v3, :cond_0

    .line 118
    iget-object v4, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v4, p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingTemp(I)V

    .line 119
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "setting_temperature"

    invoke-direct {v4, v6, v5}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v4, 0x3

    const/4 v5, 0x0

    if-ne p1, v4, :cond_2

    .line 124
    iget-object v4, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    const/16 v6, 0x80

    if-ne p2, v6, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v4, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 125
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    iget-object v4, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/dnake/desktop/handler/AirControlHandler;->getPowerAttrValue(Z)Ljava/lang/String;

    move-result-object v4

    const-string v6, "switch"

    invoke-direct {v3, v6, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    if-nez p1, :cond_3

    .line 130
    iget-object v3, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v3, p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingMode(I)V

    .line 131
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/AirControlHandler;->getModeAttrValue(I)Ljava/lang/String;

    move-result-object v4

    const-string v6, "mode"

    invoke-direct {v3, v6, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    const/4 v3, 0x2

    if-ne p1, v3, :cond_4

    .line 136
    iget-object v3, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v3, p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingWindSpeed(I)V

    .line 137
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/AirControlHandler;->getSpeedAttrValue(I)Ljava/lang/String;

    move-result-object v4

    const-string v6, "wind_speed"

    invoke-direct {v3, v6, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    :cond_4
    iget-object v3, p0, Lcom/dnake/desktop/handler/AirControlHandler;->ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-direct {p0, v3, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->writeStatusToBytes(Lcom/dnake/desktop/bean/TicaInnerStatus;I)[B

    move-result-object v2

    .line 142
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v3

    const/16 v4, 0x12c

    invoke-virtual {v3, v2, v4}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v3

    .line 143
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 144
    new-instance v2, Lcom/dnake/desktop/bean/NtWriteResult;

    int-to-float p2, p2

    invoke-direct {v2, p1, p2, v5}, Lcom/dnake/desktop/bean/NtWriteResult;-><init>(IFZ)V

    .line 145
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p1

    invoke-virtual {p1, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 146
    iget p1, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    invoke-direct {p0, p1}, Lcom/dnake/desktop/handler/AirControlHandler;->updateTica(I)V

    .line 147
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 148
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 151
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_5
    :goto_1
    return-void
.end method

.method public writeSceneMultiple(Ljava/util/List;Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz p1, :cond_2

    .line 248
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    int-to-double v5, v0

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    .line 249
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr v0, v1

    int-to-double v9, v0

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v5, v7

    double-to-int v0, v5

    .line 250
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget v5, p0, Lcom/dnake/desktop/handler/AirControlHandler;->machineNo:I

    if-ne v4, v5, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    .line 255
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "====ticaInnerStatus:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "==="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "writeMachineNum"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "AirControlHandler"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    invoke-direct {p0, p2, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->writeStatusToBytes(Lcom/dnake/desktop/bean/TicaInnerStatus;I)[B

    move-result-object v0

    .line 258
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v3, 0x12c

    invoke-virtual {v1, v0, v3}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 259
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v3

    invoke-virtual {v3, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz v2, :cond_3

    .line 261
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 263
    :cond_3
    invoke-direct {p0, p1}, Lcom/dnake/desktop/handler/AirControlHandler;->updateHash(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 266
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_4
    :goto_2
    return-void
.end method
