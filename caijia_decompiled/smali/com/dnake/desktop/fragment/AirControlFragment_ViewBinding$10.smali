.class Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$10;
.super Lbutterknife/internal/DebouncingOnClickListener;
.source "AirControlFragment_ViewBinding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;

.field final synthetic val$target:Lcom/dnake/desktop/fragment/AirControlFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$10;->this$0:Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;

    iput-object p2, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$10;->val$target:Lcom/dnake/desktop/fragment/AirControlFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$10;->val$target:Lcom/dnake/desktop/fragment/AirControlFragment;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment;->onClickView(Landroid/view/View;)V

    return-void
.end method
