.class Lcom/landleaf/smarthome/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/MainActivity;->onCreate(Landroid/os/Bundle;)V
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
.field final synthetic this$0:Lcom/landleaf/smarthome/MainActivity;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/MainActivity;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/landleaf/smarthome/MainActivity$3;->this$0:Lcom/landleaf/smarthome/MainActivity;

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

    .line 88
    iget-object p1, p1, Lcom/landleaf/smarthome/net/http/NetResponse;->data:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    .line 89
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/FloorModel;->getRooms()Ljava/util/List;

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 85
    check-cast p1, Lcom/landleaf/smarthome/net/http/NetResponse;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity$3;->accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V

    return-void
.end method
