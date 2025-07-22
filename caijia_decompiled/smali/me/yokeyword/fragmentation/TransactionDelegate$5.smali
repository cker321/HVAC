.class Lme/yokeyword/fragmentation/TransactionDelegate$5;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->showHideFragment(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$fm:Landroidx/fragment/app/FragmentManager;

.field final synthetic val$hideFragment:Lme/yokeyword/fragmentation/ISupportFragment;

.field final synthetic val$showFragment:Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->val$fm:Landroidx/fragment/app/FragmentManager;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->val$showFragment:Lme/yokeyword/fragmentation/ISupportFragment;

    iput-object p4, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->val$hideFragment:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/queue/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 144
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->val$fm:Landroidx/fragment/app/FragmentManager;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->val$showFragment:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-object v3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$5;->val$hideFragment:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-static {v0, v1, v2, v3}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$500(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method
