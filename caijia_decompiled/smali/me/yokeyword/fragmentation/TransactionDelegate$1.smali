.class Lme/yokeyword/fragmentation/TransactionDelegate$1;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "TransactionDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/TransactionDelegate;->post(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

.field final synthetic val$runnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/TransactionDelegate;Ljava/lang/Runnable;)V
    .locals 0

    .line 73
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate$1;->this$0:Lme/yokeyword/fragmentation/TransactionDelegate;

    iput-object p2, p0, Lme/yokeyword/fragmentation/TransactionDelegate$1;->val$runnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/queue/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 76
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate$1;->val$runnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
