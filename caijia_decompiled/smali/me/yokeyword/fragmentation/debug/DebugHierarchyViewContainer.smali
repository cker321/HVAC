.class public Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;
.super Landroid/widget/ScrollView;
.source "DebugHierarchyViewContainer.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mItemHeight:I

.field private mLinearLayout:Landroid/widget/LinearLayout;

.field private mPadding:I

.field private mTitleLayout:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 36
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->initView(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;)Landroid/content/Context;
    .locals 0

    .line 25
    iget-object p0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;I)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->removeView(I)V

    return-void
.end method

.method static synthetic access$200(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;Ljava/util/List;ILandroid/widget/TextView;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->handleExpandView(Ljava/util/List;ILandroid/widget/TextView;)V

    return-void
.end method

.method private dip2px(F)I
    .locals 1

    .line 62
    iget-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private getTextView(Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;I)Landroid/widget/TextView;
    .locals 8

    .line 172
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 174
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    iget v2, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mItemHeight:I

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 175
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-nez p2, :cond_0

    const-string v1, "#333333"

    .line 177
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    .line 178
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    :cond_0
    const/16 v1, 0x10

    .line 180
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 181
    iget v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mPadding:I

    int-to-double v2, v1

    mul-int p2, p2, v1

    int-to-double v4, p2

    const-wide/high16 v6, 0x3ff8000000000000L    # 1.5

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v4

    double-to-int p2, v2

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 182
    iget p2, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mPadding:I

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 184
    iget-object p2, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const v3, 0x101030e

    aput v3, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 185
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 186
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 188
    iget-object p1, p1, Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;->fragmentName:Ljava/lang/CharSequence;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method private getTitleLayout()Landroid/widget/LinearLayout;
    .locals 5

    .line 78
    iget-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    return-object v0

    .line 80
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    const/high16 v1, 0x41c00000    # 24.0f

    .line 81
    invoke-direct {p0, v1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->dip2px(F)I

    move-result v2

    invoke-direct {p0, v1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->dip2px(F)I

    move-result v1

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->dip2px(F)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v1, v4, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 82
    iget-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 83
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 84
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 87
    sget v1, Lme/yokeyword/fragmentation/R$string;->fragmentation_stack_view:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    const/high16 v1, 0x41a00000    # 20.0f

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v1, -0x1000000

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    .line 91
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 92
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 96
    sget v1, Lme/yokeyword/fragmentation/R$drawable;->fragmentation_help:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 97
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x41800000    # 16.0f

    .line 98
    invoke-direct {p0, v2}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->dip2px(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 99
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    new-instance v2, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$1;

    invoke-direct {v2, p0}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$1;-><init>(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 108
    iget-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mTitleLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method private handleExpandView(Ljava/util/List;ILandroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;",
            ">;I",
            "Landroid/widget/TextView;",
            ")V"
        }
    .end annotation

    .line 157
    invoke-direct {p0, p1, p2, p3}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->setView(Ljava/util/List;ILandroid/widget/TextView;)V

    .line 158
    sget p1, Lme/yokeyword/fragmentation/R$drawable;->fragmentation_ic_expandable:I

    const/4 p2, 0x0

    invoke-virtual {p3, p1, p2, p2, p2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 2

    .line 50
    iput-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mContext:Landroid/content/Context;

    .line 51
    new-instance v0, Landroid/widget/HorizontalScrollView;

    invoke-direct {v0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 52
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    const/4 p1, 0x1

    .line 53
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 54
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 55
    invoke-virtual {p0, v0}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->addView(Landroid/view/View;)V

    const/high16 p1, 0x42480000    # 50.0f

    .line 57
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->dip2px(F)I

    move-result p1

    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mItemHeight:I

    const/high16 p1, 0x41800000    # 16.0f

    .line 58
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->dip2px(F)I

    move-result p1

    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mPadding:I

    return-void
.end method

.method private removeView(I)V
    .locals 3

    .line 162
    iget-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 164
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 165
    sget v2, Lme/yokeyword/fragmentation/R$id;->hierarchy:I

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    sget v2, Lme/yokeyword/fragmentation/R$id;->hierarchy:I

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lt v2, p1, :cond_0

    .line 166
    iget-object v2, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private setView(Ljava/util/List;ILandroid/widget/TextView;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;",
            ">;I",
            "Landroid/widget/TextView;",
            ")V"
        }
    .end annotation

    .line 112
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    .line 113
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;

    .line 117
    invoke-direct {p0, v1, p2}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->getTextView(Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;I)Landroid/widget/TextView;

    move-result-object v2

    .line 118
    sget v3, Lme/yokeyword/fragmentation/R$id;->hierarchy:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 120
    iget-object v1, v1, Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;->childFragmentRecord:Ljava/util/List;

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 121
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    add-int/lit8 v4, p2, 0x1

    .line 123
    sget v5, Lme/yokeyword/fragmentation/R$drawable;->fragmentation_ic_right:I

    invoke-virtual {v2, v5, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 125
    new-instance v3, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$2;

    invoke-direct {v3, p0, v2, v4, v1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$2;-><init>(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;Landroid/widget/TextView;ILjava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 145
    :cond_0
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v1

    iget v4, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mPadding:I

    add-int/2addr v1, v4

    invoke-virtual {v2, v1, v3, v4, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    :goto_1
    if-nez p3, :cond_1

    .line 149
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 151
    :cond_1
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p3}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    :goto_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public bindFragmentRecords(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;",
            ">;)V"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 68
    invoke-direct {p0}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->getTitleLayout()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 69
    iget-object v1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->mLinearLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 73
    invoke-direct {p0, p1, v0, v1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->setView(Ljava/util/List;ILandroid/widget/TextView;)V

    return-void
.end method
