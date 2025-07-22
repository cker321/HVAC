.class Lcom/dnake/desktop/fragment/SceneFragment$1;
.super Ljava/lang/Object;
.source "SceneFragment.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/fragment/SceneFragment;->setModeDelay(Lcom/landleaf/smarthome/model/SceneControlBean;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/SceneFragment;

.field final synthetic val$sceneControlBean:Lcom/landleaf/smarthome/model/SceneControlBean;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/SceneFragment;Lcom/landleaf/smarthome/model/SceneControlBean;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/dnake/desktop/fragment/SceneFragment$1;->this$0:Lcom/dnake/desktop/fragment/SceneFragment;

    iput-object p2, p0, Lcom/dnake/desktop/fragment/SceneFragment$1;->val$sceneControlBean:Lcom/landleaf/smarthome/model/SceneControlBean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Long;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 124
    iget-object p1, p0, Lcom/dnake/desktop/fragment/SceneFragment$1;->val$sceneControlBean:Lcom/landleaf/smarthome/model/SceneControlBean;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/SceneControlBean;->setDelayControl(Z)V

    .line 125
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment$1;->val$sceneControlBean:Lcom/landleaf/smarthome/model/SceneControlBean;

    invoke-virtual {p1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 121
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment$1;->accept(Ljava/lang/Long;)V

    return-void
.end method
