.class public Lcom/dnake/desktop/widget/ArofeneView1;
.super Landroid/view/View;
.source "ArofeneView1.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private arofeneLevelTxt:Ljava/lang/String;

.field protected boundSize:I

.field protected bounds:Landroid/graphics/RectF;

.field private boundsHeight:F

.field private colorCha:I

.field private colorLiang:I

.field private colorYou:I

.field private colorZhong:I

.field level:I

.field private levelBgColor:I

.field private levelPaint:Landroid/graphics/Paint;

.field private levelTextSize:I

.field private lineHeight:I

.field private linePaint:Landroid/graphics/Paint;

.field private lineWidth:I

.field private triangleLength:I

.field private triangleMargin:I

.field private trianglePaint:Landroid/graphics/Paint;

.field private txtMargin:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const-class v0, Lcom/dnake/desktop/widget/ArofeneView1;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/widget/ArofeneView1;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    const/4 v0, 0x0

    .line 36
    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->level:I

    const-string v0, "#08ca08"

    .line 70
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorYou:I

    const-string v0, "#f0c61e"

    .line 72
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorLiang:I

    const-string v0, "#e9490b"

    .line 74
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorZhong:I

    const-string v0, "#de0f0f"

    .line 76
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorCha:I

    const/4 v0, 0x2

    .line 198
    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->txtMargin:I

    const/16 v0, 0xa

    .line 200
    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleMargin:I

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/dnake/desktop/widget/ArofeneView1;->initAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    invoke-direct {p0}, Lcom/dnake/desktop/widget/ArofeneView1;->initPaint()V

    return-void
.end method

