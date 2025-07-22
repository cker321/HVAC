.class Lcom/dnake/desktop/RoomAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "RoomAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/RoomAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/RoomAdapter;

.field tvRoomName:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/RoomAdapter;Landroid/view/View;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/dnake/desktop/RoomAdapter$ViewHolder;->this$0:Lcom/dnake/desktop/RoomAdapter;

    .line 69
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f080174

    .line 70
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/dnake/desktop/RoomAdapter$ViewHolder;->tvRoomName:Landroid/widget/TextView;

    return-void
.end method
