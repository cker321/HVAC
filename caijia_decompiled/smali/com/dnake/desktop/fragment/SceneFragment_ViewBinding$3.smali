.class Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$3;
.super Lbutterknife/internal/DebouncingOnClickListener;
.source "SceneFragment_ViewBinding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;-><init>(Lcom/dnake/desktop/fragment/SceneFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;

.field final synthetic val$target:Lcom/dnake/desktop/fragment/SceneFragment;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;Lcom/dnake/desktop/fragment/SceneFragment;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$3;->this$0:Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;

    iput-object p2, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$3;->val$target:Lcom/dnake/desktop/fragment/SceneFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$3;->val$target:Lcom/dnake/desktop/fragment/SceneFragment;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/fragment/SceneFragment;->onViewClicked(Landroid/view/View;)V

    return-void
.end method
