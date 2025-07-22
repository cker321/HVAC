.class public Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;
.super Ljava/lang/Object;
.source "MimeType.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/util/MimeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SpecificityComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/yanzhenjie/andserver/util/MimeType;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 613
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/yanzhenjie/andserver/util/MimeType;Lcom/yanzhenjie/andserver/util/MimeType;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 617
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 619
    :cond_0
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v0

    const/4 v2, -0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v0

    if-nez v0, :cond_1

    return v2

    .line 621
    :cond_1
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_2

    return v3

    .line 625
    :cond_2
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    .line 627
    :cond_3
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v0

    if-nez v0, :cond_4

    return v2

    .line 629
    :cond_4
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v3

    .line 632
    :cond_5
    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;->compareParameters(Lcom/yanzhenjie/andserver/util/MimeType;Lcom/yanzhenjie/andserver/util/MimeType;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 613
    check-cast p1, Lcom/yanzhenjie/andserver/util/MimeType;

    check-cast p2, Lcom/yanzhenjie/andserver/util/MimeType;

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;->compare(Lcom/yanzhenjie/andserver/util/MimeType;Lcom/yanzhenjie/andserver/util/MimeType;)I

    move-result p1

    return p1
.end method

.method protected compareParameters(Lcom/yanzhenjie/andserver/util/MimeType;Lcom/yanzhenjie/andserver/util/MimeType;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 639
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    .line 640
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result p2

    if-ge p2, p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    if-ne p2, p1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :goto_0
    return p1
.end method
