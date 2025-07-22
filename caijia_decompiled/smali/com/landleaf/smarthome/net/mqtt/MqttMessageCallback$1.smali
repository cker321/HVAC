.class Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "MqttMessageCallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->lambda$messageArrived$2(Lorg/eclipse/paho/client/mqttv3/MqttMessage;Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel<",
        "Lcom/landleaf/smarthome/model/DeviceAttribute;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback$1;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
