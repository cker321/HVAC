.class Lcom/dnake/desktop/utils/PriorityThreadFactory;
.super Ljava/lang/Object;
.source "PriorityThreadFactory.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private name:Ljava/lang/String;

.field private priority:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->name:Ljava/lang/String;

    .line 22
    iput p2, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->priority:I

    return-void
.end method

.method static synthetic access$000(Lcom/dnake/desktop/utils/PriorityThreadFactory;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->priority:I

    return p0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    .line 42
    iget v0, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->priority:I

    return v0
.end method

.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2

    .line 51
    new-instance v0, Lcom/dnake/desktop/utils/PriorityThreadFactory$1;

    iget-object v1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->name:Ljava/lang/String;

    invoke-direct {v0, p0, p1, v1}, Lcom/dnake/desktop/utils/PriorityThreadFactory$1;-><init>(Lcom/dnake/desktop/utils/PriorityThreadFactory;Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object v0
.end method

.method setName(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->name:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->name:Ljava/lang/String;

    return-void
.end method

.method setName(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->name:Ljava/lang/String;

    return-void
.end method

.method setPriority(I)V
    .locals 0

    .line 46
    iput p1, p0, Lcom/dnake/desktop/utils/PriorityThreadFactory;->priority:I

    return-void
.end method
