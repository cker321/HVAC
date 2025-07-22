.class Lcom/dnake/desktop/fragment/AirControlFragment$1;
.super Ljava/lang/Object;
.source "AirControlFragment.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/fragment/AirControlFragment;->updateDeviceInfo(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/dnake/desktop/bean/TicaInnerStatus;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/AirControlFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/AirControlFragment;)V
    .locals 0

    .line 425
    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment$1;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/dnake/desktop/bean/TicaInnerStatus;Lcom/dnake/desktop/bean/TicaInnerStatus;)I
    .locals 0

    .line 428
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result p1

    invoke-virtual {p2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 425
    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    check-cast p2, Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/fragment/AirControlFragment$1;->compare(Lcom/dnake/desktop/bean/TicaInnerStatus;Lcom/dnake/desktop/bean/TicaInnerStatus;)I

    move-result p1

    return p1
.end method
