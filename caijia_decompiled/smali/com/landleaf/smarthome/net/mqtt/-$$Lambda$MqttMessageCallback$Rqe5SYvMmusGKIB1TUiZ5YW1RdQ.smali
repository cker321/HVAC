.class public final synthetic Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Predicate;


# instance fields
.field private final synthetic f$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

.field private final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;->f$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

    iput-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 2

    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;->f$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$Rqe5SYvMmusGKIB1TUiZ5YW1RdQ;->f$1:Ljava/lang/String;

    check-cast p1, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-virtual {v0, v1, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->lambda$messageArrived$0$MqttMessageCallback(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)Z

    move-result p1

    return p1
.end method
