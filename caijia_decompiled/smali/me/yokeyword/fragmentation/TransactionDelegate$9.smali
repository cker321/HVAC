.class Lme/yokeyword/fragmentation/TransactionDelegate$9;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->pop(Landroidx/fragment/app/FragmentManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentManager;)V
    .locals 0

    .line 240
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-direct {p0, p2, p3}, Lme/yokeyword/fragmentation/queue/Action;-><init>(ILandroidx/fragment/app/FragmentManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 243
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->val$fm:Landroidx/fragment/app/FragmentManager;

    const-string v2, "pop()"

    invoke-static {v0, v1, v2}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$700(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 245
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$9;->val$fm:Landroidx/fragment/app/FragmentManager;

    invoke-static {v0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$900(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;)V

    return-void
.end method
