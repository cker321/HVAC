.class final Lcom/yanzhenjie/andserver/util/MediaType$1;
.super Ljava/lang/Object;
.source "MediaType.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/util/MediaType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/yanzhenjie/andserver/util/MediaType;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 637
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/yanzhenjie/andserver/util/MediaType;Lcom/yanzhenjie/andserver/util/MediaType;)I
    .locals 5

    .line 641
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getQualityValue()D

    move-result-wide v0

    .line 642
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getQualityValue()D

    move-result-wide v2

    .line 643
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 646
    :cond_0
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardType()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardType()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 648
    :cond_1
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardType()Z

    move-result v0

    const/4 v2, -0x1

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardType()Z

    move-result v0

    if-nez v0, :cond_2

    return v2

    .line 650
    :cond_2
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_3

    return v3

    .line 653
    :cond_3
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardSubtype()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardSubtype()Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    .line 655
    :cond_4
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardSubtype()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->isWildcardSubtype()Z

    move-result v0

    if-nez v0, :cond_5

    return v2

    .line 657
    :cond_5
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    return v3

    .line 660
    :cond_6
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    .line 661
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result p2

    if-ge p2, p1, :cond_7

    const/4 v1, -0x1

    goto :goto_0

    :cond_7
    if-ne p2, p1, :cond_8

    const/4 v1, 0x0

    :cond_8
    :goto_0
    return v1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 637
    check-cast p1, Lcom/yanzhenjie/andserver/util/MediaType;

    check-cast p2, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MediaType$1;->compare(Lcom/yanzhenjie/andserver/util/MediaType;Lcom/yanzhenjie/andserver/util/MediaType;)I

    move-result p1

    return p1
.end method
