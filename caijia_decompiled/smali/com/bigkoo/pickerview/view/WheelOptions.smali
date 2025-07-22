.class public Lcom/bigkoo/pickerview/view/WheelOptions;
.super Ljava/lang/Object;
.source "WheelOptions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private dividerColor:I

.field private dividerType:Lcom/contrarywind/view/WheelView$DividerType;

.field private isRestoreItem:Z

.field private lineSpacingMultiplier:F

.field private linkage:Z

.field private mOptions1Items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mOptions2Items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private mOptions3Items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TT;>;>;>;"
        }
    .end annotation
.end field

.field private optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

.field private textColorCenter:I

.field private textColorOut:I

.field private view:Landroid/view/View;

.field private wheelListener_option1:Lcom/contrarywind/listener/OnItemSelectedListener;

.field private wheelListener_option2:Lcom/contrarywind/listener/OnItemSelectedListener;

.field private wv_option1:Lcom/contrarywind/view/WheelView;

.field private wv_option2:Lcom/contrarywind/view/WheelView;

.field private wv_option3:Lcom/contrarywind/view/WheelView;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->linkage:Z

    .line 51
    iput-boolean p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->isRestoreItem:Z

    .line 52
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->view:Landroid/view/View;

    .line 53
    sget p2, Lcom/bigkoo/pickerview/R$id;->options1:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/contrarywind/view/WheelView;

    iput-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    .line 54
    sget p2, Lcom/bigkoo/pickerview/R$id;->options2:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/contrarywind/view/WheelView;

    iput-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    .line 55
    sget p2, Lcom/bigkoo/pickerview/R$id;->options3:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    return-void
.end method

.method static synthetic access$000(Lcom/bigkoo/pickerview/view/WheelOptions;)Ljava/util/List;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/bigkoo/pickerview/view/WheelOptions;)Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/bigkoo/pickerview/view/WheelOptions;)Lcom/contrarywind/view/WheelView;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/bigkoo/pickerview/view/WheelOptions;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->isRestoreItem:Z

    return p0
.end method

.method static synthetic access$400(Lcom/bigkoo/pickerview/view/WheelOptions;)Lcom/contrarywind/view/WheelView;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/bigkoo/pickerview/view/WheelOptions;)Ljava/util/List;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$600(Lcom/bigkoo/pickerview/view/WheelOptions;)Lcom/contrarywind/listener/OnItemSelectedListener;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wheelListener_option2:Lcom/contrarywind/listener/OnItemSelectedListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/bigkoo/pickerview/view/WheelOptions;)Lcom/contrarywind/view/WheelView;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    return-object p0
.end method

.method private itemSelected(III)V
    .locals 3

    .line 364
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions1Items:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 368
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    new-instance v2, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {v2, v0}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 369
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 371
    :cond_1
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 372
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    new-instance v2, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-direct {v2, p1}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 373
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    :cond_2
    return-void
.end method

.method private setDividerColor()V
    .locals 2

    .line 248
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 249
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 250
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    return-void
.end method

.method private setDividerType()V
    .locals 2

    .line 254
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 255
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 256
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    return-void
.end method

.method private setLineSpacingMultiplier()V
    .locals 2

    .line 260
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 261
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 262
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    return-void
.end method

.method private setTextColorCenter()V
    .locals 2

    .line 242
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 243
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 244
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    return-void
.end method

.method private setTextColorOut()V
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 237
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 238
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    return-void
.end method


# virtual methods
.method public getCurrentItems()[I
    .locals 7

    const/4 v0, 0x3

    new-array v0, v0, [I

    .line 336
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 338
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 339
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget-object v4, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    aget v5, v0, v2

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v3

    if-le v1, v4, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    :goto_0
    aput v1, v0, v3

    goto :goto_1

    .line 341
    :cond_1
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    aput v1, v0, v3

    .line 344
    :goto_1
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    const/4 v4, 0x2

    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 345
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget-object v5, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    aget v6, v0, v2

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    aget v6, v0, v3

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v3

    if-le v1, v5, :cond_2

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    :goto_2
    aput v2, v0, v4

    goto :goto_3

    .line 347
    :cond_3
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    aput v1, v0, v4

    :goto_3
    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->view:Landroid/view/View;

    return-object v0
.end method

.method public isCenterLabel(Z)V
    .locals 1

    .line 434
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 435
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 436
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    return-void
.end method

.method public setCurrentItems(III)V
    .locals 1

    .line 354
    iget-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->linkage:Z

    if-eqz v0, :cond_0

    .line 355
    invoke-direct {p0, p1, p2, p3}, Lcom/bigkoo/pickerview/view/WheelOptions;->itemSelected(III)V

    goto :goto_0

    .line 357
    :cond_0
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 358
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 359
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    :goto_0
    return-void
.end method

.method public setCyclic(Z)V
    .locals 1

    .line 300
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 301
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 302
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    return-void
.end method

.method public setCyclic(ZZZ)V
    .locals 1

    .line 322
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 323
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 324
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    return-void
.end method

.method public setDividerColor(I)V
    .locals 0

    .line 393
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerColor:I

    .line 394
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelOptions;->setDividerColor()V

    return-void
.end method

.method public setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V
    .locals 0

    .line 403
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    .line 404
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelOptions;->setDividerType()V

    return-void
.end method

.method public setLabels(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 275
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :cond_0
    if-eqz p2, :cond_1

    .line 278
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :cond_1
    if-eqz p3, :cond_2

    .line 281
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public setLineSpacingMultiplier(F)V
    .locals 0

    .line 383
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->lineSpacingMultiplier:F

    .line 384
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelOptions;->setLineSpacingMultiplier()V

    return-void
.end method

.method public setLinkage(Z)V
    .locals 0

    .line 444
    iput-boolean p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->linkage:Z

    return-void
.end method

.method public setNPicker(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    new-instance v1, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-direct {v1, p1}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 177
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    if-eqz p2, :cond_0

    .line 180
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    new-instance v1, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-direct {v1, p2}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 182
    :cond_0
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    if-eqz p3, :cond_1

    .line 185
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    new-instance v1, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-direct {v1, p3}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 187
    :cond_1
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 188
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setIsOptions(Z)V

    .line 189
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setIsOptions(Z)V

    .line 190
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setIsOptions(Z)V

    .line 192
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    if-eqz p1, :cond_2

    .line 193
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    new-instance v1, Lcom/bigkoo/pickerview/view/WheelOptions$4;

    invoke-direct {v1, p0}, Lcom/bigkoo/pickerview/view/WheelOptions$4;-><init>(Lcom/bigkoo/pickerview/view/WheelOptions;)V

    invoke-virtual {p1, v1}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_2
    const/16 p1, 0x8

    if-nez p2, :cond_3

    .line 202
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p2, p1}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    goto :goto_0

    .line 204
    :cond_3
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p2, v0}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 205
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    if-eqz p2, :cond_4

    .line 206
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    new-instance v1, Lcom/bigkoo/pickerview/view/WheelOptions$5;

    invoke-direct {v1, p0}, Lcom/bigkoo/pickerview/view/WheelOptions$5;-><init>(Lcom/bigkoo/pickerview/view/WheelOptions;)V

    invoke-virtual {p2, v1}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_4
    :goto_0
    if-nez p3, :cond_5

    .line 215
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p2, p1}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    goto :goto_1

    .line 217
    :cond_5
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, v0}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 218
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    if-eqz p1, :cond_6

    .line 219
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/view/WheelOptions$6;

    invoke-direct {p2, p0}, Lcom/bigkoo/pickerview/view/WheelOptions$6;-><init>(Lcom/bigkoo/pickerview/view/WheelOptions;)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_6
    :goto_1
    return-void
