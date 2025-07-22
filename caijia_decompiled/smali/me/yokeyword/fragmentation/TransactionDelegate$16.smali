.class Lme/yokeyword/fragmentation/TransactionDelegate$16;
.super Ljava/lang/Object;
.source "TransactionDelegate.java"

# interfaces
.implements Lme/yokeyword/fragmentation/SupportFragmentDelegate$EnterAnimListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->mockStartWithPopAnim(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$container:Landroid/view/ViewGroup;

.field final synthetic val$exitAnim:Landroid/view/animation/Animation;

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$mock:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroid/view/View;Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 0

    .line 633
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$fromView:Landroid/view/View;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$exitAnim:Landroid/view/animation/Animation;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$mock:Landroid/view/ViewGroup;

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$container:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnterAnimStart()V
    .locals 4

    .line 636
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$fromView:Landroid/view/View;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$exitAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 638
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$1400(Lme/yokeyword/fragmentation/TransactionDelegate;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lme/yokeyword/fragmentation/TransactionDelegate$16$1;

    invoke-direct {v1, p0}, Lme/yokeyword/fragmentation/TransactionDelegate$16$1;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate$16;)V

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$16;->val$exitAnim:Landroid/view/animation/Animation;

    .line 647
    invoke-virtual {v2}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v2

    .line 638
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
