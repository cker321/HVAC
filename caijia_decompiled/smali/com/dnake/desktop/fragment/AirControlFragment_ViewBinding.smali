.class public Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;
.super Ljava/lang/Object;
.source "AirControlFragment_ViewBinding.java"

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/dnake/desktop/fragment/AirControlFragment;

.field private view7f080145:Landroid/view/View;

.field private view7f080146:Landroid/view/View;

.field private view7f080147:Landroid/view/View;

.field private view7f080148:Landroid/view/View;

.field private view7f080149:Landroid/view/View;

.field private view7f08014a:Landroid/view/View;

.field private view7f08014b:Landroid/view/View;

.field private view7f08014c:Landroid/view/View;

.field private view7f08014d:Landroid/view/View;

.field private view7f08014e:Landroid/view/View;

.field private view7f08014f:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/fragment/AirControlFragment;Landroid/view/View;)V
    .locals 12

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/AirControlFragment;

    .line 50
    const-class v0, Landroidx/recyclerview/widget/RecyclerView;

    const v1, 0x7f0800f5

    const-string v2, "field \'recyclerView\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const v0, 0x7f08014c

    const-string v1, "field \'ivPower\' and method \'onClickView\'"

    .line 51
    invoke-static {p2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 52
    const-class v2, Landroid/widget/ImageView;

    const-string v3, "field \'ivPower\'"

    invoke-static {v1, v0, v3, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->ivPower:Landroid/widget/ImageView;

    .line 53
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014c:Landroid/view/View;

    .line 54
    new-instance v0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$1;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080151

    const-string v2, "field \'tvTempShow\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->tvTempShow:Landroid/widget/TextView;

    .line 61
    const-class v0, Lcom/dnake/desktop/widget/LandleafView;

    const v1, 0x7f080150

    const-string v2, "field \'myLandleafView\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/widget/LandleafView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->myLandleafView:Lcom/dnake/desktop/widget/LandleafView;

    const-string v0, "method \'onClickView\'"

    const v1, 0x7f08014a

    .line 62
    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 63
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014a:Landroid/view/View;

    .line 64
    new-instance v2, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$2;

    invoke-direct {v2, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$2;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f08014b

    .line 70
    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 71
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014b:Landroid/view/View;

    .line 72
    new-instance v2, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$3;

    invoke-direct {v2, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$3;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f08014e

    .line 78
    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 79
    iput-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014e:Landroid/view/View;

    .line 80
    new-instance v3, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$4;

    invoke-direct {v3, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$4;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v2, 0x7f08014f

    .line 86
    invoke-static {p2, v2, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 87
    iput-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014f:Landroid/view/View;

    .line 88
    new-instance v4, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$5;

    invoke-direct {v4, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$5;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f08014d

    .line 94
    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 95
    iput-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014d:Landroid/view/View;

    .line 96
    new-instance v5, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$6;

    invoke-direct {v5, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$6;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f080149

    .line 102
    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v5

    .line 103
    iput-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080149:Landroid/view/View;

    .line 104
    new-instance v6, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$7;

    invoke-direct {v6, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$7;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v5, 0x7f080145

    .line 110
    invoke-static {p2, v5, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v6

    .line 111
    iput-object v6, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080145:Landroid/view/View;

    .line 112
    new-instance v7, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$8;

    invoke-direct {v7, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$8;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v6, 0x7f080147

    .line 118
    invoke-static {p2, v6, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v7

    .line 119
    iput-object v7, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080147:Landroid/view/View;

    .line 120
    new-instance v8, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$9;

    invoke-direct {v8, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$9;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v7, 0x7f080146

    .line 126
    invoke-static {p2, v7, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v8

    .line 127
    iput-object v8, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080146:Landroid/view/View;

    .line 128
    new-instance v9, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$10;

    invoke-direct {v9, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$10;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v8, 0x7f080148

    .line 134
    invoke-static {p2, v8, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080148:Landroid/view/View;

    .line 136
    new-instance v9, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$11;

    invoke-direct {v9, p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding$11;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v0, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x4

    new-array v9, v0, [Landroid/widget/ImageView;

    .line 142
    const-class v10, Landroid/widget/ImageView;

    const-string v11, "field \'mModeViews\'"

    .line 143
    invoke-static {p2, v1, v11, v10}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    const-class v1, Landroid/widget/ImageView;

    .line 144
    invoke-static {p2, v2, v11, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v2, 0x1

    aput-object v1, v9, v2

    const-class v1, Landroid/widget/ImageView;

    .line 145
    invoke-static {p2, v3, v11, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v3, 0x2

    aput-object v1, v9, v3

    const-class v1, Landroid/widget/ImageView;

    .line 146
    invoke-static {p2, v4, v11, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const/4 v4, 0x3

    aput-object v1, v9, v4

    .line 142
    invoke-static {v9}, Lbutterknife/internal/Utils;->listFilteringNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->mModeViews:Ljava/util/List;

    new-array v0, v0, [Landroid/widget/ImageView;

    .line 147
    const-class v1, Landroid/widget/ImageView;

    const-string v9, "field \'mFengsuViews\'"

    .line 148
    invoke-static {p2, v5, v9, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v0, v10

    const-class v1, Landroid/widget/ImageView;

    .line 149
    invoke-static {p2, v6, v9, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v0, v2

    const-class v1, Landroid/widget/ImageView;

    .line 150
    invoke-static {p2, v7, v9, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v0, v3

    const-class v1, Landroid/widget/ImageView;

    .line 151
    invoke-static {p2, v8, v9, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v0, v4

    .line 147
    invoke-static {v0}, Lbutterknife/internal/Utils;->listFilteringNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->mFengsuViews:Ljava/util/List;

    .line 153
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const v0, 0x7f05002c

    .line 154
    invoke-static {p2, v0}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    iput p2, p1, Lcom/dnake/desktop/fragment/AirControlFragment;->colorLevelGood:I

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/AirControlFragment;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 162
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/AirControlFragment;

    .line 164
    iput-object v1, v0, Lcom/dnake/desktop/fragment/AirControlFragment;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 165
    iput-object v1, v0, Lcom/dnake/desktop/fragment/AirControlFragment;->ivPower:Landroid/widget/ImageView;

    .line 166
    iput-object v1, v0, Lcom/dnake/desktop/fragment/AirControlFragment;->tvTempShow:Landroid/widget/TextView;

    .line 167
    iput-object v1, v0, Lcom/dnake/desktop/fragment/AirControlFragment;->myLandleafView:Lcom/dnake/desktop/widget/LandleafView;

    .line 168
    iput-object v1, v0, Lcom/dnake/desktop/fragment/AirControlFragment;->mModeViews:Ljava/util/List;

    .line 169
    iput-object v1, v0, Lcom/dnake/desktop/fragment/AirControlFragment;->mFengsuViews:Ljava/util/List;

    .line 171
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014c:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014c:Landroid/view/View;

    .line 173
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014a:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014a:Landroid/view/View;

    .line 175
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014b:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014b:Landroid/view/View;

    .line 177
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014e:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014e:Landroid/view/View;

    .line 179
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014f:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014f:Landroid/view/View;

    .line 181
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014d:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f08014d:Landroid/view/View;

    .line 183
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080149:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080149:Landroid/view/View;

    .line 185
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080145:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080145:Landroid/view/View;

    .line 187
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080147:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080147:Landroid/view/View;

    .line 189
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080146:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080146:Landroid/view/View;

    .line 191
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080148:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment_ViewBinding;->view7f080148:Landroid/view/View;

    return-void

    .line 161
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
