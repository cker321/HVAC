.class public Lcom/dnake/desktop/handler/SensorHandler;
.super Ljava/lang/Object;
.source "SensorHandler.java"

# interfaces
.implements Lcom/dnake/desktop/callback/Rs485Callback;


# static fields
.field public static final MT_DATA_LENGTH_MULTIPLE:I = 0x18

.field public static final MT_DATA_LENGTH_Z2GC:I = 0x5

.field public static final MT_FUNCTION_CODE_READ:B = 0x4t

.field public static final MT_FUNCTION_CODE_YINGJIANG_READ:B = 0x3t

.field public static final MT_INDEX_CO2:I = 0xa

.field public static final MT_INDEX_HUMIDITY:I = 0x9

.field public static final MT_INDEX_PM25:I = 0x0

.field public static final MT_INDEX_TEMP:I = 0x8

.field public static final MT_INDEX_VOC:I = 0xb

.field public static final MT_START_ADDRESS:I = 0x0

.field public static final YJ_INDEX_CO2:I = 0x3

.field public static final YJ_INDEX_HUMIDITY:I = 0x1

.field public static final YJ_INDEX_PM25:I = 0x4

.field public static final YJ_INDEX_TEMP:I = 0x0

.field public static final YJ_INDEX_VOC:I = 0x2

.field public static final YJ_START_ADDRESS:I = 0x1


# instance fields
.field private final SENSOR_ADDRESS:B

.field private deviceSn:Ljava/lang/String;

.field private preRecord:Lcom/dnake/desktop/bean/RecordBean;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 26
    iput-byte v0, p0, Lcom/dnake/desktop/handler/SensorHandler;->SENSOR_ADDRESS:B

    const-string v0, "11011"

    .line 50
    iput-object v0, p0, Lcom/dnake/desktop/handler/SensorHandler;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method private adjustUpload(Lcom/dnake/desktop/bean/RecordBean;)Z
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/dnake/desktop/handler/SensorHandler;->preRecord:Lcom/dnake/desktop/bean/RecordBean;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 106
    :cond_0
    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/RecordBean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    return v1
.end method

