.class public final synthetic Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# static fields
.field public static final synthetic INSTANCE:Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;-><init>()V

    sput-object v0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;->INSTANCE:Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$myJlXwZ1B86vr4uQlhfU-YsBVmM;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    invoke-static {p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->lambda$messageArrived$1(Lorg/eclipse/paho/client/mqttv3/MqttMessage;)Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;

    move-result-object p1

    return-object p1
.end method
