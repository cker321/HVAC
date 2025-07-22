.class public Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;
.super Ljava/lang/Object;
.source "InvertibleComparator.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TT;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private ascending:Z

.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "TT;>;)V"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    const-string v0, "Comparator must not be null."

    .line 39
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Ljava/util/Comparator;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    const-string v0, "Comparator must not be null."

    .line 51
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    .line 53
    invoke-virtual {p0, p2}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->setAscending(Z)V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p1

    if-eqz p1, :cond_2

    .line 82
    iget-boolean p2, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    if-nez p2, :cond_1

    const/high16 p2, -0x80000000

    if-ne p2, p1, :cond_0

    const p1, 0x7fffffff

    goto :goto_0

    :cond_0
    mul-int/lit8 p1, p1, -0x1

    :cond_1
    :goto_0
    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 100
    :cond_0
    instance-of v1, p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 103
    :cond_1
    check-cast p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    .line 104
    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    iget-object v3, p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    invoke-interface {v1, v3}, Ljava/util/Comparator;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    iget-boolean p1, p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    if-ne v1, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public invertOrder()V
    .locals 1

    .line 74
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    return-void
.end method

.method public isAscending()Z
    .locals 1

    .line 67
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    return v0
.end method

.method public setAscending(Z)V
    .locals 0

    .line 60
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "InvertibleComparator: ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]; ascending="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->ascending:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
