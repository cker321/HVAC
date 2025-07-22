.class Lme/yokeyword/fragmentation/TransactionDelegate$7;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->startWithPopTo(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$fragmentTag:Ljava/lang/String;

.field final synthetic val$from:Lme/yokeyword/fragmentation/ISupportFragment;

.field final synthetic val$includeTargetFragment:Z

.field final synthetic val$to:Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;IZLandroidx/fragment/app/FragmentManager;Ljava/lang/String;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 180
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-boolean p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$includeTargetFragment:Z

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fragmentTag:Ljava/lang/String;

    iput-object p6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$from:Lme/yokeyword/fragmentation/ISupportFragment;

    iput-object p7, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 184
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$includeTargetFragment:Z

    .line 188
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fragmentTag:Ljava/lang/String;

    invoke-static {v1, v2, v0}, Lme/yokeyword/fragmentation/SupportHelper;->getWillPopFragments(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v1

    .line 190
    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$from:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-object v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v2, v3, v4}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$600(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 194
    invoke-interface {v2}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v3

    iget v3, v3, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    .line 195
    iget-object v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-static {v4, v3, v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$000(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;)V

    .line 197
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-gtz v3, :cond_0

    return-void

    .line 199
    :cond_0
    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    const-string v5, "startWithPopTo()"

    invoke-static {v3, v4, v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$700(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 200
    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v3}, Landroidx/fragment/app/FragmentationMagician;->executePendingTransactionsAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 201
    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v3}, Landroidx/fragment/app/FragmentationMagician;->isStateSaved(Landroidx/fragment/app/FragmentManager;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 202
    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v4}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v4

    iget-object v5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {v2}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v2

    iget-object v2, v2, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mAnimHelper:Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;

    iget-object v2, v2, Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;->popExitAnim:Landroid/view/animation/Animation;

    invoke-static {v3, v4, v5, v2}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$800(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Landroid/view/animation/Animation;)V

    .line 205
    :cond_1
    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fragmentTag:Ljava/lang/String;

    iget-object v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$7;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v2, v3, v4, v0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$1000(Lme/yokeyword/fragmentation/TransactionDelegate;Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;)V

    return-void

    .line 192
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "There is no Fragment in the FragmentManager, maybe you need to call loadRootFragment() first!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
