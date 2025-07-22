.class public Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;
.super Ljava/lang/Object;
.source "WindControlFragment_ViewBinding.java"

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/dnake/desktop/fragment/WindControlFragment;

.field private view7f0800a8:Landroid/view/View;

.field private view7f0800a9:Landroid/view/View;

.field private view7f0800aa:Landroid/view/View;

.field private view7f0800ab:Landroid/view/View;

.field private view7f0800ac:Landroid/view/View;

.field private view7f0800ad:Landroid/view/View;

.field private view7f0800af:Landroid/view/View;

.field private view7f0800b1:Landroid/view/View;

.field private view7f0800b2:Landroid/view/View;

.field private view7f0800b3:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/fragment/WindControlFragment;Landroid/view/View;)V
    .locals 11

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/WindControlFragment;

    const v0, 0x7f0800ad

    const-string v1, "field \'ivPower\' and method \'onClickView\'"

    .line 47
    invoke-static {p2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 48
    const-class v2, Landroid/widget/ImageView;

    const-string v3, "field \'ivPower\'"

    invoke-static {v1, v0, v3, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->ivPower:Landroid/widget/ImageView;

    .line 49
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ad:Landroid/view/View;

    .line 50
    new-instance v0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$1;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0800ac

    const-string v1, "field \'ivJiashi\' and method \'onClickView\'"

    .line 56
    invoke-static {p2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 57
    const-class v2, Landroid/widget/ImageView;

    const-string v3, "field \'ivJiashi\'"

    invoke-static {v1, v0, v3, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->ivJiashi:Landroid/widget/ImageView;

    .line 58
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ac:Landroid/view/View;

    .line 59
    new-instance v0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$2;

    invoke-direct {v0, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$2;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    const-class v0, Lcom/dnake/desktop/widget/LandleafView;

    const v1, 0x7f0800d6

    const-string v2, "field \'myCustomLayout\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/widget/LandleafView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->myCustomLayout:Lcom/dnake/desktop/widget/LandleafView;

    const v0, 0x7f0800ab

    const-string v1, "method \'onClickView\'"

    .line 66
    invoke-static {p2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 67
    iput-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ab:Landroid/view/View;

    .line 68
    new-instance v3, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$3;

    invoke-direct {v3, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$3;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v2, 0x7f0800b3

    .line 74
    invoke-static {p2, v2, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 75
    iput-object v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b3:Landroid/view/View;

    .line 76
    new-instance v4, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$4;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$4;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f0800a9

    .line 82
    invoke-static {p2, v3, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 83
    iput-object v4, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800a9:Landroid/view/View;

    .line 84
    new-instance v5, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$5;

    invoke-direct {v5, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$5;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f0800b1

    .line 90
    invoke-static {p2, v4, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v5

    .line 91
    iput-object v5, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b1:Landroid/view/View;

    .line 92
    new-instance v6, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$6;

    invoke-direct {v6, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$6;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v5, 0x7f0800aa

    .line 98
    invoke-static {p2, v5, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v6

    .line 99
    iput-object v6, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800aa:Landroid/view/View;

    .line 100
    new-instance v7, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$7;

    invoke-direct {v7, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$7;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v6, 0x7f0800af

    .line 106
    invoke-static {p2, v6, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v7

    .line 107
    iput-object v7, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800af:Landroid/view/View;

    .line 108
    new-instance v8, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$8;

    invoke-direct {v8, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$8;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v7, 0x7f0800a8

    .line 114
    invoke-static {p2, v7, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v8

    .line 115
    iput-object v8, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800a8:Landroid/view/View;

    .line 116
    new-instance v9, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$9;

    invoke-direct {v9, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$9;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v8, 0x7f0800b2

    .line 122
    invoke-static {p2, v8, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 123
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b2:Landroid/view/View;

    .line 124
    new-instance v9, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$10;

    invoke-direct {v9, p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding$10;-><init>(Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/WindControlFragment;)V

    invoke-virtual {v1, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v1, 0x5

    new-array v1, v1, [Landroid/widget/ImageView;

    .line 130
    const-class v9, Landroid/widget/ImageView;

    const-string v10, "field \'ivModes\'"

    .line 131
    invoke-static {p2, v6, v10, v9}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    const/4 v9, 0x0

    aput-object v6, v1, v9

    const-class v6, Landroid/widget/ImageView;

    .line 132
    invoke-static {p2, v4, v10, v6}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const/4 v6, 0x1

    aput-object v4, v1, v6

    const-class v4, Landroid/widget/ImageView;

    .line 133
    invoke-static {p2, v7, v10, v4}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const/4 v7, 0x2

    aput-object v4, v1, v7

    const-class v4, Landroid/widget/ImageView;

    .line 134
    invoke-static {p2, v5, v10, v4}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const/4 v5, 0x3

    aput-object v4, v1, v5

    const-class v4, Landroid/widget/ImageView;

    .line 135
    invoke-static {p2, v8, v10, v4}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const/4 v8, 0x4

    aput-object v4, v1, v8

    .line 130
    invoke-static {v1}, Lbutterknife/internal/Utils;->arrayFilteringNull([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/widget/ImageView;

    iput-object v1, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->ivModes:[Landroid/widget/ImageView;

    new-array v1, v5, [Landroid/widget/ImageView;

    .line 136
    const-class v4, Landroid/widget/ImageView;

    const-string v5, "field \'ivVolumes\'"

    .line 137
    invoke-static {p2, v0, v5, v4}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v9

    const-class v0, Landroid/widget/ImageView;

    .line 138
    invoke-static {p2, v2, v5, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v6

    const-class v0, Landroid/widget/ImageView;

    .line 139
    invoke-static {p2, v3, v5, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    aput-object v0, v1, v7

    .line 136
    invoke-static {v1}, Lbutterknife/internal/Utils;->arrayFilteringNull([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->ivVolumes:[Landroid/widget/ImageView;

    .line 141
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 142
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f05002c

    .line 143
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    iput v1, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->colorLevelGood:I

    const v1, 0x7f05002d

    .line 144
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    iput p2, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->colorLevelMedium:I

    const p2, 0x7f0d0039

    .line 145
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->strShushi:Ljava/lang/String;

    const p2, 0x7f0d0038

    .line 146
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/dnake/desktop/fragment/WindControlFragment;->strLianghao:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/WindControlFragment;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 154
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/WindControlFragment;

    .line 156
    iput-object v1, v0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivPower:Landroid/widget/ImageView;

    .line 157
    iput-object v1, v0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivJiashi:Landroid/widget/ImageView;

    .line 158
    iput-object v1, v0, Lcom/dnake/desktop/fragment/WindControlFragment;->myCustomLayout:Lcom/dnake/desktop/widget/LandleafView;

    .line 159
    iput-object v1, v0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivModes:[Landroid/widget/ImageView;

    .line 160
    iput-object v1, v0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivVolumes:[Landroid/widget/ImageView;

    .line 162
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ad:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ad:Landroid/view/View;

    .line 164
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ac:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ac:Landroid/view/View;

    .line 166
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ab:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800ab:Landroid/view/View;

    .line 168
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b3:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b3:Landroid/view/View;

    .line 170
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800a9:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800a9:Landroid/view/View;

    .line 172
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b1:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b1:Landroid/view/View;

    .line 174
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800aa:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800aa:Landroid/view/View;

    .line 176
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800af:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800af:Landroid/view/View;

    .line 178
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800a8:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800a8:Landroid/view/View;

    .line 180
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b2:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment_ViewBinding;->view7f0800b2:Landroid/view/View;

    return-void

    .line 153
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
