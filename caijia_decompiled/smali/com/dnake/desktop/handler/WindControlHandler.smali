.class public Lcom/dnake/desktop/handler/WindControlHandler;
.super Ljava/lang/Object;
.source "WindControlHandler.java"

# interfaces
.implements Lcom/dnake/desktop/callback/Rs485Callback;


# instance fields
.field private final INDEX_HUMIDIFICATION:I

.field private final INDEX_MODE:I

.field private final INDEX_SHOW_HUMIDITY:I

.field private final INDEX_SHOW_TEMP:I

.field private final INDEX_SWITCH:I

.field private final INDEX_WIND_SPEED:I

.field private final READ_FUNCTION_CODE:I

.field private final READ_FUNCTION_CODE_BUG:I

.field private final READ_LENGTH_SYSTEM:I

.field private final READ_LENGTH_TEMP:I

.field private final START_ADDRESS_SYSTEM:I

.field private final START_ADDRESS_TEMP:I

.field private final WIND_ADDRESS:I

.field private final WRITE_FUNCTION_CODE:I

.field private deviceSn:Ljava/lang/String;

.field hashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private prePowerWindStatus:Lcom/dnake/desktop/bean/WindStatus;

.field private preTempWindStatus:Lcom/dnake/desktop/bean/WindStatus;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 28
    iput v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->WIND_ADDRESS:I

    const/4 v1, 0x3

    .line 29
    iput v1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->READ_FUNCTION_CODE:I

    const/4 v2, 0x6

    .line 30
    iput v2, p0, Lcom/dnake/desktop/handler/WindControlHandler;->WRITE_FUNCTION_CODE:I

    const/4 v2, 0x1

    .line 31
    iput v2, p0, Lcom/dnake/desktop/handler/WindControlHandler;->READ_FUNCTION_CODE_BUG:I

    const/4 v3, 0x0

    .line 32
    iput v3, p0, Lcom/dnake/desktop/handler/WindControlHandler;->START_ADDRESS_TEMP:I

    const/16 v4, 0x10

    .line 33
    iput v4, p0, Lcom/dnake/desktop/handler/WindControlHandler;->READ_LENGTH_TEMP:I

    const/16 v4, 0x32

    .line 34
    iput v4, p0, Lcom/dnake/desktop/handler/WindControlHandler;->START_ADDRESS_SYSTEM:I

    const/4 v4, 0x4

    .line 35
    iput v4, p0, Lcom/dnake/desktop/handler/WindControlHandler;->READ_LENGTH_SYSTEM:I

    const/16 v4, 0xf

    .line 37
    iput v4, p0, Lcom/dnake/desktop/handler/WindControlHandler;->INDEX_SHOW_TEMP:I

    const/16 v4, 0xb

    .line 38
    iput v4, p0, Lcom/dnake/desktop/handler/WindControlHandler;->INDEX_SHOW_HUMIDITY:I

    .line 39
    iput v3, p0, Lcom/dnake/desktop/handler/WindControlHandler;->INDEX_SWITCH:I

    .line 40
    iput v2, p0, Lcom/dnake/desktop/handler/WindControlHandler;->INDEX_MODE:I

    .line 41
    iput v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->INDEX_WIND_SPEED:I

    .line 42
    iput v1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->INDEX_HUMIDIFICATION:I

    const-string v0, "71071"

    .line 44
    iput-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->deviceSn:Ljava/lang/String;

    .line 234
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    return-void
.end method

.method private adjustUpload(Lcom/dnake/desktop/bean/WindStatus;)Z
    .locals 3

    .line 121
    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->prePowerWindStatus:Lcom/dnake/desktop/bean/WindStatus;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->preTempWindStatus:Lcom/dnake/desktop/bean/WindStatus;

    if-nez v0, :cond_0

    goto :goto_0

    .line 124
    :cond_0
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->isTypeTemp()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->preTempWindStatus:Lcom/dnake/desktop/bean/WindStatus;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    .line 127
    :cond_1
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->isTypeTemp()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->prePowerWindStatus:Lcom/dnake/desktop/bean/WindStatus;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v2

    :cond_2
    :goto_0
    return v1
.end method

