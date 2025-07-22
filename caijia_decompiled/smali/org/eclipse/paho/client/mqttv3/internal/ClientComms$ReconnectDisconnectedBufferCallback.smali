.class Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;
.super Ljava/lang/Object;
.source "ClientComms.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/internal/IDisconnectedBufferCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReconnectDisconnectedBufferCallback"
.end annotation


# instance fields
.field final methodName:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;


# direct methods
.method constructor <init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;Ljava/lang/String;)V
    .locals 0

    .line 904
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 905
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->methodName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public publishBufferedMessage(Lorg/eclipse/paho/client/mqttv3/BufferedMessage;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .line 909
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 911
    :goto_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$6(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->getActualInFlight()I

    move-result v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$6(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->getMaxInFlight()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    if-ge v0, v1, :cond_0

    .line 917
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$1(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$2(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->methodName:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/BufferedMessage;->getMessage()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;->getKey()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v4, "510"

    invoke-interface {v0, v1, v2, v4, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 918
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/BufferedMessage;->getMessage()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/BufferedMessage;->getToken()Lorg/eclipse/paho/client/mqttv3/MqttToken;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->internalSend(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 921
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$6(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/BufferedMessage;->getMessage()Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->unPersistBufferedMessage(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)V

    return-void

    .line 913
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0

    .line 924
    :cond_1
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$1(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object p1

    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$2(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$ReconnectDisconnectedBufferCallback;->methodName:Ljava/lang/String;

    const-string v2, "208"

    invoke-interface {p1, v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x7d68

    .line 925
    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object p1

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method
