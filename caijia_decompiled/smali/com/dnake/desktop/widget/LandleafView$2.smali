.class Lcom/dnake/desktop/widget/LandleafView$2;
.super Ljava/lang/Object;
.source "LandleafView.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


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


# direct methods
.method constructor <init>(Lcom/dnake/desktop/widget/LandleafView;)V
    .locals 0

    .line 433
    iput-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$2;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 446
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$2;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 441
    iget-object p1, p0, Lcom/dnake/desktop/widget/LandleafView$2;->this$0:Lcom/dnake/desktop/widget/LandleafView;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/dnake/desktop/widget/LandleafView;->progressAnim:Landroid/animation/ValueAnimator;

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
