.class Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$1;
.super Ljava/lang/Object;
.source "MqttMsgHandler.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;->handlerConfigUpdateMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Lcom/landleaf/smarthome/net/http/NetResponse<",
        "Ljava/util/List<",
        "Lcom/landleaf/smarthome/model/FloorModel;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$1;->this$0:Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/FloorModel;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 129
    iget-object p1, p1, Lcom/landleaf/smarthome/net/http/NetResponse;->data:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    .line 130
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/FloorModel;->getRooms()Ljava/util/List;

    move-result-object p1

    .line 131
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/greenrobot/eventbus/EventBus;->postSticky(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 126
    check-cast p1, Lcom/landleaf/smarthome/net/http/NetResponse;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMsgHandler$1;->accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V

    return-void
.end method
