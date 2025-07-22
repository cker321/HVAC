.class public Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;
.super Ljava/lang/Object;
.source "MqttMsgHandler.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handlerConfigUpdateMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 6

    .line 108
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    .line 109
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getUpdateType()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    const/4 v0, -0x1

    .line 111
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "FloorRoomDevice"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :sswitch_1
    const-string v1, "SceneTiming"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_2
    const-string v1, "Scene"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_3
    const-string v1, "News"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :sswitch_4
    const-string v1, "ApkUpdate"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :cond_0
    :goto_0
    if-eq v0, v5, :cond_4

    if-eq v0, v4, :cond_3

    if-eq v0, v3, :cond_2

    if-eq v0, v2, :cond_1

    goto :goto_1

    .line 142
    :cond_1
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/landleaf/smarthome/net/http/NetApi;->getNewsList()Lio/reactivex/Observable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Observable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 126
    :cond_2
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/landleaf/smarthome/net/http/NetApi;->getFloorDeviceList()Lio/reactivex/Observable;

    move-result-object p1

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance v0, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$1;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$1;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;)V

    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$2;

    invoke-direct {v1, p0}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$2;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;)V

    invoke-virtual {p1, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 122
    :cond_3
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/landleaf/smarthome/net/http/NetApi;->getTimingSceneList()Lio/reactivex/Observable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Observable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 118
    :cond_4
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/landleaf/smarthome/net/http/NetApi;->getSceneList()Lio/reactivex/Observable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Observable;->subscribe()Lio/reactivex/disposables/Disposable;

    :cond_5
    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x347c461b -> :sswitch_4
        0x24fef3 -> :sswitch_3
        0x4c0286c -> :sswitch_2
        0x547503d6 -> :sswitch_1
        0x7dea541d -> :sswitch_0
    .end sparse-switch
.end method

.method public handlerDeviceReadMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 8

    .line 73
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getProductCode()I

    move-result v0

    .line 74
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    .line 75
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v2}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    .line 76
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 77
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v5, "temperature"

    const-string v6, "24"

    invoke-direct {v4, v5, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    new-instance v5, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v6, "humidity"

    const-string v7, "45"

    invoke-direct {v5, v6, v7}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-virtual {v2, v3}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    .line 82
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v3

    invoke-virtual {v3, p1, v2}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceReadMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;Lcom/landleaf/smarthome/model/DeviceModel;)V

    .line 83
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method

.method public handlerDeviceUpdateMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 0

    return-void
.end method

.method public handlerDeviceWriteMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 2

    .line 45
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getProductCode()I

    move-result v0

    .line 46
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getDeviceSn()Ljava/lang/String;

    const/16 v1, 0x1bc3

    if-eq v0, v1, :cond_0

    const/16 v1, 0x2008

    if-eq v0, v1, :cond_0

    .line 53
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    .line 56
    :cond_0
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    return-void
.end method

.method public handlerSceneSetMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 2

    .line 95
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    .line 97
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getSceneNo()I

    move-result p1

    .line 98
    new-instance v0, Lcom/landleaf/smarthome/model/SceneControlBean;

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    invoke-direct {v0, p1, v1}, Lcom/landleaf/smarthome/model/SceneControlBean;-><init>(IZ)V

    .line 99
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    return-void
.end method

.method public handlerSecurityAlarmMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 2

    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "data:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MqttMsgHandler"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
