.class Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;
.super Ljava/lang/Object;
.source "ClientComms.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DisconnectBG"
.end annotation


# instance fields
.field disconnect:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;

.field quiesceTimeout:J

.field final synthetic this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

.field private threadName:Ljava/lang/String;

.field token:Lorg/eclipse/paho/client/mqttv3/MqttToken;


# direct methods
.method constructor <init>(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;JLorg/eclipse/paho/client/mqttv3/MqttToken;Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    .line 755
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 756
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->disconnect:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;

    .line 757
    iput-wide p3, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->quiesceTimeout:J

    .line 758
    iput-object p5, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 771
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->threadName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 774
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$1(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$2(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "disconnectBG:run"

    const-string v3, "221"

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 777
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$6(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/ClientState;

    move-result-object v0

    iget-wide v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->quiesceTimeout:J

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientState;->quiesce(J)V

    const/4 v0, 0x0

    .line 779
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->disconnect:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->internalSend(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttToken;)V

    .line 781
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 782
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v1, v1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->waitUntilSent()V
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 788
    :cond_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v1, v1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v1, v0, v0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->markComplete(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttException;)V

    .line 789
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;->isRunning()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 788
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v2, v2, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v2, v0, v0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->markComplete(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttException;)V

    .line 789
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;->isRunning()Z

    move-result v2

    if-nez v2, :cond_2

    .line 791
    :cond_1
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v2, v2, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v2}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->notifyComplete()V

    .line 793
    :cond_2
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {v2, v3, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->shutdownConnection(Lorg/eclipse/paho/client/mqttv3/MqttToken;Lorg/eclipse/paho/client/mqttv3/MqttException;)V

    .line 794
    throw v1

    :catch_0
    nop

    .line 788
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v1, v1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v1, v0, v0}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->markComplete(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;Lorg/eclipse/paho/client/mqttv3/MqttException;)V

    .line 789
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$10(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;->isRunning()Z

    move-result v1

    if-nez v1, :cond_4

    .line 791
    :cond_3
    :goto_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    iget-object v1, v1, Lorg/eclipse/paho/client/mqttv3/MqttToken;->internalTok:Lorg/eclipse/paho/client/mqttv3/internal/Token;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/Token;->notifyComplete()V

    .line 793
    :cond_4
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->token:Lorg/eclipse/paho/client/mqttv3/MqttToken;

    invoke-virtual {v1, v2, v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->shutdownConnection(Lorg/eclipse/paho/client/mqttv3/MqttToken;Lorg/eclipse/paho/client/mqttv3/MqttException;)V

    return-void
.end method

.method start()V
    .locals 2

    .line 762
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MQTT Disc: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->threadName:Ljava/lang/String;

    .line 763
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$0(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-nez v0, :cond_0

    .line 764
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 766
    :cond_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms$DisconnectBG;->this$0:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->access$0(Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
