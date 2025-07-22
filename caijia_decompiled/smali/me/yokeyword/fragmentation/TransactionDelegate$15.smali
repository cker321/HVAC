.class Lme/yokeyword/fragmentation/TransactionDelegate$15;
.super Ljava/lang/Object;
.source "TransactionDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->mockPopToAnim(Landroidx/fragment/app/Fragment;Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$container:Landroid/view/ViewGroup;

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$mock:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 0

    .line 609
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$mock:Landroid/view/ViewGroup;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$fromView:Landroid/view/View;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$container:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 613
    :try_start_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$mock:Landroid/view/ViewGroup;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$fromView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 614
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$container:Landroid/view/ViewGroup;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$15;->val$mock:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
