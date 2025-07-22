.class public Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;
.super Ljava/lang/Object;
.source "SceneFragment_ViewBinding.java"

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/dnake/desktop/fragment/SceneFragment;

.field private view7f080100:Landroid/view/View;

.field private view7f080101:Landroid/view/View;

.field private view7f080102:Landroid/view/View;

.field private view7f080103:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/fragment/SceneFragment;Landroid/view/View;)V
    .locals 7

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/SceneFragment;

    const v0, 0x7f080102

    const-string v1, "method \'onViewClicked\'"

    .line 31
    invoke-static {p2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 32
    iput-object v2, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080102:Landroid/view/View;

    .line 33
    new-instance v3, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$1;

    invoke-direct {v3, p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$1;-><init>(Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;Lcom/dnake/desktop/fragment/SceneFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v2, 0x7f080101

    .line 39
    invoke-static {p2, v2, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 40
    iput-object v3, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080101:Landroid/view/View;

    .line 41
    new-instance v4, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$2;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$2;-><init>(Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;Lcom/dnake/desktop/fragment/SceneFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f080103

    .line 47
    invoke-static {p2, v3, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 48
    iput-object v4, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080103:Landroid/view/View;

    .line 49
    new-instance v5, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$3;

    invoke-direct {v5, p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$3;-><init>(Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;Lcom/dnake/desktop/fragment/SceneFragment;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f080100

    .line 55
    invoke-static {p2, v4, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 56
    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080100:Landroid/view/View;

    .line 57
    new-instance v5, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$4;

    invoke-direct {v5, p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding$4;-><init>(Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;Lcom/dnake/desktop/fragment/SceneFragment;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v1, 0x4

    new-array v1, v1, [Landroid/widget/ImageView;

    .line 63
    const-class v5, Landroid/widget/ImageView;

    const-string v6, "field \'imageViews\'"

    .line 64
    invoke-static {p2, v0, v6, v5}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v5, 0x0

    aput-object v0, v1, v5

    const-class v0, Landroid/widget/ImageView;

    .line 65
    invoke-static {p2, v2, v6, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v2, 0x1

    aput-object v0, v1, v2

    const-class v0, Landroid/widget/ImageView;

    .line 66
    invoke-static {p2, v3, v6, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v2, 0x2

    aput-object v0, v1, v2

    const-class v0, Landroid/widget/ImageView;

    .line 67
    invoke-static {p2, v4, v6, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    const/4 v0, 0x3

    aput-object p2, v1, v0

    .line 63
    invoke-static {v1}, Lbutterknife/internal/Utils;->arrayFilteringNull([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Landroid/widget/ImageView;

    iput-object p2, p1, Lcom/dnake/desktop/fragment/SceneFragment;->imageViews:[Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2

    .line 73
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/SceneFragment;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 75
    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/SceneFragment;

    .line 77
    iput-object v1, v0, Lcom/dnake/desktop/fragment/SceneFragment;->imageViews:[Landroid/widget/ImageView;

    .line 79
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080102:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080102:Landroid/view/View;

    .line 81
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080101:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080101:Landroid/view/View;

    .line 83
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080103:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080103:Landroid/view/View;

    .line 85
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080100:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment_ViewBinding;->view7f080100:Landroid/view/View;

    return-void

    .line 74
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
