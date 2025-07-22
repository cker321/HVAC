.class Lcom/landleaf/smarthome/net/mqtt/MqttClient$4;
.super Ljava/lang/Object;
.source "MqttClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/net/mqtt/MqttClient;->publishUploadMessage(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

.field final synthetic val$publishMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$4;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    iput-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$4;->val$publishMessage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lorg/eclipse/paho/client/mqttv3/IMqttToken;Ljava/lang/Throwable;)V
    .locals 0

    const-string p1, "Upload\u6d88\u606f\u53d1\u9001\u5931\u8d25"

    .line 174
    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(Lorg/eclipse/paho/client/mqttv3/IMqttToken;)V
    .locals 1

    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Upload\u6d88\u606f\u53d1\u9001\u6210\u529f-->:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$4;->val$publishMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    return-void
.end method
