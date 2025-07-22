.class public final synthetic Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

.field private final synthetic f$1:Lorg/eclipse/paho/client/mqttv3/MqttMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;->f$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

    iput-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;->f$1:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;->f$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$ms56JJN3xd4swxDJw-ffBSP0Wgg;->f$1:Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    check-cast p1, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    invoke-virtual {v0, v1, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->lambda$messageArrived$2$MqttMessageCallback(Lorg/eclipse/paho/client/mqttv3/MqttMessage;Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    return-void
.end method
