.class Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;
.super Ljava/lang/Object;
.source "MqttAsyncClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/IMqttActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MqttReconnectActionListener"
.end annotation


# instance fields
.field final methodName:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;


# direct methods
.method constructor <init>(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Ljava/lang/String;)V
    .locals 0

    .line 1504
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1505
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->methodName:Ljava/lang/String;

    return-void
.end method

.method private rescheduleReconnectCycle(I)V
    .locals 6

    .line 1525
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->methodName:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":rescheduleReconnectCycle"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1528
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$0(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v1

    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$1()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 1529
    iget-object v4, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {v4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$9(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$6()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "505"

    .line 1528
    invoke-interface {v1, v2, v0, v4, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1530
    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$10()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 1531
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$7(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isAutomaticReconnect()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1532
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$11(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Ljava/util/Timer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1533
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {v1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$11(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Ljava/util/Timer;

    move-result-object v1

    new-instance v2, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;

    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;-><init>(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$ReconnectTask;)V

    int-to-long v3, p1

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    .line 1536
    :cond_0
    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$8(I)V

    .line 1537
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$4(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)V

    .line 1530
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public onFailure(Lorg/eclipse/paho/client/mqttv3/IMqttToken;Ljava/lang/Throwable;)V
    .locals 4

    .line 1517
    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$0(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object p2

    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$1()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->methodName:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object p1

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string p1, "502"

    invoke-interface {p2, v0, v1, p1, v2}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1518
    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$6()I

    move-result p1

    iget-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {p2}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$7(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    move-result-object p2

    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getMaxReconnectDelay()I

    move-result p2

    if-ge p1, p2, :cond_0

    .line 1519
    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$6()I

    move-result p1

    mul-int/lit8 p1, p1, 0x2

    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$8(I)V

    .line 1521
    :cond_0
    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$6()I

    move-result p1

    invoke-direct {p0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->rescheduleReconnectCycle(I)V

    return-void
.end method

.method public onSuccess(Lorg/eclipse/paho/client/mqttv3/IMqttToken;)V
    .locals 5

    .line 1510
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$0(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v0

    invoke-static {}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$1()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->methodName:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttToken;->getClient()Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;

    move-result-object p1

    invoke-interface {p1}, Lorg/eclipse/paho/client/mqttv3/IMqttAsyncClient;->getClientId()Ljava/lang/String;

    move-result-object p1

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const-string p1, "501"

    invoke-interface {v0, v1, v2, p1, v3}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->fine(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1511
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    iget-object p1, p1, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {p1, v4}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setRestingState(Z)V

    .line 1512
    iget-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient$MqttReconnectActionListener;->this$0:Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;

    invoke-static {p1}, Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;->access$5(Lorg/eclipse/paho/client/mqttv3/MqttAsyncClient;)V

    return-void
.end method
