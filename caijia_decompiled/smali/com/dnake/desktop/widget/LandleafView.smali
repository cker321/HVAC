.class public Lcom/dnake/desktop/widget/LandleafView;
.super Landroid/view/View;
.source "LandleafView.java"


# static fields
.field protected static final ANIMATION_DURATION:I = 0x1388

.field protected static final TAG:Ljava/lang/String; = "LandleafView"


# instance fields
.field protected angle:F

.field protected arcRect:Landroid/graphics/RectF;

.field protected bRadius:F

.field protected boundSize:I

.field protected bounds:Landroid/graphics/RectF;

.field protected cBgColor:I

.field protected cCurProgress:F

.field protected cLineWidth:F

.field protected cProgressColor:I

.field protected cRadius:F

.field protected cStartAngle:F

.field protected cSweepAngle:F

.field protected cTriangleMargin:F

.field protected decimalFormat:Ljava/text/DecimalFormat;

.field protected leftX:F

.field protected leftY:F

.field protected levelBg:I

.field protected levelText:Ljava/lang/String;

.field protected levelTextSize:I

.field protected mCenter:F

.field protected maxSweep:F

.field protected maxText:Ljava/lang/String;

.field protected minText:Ljava/lang/String;

.field protected path:Landroid/graphics/Path;

.field protected progressAnim:Landroid/animation/ValueAnimator;

.field protected progressPaint:Landroid/graphics/Paint;

.field public progressText:Ljava/lang/String;

.field protected progressTextSize:I

.field protected rangeSize:I

.field protected rightX:F

.field protected rightY:F

.field protected sRadius:F

.field protected startNum:F

.field protected trianglePaint:Landroid/graphics/Paint;

.field protected txtAnim:Landroid/animation/ValueAnimator;

.field protected txtPaint:Landroid/graphics/Paint;

.field protected x1:F

.field protected xPoint:F

.field protected y1:F

.field protected yPoint:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 197
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 33
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    .line 35
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    .line 39
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    .line 72
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    const/4 v0, 0x0

    .line 198
    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/widget/LandleafView;->initAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 199
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->initPaint()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 88
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    .line 35
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    .line 39
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    .line 72
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    .line 89
    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/widget/LandleafView;->initAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 90
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->initPaint()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 246
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    new-instance p3, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p3, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    .line 35
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    .line 37
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    .line 39
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    .line 72
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    .line 247
    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/widget/LandleafView;->initAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 248
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->initPaint()V

    return-void
.end method


# virtual methods
.method protected calRadian()V
    .locals 3

    .line 178
    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    const/4 v1, 0x0

    cmpg-float v1, v0, v1

    if-ltz v1, :cond_0

    const/high16 v1, 0x42c80000    # 100.0f

    cmpl-float v2, v0, v1

    if-gtz v2, :cond_0

    div-float/2addr v0, v1

    .line 181
    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView;->maxSweep:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cSweepAngle:F

    return-void

    .line 179
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "progress must >=0 && <=100\uff0cnow progress is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public drawArc(Landroid/graphics/Canvas;F)V
    .locals 6

    .line 193
    iget-object v1, p0, Lcom/dnake/desktop/widget/LandleafView;->arcRect:Landroid/graphics/RectF;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->cStartAngle:F

    iget-object v5, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    move-object v0, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    return-void
.end method