.end method

.method public setOptionsSelectChangeListener(Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;)V
    .locals 0

    .line 440
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    return-void
.end method

.method public setPicker(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TT;>;>;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TT;>;>;>;)V"
        }
    .end annotation

    .line 62
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions1Items:Ljava/util/List;

    .line 63
    iput-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    .line 64
    iput-object p3, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    .line 67
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    new-instance v1, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-direct {v1, p1}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 68
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 70
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 71
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    new-instance v3, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {v3, v0}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 75
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 76
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    new-instance v3, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {v3, v0}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 79
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setIsOptions(Z)V

    .line 80
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setIsOptions(Z)V

    .line 81
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setIsOptions(Z)V

    .line 83
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions2Items:Ljava/util/List;

    const/16 v2, 0x8

    if-nez v0, :cond_2

    .line 84
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    goto :goto_0

    .line 86
    :cond_2
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 88
    :goto_0
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->mOptions3Items:Ljava/util/List;

    if-nez v0, :cond_3

    .line 89
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, v2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    goto :goto_1

    .line 91
    :cond_3
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 95
    :goto_1
    new-instance v0, Lcom/bigkoo/pickerview/view/WheelOptions$1;

    invoke-direct {v0, p0}, Lcom/bigkoo/pickerview/view/WheelOptions$1;-><init>(Lcom/bigkoo/pickerview/view/WheelOptions;)V

    iput-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wheelListener_option1:Lcom/contrarywind/listener/OnItemSelectedListener;

    .line 124
    new-instance v0, Lcom/bigkoo/pickerview/view/WheelOptions$2;

    invoke-direct {v0, p0}, Lcom/bigkoo/pickerview/view/WheelOptions$2;-><init>(Lcom/bigkoo/pickerview/view/WheelOptions;)V

    iput-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wheelListener_option2:Lcom/contrarywind/listener/OnItemSelectedListener;

    if-eqz p1, :cond_4

    .line 155
    iget-boolean p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->linkage:Z

    if-eqz p1, :cond_4

    .line 156
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wheelListener_option1:Lcom/contrarywind/listener/OnItemSelectedListener;

    invoke-virtual {p1, v0}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_4
    if-eqz p2, :cond_5

    .line 158
    iget-boolean p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->linkage:Z

    if-eqz p1, :cond_5

    .line 159
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wheelListener_option2:Lcom/contrarywind/listener/OnItemSelectedListener;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_5
    if-eqz p3, :cond_6

    .line 161
    iget-boolean p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->linkage:Z

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    if-eqz p1, :cond_6

    .line 162
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/view/WheelOptions$3;

    invoke-direct {p2, p0}, Lcom/bigkoo/pickerview/view/WheelOptions$3;-><init>(Lcom/bigkoo/pickerview/view/WheelOptions;)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_6
    return-void
.end method

.method public setTextColorCenter(I)V
    .locals 0

    .line 413
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorCenter:I

    .line 414
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelOptions;->setTextColorCenter()V

    return-void
.end method

.method public setTextColorOut(I)V
    .locals 0

    .line 423
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->textColorOut:I

    .line 424
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelOptions;->setTextColorOut()V

    return-void
.end method

.method public setTextContentSize(I)V
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 231
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 232
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    return-void
.end method

.method public setTextXOffset(III)V
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 290
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 291
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 311
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option1:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 312
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option2:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 313
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->wv_option3:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTypeface(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public setView(Landroid/view/View;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelOptions;->view:Landroid/view/View;

    return-void
.end method
