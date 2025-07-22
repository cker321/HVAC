.class Lcom/dnake/desktop/widget/LandleafView$1;
.super Ljava/lang/Object;
.source "LandleafView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/widget/LandleafView;->valueAnimator(FFI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/widget/LandleafView;

.field final synthetic val$color:I

.field final synthetic val$endProgress:F

.field final synthetic val$oldProgress:F


# direct methods
.method constructor <init>(Lcom/dnake/desktop/widget/LandleafView;FFI)V
    .locals 0

    .line 412
    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    iput p2, p0, Lcom/dnake/desktop/widget/LandleafView$1;->val$oldProgress:F

    iput p3, p0, Lcom/dnake/desktop/widget/LandleafView$1;->val$endProgress:F

    iput p4, p0, Lcom/dnake/desktop/widget/LandleafView$1;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private evaluate(FLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1

    .line 429
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    int-to-float v0, p2

    .line 430
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    sub-int/2addr p3, p2

    int-to-float p2, p3

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    float-to-int p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 415
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    .line 416
    iget-object v0, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    iget v1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->val$oldProgress:F

    float-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/dnake/desktop/widget/LandleafView$1;->val$endProgress:F

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, p1, v1, v2}, Lcom/dnake/desktop/widget/LandleafView$1;->evaluate(FLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    iput p1, v0, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    .line 418
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    iget p1, p1, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_0

    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    iget p1, p1, Lcom/dnake/desktop/widget/LandleafView;->cCurProgress:F

    const/high16 v0, 0x42c80000    # 100.0f

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    .line 420
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    invoke-virtual {p1}, Lcom/dnake/desktop/widget/LandleafView;->calRadian()V

    .line 422
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    iget v0, p0, Lcom/dnake/desktop/widget/LandleafView$1;->val$color:I

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/widget/LandleafView;->setProgressColor(I)V

    .line 424
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$1;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    invoke-virtual {p1}, Lcom/dnake/desktop/widget/LandleafView;->invalidate()V

    :cond_0
    return-void
.end method
