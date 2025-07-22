.class public final synthetic Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/dnake/desktop/fragment/MonitorFragment;

.field private final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/dnake/desktop/fragment/MonitorFragment;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;->f$0:Lcom/dnake/desktop/fragment/MonitorFragment;

    iput p2, p0, Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;->f$1:I

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;->f$0:Lcom/dnake/desktop/fragment/MonitorFragment;

    iget v1, p0, Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;->f$1:I

    invoke-virtual {v0, v1, p1}, Lcom/dnake/desktop/fragment/MonitorFragment;->lambda$setClick$0$MonitorFragment(ILjava/lang/Object;)V

    return-void
.end method
