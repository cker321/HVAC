.class public Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;
.super Ljava/lang/Object;
.source "MqttMessageCallback.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/MqttCallbackExtended;


# instance fields
.field clientId:Ljava/lang/String;

.field mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;-><init>()V

    iput-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    .line 29
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->clientId:Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$messageArrived$1(Lorg/eclipse/paho/client/mqttv3/MqttMessage;)Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 50
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getPayload()[B

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    const-class p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    invoke-static {v0, p0}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    return-object p0
.end method

.method static synthetic lambda$messageArrived$3(Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6570\u636e\u5f02\u5e38-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public connectComplete(ZLjava/lang/String;)V
    .locals 0

    const-string p2, "\u91cd\u8fde\u6210\u529f"

    .line 89
    invoke-static {p2}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 91
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    move-result-object p1

    iget-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->clientId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->subscribeTopic(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public connectionLost(Ljava/lang/Throwable;)V
    .locals 2

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "connectionLost-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method

.method public deliveryComplete(Lorg/eclipse/paho/client/mqttv3/IMqttDeliveryToken;)V
    .locals 0

    return-void
.end method

.method public synthetic lambda$messageArrived$0$MqttMessageCallback(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 46
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "/screen/service/cloud/to/screen/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->clientId:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public synthetic lambda$messageArrived$2$MqttMessageCallback(Lorg/eclipse/paho/client/mqttv3/MqttMessage;Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    invoke-virtual {p2}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getHeader()Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttHeaderModel;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "FamilySceneSet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_1
    const-string v1, "FamilyConfigUpdate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_2
    const-string v1, "DeviceWrite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_3
    const-string v1, "DeviceStatusUpdate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_4
    const-string v1, "FamilySecurityAlarmEvent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_5
    const-string v1, "DeviceStatusRead"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v0, -0x1

    :goto_1
    if-eqz v0, :cond_6

    if-eq v0, v6, :cond_5

    if-eq v0, v5, :cond_4

    if-eq v0, v4, :cond_3

    if-eq v0, v3, :cond_2

    if-eq v0, v2, :cond_1

    goto :goto_2

    .line 73
    :cond_1
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerSecurityAlarmMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    goto :goto_2

    .line 70
    :cond_2
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerDeviceUpdateMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    goto :goto_2

    .line 67
    :cond_3
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerConfigUpdateMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    goto :goto_2

    .line 64
    :cond_4
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerSceneSetMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    goto :goto_2

    .line 61
    :cond_5
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-virtual {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerDeviceReadMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    goto :goto_2

    .line 57
    :cond_6
    new-instance p2, Ljava/lang/String;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getPayload()[B

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/String;-><init>([B)V

    new-instance p1, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback$1;

    invoke-direct {p1, p0}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback$1;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;)V

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback$1;->getType()Ljava/lang/reflect/Type;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    .line 58
    iget-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->mMsgHandler:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-virtual {p2, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerDeviceWriteMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    :goto_2
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7430e042 -> :sswitch_5
        -0x3ed13f33 -> :sswitch_4
        -0x25beeb0f -> :sswitch_3
        0x7017709 -> :sswitch_2
        0x54b7244f -> :sswitch_1
        0x73b0b7da -> :sswitch_0
    .end sparse-switch
.end method

.method public messageArrived(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V
    .locals 3

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6d88\u606f\u63a5\u53d7\u6210\u529f-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/String;

    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getPayload()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    .line 46
    invoke-static {p2}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->createObservable(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;

    invoke-direct {v1, p0, p1}, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object p1

    .line 47
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object v0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;->INSTANCE:Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;

    .line 48
    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance v0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;

    invoke-direct {v0, p0, p2}, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;-><init>(Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V

    sget-object p2, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;->INSTANCE:Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;

    .line 53
    invoke-virtual {p1, v0, p2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method
