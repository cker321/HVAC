.class Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$MessageDiscardedCallback;
.super Ljava/lang/Object;
.source "ClientComms.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/internal/IDiscardedBufferMessageCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MessageDiscardedCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;


# direct methods
.method constructor <init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)V
    .locals 0

    .line 889
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$MessageDiscardedCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public messageDiscarded(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)V
    .locals 1

    .line 893
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$MessageDiscardedCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$12(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/DisconnectedMessageBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/DisconnectedMessageBuffer;->isPersistBuffer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 894
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$MessageDiscardedCallback;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$6(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->unPersistBufferedMessage(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)V

    :cond_0
    return-void
.end method
