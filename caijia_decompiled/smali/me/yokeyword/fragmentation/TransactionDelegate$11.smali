.class Lme/yokeyword/fragmentation/TransactionDelegate$11;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->popTo(Ljava/lang/String;ZLjava/lang/Runnable;Landroidx/fragment/app/FragmentManager;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$afterPopTransactionRunnable:Ljava/lang/Runnable;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$includeTargetFragment:Z

.field final synthetic val$popAnim:I

.field final synthetic val$targetFragmentTag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILjava/lang/String;ZLandroidx/fragment/app/FragmentManager;ILjava/lang/Runnable;)V
    .locals 0

    .line 285
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$targetFragmentTag:Ljava/lang/String;

    iput-boolean p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$includeTargetFragment:Z

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput p6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$popAnim:I

    iput-object p7, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$afterPopTransactionRunnable:Ljava/lang/Runnable;

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 288
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$targetFragmentTag:Ljava/lang/String;

    iget-boolean v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$includeTargetFragment:Z

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$fm:Landroidx/fragment/app/FragmentManager;

    iget v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$popAnim:I

    invoke-static {v0, v1, v2, v3, v4}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$1200(Lme/yokeyword/fragmentation/TransactionDelegate;Ljava/lang/String;ZLandroidx/fragment/app/FragmentManager;I)V

    .line 290
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$11;->val$afterPopTransactionRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 291
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method
