.class Lme/yokeyword/fragmentation/TransactionDelegate$3;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->loadMultipleRootTransaction(Landroidx/fragment/app/FragmentManager;II[Lme/yokeyword/fragmentation/ISupportFragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$containerId:I

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$showPosition:I

.field final synthetic val$tos:[Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;[Lme/yokeyword/fragmentation/ISupportFragment;II)V
    .locals 0

    .line 101
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$tos:[Lme/yokeyword/fragmentation/ISupportFragment;

    iput p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$containerId:I

    iput p6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$showPosition:I

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 104
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/4 v1, 0x0

    .line 105
    :goto_0
    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$tos:[Lme/yokeyword/fragmentation/ISupportFragment;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 106
    aget-object v2, v2, v1

    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 108
    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-static {v3, v2}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$200(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object v3

    const/4 v4, 0x1

    const-string v5, "fragmentation_arg_root_status"

    .line 109
    invoke-virtual {v3, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 110
    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$containerId:I

    iget-object v5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$tos:[Lme/yokeyword/fragmentation/ISupportFragment;

    aget-object v5, v5, v1

    invoke-static {v3, v4, v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$000(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;)V

    .line 112
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 113
    iget v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$containerId:I

    invoke-virtual {v0, v4, v2, v3}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 115
    iget v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$showPosition:I

    if-eq v1, v3, :cond_0

    .line 116
    invoke-virtual {v0, v2}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 120
    :cond_1
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$3;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v1, v2, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$300(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V

    return-void
.end method
