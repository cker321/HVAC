.class public Lcom/dnake/desktop/RoomAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "RoomAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dnake/desktop/RoomAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/dnake/desktop/RoomAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

.field list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;"
        }
    .end annotation
.end field

.field mContext:Landroid/content/Context;

.field selectPosition:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Lcom/dnake/desktop/handler/AirControlHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;",
            "Lcom/dnake/desktop/handler/AirControlHandler;",
            ")V"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lcom/dnake/desktop/RoomAdapter;->selectPosition:I

    .line 29
    iput-object p1, p0, Lcom/dnake/desktop/RoomAdapter;->mContext:Landroid/content/Context;

    .line 30
    iput-object p2, p0, Lcom/dnake/desktop/RoomAdapter;->list:Ljava/util/ArrayList;

    .line 31
    iput-object p3, p0, Lcom/dnake/desktop/RoomAdapter;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/dnake/desktop/RoomAdapter;->list:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 22
    check-cast p1, Lcom/dnake/desktop/RoomAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/RoomAdapter;->onBindViewHolder(Lcom/dnake/desktop/RoomAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/dnake/desktop/RoomAdapter$ViewHolder;I)V
    .locals 3

    .line 44
    iget-object v0, p0, Lcom/dnake/desktop/RoomAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 45
    iget-object v1, p1, Lcom/dnake/desktop/RoomAdapter$ViewHolder;->tvRoomName:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    iget-object v1, p1, Lcom/dnake/desktop/RoomAdapter$ViewHolder;->tvRoomName:Landroid/widget/TextView;

    iget v2, p0, Lcom/dnake/desktop/RoomAdapter;->selectPosition:I

    if-ne p2, v2, :cond_0

    const v2, 0x7f07009d

    goto :goto_0

    :cond_0
    const v2, 0x7f07009c

    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 47
    iget-object p1, p1, Lcom/dnake/desktop/RoomAdapter$ViewHolder;->tvRoomName:Landroid/widget/TextView;

    new-instance v1, Lcom/dnake/desktop/RoomAdapter$1;

    invoke-direct {v1, p0, p2, v0}, Lcom/dnake/desktop/RoomAdapter$1;-><init>(Lcom/dnake/desktop/RoomAdapter;ILcom/dnake/desktop/bean/TicaInnerStatus;)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/RoomAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/dnake/desktop/RoomAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/dnake/desktop/RoomAdapter$ViewHolder;
    .locals 2

    .line 37
    iget-object p2, p0, Lcom/dnake/desktop/RoomAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0028

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 38
    new-instance p2, Lcom/dnake/desktop/RoomAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/dnake/desktop/RoomAdapter$ViewHolder;-><init>(Lcom/dnake/desktop/RoomAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public setSelectPosition(I)V
    .locals 0

    .line 75
    iput p1, p0, Lcom/dnake/desktop/RoomAdapter;->selectPosition:I

    return-void
.end method
