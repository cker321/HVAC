.class public Lorg/apache/httpcore/message/BasicHeaderIterator;
.super Ljava/lang/Object;
.source "BasicHeaderIterator.java"

# interfaces
.implements Lorg/apache/httpcore/HeaderIterator;


# instance fields
.field protected final allHeaders:[Lorg/apache/httpcore/Header;

.field protected currentIndex:I

.field protected headerName:Ljava/lang/String;


# direct methods
.method public constructor <init>([Lorg/apache/httpcore/Header;Ljava/lang/String;)V
    .locals 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Header array"

    .line 76
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/httpcore/Header;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/httpcore/Header;

    .line 77
    iput-object p2, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    const/4 p1, -0x1

    .line 78
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/message/BasicHeaderIterator;->findNext(I)I

    move-result p1

    iput p1, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->currentIndex:I

    return-void
.end method


# virtual methods
.method protected filterHeader(I)Z
    .locals 2

    .line 116
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->headerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/httpcore/Header;

    aget-object p1, v1, p1

    .line 117
    invoke-interface {p1}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method protected findNext(I)I
    .locals 3

    const/4 v0, -0x1

    if-ge p1, v0, :cond_0

    return v0

    .line 97
    :cond_0
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/httpcore/Header;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_1

    if-ge p1, v1, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 101
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/message/BasicHeaderIterator;->filterHeader(I)Z

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

    .line 124
    iget v0, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->currentIndex:I

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

    .line 161
    invoke-virtual {p0}, Lorg/apache/httpcore/message/BasicHeaderIterator;->nextHeader()Lorg/apache/httpcore/Header;

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

    .line 139
    iget v0, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->currentIndex:I

    if-ltz v0, :cond_0

    .line 144
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/message/BasicHeaderIterator;->findNext(I)I

    move-result v1

    iput v1, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->currentIndex:I

    .line 146
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderIterator;->allHeaders:[Lorg/apache/httpcore/Header;

    aget-object v0, v1, v0

    return-object v0

    .line 141
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Iteration already finished."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 174
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Removing headers is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
