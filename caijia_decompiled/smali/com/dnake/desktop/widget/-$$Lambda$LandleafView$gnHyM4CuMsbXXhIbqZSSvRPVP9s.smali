.class public final synthetic Lcom/dnake/desktop/widget/-$$Lambda$LandleafView$gnHyM4CuMsbXXhIbqZSSvRPVP9s;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final synthetic f$0:Lcom/dnake/desktop/widget/LandleafView;


# direct methods
.method public synthetic constructor <init>(Lcom/dnake/desktop/widget/LandleafView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dnake/desktop/widget/-$$Lambda$LandleafView$gnHyM4CuMsbXXhIbqZSSvRPVP9s;->f$0:Lcom/dnake/desktop/widget/LandleafView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    iget-object v0, p0, Lcom/dnake/desktop/widget/-$$Lambda$LandleafView$gnHyM4CuMsbXXhIbqZSSvRPVP9s;->f$0:Lcom/dnake/desktop/widget/LandleafView;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/widget/LandleafView;->lambda$runFloat$0$LandleafView(Landroid/animation/ValueAnimator;)V

    return-void
.end method
