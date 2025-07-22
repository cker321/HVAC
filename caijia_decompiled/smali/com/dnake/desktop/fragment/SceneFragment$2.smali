.class Lcom/dnake/desktop/fragment/SceneFragment$2;
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
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/SceneFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/SceneFragment;)V
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/dnake/desktop/fragment/SceneFragment$2;->this$0:Lcom/dnake/desktop/fragment/SceneFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 127
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment$2;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment$2;->this$0:Lcom/dnake/desktop/fragment/SceneFragment;

    invoke-static {v0}, Lcom/dnake/desktop/fragment/SceneFragment;->access$000(Lcom/dnake/desktop/fragment/SceneFragment;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
