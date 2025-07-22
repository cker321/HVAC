.class Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;
.super Ljava/lang/Object;
.source "MqttClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/net/mqtt/MqttClient;->connect(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

.field final synthetic val$clientId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    iput-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->val$clientId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lorg/eclipse/paho/client/mqttv3/IMqttToken;Ljava/lang/Throwable;)V
    .locals 1

    .line 73
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u8fde\u63a5\u5931\u8d25"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    .line 74
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    iget-object p2, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->val$clientId:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->access$100(Lcom/landleaf/smarthome/net/mqtt/MqttClient;Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(Lorg/eclipse/paho/client/mqttv3/IMqttToken;)V
    .locals 1

    const-string p1, "\u8fde\u63a5\u6210\u529f"

    .line 61
    invoke-static {p1}, Lcom/landleaf/smarthome/util/LogUtils;->d(Ljava/lang/String;)V

    .line 62
    new-instance p1, Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;

    invoke-direct {p1}, Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;-><init>()V

    const/4 v0, 0x1

    .line 63
    invoke-virtual {p1, v0}, Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;->setBufferEnabled(Z)V

    const/16 v0, 0x400

    .line 64
    invoke-virtual {p1, v0}, Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;->setBufferSize(I)V

    const/4 v0, 0x0

    .line 65
    invoke-virtual {p1, v0}, Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;->setPersistBuffer(Z)V

    .line 66
    invoke-virtual {p1, v0}, Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;->setDeleteOldestMessages(Z)V

    .line 67
    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    invoke-static {v0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->access$000(Lcom/landleaf/smarthome/net/mqtt/MqttClient;)Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->setBufferOpts(Lorg/eclipse/paho/client/mqttv3/DisconnectedBufferOptions;)V

    .line 68
    iget-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttClient;

    iget-object v0, p0, Lcom/landleaf/smarthome/net/mqtt/MqttClient$1;->val$clientId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttClient;->subscribeTopic(Ljava/lang/String;)V

    return-void
.end method
