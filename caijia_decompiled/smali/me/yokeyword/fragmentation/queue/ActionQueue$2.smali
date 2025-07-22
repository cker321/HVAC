.class Lme/yokeyword/fragmentation/queue/ActionQueue$2;
.super Ljava/lang/Object;
.source "ActionQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/queue/ActionQueue;->executeNextAction(Lme/yokeyword/fragmentation/queue/Action;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/queue/ActionQueue;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$2;->this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 67
    iget-object v0, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$2;->this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;

    invoke-static {v0}, Lme/yokeyword/fragmentation/queue/ActionQueue;->access$100(Lme/yokeyword/fragmentation/queue/ActionQueue;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 68
    iget-object v0, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$2;->this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;

    invoke-static {v0}, Lme/yokeyword/fragmentation/queue/ActionQueue;->access$200(Lme/yokeyword/fragmentation/queue/ActionQueue;)V

    return-void
.end method
