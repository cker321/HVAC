.class final Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;
.super Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;
.source "AutoValue_ViewScrollChangeEvent.java"


# instance fields
.field private final oldScrollX:I

.field private final oldScrollY:I

.field private final scrollX:I

.field private final scrollY:I

.field private final view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;IIII)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;-><init>()V

    if-eqz p1, :cond_0

    .line 24
    iput-object p1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->view:Landroid/view/View;

    .line 25
    iput p2, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollX:I

    .line 26
    iput p3, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollY:I

    .line 27
    iput p4, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollX:I

    .line 28
    iput p5, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollY:I

    return-void

    .line 22
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null view"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 73
    :cond_0
    instance-of v1, p1, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 74
    check-cast p1, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;

    .line 75
    iget-object v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->view:Landroid/view/View;

    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;->view()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollX:I

    .line 76
    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;->scrollX()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollY:I

    .line 77
    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;->scrollY()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollX:I

    .line 78
    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;->oldScrollX()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollY:I

    .line 79
    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/view/ViewScrollChangeEvent;->oldScrollY()I

    move-result p1

    if-ne v1, p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 3

    .line 88
    iget-object v0, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->view:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 90
    iget v2, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollX:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 92
    iget v2, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollY:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 94
    iget v2, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollX:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 96
    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollY:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public oldScrollX()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollX:I

    return v0
.end method

.method public oldScrollY()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollY:I

    return v0
.end method

.method public scrollX()I
    .locals 1

    .line 39
    iget v0, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollX:I

    return v0
.end method

.method public scrollY()I
    .locals 1

    .line 44
    iget v0, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollY:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ViewScrollChangeEvent{view="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->view:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", scrollX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", scrollY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->scrollY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", oldScrollX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", oldScrollY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->oldScrollY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public view()Landroid/view/View;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/jakewharton/rxbinding2/view/AutoValue_ViewScrollChangeEvent;->view:Landroid/view/View;

    return-object v0
.end method
