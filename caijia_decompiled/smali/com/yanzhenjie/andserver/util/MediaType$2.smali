.class final Lcom/yanzhenjie/andserver/util/MediaType$2;
.super Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;
.source "MediaType.java"


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
        "Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator<",
        "Lcom/yanzhenjie/andserver/util/MediaType;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 673
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;-><init>()V

    return-void
.end method


# virtual methods
.method protected compareParameters(Lcom/yanzhenjie/andserver/util/MediaType;Lcom/yanzhenjie/andserver/util/MediaType;)I
    .locals 4

    .line 677
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getQualityValue()D

    move-result-wide v0

    .line 678
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getQualityValue()D

    move-result-wide v2

    .line 679
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 683
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;->compareParameters(Lcom/yanzhenjie/andserver/util/MimeType;Lcom/yanzhenjie/andserver/util/MimeType;)I

    move-result p1

    return p1
.end method

.method protected bridge synthetic compareParameters(Lcom/yanzhenjie/andserver/util/MimeType;Lcom/yanzhenjie/andserver/util/MimeType;)I
    .locals 0

    .line 673
    check-cast p1, Lcom/yanzhenjie/andserver/util/MediaType;

    check-cast p2, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MediaType$2;->compareParameters(Lcom/yanzhenjie/andserver/util/MediaType;Lcom/yanzhenjie/andserver/util/MediaType;)I

    move-result p1

    return p1
.end method
