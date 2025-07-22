.class public Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;
.super Ljava/lang/Object;
.source "MqttExecutor.java"


# static fields
.field private static volatile singleton:Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;


# instance fields
.field private clientId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getCommonMqttRequestMsgModel()Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;
    .locals 3

    .line 143
    new-instance v0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;-><init>()V

    .line 144
    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    invoke-direct {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;-><init>()V

    const/4 v2, 0x0

    .line 145
    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setAckCode(I)V

    .line 146
    invoke-direct {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getNewMsgId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setMessageId(Ljava/lang/String;)V

    .line 147
    iget-object v2, p0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->clientId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setScreenMac(Ljava/lang/String;)V

    .line 148
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->setHeader(Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;)V

    .line 149
    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    invoke-direct {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;-><init>()V

    .line 150
    new-instance v2, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    invoke-direct {v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;-><init>()V

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->setData(Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;)V

    .line 151
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->setPayload(Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;)V

    return-object v0
.end method

.method public static getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;
    .locals 2

    .line 32
    sget-object v0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    if-nez v0, :cond_1

    .line 33
    const-class v0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    monitor-enter v0

    .line 34
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    if-nez v1, :cond_0

    .line 35
    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    invoke-direct {v1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;-><init>()V

    sput-object v1, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    .line 37
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 39
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->singleton:Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    return-object v0
.end method

.method private getNewMsgId()I
    .locals 4

    const-string v0, "msgID"

    const/4 v1, 0x1

    .line 157
    invoke-static {v0, v1}, Lcom/landleaf/smarthome/util/SpUtils;->readInt(Ljava/lang/String;I)I

    move-result v2

    const v3, 0xffdc

    if-lt v2, v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    add-int/lit8 v2, v1, 0x1

    .line 161
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/landleaf/smarthome/util/SpUtils;->save(Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method


# virtual methods
.method public connect(Ljava/lang/String;)V
    .locals 1

    .line 43
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->clientId:Ljava/lang/String;

    .line 44
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->connect(Ljava/lang/String;)V

    return-void
.end method

.method public disConnect()V
    .locals 1

    .line 48
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->disConnect()V

    return-void
.end method

.method public sedMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 2

    .line 130
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    move-result-object v0

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->clientId:Ljava/lang/String;

    invoke-static {p1}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->publishMessage(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 2

    .line 55
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->getAckCode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    .line 58
    :cond_0
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setAckCode(I)V

    .line 59
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->setCode(I)V

    .line 60
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    const-string v1, "success"

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->setMessage(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sedMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method

.method public sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;ILjava/lang/String;)V
    .locals 2

    .line 74
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->getAckCode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    .line 77
    :cond_0
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setAckCode(I)V

    .line 78
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->setCode(I)V

    .line 79
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->setMessage(Ljava/lang/String;)V

    .line 80
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sedMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method

.method public sendDeviceReadMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 1

    .line 88
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getAtts()Ljava/util/List;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->setItems(Ljava/util/List;)V

    .line 89
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method

.method public sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 3

    .line 97
    invoke-direct {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getCommonMqttRequestMsgModel()Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setAckCode(I)V

    .line 99
    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v1

    const-string v2, "DeviceStatusUpdate"

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setName(Ljava/lang/String;)V

    .line 100
    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v1

    .line 101
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getAtts()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->setItems(Ljava/util/List;)V

    .line 102
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->setProductCode(I)V

    .line 103
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceSn()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->setDeviceSn(Ljava/lang/String;)V

    .line 104
    invoke-virtual {p0, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendUploadStatusMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method

.method public sendSceneUpdateMsg(Lcom/landleaf/smarthome/model/SceneModel;)V
    .locals 3

    .line 122
    invoke-direct {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getCommonMqttRequestMsgModel()Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    move-result-object p1

    .line 123
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setAckCode(I)V

    .line 124
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    const-string v2, "ScreenSceneSetUpload"

    invoke-virtual {v0, v2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setName(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->setSceneNo(I)V

    .line 126
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sedMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method

.method public sendSecurityAlarmMsg(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/SecurityModel;",
            ">;)V"
        }
    .end annotation

    .line 111
    invoke-direct {p0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getCommonMqttRequestMsgModel()Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setAckCode(I)V

    .line 113
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    const-string v1, "FamilySecurityAlarmEvent"

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->setName(Ljava/lang/String;)V

    .line 114
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-static {}, Lcom/landleaf/smarthome/MockData;->getSecurityList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->setItems(Ljava/util/List;)V

    .line 115
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sedMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method

.method public sendUploadStatusMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 2

    .line 134
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    move-result-object v0

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->clientId:Ljava/lang/String;

    invoke-static {p1}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->publishUploadMessage(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
