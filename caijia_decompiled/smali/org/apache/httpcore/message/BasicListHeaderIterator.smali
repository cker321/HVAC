.class public Lorg/apache/httpcore/message/BasicListHeaderIterator;
.super Ljava/lang/Object;
.source "BasicListHeaderIterator.java"

# interfaces
.implements Lorg/apache/httpcore/HeaderIterator;


# instance fields
.field protected final allHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apache/httpcore/Header;",
            ">;"
        }
    .end annotation
.end field

.field protected currentIndex:I

.field protected headerName:Ljava/lang/String;

.field protected lastIndex:I


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apache/httpcore/Header;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Header list"

    .line 84
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    .line 85
    iput-object p2, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->headerName:Ljava/lang/String;

    const/4 p1, -0x1

    .line 86
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/message/BasicListHeaderIterator;->findNext(I)I

    move-result p2

    iput p2, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->currentIndex:I

    .line 87
    iput p1, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->lastIndex:I

    return-void
.end method


# virtual methods
.method protected filterHeader(I)Z
    .locals 1

    .line 125
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->headerName:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 130
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/Header;

    invoke-interface {p1}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object p1

    .line 132
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->headerName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method protected findNext(I)I
    .locals 3

    const/4 v0, -0x1

    if-ge p1, v0, :cond_0

    return v0

    .line 106
    :cond_0
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_1

    if-ge p1, v1, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 110
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/message/BasicListHeaderIterator;->filterHeader(I)Z

    move-result v2

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_2

    move v0, p1

    :cond_2
    return v0
.end method

.method public hasNext()Z
    .locals 1

    .line 139
    iget v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->currentIndex:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 177
    invoke-virtual {p0}, Lorg/apache/httpcore/message/BasicListHeaderIterator;->nextHeader()Lorg/apache/httpcore/Header;

    move-result-object v0

    return-object v0
.end method

.method public nextHeader()Lorg/apache/httpcore/Header;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 154
    iget v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->currentIndex:I

    if-ltz v0, :cond_0

    .line 159
    iput v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->lastIndex:I

    .line 160
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/message/BasicListHeaderIterator;->findNext(I)I

    move-result v1

    iput v1, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->currentIndex:I

    .line 162
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/Header;

    return-object v0

    .line 156
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Iteration already finished."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 187
    iget v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->lastIndex:I

    const/4 v1, 0x1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "No header to remove"

    invoke-static {v0, v2}, Lorg/apache/httpcore/util/Asserts;->check(ZLjava/lang/String;)V

    .line 188
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->allHeaders:Ljava/util/List;

    iget v2, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->lastIndex:I

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    const/4 v0, -0x1

    .line 189
    iput v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->lastIndex:I

    .line 190
    iget v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->currentIndex:I

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/apache/httpcore/message/BasicListHeaderIterator;->currentIndex:I

    return-void
.end method
