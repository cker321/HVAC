.class Lme/yokeyword/fragmentation/TransactionDelegate$8;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->remove(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$fragment:Landroidx/fragment/app/Fragment;

.field final synthetic val$showPreFragment:Z


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Z)V
    .locals 0

    .line 218
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$fragment:Landroidx/fragment/app/Fragment;

    iput-boolean p6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$showPreFragment:Z

    invoke-direct {p0, p2, p3}, Lme/yokeyword/fragmentation/queue/Action;-><init>(ILandroidx/fragment/app/FragmentManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 221
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x2002

    .line 222
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$fragment:Landroidx/fragment/app/Fragment;

    .line 223
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 225
    iget-boolean v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$showPreFragment:Z

    if-eqz v1, :cond_0

    .line 226
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$fragment:Landroidx/fragment/app/Fragment;

    invoke-static {v1}, Lme/yokeyword/fragmentation/SupportHelper;->getPreFragment(Landroidx/fragment/app/Fragment;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v1

    .line 227
    instance-of v2, v1, Landroidx/fragment/app/Fragment;

    if-eqz v2, :cond_0

    .line 228
    check-cast v1, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 231
    :cond_0
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$8;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v1, v2, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$300(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V

    return-void
.end method
