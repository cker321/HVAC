.class Lcom/dnake/desktop/fragment/AirControlFragment$3;
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
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/AirControlFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/AirControlFragment;)V
    .locals 0

    .line 491
    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment$3;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment;

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

    .line 491
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment$3;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 494
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment$3;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment;

    invoke-static {v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->access$100(Lcom/dnake/desktop/fragment/AirControlFragment;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initNtInfo:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment$3;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->access$002(Lcom/dnake/desktop/fragment/AirControlFragment;Z)Z

    return-void
.end method
