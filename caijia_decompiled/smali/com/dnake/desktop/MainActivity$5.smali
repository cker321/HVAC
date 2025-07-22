.class Lcom/dnake/desktop/MainActivity$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/MainActivity;->initSceneInfo()V
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
        "Lcom/landleaf/smarthome/model/SceneModel;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/MainActivity;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/MainActivity;)V
    .locals 0

    .line 211
    iput-object p1, p0, Lcom/dnake/desktop/MainActivity$5;->this$0:Lcom/dnake/desktop/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/SceneModel;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 214
    iget-object p1, p1, Lcom/landleaf/smarthome/net/http/NetResponse;->data:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 211
    check-cast p1, Lcom/landleaf/smarthome/net/http/NetResponse;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity$5;->accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V

    return-void
.end method
