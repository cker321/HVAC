.class public Lcom/yanzhenjie/andserver/http/AcceptLanguage;
.super Ljava/lang/Object;
.source "AcceptLanguage.java"


# instance fields
.field private final locale:Ljava/util/Locale;

.field private final quality:D


# direct methods
.method protected constructor <init>(Ljava/util/Locale;D)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/AcceptLanguage;->locale:Ljava/util/Locale;

    .line 35
    iput-wide p2, p0, Lcom/yanzhenjie/andserver/http/AcceptLanguage;->quality:D

    return-void
.end method

.method public static parse(Ljava/lang/String;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/AcceptLanguage;",
            ">;"
        }
    .end annotation

    .line 47
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    const-string v0, ","

    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 52
    array-length v0, p0

    if-nez v0, :cond_1

    .line 53
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 56
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 57
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    aget-object v4, p0, v3

    const-string v5, ";"

    .line 58
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 59
    array-length v5, v4

    const/4 v6, 0x2

    if-ne v5, v6, :cond_2

    const/4 v5, 0x1

    aget-object v7, v4, v5

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v6, :cond_2

    aget-object v7, v4, v5

    invoke-virtual {v7, v2}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x71

    if-ne v7, v8, :cond_2

    aget-object v7, v4, v5

    .line 60
    invoke-virtual {v7, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x3d

    if-ne v7, v8, :cond_2

    .line 61
    aget-object v7, v4, v5

    invoke-virtual {v7, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 63
    :try_start_0
    new-instance v7, Lcom/yanzhenjie/andserver/http/AcceptLanguage;

    new-instance v8, Ljava/util/Locale;

    aget-object v4, v4, v5

    invoke-direct {v8, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-direct {v7, v8, v4, v5}, Lcom/yanzhenjie/andserver/http/AcceptLanguage;-><init>(Ljava/util/Locale;D)V

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 65
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->printStackTrace()V

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method


# virtual methods
.method public getLocale()Ljava/util/Locale;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/AcceptLanguage;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getQuality()D
    .locals 2

    .line 43
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/AcceptLanguage;->quality:D

    return-wide v0
.end method
