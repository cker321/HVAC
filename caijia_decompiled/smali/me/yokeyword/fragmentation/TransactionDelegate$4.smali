.class Lme/yokeyword/fragmentation/TransactionDelegate$4;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$from:Lme/yokeyword/fragmentation/ISupportFragment;

.field final synthetic val$launchMode:I

.field final synthetic val$requestCode:I

.field final synthetic val$to:Lme/yokeyword/fragmentation/ISupportFragment;

.field final synthetic val$type:I


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V
    .locals 0

    .line 129
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$from:Lme/yokeyword/fragmentation/ISupportFragment;

    iput-object p5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    iput p6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$requestCode:I

    iput p7, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$launchMode:I

    iput p8, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$type:I

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 132
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$fm:Landroidx/fragment/app/FragmentManager;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$from:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    iget v4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$requestCode:I

    iget v5, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$launchMode:I

    iget v6, p0, Lme/yokeyword/fragmentation/TransactionDelegate$4;->val$type:I

    invoke-static/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$400(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method
