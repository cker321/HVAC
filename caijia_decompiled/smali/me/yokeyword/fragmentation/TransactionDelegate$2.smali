.class Lme/yokeyword/fragmentation/TransactionDelegate$2;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->loadRootTransaction(Landroidx/fragment/app/FragmentManager;ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$addToBackStack:Z

.field final synthetic val$allowAnimation:Z

.field final synthetic val$containerId:I

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$to:Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;IILme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;ZZ)V
    .locals 0

    .line 82
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$containerId:I

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-boolean p6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$addToBackStack:Z

    iput-boolean p7, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$allowAnimation:Z

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 85
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$containerId:I

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-static {v0, v1, v2}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$000(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;)V

    .line 87
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 88
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {v1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    iget-object v1, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    if-eqz v1, :cond_0

    .line 90
    iget-object v2, v1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->tag:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 91
    iget-object v0, v1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->tag:Ljava/lang/String;

    :cond_0
    move-object v5, v0

    .line 95
    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$fm:Landroidx/fragment/app/FragmentManager;

    const/4 v3, 0x0

    iget-object v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-boolean v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$addToBackStack:Z

    xor-int/lit8 v6, v0, 0x1

    const/4 v7, 0x0

    iget-boolean v8, p0, Lme/yokeyword/fragmentation/TransactionDelegate$2;->val$allowAnimation:Z

    const/16 v9, 0xa

    invoke-static/range {v1 .. v9}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$100(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;ZLjava/util/ArrayList;ZI)V

    return-void
.end method
