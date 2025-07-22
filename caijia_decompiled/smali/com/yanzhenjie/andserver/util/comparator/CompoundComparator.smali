.class public Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;
.super Ljava/lang/Object;
.source "CompoundComparator.java"

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
.field private final comparators:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    return-void
.end method

.method public varargs constructor <init>([Ljava/util/Comparator;)V
    .locals 3

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Comparators must not be null"

    .line 52
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    .line 54
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 55
    invoke-virtual {p0, v2}, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->addComparator(Ljava/util/Comparator;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public addComparator(Ljava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "+TT;>;)V"
        }
    .end annotation

    .line 69
    instance-of v0, p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    check-cast p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    new-instance v1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-direct {v1, p1}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;-><init>(Ljava/util/Comparator;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public addComparator(Ljava/util/Comparator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "+TT;>;Z)V"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    new-instance v1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-direct {v1, p1, p2}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;-><init>(Ljava/util/Comparator;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 163
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "No sort definitions have been added to this CompoundComparator to compare"

    invoke-static {v0, v2}, Lcom/yanzhenjie/andserver/util/Assert;->state(ZLjava/lang/String;)V

    .line 164
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    .line 165
    invoke-virtual {v2, p1, p2}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-eqz v2, :cond_1

    return v2

    :cond_2
    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 179
    :cond_0
    instance-of v0, p1, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 182
    :cond_1
    check-cast p1, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;

    .line 183
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    iget-object p1, p1, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getComparatorCount()I
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    return v0
.end method

.method public invertOrder()V
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    .line 121
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->invertOrder()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public invertOrder(I)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->invertOrder()V

    return-void
.end method

.method public setAscendingOrder(I)V
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->setAscending(Z)V

    return-void
.end method

.method public setComparator(ILjava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Comparator<",
            "+TT;>;)V"
        }
    .end annotation

    .line 98
    instance-of v0, p2, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    check-cast p2, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    new-instance v1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-direct {v1, p2}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;-><init>(Ljava/util/Comparator;)V

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public setComparator(ILjava/util/Comparator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Comparator<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    new-instance v1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    invoke-direct {v1, p2, p3}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;-><init>(Ljava/util/Comparator;Z)V

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setDescendingOrder(I)V
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/util/comparator/InvertibleComparator;->setAscending(Z)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CompoundComparator: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;->comparators:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
