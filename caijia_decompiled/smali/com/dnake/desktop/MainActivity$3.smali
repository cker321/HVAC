.class Lcom/dnake/desktop/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/MainActivity;->initWeather()V
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
        "Lcom/landleaf/smarthome/model/WeatherModel;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/MainActivity;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/MainActivity;)V
    .locals 0

    .line 194
    iput-object p1, p0, Lcom/dnake/desktop/MainActivity$3;->this$0:Lcom/dnake/desktop/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Lcom/landleaf/smarthome/model/WeatherModel;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 197
    iget v0, p1, Lcom/landleaf/smarthome/net/http/NetResponse;->code:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 198
    iget-object p1, p1, Lcom/landleaf/smarthome/net/http/NetResponse;->data:Ljava/lang/Object;

    check-cast p1, Lcom/landleaf/smarthome/model/WeatherModel;

    .line 199
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/greenrobot/eventbus/EventBus;->postSticky(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 194
    check-cast p1, Lcom/landleaf/smarthome/net/http/NetResponse;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity$3;->accept(Lcom/landleaf/smarthome/net/http/NetResponse;)V

    return-void
.end method