.method private drawLevelBg(Landroid/graphics/Canvas;)V
    .locals 8

    .line 205
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 207
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 208
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelBgColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 209
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 210
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/widget/ArofeneView1;->getStringHeight(Landroid/graphics/Paint;)F

    move-result v0

    .line 211
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->arofeneLevelTxt:Ljava/lang/String;

    iget-object v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, v1, v2}, Lcom/dnake/desktop/widget/ArofeneView1;->getStringWidth(Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result v1

    .line 212
    sget-object v2, Lcom/dnake/desktop/widget/ArofeneView1;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Str height:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, "-strWidth:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v3, v2, 0x2

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    iget v5, p0, Lcom/dnake/desktop/widget/ArofeneView1;->txtMargin:I

    int-to-float v6, v5

    const/high16 v7, 0x40800000    # 4.0f

    mul-float v6, v6, v7

    add-float/2addr v6, v1

    sub-float/2addr v3, v6

    .line 216
    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    int-to-float v6, v5

    mul-float v6, v6, v7

    add-float/2addr v1, v6

    add-float/2addr v2, v1

    mul-int/lit8 v5, v5, 0x2

    int-to-float v1, v5

    add-float/2addr v0, v1

    .line 218
    iput v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundsHeight:F

    .line 219
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 220
    sget-object v1, Lcom/dnake/desktop/widget/ArofeneView1;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "left:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, ",top:"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, ",right:"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ",bottom:"

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    sget-object v0, Lcom/dnake/desktop/widget/ArofeneView1;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "centerX:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "-centY:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundSize:I

    int-to-float v2, v1

    int-to-float v1, v1

    iget-object v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 224
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 225
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 226
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 227
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v1, v2

    iget v2, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    int-to-float v0, v0

    sub-float/2addr v1, v0

    div-float/2addr v1, v4

    .line 228
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->arofeneLevelTxt:Ljava/lang/String;

    iget-object v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->bounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawLine(Landroid/graphics/Canvas;)V
    .locals 8

    .line 175
    iget v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundsHeight:F

    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleMargin:I

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    int-to-double v2, v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    iget v6, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    div-int/lit8 v6, v6, 0x2

    int-to-double v6, v6

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-float v0, v0

    .line 176
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorYou:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 177
    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v5, v1

    iget-object v7, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    move-object v2, p1

    move v4, v0

    move v6, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 178
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorLiang:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 179
    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v2, v1, 0x4

    int-to-float v3, v2

    div-int/lit8 v1, v1, 0x2

    int-to-float v5, v1

    iget-object v7, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 180
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorZhong:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 181
    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v2, v1, 0x2

    int-to-float v3, v2

    div-int/lit8 v1, v1, 0x4

    mul-int/lit8 v1, v1, 0x3

    int-to-float v5, v1

    iget-object v7, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 182
    iget-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorCha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v2, v1, 0x4

    mul-int/lit8 v2, v2, 0x3

    int-to-float v3, v2

    int-to-float v5, v1

    iget-object v7, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawTriangle(Landroid/graphics/Canvas;)V
    .locals 10

    .line 187
    iget v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->level:I

    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    mul-int v0, v0, v1

    div-int/lit8 v0, v0, 0x4

    .line 188
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 190
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v2, v2, 0x8

    iget v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    add-int/2addr v2, v0

    int-to-float v2, v2

    iget v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundsHeight:F

    iget v4, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleMargin:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 191
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v2, v2, 0x8

    iget v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    add-int/2addr v2, v0

    int-to-float v2, v2

    iget v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundsHeight:F

    iget v4, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleMargin:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 192
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    div-int/lit8 v2, v2, 0x8

    add-int/2addr v2, v0

    int-to-float v0, v2

    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundsHeight:F

    iget v3, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleMargin:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    float-to-double v2, v2

    iget v4, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    int-to-double v4, v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    iget v8, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    div-int/lit8 v8, v8, 0x2

    int-to-double v8, v8

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    sub-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v2, v4

    double-to-float v2, v2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 193
    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 194
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->trianglePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method private initAttrs(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v0, 0x0

    .line 121
    invoke-virtual {p0, v0, p1}, Lcom/dnake/desktop/widget/ArofeneView1;->setArofeneLevelTxt(ILandroid/content/Context;)V

    .line 123
    sget-object v1, Lcom/dnake/desktop/R$styleable;->ArofeneView1:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x4

    const/16 v1, 0xac

    .line 124
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    const/4 p2, 0x3

    const/16 v1, 0x8

    .line 125
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineHeight:I

    const/4 p2, 0x2

    const/16 v1, 0xb

    .line 127
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    const/4 p2, 0x1

    const/16 v1, 0x14

    .line 129
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelTextSize:I

    const/4 p2, 0x5

    .line 131
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->boundSize:I

    .line 133
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private initPaint()V
    .locals 2

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->trianglePaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    .line 55
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 57
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->trianglePaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->trianglePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 61
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    .line 62
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 63
    iget-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->linePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 65
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public getStringHeight(Landroid/graphics/Paint;)F
    .locals 4

    .line 236
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object p1

    .line 237
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

    .line 232
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    return p1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 138
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    .line 140
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 142
    invoke-direct {p0, p1}, Lcom/dnake/desktop/widget/ArofeneView1;->drawLevelBg(Landroid/graphics/Canvas;)V

    .line 144
    invoke-direct {p0, p1}, Lcom/dnake/desktop/widget/ArofeneView1;->drawTriangle(Landroid/graphics/Canvas;)V

    .line 146
    invoke-direct {p0, p1}, Lcom/dnake/desktop/widget/ArofeneView1;->drawLine(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 8

    .line 152
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 153
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 154
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 155
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/high16 v2, 0x40000000    # 2.0f

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 161
    :cond_0
    iget p1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineWidth:I

    :goto_0
    if-ne v1, v2, :cond_1

    goto :goto_1

    .line 166
    :cond_1
    iget-object p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, p2}, Lcom/dnake/desktop/widget/ArofeneView1;->getStringHeight(Landroid/graphics/Paint;)F

    move-result p2

    iget v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->txtMargin:I

    mul-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    add-float/2addr p2, v0

    iget v0, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleMargin:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    add-float/2addr p2, v0

    float-to-double v0, p2

    iget p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    int-to-double v2, p2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    iget p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->triangleLength:I

    div-int/lit8 p2, p2, 0x2

    int-to-double v6, p2

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    iget p2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->lineHeight:I

    int-to-double v2, p2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-int p2, v0

    .line 169
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/dnake/desktop/widget/ArofeneView1;->setMeasuredDimension(II)V

    return-void
.end method

.method public setArofeneLevelTxt(ILandroid/content/Context;)V
    .locals 3

    const v0, 0x7f0d002b

    .line 84
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 85
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorYou:I

    if-eqz p1, :cond_3

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const v0, 0x7f0d0029

    .line 104
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 105
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorCha:I

    goto :goto_0

    :cond_1
    const v0, 0x7f0d002c

    .line 99
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 100
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorZhong:I

    goto :goto_0

    :cond_2
    const v0, 0x7f0d002a

    .line 94
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 95
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorLiang:I

    goto :goto_0

    .line 89
    :cond_3
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 90
    iget v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->colorYou:I

    .line 108
    :goto_0
    iput-object v1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->arofeneLevelTxt:Ljava/lang/String;

    .line 109
    iput v2, p0, Lcom/dnake/desktop/widget/ArofeneView1;->levelBgColor:I

    .line 110
    iput p1, p0, Lcom/dnake/desktop/widget/ArofeneView1;->level:I

    .line 111
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/ArofeneView1;->invalidate()V

    return-void
.end method