.method private getSensorSendBytes(Lcom/dnake/desktop/bean/SensorModel;)[B
    .locals 4

    .line 154
    sget-object v0, Lcom/dnake/desktop/handler/SensorHandler$1;->$SwitchMap$com$dnake$desktop$bean$SensorType:[I

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/SensorModel;->getSensorType()Lcom/dnake/desktop/bean/SensorType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/SensorType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 164
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/SensorModel;->getSlaveAddress()B

    move-result p1

    const/4 v3, 0x5

    invoke-virtual {v0, p1, v2, v1, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object p1

    goto :goto_0

    .line 159
    :cond_1
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/SensorModel;->getSlaveAddress()B

    move-result p1

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/16 v3, 0x18

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/dnake/desktop/utils/Rs485Utils;->getReadSendBytes(IIII)[B

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private parseData(Lcom/dnake/desktop/bean/SensorType;[B)Lcom/dnake/desktop/bean/RecordBean;
    .locals 5

    .line 119
    new-instance v0, Lcom/dnake/desktop/bean/RecordBean;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/RecordBean;-><init>()V

    .line 120
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->calReadDataArray([B)[B

    move-result-object p2

    .line 122
    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->Z2_GC:Lcom/dnake/desktop/bean/SensorType;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_0

    .line 123
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->toIntArray([B)[I

    move-result-object v1

    .line 124
    aget v3, v1, v2

    int-to-float v3, v3

    const/high16 v4, 0x41200000    # 10.0f

    div-float/2addr v3, v4

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/RecordBean;->setTemp(F)V

    const/4 v3, 0x1

    .line 125
    aget v3, v1, v3

    int-to-float v3, v3

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/RecordBean;->setHumidity(F)V

    const/4 v3, 0x2

    .line 126
    aget v3, v1, v3

    int-to-float v3, v3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v3, v4

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/RecordBean;->setVoc(F)V

    const/4 v3, 0x3

    .line 127
    aget v3, v1, v3

    int-to-float v3, v3

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/RecordBean;->setCo2(F)V

    const/4 v3, 0x4

    .line 128
    aget v1, v1, v3

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/RecordBean;->setPm25(F)V

    .line 131
    :cond_0
    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->MULTIPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    if-ne p1, v1, :cond_1

    .line 132
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->toFloatArray([B)[F

    move-result-object p1

    const/16 p2, 0x8

    .line 133
    aget p2, p1, p2

    invoke-virtual {v0, p2}, Lcom/dnake/desktop/bean/RecordBean;->setTemp(F)V

    const/16 p2, 0x9

    .line 134
    aget p2, p1, p2

    invoke-virtual {v0, p2}, Lcom/dnake/desktop/bean/RecordBean;->setHumidity(F)V

    const/16 p2, 0xb

    .line 135
    aget p2, p1, p2

    invoke-virtual {v0, p2}, Lcom/dnake/desktop/bean/RecordBean;->setVoc(F)V

    const/16 p2, 0xa

    .line 136
    aget p2, p1, p2

    invoke-virtual {v0, p2}, Lcom/dnake/desktop/bean/RecordBean;->setCo2(F)V

    .line 137
    aget p1, p1, v2

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/RecordBean;->setPm25(F)V

    :cond_1
    return-object v0
.end method

.method private upload(Lcom/dnake/desktop/bean/RecordBean;)V
    .locals 9

    .line 75
    invoke-direct {p0, p1}, Lcom/dnake/desktop/handler/SensorHandler;->adjustUpload(Lcom/dnake/desktop/bean/RecordBean;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 78
    :cond_0
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 79
    iget-object v1, p0, Lcom/dnake/desktop/handler/SensorHandler;->deviceSn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v1, 0x44d

    .line 80
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 81
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getTemp()F

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v3

    const-string v4, "temperature"

    invoke-direct {v2, v4, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getHumidity()F

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v4

    const-string v5, "humidity"

    invoke-direct {v3, v5, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getVoc()F

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v5

    const-string v6, "voc"

    invoke-direct {v4, v6, v5}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    new-instance v5, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getCo2()F

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v6

    const-string v7, "co2"

    invoke-direct {v5, v7, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    new-instance v6, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getPm25()F

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v7

    const-string v8, "pm25"

    invoke-direct {v6, v8, v7}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 93
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    .line 94
    iput-object p1, p0, Lcom/dnake/desktop/handler/SensorHandler;->preRecord:Lcom/dnake/desktop/bean/RecordBean;

    return-void
.end method


# virtual methods
.method public read()V
    .locals 4

    .line 60
    new-instance v0, Lcom/dnake/desktop/bean/SensorModel;

    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->Z2_GC:Lcom/dnake/desktop/bean/SensorType;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/dnake/desktop/bean/SensorModel;-><init>(Lcom/dnake/desktop/bean/SensorType;B)V

    .line 61
    invoke-direct {p0, v0}, Lcom/dnake/desktop/handler/SensorHandler;->getSensorSendBytes(Lcom/dnake/desktop/bean/SensorModel;)[B

    move-result-object v1

    .line 63
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v2

    const/16 v3, 0x12c

    invoke-virtual {v2, v1, v3}, Lcom/dnake/desktop/dnake/Rs485Executor;->write([BI)[B

    move-result-object v2

    .line 64
    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v3

    invoke-virtual {v3, v2, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->returnCheck([B[B)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 65
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/SensorModel;->getSensorType()Lcom/dnake/desktop/bean/SensorType;

    move-result-object v0

    invoke-direct {p0, v0, v2}, Lcom/dnake/desktop/handler/SensorHandler;->parseData(Lcom/dnake/desktop/bean/SensorType;[B)Lcom/dnake/desktop/bean/RecordBean;

    move-result-object v0

    .line 66
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 67
    invoke-direct {p0, v0}, Lcom/dnake/desktop/handler/SensorHandler;->upload(Lcom/dnake/desktop/bean/RecordBean;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 70
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public setDeviceSn(Ljava/lang/String;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/dnake/desktop/handler/SensorHandler;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method public uploadDeviceBug()V
    .locals 0

    return-void
.end method

.method public write(II)V
    .locals 0

    return-void
.end method
