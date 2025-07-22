.class public Lcom/dnake/desktop/MainActivity_ViewBinding;
.super Ljava/lang/Object;
.source "MainActivity_ViewBinding.java"

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/dnake/desktop/MainActivity;

.field private view7f0800ae:Landroid/view/View;

.field private view7f0800fb:Landroid/view/View;

.field private view7f0800fd:Landroid/view/View;

.field private view7f0800fe:Landroid/view/View;

.field private view7f080104:Landroid/view/View;

.field private view7f080106:Landroid/view/View;

.field private view7f080108:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/MainActivity;)V
    .locals 1

    .line 36
    invoke-virtual {p1}, Lcom/dnake/desktop/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/dnake/desktop/MainActivity_ViewBinding;-><init>(Lcom/dnake/desktop/MainActivity;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/dnake/desktop/MainActivity;Landroid/view/View;)V
    .locals 6

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->target:Lcom/dnake/desktop/MainActivity;

    .line 44
    const-class v0, Lcom/dnake/desktop/widget/TimeView;

    const v1, 0x7f080153

    const-string v2, "field \'timeView\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/widget/TimeView;

    iput-object v0, p1, Lcom/dnake/desktop/MainActivity;->timeView:Lcom/dnake/desktop/widget/TimeView;

    const-string v0, "method \'onViewClicked\'"

    const v1, 0x7f0800fb

    .line 45
    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 46
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fb:Landroid/view/View;

    .line 47
    new-instance v2, Lcom/dnake/desktop/MainActivity_ViewBinding$1;

    invoke-direct {v2, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$1;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0800fe

    .line 53
    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 54
    iput-object v2, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fe:Landroid/view/View;

    .line 55
    new-instance v3, Lcom/dnake/desktop/MainActivity_ViewBinding$2;

    invoke-direct {v3, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$2;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v2, 0x7f0800fd

    .line 61
    invoke-static {p2, v2, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 62
    iput-object v3, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fd:Landroid/view/View;

    .line 63
    new-instance v4, Lcom/dnake/desktop/MainActivity_ViewBinding$3;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$3;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f080106

    .line 69
    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 70
    iput-object v3, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080106:Landroid/view/View;

    .line 71
    new-instance v4, Lcom/dnake/desktop/MainActivity_ViewBinding$4;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$4;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f080108

    .line 77
    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 78
    iput-object v3, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080108:Landroid/view/View;

    .line 79
    new-instance v4, Lcom/dnake/desktop/MainActivity_ViewBinding$5;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$5;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f080104

    .line 85
    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 86
    iput-object v4, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080104:Landroid/view/View;

    .line 87
    new-instance v5, Lcom/dnake/desktop/MainActivity_ViewBinding$6;

    invoke-direct {v5, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$6;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f0800ae

    .line 93
    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800ae:Landroid/view/View;

    .line 95
    new-instance v4, Lcom/dnake/desktop/MainActivity_ViewBinding$7;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/MainActivity_ViewBinding$7;-><init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x3

    new-array v0, v0, [Landroid/widget/RelativeLayout;

    .line 101
    const-class v4, Landroid/widget/RelativeLayout;

    const-string v5, "field \'mView\'"

    .line 102
    invoke-static {p2, v1, v5, v4}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v4, 0x0

    aput-object v1, v0, v4

    const-class v1, Landroid/widget/RelativeLayout;

    .line 103
    invoke-static {p2, v2, v5, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-class v1, Landroid/widget/RelativeLayout;

    .line 104
    invoke-static {p2, v3, v5, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 101
    invoke-static {v0}, Lbutterknife/internal/Utils;->listFilteringNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p1, Lcom/dnake/desktop/MainActivity;->mView:Ljava/util/List;

    .line 106
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const v0, 0x7f05002a

    .line 107
    invoke-static {p2, v0}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p1, Lcom/dnake/desktop/MainActivity;->clickedColor:I

    const v0, 0x7f050030

    .line 108
    invoke-static {p2, v0}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    iput p2, p1, Lcom/dnake/desktop/MainActivity;->colorUnClick:I

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->target:Lcom/dnake/desktop/MainActivity;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 116
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->target:Lcom/dnake/desktop/MainActivity;

    .line 118
    iput-object v1, v0, Lcom/dnake/desktop/MainActivity;->timeView:Lcom/dnake/desktop/widget/TimeView;

    .line 119
    iput-object v1, v0, Lcom/dnake/desktop/MainActivity;->mView:Ljava/util/List;

    .line 121
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fb:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fb:Landroid/view/View;

    .line 123
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fe:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fe:Landroid/view/View;

    .line 125
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fd:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800fd:Landroid/view/View;

    .line 127
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080106:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080106:Landroid/view/View;

    .line 129
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080108:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080108:Landroid/view/View;

    .line 131
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080104:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f080104:Landroid/view/View;

    .line 133
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800ae:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    iput-object v1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding;->view7f0800ae:Landroid/view/View;

    return-void

    .line 115
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