.method protected drawTriangle(Landroid/graphics/Canvas;F)V
    .locals 16

    move-object/from16 v0, p0

    .line 333
    iget v1, v0, Lcom/dnake/desktop/widget/LandleafView;->cStartAngle:F

    add-float v1, p2, v1

    .line 337
    iget v2, v0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    float-to-double v2, v2

    iget v4, v0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    float-to-double v4, v4

    float-to-double v6, v1

    const-wide v8, 0x400921fb54442d18L    # Math.PI

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v8

    const-wide v10, 0x4066800000000000L    # 180.0

    div-double/2addr v6, v10

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v12

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, v0, Lcom/dnake/desktop/widget/LandleafView;->x1:F

    .line 338
    iget v2, v0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    float-to-double v2, v2

    iget v4, v0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    float-to-double v4, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, v0, Lcom/dnake/desktop/widget/LandleafView;->y1:F

    .line 343
    iget v2, v0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    float-to-double v2, v2

    iget v4, v0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    float-to-double v4, v4

    iget v6, v0, Lcom/dnake/desktop/widget/LandleafView;->angle:F

    add-float/2addr v6, v1

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v8

    div-double/2addr v6, v10

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v4

    double-to-float v2, v2

    .line 344
    iget v3, v0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    float-to-double v3, v3

    iget v5, v0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    float-to-double v5, v5

    iget v7, v0, Lcom/dnake/desktop/widget/LandleafView;->angle:F

    add-float/2addr v7, v1

    float-to-double v12, v7

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v8

    div-double/2addr v12, v10

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v12

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v3, v5

    double-to-float v3, v3

    .line 346
    iget v4, v0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    float-to-double v4, v4

    iget v6, v0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    float-to-double v6, v6

    iget v12, v0, Lcom/dnake/desktop/widget/LandleafView;->angle:F

    sub-float v12, v1, v12

    float-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v8

    div-double/2addr v12, v10

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v12

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v4, v6

    double-to-float v4, v4

    .line 347
    iget v5, v0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    float-to-double v5, v5

    iget v7, v0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    float-to-double v12, v7

    iget v7, v0, Lcom/dnake/desktop/widget/LandleafView;->angle:F

    sub-float/2addr v1, v7

    float-to-double v14, v1

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v8

    div-double/2addr v14, v10

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v7

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v5, v12

    double-to-float v1, v5

    .line 350
    iget-object v5, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    sget-object v6, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v5, v6}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 351
    iget-object v5, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    iget v6, v0, Lcom/dnake/desktop/widget/LandleafView;->x1:F

    iget v7, v0, Lcom/dnake/desktop/widget/LandleafView;->y1:F

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 352
    iget-object v5, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 353
    iget-object v2, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    invoke-virtual {v2, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 354
    iget-object v1, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    iget v2, v0, Lcom/dnake/desktop/widget/LandleafView;->x1:F

    iget v3, v0, Lcom/dnake/desktop/widget/LandleafView;->y1:F

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 356
    iget-object v1, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 357
    iget-object v1, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    iget-object v2, v0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 358
    iget-object v1, v0, Lcom/dnake/desktop/widget/LandleafView;->path:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    return-void
.end method

.method protected getDecimalFormat(F)Ljava/text/DecimalFormat;
    .locals 6

    .line 463
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 466
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    sub-int/2addr v0, p1

    sub-int/2addr v0, v4

    .line 468
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "##0"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-lt v0, v4, :cond_1

    .line 470
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    if-ge v3, v0, :cond_1

    const-string v1, "0"

    .line 472
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 476
    :cond_1
    new-instance v0, Ljava/text/DecimalFormat;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->decimalFormat:Ljava/text/DecimalFormat;

    return-object v0
.end method

.method public getStringHeight(Landroid/graphics/Paint;)F
    .locals 4

    .line 522
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object p1

    .line 523
    iget v0, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr v0, p1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    add-double/2addr v0, v2

    double-to-float p1, v0

    return p1
.end method

.method public getStringWidth(Ljava/lang/String;Landroid/graphics/Paint;)F
    .locals 0

    .line 518
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    return p1
.end method

.method protected initAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 11

    .line 106
    sget-object v0, Lcom/dnake/desktop/R$styleable;->LandleafView:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    const v0, -0x777778

    .line 107
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cBgColor:I

    const/16 v0, 0xd

    const v1, -0xff0100

    .line 108
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cProgressColor:I

    const/4 v0, 0x4

    .line 109
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    const/16 v0, 0x12

    const/16 v1, 0x78

    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cStartAngle:F

    const/16 v0, 0x10

    const/16 v1, 0xc8

    .line 111
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cRadius:F

    const/16 v0, 0xa

    const/16 v1, 0x14

    .line 112
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/dnake/desktop/widget/LandleafView;->cLineWidth:F

    const/16 v2, 0x13

    .line 113
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    .line 114
    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    int-to-float v0, v0

    const/16 v1, 0xf

    const/16 v2, 0x6e

    .line 116
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/dnake/desktop/widget/LandleafView;->progressTextSize:I

    const/16 v1, 0x1c

    const/16 v2, 0x11

    .line 118
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Lcom/dnake/desktop/widget/LandleafView;->rangeSize:I

    .line 119
    iget-object v3, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    int-to-float v2, v2

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    const-string v2, "#39b54a"

    .line 121
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0x8

    invoke-virtual {p1, v3, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Lcom/dnake/desktop/widget/LandleafView;->levelBg:I

    const/16 v2, 0x9

    .line 122
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/dnake/desktop/widget/LandleafView;->levelTextSize:I

    const/4 v1, 0x1

    const/4 v2, 0x5

    .line 124
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/dnake/desktop/widget/LandleafView;->boundSize:I

    const/16 v1, 0xe

    .line 127
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/dnake/desktop/widget/LandleafView;->progressText:Ljava/lang/String;

    .line 129
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, p0, Lcom/dnake/desktop/widget/LandleafView;->startNum:F

    const/16 v1, 0xc

    .line 131
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/dnake/desktop/widget/LandleafView;->minText:Ljava/lang/String;

    const/16 v1, 0xb

    .line 132
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/dnake/desktop/widget/LandleafView;->maxText:Ljava/lang/String;

    const/4 v1, 0x7

    .line 133
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/dnake/desktop/widget/LandleafView;->levelText:Ljava/lang/String;

    .line 134
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 136
    new-instance p1, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v1, 0x3

    invoke-direct {p1, p2, v1}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 137
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cRadius:F

    add-float/2addr p1, p2

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cLineWidth:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    .line 138
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u5c0f\u5706\u534a\u5f84:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "LandleafView"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    float-to-double p1, p1

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p1

    float-to-double v3, v0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    add-double/2addr p1, v1

    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v1, v1, v2

    mul-float v1, v1, v0

    float-to-double v0, v1

    const-wide v5, 0x4004f1a6c638d03fL    # 2.6179938779914944

    .line 141
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v7

    sub-double/2addr p1, v0

    .line 140
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    .line 142
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->cStartAngle:F

    mul-float p1, p1, v2

    const/high16 p2, 0x44070000    # 540.0f

    sub-float/2addr p2, p1

    iput p2, p0, Lcom/dnake/desktop/widget/LandleafView;->maxSweep:F

    .line 144
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->cRadius:F

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cLineWidth:F

    add-float/2addr p1, p2

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    add-float/2addr p1, p2

    float-to-double p1, p1

    const-wide v0, 0x3ff0c152382d7365L    # 1.0471975511965976

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v3

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr p1, v0

    double-to-float p1, p1

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->mCenter:F

    .line 147
    new-instance p1, Landroid/graphics/RectF;

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->mCenter:F

    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cRadius:F

    sub-float v1, p2, v0

    sub-float v7, p2, v0

    add-float v8, p2, v0

    add-float/2addr p2, v0

    invoke-direct {p1, v1, v7, v8, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->arcRect:Landroid/graphics/RectF;

    .line 148
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    .line 149
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->arcRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result p1

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    .line 151
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, p1

    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v3, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->asin(D)D

    move-result-wide p1

    const-wide v0, 0x400921fb54442d18L    # Math.PI

    div-double/2addr p1, v0

    const-wide v3, 0x4066800000000000L    # 180.0

    mul-double p1, p1, v3

    double-to-float p1, p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->angle:F

    .line 155
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->cSweepAngle:F

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cStartAngle:F

    add-float/2addr p1, p2

    .line 158
    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->bRadius:F

    mul-float v5, p2, p2

    mul-float v5, v5, v2

    float-to-double v5, v5

    mul-float v2, v2, p2

    mul-float v2, v2, p2

    float-to-double v7, v2

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->maxSweep:F

    const/high16 v2, 0x43b40000    # 360.0f

    sub-float/2addr v2, p2

    float-to-double v9, v2

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v0

    div-double/2addr v9, v3

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v9

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float p2, v5

    .line 162
    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    float-to-double v5, v2

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    float-to-double v7, v2

    float-to-double v9, p1

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v0

    div-double/2addr v9, v3

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v0

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v5, v7

    double-to-float p1, v5

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->x1:F

    .line 163
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    float-to-double v0, p1

    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    float-to-double v2, p1

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v4

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-float p1, v0

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->y1:F

    .line 165
    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->x1:F

    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    add-float v2, v0, v1

    iput v2, p0, Lcom/dnake/desktop/widget/LandleafView;->leftX:F

    add-float/2addr p1, v1

    .line 166
    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->leftY:F

    add-float/2addr v0, p2

    .line 168
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget-object p2, p0, Lcom/dnake/desktop/widget/LandleafView;->minText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/dnake/desktop/widget/LandleafView;->rightX:F

    .line 169
    iget p1, p0, Lcom/dnake/desktop/widget/LandleafView;->y1:F

    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->rightY:F

    .line 171
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->calRadian()V

    return-void
.end method

.method protected initPaint()V
    .locals 4

    .line 206
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 207
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 208
    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v2, 0x4

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 209
    iget-object v2, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 210
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->cLineWidth:F

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 211
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 212
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x40400000    # 3.0f
        0x41100000    # 9.0f
        0x40400000    # 3.0f
        0x41100000    # 9.0f
    .end array-data
.end method

.method public synthetic lambda$runFloat$0$LandleafView(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 490
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->decimalFormat:Ljava/text/DecimalFormat;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->progressText:Ljava/lang/String;

    .line 491
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->invalidate()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 259
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    .line 260
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 262
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView;->cBgColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 264
    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->maxSweep:F

    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/widget/LandleafView;->drawArc(Landroid/graphics/Canvas;F)V

    .line 266
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView;->cProgressColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 267
    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cSweepAngle:F

    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/widget/LandleafView;->drawArc(Landroid/graphics/Canvas;F)V

    .line 269
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->trianglePaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 270
    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->cSweepAngle:F

    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/widget/LandleafView;->drawTriangle(Landroid/graphics/Canvas;F)V

    .line 272
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 276
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 278
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->levelBg:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 279
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->levelTextSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 280
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/widget/LandleafView;->getStringHeight(Landroid/graphics/Paint;)F

    move-result v0

    .line 281
    iget-object v2, p0, Lcom/dnake/desktop/widget/LandleafView;->levelText:Ljava/lang/String;

    iget-object v3, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, v2, v3}, Lcom/dnake/desktop/widget/LandleafView;->getStringWidth(Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result v2

    .line 282
    iget v3, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    .line 284
    iget-object v5, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    iget v6, p0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    iget-object v7, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/dnake/desktop/widget/LandleafView;->levelText:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v7

    div-float/2addr v7, v4

    sub-float/2addr v6, v7

    sub-float/2addr v6, v3

    iget v7, p0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    iget v8, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    div-float/2addr v8, v4

    add-float/2addr v7, v8

    sub-float/2addr v7, v0

    div-float v0, v3, v4

    sub-float/2addr v7, v0

    iget v8, p0, Lcom/dnake/desktop/widget/LandleafView;->xPoint:F

    iget-object v9, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget-object v10, p0, Lcom/dnake/desktop/widget/LandleafView;->levelText:Ljava/lang/String;

    .line 286
    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v9

    div-float/2addr v9, v4

    sub-float/2addr v8, v9

    add-float/2addr v8, v2

    add-float/2addr v8, v3

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    iget v3, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    add-float/2addr v2, v0

    .line 284
    invoke-virtual {v5, v6, v7, v8, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 288
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->boundSize:I

    int-to-float v3, v2

    int-to-float v2, v2

    iget-object v5, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v3, v2, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 290
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 291
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 292
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 293
    iget-object v2, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v2, v3

    iget v3, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    int-to-float v0, v0

    sub-float/2addr v2, v0

    div-float/2addr v2, v4

    .line 295
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->levelText:Ljava/lang/String;

    iget-object v3, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    iget-object v5, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v3, v2, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 297
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->rangeSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 298
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->minText:Ljava/lang/String;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->leftX:F

    iget v3, p0, Lcom/dnake/desktop/widget/LandleafView;->leftY:F

    iget-object v5, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 299
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->maxText:Ljava/lang/String;

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->rightX:F

    iget v3, p0, Lcom/dnake/desktop/widget/LandleafView;->rightY:F

    iget-object v5, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 301
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 302
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView;->progressTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 303
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, -0x1000000

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 304
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressText:Ljava/lang/String;

    iget-object v1, p0, Lcom/dnake/desktop/widget/LandleafView;->bounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->yPoint:F

    iget v3, p0, Lcom/dnake/desktop/widget/LandleafView;->sRadius:F

    const/high16 v5, 0x40a00000    # 5.0f

    div-float/2addr v3, v5

    add-float/2addr v2, v3

    iget v3, p0, Lcom/dnake/desktop/widget/LandleafView;->cTriangleMargin:F

    mul-float v3, v3, v4

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 305
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->txtPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->reset()V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    .line 218
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 219
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 220
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 221
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/high16 v2, 0x40000000    # 2.0f

    const/high16 v3, 0x40000000    # 2.0f

    if-ne v0, v3, :cond_0

    goto :goto_0

    .line 227
    :cond_0
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->getPaddingLeft()I

    move-result p1

    int-to-float p1, p1

    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->mCenter:F

    mul-float v0, v0, v2

    add-float/2addr p1, v0

    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->getPaddingRight()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    float-to-int p1, p1

    :goto_0
    if-ne v1, v3, :cond_1

    goto :goto_1

    .line 232
    :cond_1
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->getPaddingTop()I

    move-result p2

    int-to-float p2, p2

    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView;->mCenter:F

    mul-float v0, v0, v2

    add-float/2addr p2, v0

    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->getPaddingBottom()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p2, v0

    float-to-int p2, p2

    .line 235
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/widget/LandleafView;->setMeasuredDimension(II)V

    return-void
.end method

.method protected runFloat(IF)V
    .locals 3

    .line 483
    invoke-virtual {p0, p2}, Lcom/dnake/desktop/widget/LandleafView;->getDecimalFormat(F)Ljava/text/DecimalFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->decimalFormat:Ljava/text/DecimalFormat;

    .line 484
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->txtAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 485
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    .line 487
    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView;->startNum:F

    aput v2, v0, v1

    const/4 v1, 0x1

    aput p2, v0, v1

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/dnake/desktop/widget/LandleafView;->txtAnim:Landroid/animation/ValueAnimator;

    int-to-long v0, p1

    .line 488
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 489
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->txtAnim:Landroid/animation/ValueAnimator;

    new-instance p2, Lcom/dnake/desktop/widget/-$$Lambda$LandleafView$gnHyM4CuMsbXXhIbqZSSvRPVP9s;

    invoke-direct {p2, p0}, Lcom/dnake/desktop/widget/-$$Lambda$LandleafView$gnHyM4CuMsbXXhIbqZSSvRPVP9s;-><init>(Lcom/dnake/desktop/widget/LandleafView;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 493
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->txtAnim:Landroid/animation/ValueAnimator;

    new-instance p2, Lcom/dnake/desktop/widget/LandleafView$3;

    invoke-direct {p2, p0}, Lcom/dnake/desktop/widget/LandleafView$3;-><init>(Lcom/dnake/desktop/widget/LandleafView;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 514
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->txtAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public setProgress(FFFILjava/lang/String;)V
    .locals 2

    cmpl-float v0, p1, p3

    if-ltz v0, :cond_0

    move p1, p3

    :cond_0
    cmpg-float v0, p1, p2

    if-gtz v0, :cond_1

    move p1, p2

    :cond_1
    sub-float v0, p1, p2

    sub-float v1, p3, p2

    div-float/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 379
    iput-object p5, p0, Lcom/dnake/desktop/widget/LandleafView;->levelText:Ljava/lang/String;

    .line 380
    iput p4, p0, Lcom/dnake/desktop/widget/LandleafView;->levelBg:I

    .line 381
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/dnake/desktop/widget/LandleafView;->minText:Ljava/lang/String;

    .line 382
    invoke-static {p3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/dnake/desktop/widget/LandleafView;->maxText:Ljava/lang/String;

    if-ltz v0, :cond_2

    const/16 p2, 0x64

    if-gt v0, p2, :cond_2

    .line 386
    iget p2, p0, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    int-to-float p3, v0

    invoke-virtual {p0, p2, p3, p4}, Lcom/dnake/desktop/widget/LandleafView;->valueAnimator(FFI)V

    const/16 p2, 0x1f4

    .line 388
    invoke-virtual {p0, p2, p1}, Lcom/dnake/desktop/widget/LandleafView;->runFloat(IF)V

    .line 389
    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->startNum:F

    return-void

    .line 384
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "progress must >=0 && <=100\uff0cnow progress is "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected setProgressColor(I)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/dnake/desktop/widget/LandleafView;->cProgressColor:I

    return-void
.end method

.method public setProgressText(F)V
    .locals 0

    .line 77
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->progressText:Ljava/lang/String;

    .line 78
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->invalidate()V

    return-void
.end method

.method public setRange(FF)V
    .locals 0

    .line 394
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->minText:Ljava/lang/String;

    .line 395
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->maxText:Ljava/lang/String;

    .line 396
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/LandleafView;->invalidate()V

    return-void
.end method

.method protected valueAnimator(FFI)V
    .locals 3

    .line 408
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 409
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput v0, v1, v2

    .line 411
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    .line 412
    new-instance v1, Lcom/dnake/desktop/widget/LandleafView$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/dnake/desktop/widget/LandleafView$1;-><init>(Lcom/dnake/desktop/widget/LandleafView;FFI)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 433
    iget-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/dnake/desktop/widget/LandleafView$2;

    invoke-direct {v0, p0}, Lcom/dnake/desktop/widget/LandleafView$2;-><init>(Lcom/dnake/desktop/widget/LandleafView;)V

    invoke-virtual {p3, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 454
    iget-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v0}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {p3, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 455
    iget-object p3, p0, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    const v0, 0x459c4000    # 5000.0f

    sub-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 p2, 0x42c80000    # 100.0f

    div-float/2addr p1, p2

    mul-float p1, p1, v0

    float-to-int p1, p1

    int-to-long p1, p1

    invoke-virtual {p3, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 456
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method
