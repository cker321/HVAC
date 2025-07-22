.class public Lcom/yanzhenjie/andserver/util/MimeType;
.super Ljava/lang/Object;
.source "MimeType.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/util/MimeType$SpecificityComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/yanzhenjie/andserver/util/MimeType;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final PARAM_CHARSET:Ljava/lang/String; = "charset"

.field private static final TOKEN:Ljava/util/BitSet;

.field protected static final WILDCARD_TYPE:Ljava/lang/String; = "*"


# instance fields
.field private final parameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final subtype:Ljava/lang/String;

.field private final type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 48
    new-instance v0, Ljava/util/BitSet;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0x1f

    if-gt v3, v4, :cond_0

    .line 50
    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/16 v3, 0x7f

    .line 52
    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    .line 54
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    const/16 v4, 0x28

    .line 55
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x29

    .line 56
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x3c

    .line 57
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x3e

    .line 58
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x40

    .line 59
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x2c

    .line 60
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x3b

    .line 61
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x3a

    .line 62
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x5c

    .line 63
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x22

    .line 64
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x2f

    .line 65
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x5b

    .line 66
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x5d

    .line 67
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x3f

    .line 68
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x3d

    .line 69
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x7b

    .line 70
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x7d

    .line 71
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x20

    .line 72
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    const/16 v4, 0x9

    .line 73
    invoke-virtual {v3, v4}, Ljava/util/BitSet;->set(I)V

    .line 75
    new-instance v4, Ljava/util/BitSet;

    invoke-direct {v4, v1}, Ljava/util/BitSet;-><init>(I)V

    sput-object v4, Lcom/yanzhenjie/andserver/util/MimeType;->TOKEN:Ljava/util/BitSet;

    .line 76
    invoke-virtual {v4, v2, v1}, Ljava/util/BitSet;->set(II)V

    .line 77
    sget-object v1, Lcom/yanzhenjie/andserver/util/MimeType;->TOKEN:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    .line 78
    sget-object v0, Lcom/yanzhenjie/andserver/util/MimeType;->TOKEN:Ljava/util/BitSet;

    invoke-virtual {v0, v3}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MimeType;Ljava/nio/charset/Charset;)V
    .locals 2

    .line 138
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->addCharsetParameter(Ljava/nio/charset/Charset;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, v0, v1, p1}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MimeType;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/util/MimeType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 150
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const-string v0, "*"

    .line 98
    invoke-direct {p0, p1, v0}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 112
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 1

    .line 125
    invoke-virtual {p3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p3

    const-string v0, "charset"

    invoke-static {v0, p3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->checkToken(Ljava/lang/String;)V

    .line 164
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/util/MimeType;->checkToken(Ljava/lang/String;)V

    .line 165
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->type:Ljava/lang/String;

    .line 166
    sget-object p1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p2, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->subtype:Ljava/lang/String;

    if-eqz p3, :cond_1

    .line 167
    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    .line 168
    new-instance p1, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-interface {p3}, Ljava/util/Map;->size()I

    move-result p2

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p1, p2, v0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;-><init>(ILjava/util/Locale;)V

    .line 169
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    .line 170
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 171
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 172
    invoke-virtual {p0, v0, p3}, Lcom/yanzhenjie/andserver/util/MimeType;->checkParameters(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 175
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    goto :goto_1

    .line 177
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    :goto_1
    return-void
.end method

.method private static addCharsetParameter(Ljava/nio/charset/Charset;Ljava/util/Map;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/charset/Charset;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 608
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 609
    invoke-virtual {p0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p0

    const-string p1, "charset"

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private appendTo(Ljava/util/Map;Ljava/lang/StringBuilder;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .line 461
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    const/16 v1, 0x3b

    .line 462
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 463
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3d

    .line 464
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 465
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private checkToken(Ljava/lang/String;)V
    .locals 4

    const/4 v0, 0x0

    .line 188
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 189
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 190
    sget-object v2, Lcom/yanzhenjie/andserver/util/MimeType;->TOKEN:Ljava/util/BitSet;

    invoke-virtual {v2, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-eqz v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 191
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid token character \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "\' in token \""

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method private isQuotedString(Ljava/lang/String;)Z
    .locals 3

    .line 209
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_0

    return v1

    :cond_0
    const-string v0, "\""

    .line 212
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, "\'"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method private parametersAreEqual(Lcom/yanzhenjie/andserver/util/MimeType;)Z
    .locals 5

    .line 409
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p1, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 413
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 414
    iget-object v4, p1, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    return v2

    :cond_2
    const-string v4, "charset"

    .line 418
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 419
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 420
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    if-eqz v0, :cond_4

    .line 421
    invoke-virtual {v0, p1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    return v3

    :cond_4
    :goto_0
    return v2

    .line 428
    :cond_5
    iget-object v3, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 429
    iget-object v4, p1, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 430
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_6
    return v2

    :cond_7
    return v3
.end method

.method public static toString(Ljava/util/Collection;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/yanzhenjie/andserver/util/MimeType;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 596
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 597
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 598
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/util/MimeType;

    .line 599
    invoke-virtual {v1, v0}, Lcom/yanzhenjie/andserver/util/MimeType;->appendTo(Ljava/lang/StringBuilder;)V

    .line 600
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, ", "

    .line 601
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 604
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MimeType;
    .locals 10

    .line 519
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_d

    const/16 v0, 0x3b

    .line 523
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, 0x0

    if-ltz v1, :cond_0

    .line 524
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, p0

    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 525
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c

    const-string v4, "*"

    .line 530
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v3, "*/*"

    :cond_1
    const/16 v5, 0x2f

    .line 533
    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_b

    .line 537
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-eq v5, v6, :cond_a

    .line 540
    invoke-virtual {v3, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    .line 541
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 542
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    .line 543
    :cond_2
    new-instance v0, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    const-string v1, "wildcard type is legal only in \'*/*\' (all mime types)"

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_1
    const/4 v4, 0x0

    :goto_2
    add-int/lit8 v1, v1, 0x1

    move v5, v1

    const/4 v7, 0x0

    .line 550
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v5, v8, :cond_6

    .line 551
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v8, v0, :cond_4

    if-nez v7, :cond_5

    goto :goto_4

    :cond_4
    const/16 v9, 0x22

    if-ne v8, v9, :cond_5

    xor-int/lit8 v7, v7, 0x1

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 561
    :cond_6
    :goto_4
    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 562
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_8

    if-nez v4, :cond_7

    .line 564
    new-instance v4, Ljava/util/LinkedHashMap;

    const/4 v7, 0x4

    invoke-direct {v4, v7}, Ljava/util/LinkedHashMap;-><init>(I)V

    :cond_7
    const/16 v7, 0x3d

    .line 566
    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_8

    .line 568
    invoke-virtual {v1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    .line 569
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v1, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 570
    invoke-interface {v4, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 575
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v5, v1, :cond_9

    .line 578
    :try_start_0
    new-instance v0, Lcom/yanzhenjie/andserver/util/MimeType;

    invoke-direct {v0, v6, v3, v4}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 582
    new-instance v1, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    :catch_1
    move-exception v0

    .line 580
    new-instance v1, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unsupported charset \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/nio/charset/UnsupportedCharsetException;->getCharsetName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    :cond_9
    move v1, v5

    goto/16 :goto_2

    .line 538
    :cond_a
    new-instance v0, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    const-string v1, "does not contain subtype after \'/\'"

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 535
    :cond_b
    new-instance v0, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    const-string v1, "does not contain \'/\'"

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 526
    :cond_c
    new-instance v0, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    const-string v1, "\'contentType\' must not be empty"

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 520
    :cond_d
    new-instance v0, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;

    const-string v1, "[mimeType] must not be empty"

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    :goto_5
    throw v0

    :goto_6
    goto :goto_5
.end method


# virtual methods
.method protected appendTo(Ljava/lang/StringBuilder;)V
    .locals 1

    .line 454
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x2f

    .line 455
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 456
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->subtype:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->appendTo(Ljava/util/Map;Ljava/lang/StringBuilder;)V

    return-void
.end method

.method protected checkParameters(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "\'attribute\' must not be empty."

    .line 197
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->hasLength(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "\'value\' must not be empty."

    .line 198
    invoke-static {p2, v0}, Lcom/yanzhenjie/andserver/util/Assert;->hasLength(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->checkToken(Ljava/lang/String;)V

    const-string v0, "charset"

    .line 200
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 201
    invoke-virtual {p0, p2}, Lcom/yanzhenjie/andserver/util/MimeType;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 202
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    goto :goto_0

    .line 203
    :cond_0
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/util/MimeType;->isQuotedString(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 204
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/util/MimeType;->checkToken(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public compareTo(Lcom/yanzhenjie/andserver/util/MimeType;)I
    .locals 5

    .line 476
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 480
    :cond_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    return v0

    .line 484
    :cond_1
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    sub-int/2addr v0, v1

    if-eqz v0, :cond_2

    return v0

    .line 488
    :cond_2
    new-instance v0, Ljava/util/TreeSet;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 489
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    .line 490
    new-instance v1, Ljava/util/TreeSet;

    sget-object v2, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v1, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 491
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    .line 492
    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 493
    invoke-virtual {v1}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 494
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 495
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 496
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 497
    invoke-virtual {v2, v3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_4

    return v4

    .line 501
    :cond_4
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 502
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_5

    const-string v3, ""

    .line 506
    :cond_5
    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_3

    return v2

    :cond_6
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 38
    check-cast p1, Lcom/yanzhenjie/andserver/util/MimeType;

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->compareTo(Lcom/yanzhenjie/andserver/util/MimeType;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 386
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->equalsExcludeParameter(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 389
    :cond_0
    check-cast p1, Lcom/yanzhenjie/andserver/util/MimeType;

    .line 390
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->parametersAreEqual(Lcom/yanzhenjie/andserver/util/MimeType;)Z

    move-result p1

    return p1
.end method

.method public equalsExcludeParameter(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 397
    :cond_0
    instance-of v1, p1, Lcom/yanzhenjie/andserver/util/MimeType;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 400
    :cond_1
    check-cast p1, Lcom/yanzhenjie/andserver/util/MimeType;

    .line 401
    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->type:Ljava/lang/String;

    iget-object v3, p1, Lcom/yanzhenjie/andserver/util/MimeType;->type:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->subtype:Ljava/lang/String;

    iget-object p1, p1, Lcom/yanzhenjie/andserver/util/MimeType;->subtype:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    const-string v0, "charset"

    .line 271
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 272
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/util/MimeType;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 283
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getParameters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 292
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    return-object v0
.end method

.method public getSubtype()Ljava/lang/String;
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->subtype:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 440
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/MimeType;->type:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 441
    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->subtype:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 442
    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/MimeType;->parameters:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public includes(Lcom/yanzhenjie/andserver/util/MimeType;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 309
    :cond_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    return v2

    .line 312
    :cond_1
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 313
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    .line 316
    :cond_2
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 318
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x2b

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v4, -0x1

    if-ne v1, v4, :cond_3

    return v2

    .line 323
    :cond_3
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eq v3, v4, :cond_4

    .line 325
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 326
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v5

    add-int/2addr v1, v2

    invoke-virtual {v5, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 327
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object p1

    add-int/2addr v3, v2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 328
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "*"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public isCompatibleWith(Lcom/yanzhenjie/andserver/util/MimeType;)Z
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 352
    :cond_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_7

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_0

    .line 354
    :cond_1
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 355
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    .line 359
    :cond_2
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 361
    :cond_3
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x2b

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 362
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v1, v4, :cond_4

    if-ne v3, v4, :cond_4

    return v2

    :cond_4
    if-eq v1, v4, :cond_6

    if-eq v3, v4, :cond_6

    .line 367
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 368
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 370
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v6

    add-int/2addr v1, v2

    invoke-virtual {v6, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 371
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object p1

    add-int/2addr v3, v2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 373
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "*"

    .line 374
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_5
    return v2

    :cond_6
    return v0

    :cond_7
    :goto_0
    return v2
.end method

.method public isConcrete()Z
    .locals 1

    .line 248
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardType()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->isWildcardSubtype()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isWildcardSubtype()Z
    .locals 2

    .line 237
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isWildcardType()Z
    .locals 2

    .line 227
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 448
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 449
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/util/MimeType;->appendTo(Ljava/lang/StringBuilder;)V

    .line 450
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected unquote(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 220
    :cond_0
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isQuotedString(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method
