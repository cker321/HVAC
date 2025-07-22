.class Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$6;
.super Lbutterknife/internal/DebouncingOnClickListener;
.source "WindControlFragment_ViewBinding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;

.field final synthetic val$target:Lcom/dnake/desktop/fragment/WindControlFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$6;->this$0:Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;

    iput-object p2, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$6;->val$target:Lcom/dnake/desktop/fragment/WindControlFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$6;->val$target:Lcom/dnake/desktop/fragment/WindControlFragment;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment;->onClickView(Landroid/view/View;)V

    return-void
.end method
