.class Lme/yokeyword/fragmentation/TransactionDelegate$6;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->startWithPop(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$from:Lme/yokeyword/fragmentation/ISupportFragment;

.field final synthetic val$to:Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$from:Lme/yokeyword/fragmentation/ISupportFragment;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 156
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$from:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0, v1, v2}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$600(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 160
    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    iget v1, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    .line 161
    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-static {v2, v1, v3}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$000(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;)V

    .line 163
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    const-string v3, "popTo()"

    invoke-static {v1, v2, v3}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$700(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 164
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v1}, Landroidx/fragment/app/FragmentationMagician;->executePendingTransactionsAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 165
    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    const/4 v2, 0x1

    iput-boolean v2, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mLockAnim:Z

    .line 166
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v1}, Landroidx/fragment/app/FragmentationMagician;->isStateSaved(Landroidx/fragment/app/FragmentManager;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 167
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v2}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v0, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mAnimHelper:Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;

    iget-object v0, v0, Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;->popExitAnim:Landroid/view/animation/Animation;

    invoke-static {v1, v2, v3, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$800(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Landroid/view/animation/Animation;)V

    .line 170
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$900(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;)V

    .line 171
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 172
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$6;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->executePendingTransactionsAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    return-void

    .line 158
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "There is no Fragment in the FragmentManager, maybe you need to call loadRootFragment() first!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
