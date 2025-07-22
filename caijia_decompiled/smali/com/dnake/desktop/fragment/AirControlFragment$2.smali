.class Lcom/dnake/desktop/fragment/AirControlFragment$2;
.super Ljava/lang/Object;
.source "AirControlFragment.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/fragment/AirControlFragment;->initNtInfo()V
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
.field final synthetic this$0:Lcom/dnake/desktop/fragment/AirControlFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/AirControlFragment;)V
    .locals 0

    .line 483
    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment$2;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment;

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

    .line 486
    iget-object p1, p1, Lcom/landleaf/smarthome/net/http/NetResponse;->data:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    .line 487
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/FloorModel;->getRooms()Ljava/util/List;

    move-result-object p1

    .line 488
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/greenrobot/eventbus/EventBus;->postSticky(Ljava/lang/Object;)V

    .line 489
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment$2;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->access$002(Lcom/dnake/desktop/fragment/AirControlFragment;Z)Z

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 483
    check-cast p1, Lcom/landleaf/smarthome/net/http/NetResponse;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment$2;->accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V

    return-void
.end method
