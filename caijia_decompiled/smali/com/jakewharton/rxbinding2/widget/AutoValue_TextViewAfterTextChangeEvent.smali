.class final Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;
.super Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;
.source "AutoValue_TextViewAfterTextChangeEvent.java"


# instance fields
.field private final editable:Landroid/text/Editable;

.field private final view:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/text/Editable;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;-><init>()V

    if-eqz p1, :cond_0

    .line 20
    iput-object p1, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->view:Landroid/widget/TextView;

    .line 21
    iput-object p2, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->editable:Landroid/text/Editable;

    return-void

    .line 18
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null view"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public editable()Landroid/text/Editable;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->editable:Landroid/text/Editable;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 49
    :cond_0
    instance-of v1, p1, Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 50
    check-cast p1, Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;

    .line 51
    iget-object v1, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->view:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;->view()Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->editable:Landroid/text/Editable;

    if-nez v1, :cond_1

    .line 52
    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;->editable()Landroid/text/Editable;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/jakewharton/rxbinding2/widget/TextViewAfterTextChangeEvent;->editable()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    return v2
.end method

.method public hashCode()I
    .locals 2

    .line 61
    iget-object v0, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->view:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 63
    iget-object v1, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->editable:Landroid/text/Editable;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TextViewAfterTextChangeEvent{view="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->view:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", editable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->editable:Landroid/text/Editable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public view()Landroid/widget/TextView;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/jakewharton/rxbinding2/widget/AutoValue_TextViewAfterTextChangeEvent;->view:Landroid/widget/TextView;

    return-object v0
.end method
