.class Lme/yokeyword/fragmentation/TransactionDelegate$10;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->popQuiet(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$fragment:Landroidx/fragment/app/Fragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
    .locals 0

    .line 265
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fragment:Landroidx/fragment/app/Fragment;

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 268
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$1100(Lme/yokeyword/fragmentation/TransactionDelegate;)Lme/yokeyword/fragmentation/ISupportActivity;

    move-result-object v0

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportActivity;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportActivityDelegate;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mPopMultipleNoAnim:Z

    .line 269
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$900(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;)V

    .line 270
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fm:Landroidx/fragment/app/FragmentManager;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/FragmentationMagician;->popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;I)V

    .line 271
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 272
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->executePendingTransactionsAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 273
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$10;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$1100(Lme/yokeyword/fragmentation/TransactionDelegate;)Lme/yokeyword/fragmentation/ISupportActivity;

    move-result-object v0

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportActivity;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportActivityDelegate;

    move-result-object v0

    iput-boolean v2, v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mPopMultipleNoAnim:Z

    return-void
.end method
