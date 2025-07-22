.class Lcom/landleaf/smarthome/net/mqtt/MqttClient$2;
.super Ljava/lang/Object;
.source "MqttClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/net/mqtt/MqttClient;->subscribeTopic(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$2;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lorg/eclipse/paho/client/mqttv3/IMqttToken;Ljava/lang/Throwable;)V
    .locals 2

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "subscribeTopic \u8ba2\u9605topic\u5931\u8d25."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(Lorg/eclipse/paho/client/mqttv3/IMqttToken;)V
    .locals 0

    const-string p1, "subscribeTopic \u8ba2\u9605topic\u6210\u529f"

    .line 105
    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method
