.class Lcom/dnake/desktop/utils/PriorityThreadFactory$1;
.super Ljava/lang/Thread;
.source "PriorityThreadFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/utils/PriorityThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/utils/PriorityThreadFactory;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/utils/PriorityThreadFactory;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory$1;->this$0:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-direct {p0, p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory$1;->this$0:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {v0}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->access$000(Lcom/dnake/desktop/utils/PriorityThreadFactory;)I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 56
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    return-void
.end method
