.class Lcom/dnake/desktop/RoomAdapter$1;
.super Ljava/lang/Object;
.source "RoomAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/RoomAdapter;->onBindViewHolder(Lcom/dnake/desktop/RoomAdapter$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/RoomAdapter;

.field final synthetic val$position:I

.field final synthetic val$ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/RoomAdapter;ILcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/dnake/desktop/RoomAdapter$1;->this$0:Lcom/dnake/desktop/RoomAdapter;

    iput p2, p0, Lcom/dnake/desktop/RoomAdapter$1;->val$position:I

    iput-object p3, p0, Lcom/dnake/desktop/RoomAdapter$1;->val$ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 50
    iget-object p1, p0, Lcom/dnake/desktop/RoomAdapter$1;->this$0:Lcom/dnake/desktop/RoomAdapter;

    iget v0, p0, Lcom/dnake/desktop/RoomAdapter$1;->val$position:I

    iput v0, p1, Lcom/dnake/desktop/RoomAdapter;->selectPosition:I

    .line 51
    iget-object p1, p0, Lcom/dnake/desktop/RoomAdapter$1;->this$0:Lcom/dnake/desktop/RoomAdapter;

    invoke-virtual {p1}, Lcom/dnake/desktop/RoomAdapter;->notifyDataSetChanged()V

    .line 52
    iget-object p1, p0, Lcom/dnake/desktop/RoomAdapter$1;->this$0:Lcom/dnake/desktop/RoomAdapter;

    iget-object p1, p1, Lcom/dnake/desktop/RoomAdapter;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v0, p0, Lcom/dnake/desktop/RoomAdapter$1;->val$ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->setTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 53
    iget-object p1, p0, Lcom/dnake/desktop/RoomAdapter$1;->this$0:Lcom/dnake/desktop/RoomAdapter;

    iget-object p1, p1, Lcom/dnake/desktop/RoomAdapter;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v0, p0, Lcom/dnake/desktop/RoomAdapter$1;->val$ticaInnerStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->setMachineNo(I)V

    .line 54
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/RoomAdapter$1;->this$0:Lcom/dnake/desktop/RoomAdapter;

    iget-object v0, v0, Lcom/dnake/desktop/RoomAdapter;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    return-void
.end method
