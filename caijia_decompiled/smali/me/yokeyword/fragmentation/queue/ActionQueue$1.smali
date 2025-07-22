.class Lme/yokeyword/fragmentation/queue/ActionQueue$1;
.super Ljava/lang/Object;
.source "ActionQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/queue/ActionQueue;->enqueue(Lme/yokeyword/fragmentation/queue/Action;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;

.field final synthetic val$action:Lme/yokeyword/fragmentation/queue/Action;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/queue/ActionQueue;Lme/yokeyword/fragmentation/queue/Action;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$1;->this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;

    iput-object p2, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$1;->val$action:Lme/yokeyword/fragmentation/queue/Action;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 37
    iget-object v0, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$1;->this$0:Lme/yokeyword/fragmentation/queue/ActionQueue;

    iget-object v1, p0, Lme/yokeyword/fragmentation/queue/ActionQueue$1;->val$action:Lme/yokeyword/fragmentation/queue/Action;

    invoke-static {v0, v1}, Lme/yokeyword/fragmentation/queue/ActionQueue;->access$000(Lme/yokeyword/fragmentation/queue/ActionQueue;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method