.method private getPowerAttrValue(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string p1, "on"

    return-object p1

    :cond_0
    const-string p1, "off"

    return-object p1
.end method

.method private getUploadString([I)Ljava/lang/String;
    .locals 5

    .line 276
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 277
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p1, v2

    .line 278
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 280
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getWindModeAttrValue(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string p1, "cold"

    return-object p1

    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    const-string p1, "hot"

    return-object p1

    :cond_1
    if-nez p1, :cond_2

    const-string p1, "wind"

    return-object p1

    :cond_2
    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    const-string p1, "dehumidification"

    return-object p1

    :cond_3
    const-string p1, "intelligent"

    return-object p1
.end method

.method private getWindSpeedAttrValue(I)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, "high_speed"

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string p1, "medium_speed"

    return-object p1

    :cond_1
    const-string p1, "low_speed"

    return-object p1
.end method

.method private parseData(Z[B)Lcom/dnake/desktop/bean/WindStatus;
    .locals 2

    .line 134
    new-instance v0, Lcom/dnake/desktop/bean/WindStatus;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/WindStatus;-><init>()V

    .line 135
    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setTypeTemp(Z)V

    .line 136
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object p2

    .line 137
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object p2

    if-eqz p1, :cond_0

    const/16 p1, 0xf

    .line 139
    aget p1, p2, p1

    int-to-float p1, p1

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setShowTemp(F)V

    const/16 p1, 0xb

    .line 140
    aget p1, p2, p1

    int-to-float p1, p1

    div-float/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setWindHumidity(F)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    .line 143
    aget p1, p2, p1

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setPower(I)V

    const/4 p1, 0x1

    .line 144
    aget p1, p2, p1

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setMode(I)V

    const/4 p1, 0x2

    .line 145
    aget p1, p2, p1

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setWindSpeed(I)V

    const/4 p1, 0x3

    .line 146
    aget p1, p2, p1

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/WindStatus;->setHumiditySwitch(I)V

    return-object v0
.end method

.method private readShowTemp()V
    .locals 5

    .line 63
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/16 v4, 0x10

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 65
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v2, 0x12c

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 66
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 67
    invoke-direct {p0, v0, v1}, Lcom/dnake/desktop/handler/WindControlHandler;->parseData(Z[B)Lcom/dnake/desktop/bean/WindStatus;

    move-result-object v0

    .line 68
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 69
    invoke-direct {p0, v0}, Lcom/dnake/desktop/handler/WindControlHandler;->upload(Lcom/dnake/desktop/bean/WindStatus;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 72
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private readSystemStatus()V
    .locals 5

    .line 80
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/16 v3, 0x32

    const/4 v4, 0x4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 82
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v2, 0x12c

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 83
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, v0, v1}, Lcom/dnake/desktop/handler/WindControlHandler;->parseData(Z[B)Lcom/dnake/desktop/bean/WindStatus;

    move-result-object v0

    .line 85
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 86
    invoke-direct {p0, v0}, Lcom/dnake/desktop/handler/WindControlHandler;->upload(Lcom/dnake/desktop/bean/WindStatus;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 89
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private updateWindStatus()Z
    .locals 4

    .line 284
    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    return v1

    .line 287
    :cond_0
    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 288
    iget-object v3, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    return v1

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private upload(Lcom/dnake/desktop/bean/WindStatus;)V
    .locals 8

    .line 94
    invoke-direct {p0, p1}, Lcom/dnake/desktop/handler/WindControlHandler;->adjustUpload(Lcom/dnake/desktop/bean/WindStatus;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 97
    :cond_0
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 98
    iget-object v1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->deviceSn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v1, 0x1bc3

    .line 99
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 100
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->isTypeTemp()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getShowTemp()F

    move-result v3

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "return_air_temperature"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    iput-object p1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->preTempWindStatus:Lcom/dnake/desktop/bean/WindStatus;

    goto :goto_0

    .line 106
    :cond_1
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getPower()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/dnake/desktop/handler/WindControlHandler;->getPowerAttrValue(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "switch"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getMode()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/dnake/desktop/handler/WindControlHandler;->getWindModeAttrValue(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "mode"

    invoke-direct {v3, v5, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getWindSpeed()I

    move-result v5

    invoke-direct {p0, v5}, Lcom/dnake/desktop/handler/WindControlHandler;->getWindSpeedAttrValue(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "wind_speed"

    invoke-direct {v4, v6, v5}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    new-instance v5, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getHumiditySwitch()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/dnake/desktop/handler/WindControlHandler;->getPowerAttrValue(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "humidification_enable"

    invoke-direct {v5, v7, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    iput-object p1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->prePowerWindStatus:Lcom/dnake/desktop/bean/WindStatus;

    .line 116
    :goto_0
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 117
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method

.method private uploadBug()V
    .locals 10

    .line 204
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/16 v4, 0x50

    invoke-virtual {v0, v3, v2, v1, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 206
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v4

    const/16 v5, 0x12c

    invoke-virtual {v4, v0, v5}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v4

    .line 207
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v5

    invoke-virtual {v5, v4, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object v0

    .line 209
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object v0

    .line 210
    invoke-static {v0}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getFaults4FaultAdds([I)Ljava/util/List;

    move-result-object v0

    .line 211
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v4}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 212
    iget-object v5, p0, Lcom/dnake/desktop/handler/WindControlHandler;->deviceSn:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v5, 0x1bc3

    .line 213
    invoke-virtual {v4, v5}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 214
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 215
    new-instance v6, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v7, "glc_1_fault_1"

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v7, v1}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v7, "glc_1_fault_2"

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v7, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v7, "glc_1_fault_3"

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v7, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v7, "glc_1_fault_4"

    const/4 v8, 0x3

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v3, v7, v8}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    new-instance v7, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v8, "glc_1_fault_5"

    const/4 v9, 0x4

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v8, v0}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    invoke-virtual {v4, v5}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 226
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 229
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private uploadWrite(II)V
    .locals 5

    .line 166
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 167
    iget-object v1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->deviceSn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v1, 0x1bc3

    .line 168
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 169
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/16 v2, 0x32

    if-ne p1, v2, :cond_0

    .line 172
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/WindControlHandler;->getPowerAttrValue(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "switch"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/16 v2, 0x33

    if-ne p1, v2, :cond_1

    .line 177
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/WindControlHandler;->getWindModeAttrValue(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "mode"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    const/16 v2, 0x34

    if-ne p1, v2, :cond_2

    .line 182
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/WindControlHandler;->getWindSpeedAttrValue(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "wind_speed"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    const/16 v2, 0x35

    if-ne p1, v2, :cond_3

    .line 187
    new-instance p1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/WindControlHandler;->getPowerAttrValue(I)Ljava/lang/String;

    move-result-object p2

    const-string v2, "humidification_enable"

    invoke-direct {p1, v2, p2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    :cond_3
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 191
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method


# virtual methods
.method public handlerWindRecord(III)V
    .locals 3

    .line 242
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2, p2, p3}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object p2

    .line 244
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object p3

    const/16 v0, 0x12c

    invoke-virtual {p3, p2, v0}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object p3

    .line 245
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {v0, p3, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 246
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object p2

    .line 247
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object p2

    .line 248
    invoke-direct {p0, p2}, Lcom/dnake/desktop/handler/WindControlHandler;->getUploadString([I)Ljava/lang/String;

    move-result-object p2

    .line 249
    iget-object p3, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p3, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    invoke-direct {p0}, Lcom/dnake/desktop/handler/WindControlHandler;->updateWindStatus()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 251
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 252
    iget-object p2, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    .line 253
    iget-object v0, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 254
    invoke-virtual {p1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 256
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 257
    new-instance p2, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {p2}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 258
    iget-object p3, p0, Lcom/dnake/desktop/handler/WindControlHandler;->deviceSn:Ljava/lang/String;

    invoke-virtual {p2, p3}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 p3, 0x1bc3

    .line 259
    invoke-virtual {p2, p3}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 260
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 261
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v1, "glc_wind_status"

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    invoke-virtual {p2, p3}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 264
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    .line 265
    iget-object p1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    .line 266
    iget-object p3, p0, Lcom/dnake/desktop/handler/WindControlHandler;->hashMap:Ljava/util/HashMap;

    const/4 v0, 0x0

    invoke-virtual {p3, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 271
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_1
    return-void
.end method

.method public read()V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/dnake/desktop/handler/WindControlHandler;->readShowTemp()V

    .line 56
    invoke-direct {p0}, Lcom/dnake/desktop/handler/WindControlHandler;->readSystemStatus()V

    return-void
.end method

.method public setDeviceSn(Ljava/lang/String;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/dnake/desktop/handler/WindControlHandler;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method public uploadDeviceBug()V
    .locals 3

    const/4 v0, 0x0

    const/16 v1, 0x2b

    .line 196
    invoke-virtual {p0, v0, v0, v1}, Lcom/dnake/desktop/handler/WindControlHandler;->handlerWindRecord(III)V

    const/4 v0, 0x1

    const/16 v1, 0x32

    const/16 v2, 0x3e

    .line 197
    invoke-virtual {p0, v0, v1, v2}, Lcom/dnake/desktop/handler/WindControlHandler;->handlerWindRecord(III)V

    const/4 v0, 0x2

    const/16 v1, 0xc8

    const/16 v2, 0x34

    .line 198
    invoke-virtual {p0, v0, v1, v2}, Lcom/dnake/desktop/handler/WindControlHandler;->handlerWindRecord(III)V

    const/4 v0, 0x3

    const/16 v1, 0x12c

    const/16 v2, 0x25

    .line 199
    invoke-virtual {p0, v0, v1, v2}, Lcom/dnake/desktop/handler/WindControlHandler;->handlerWindRecord(III)V

    .line 200
    invoke-direct {p0}, Lcom/dnake/desktop/handler/WindControlHandler;->uploadBug()V

    return-void
.end method

.method public write(II)V
    .locals 3

    .line 152
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object v0

    .line 154
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v1

    const/16 v2, 0x12c

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v1

    .line 155
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    new-instance v0, Lcom/dnake/desktop/bean/NtWriteResult;

    int-to-float v1, p2

    const/4 v2, 0x1

    invoke-direct {v0, p1, v1, v2}, Lcom/dnake/desktop/bean/NtWriteResult;-><init>(IFZ)V

    .line 157
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 158
    invoke-direct {p0, p1, p2}, Lcom/dnake/desktop/handler/WindControlHandler;->uploadWrite(II)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 161
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method
