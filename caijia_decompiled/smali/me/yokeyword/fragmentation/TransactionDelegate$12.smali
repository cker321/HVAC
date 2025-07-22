.class Lme/yokeyword/fragmentation/TransactionDelegate$12;
.super Ljava/lang/Object;
.source "TransactionDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->handleLaunchMode(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$stackToFragment:Lme/yokeyword/fragmentation/ISupportFragment;

.field final synthetic val$to:Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 501
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$12;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$12;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    iput-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate$12;->val$stackToFragment:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 504
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$12;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$12;->val$to:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-object v2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$12;->val$stackToFragment:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-static {v0, v1, v2}, Lme/yokeyword/fragmentation/TransactionDelegate;->access$1300(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method
