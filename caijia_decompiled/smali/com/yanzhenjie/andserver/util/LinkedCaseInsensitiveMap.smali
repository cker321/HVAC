.class public Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;
.super Ljava/lang/Object;
.source "LinkedCaseInsensitiveMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "TV;>;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field private final mCaseInsensitiveKeys:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mLocale:Ljava/util/Locale;

.field private final mSource:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 42
    check-cast v0, Ljava/util/Locale;

    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;-><init>(Ljava/util/Locale;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;-><init>(ILjava/util/Locale;)V

    return-void
.end method

.method public constructor <init>(ILjava/util/Locale;)V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;

    invoke-direct {v0, p0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;-><init>(Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;I)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    :goto_0
    iput-object p2, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mLocale:Ljava/util/Locale;

    return-void
.end method

.method private constructor <init>(Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap<",
            "TV;>;)V"
        }
    .end annotation

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iget-object v0, p1, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedHashMap;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    .line 95
    iget-object v0, p1, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    .line 96
    iget-object p1, p1, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mLocale:Ljava/util/Locale;

    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mLocale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .locals 1

    const/16 v0, 0x10

    .line 52
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;-><init>(ILjava/util/Locale;)V

    return-void
.end method

.method static synthetic access$000(Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;)Ljava/util/HashMap;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    return-object p0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 176
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    return-void
.end method

.method public clone()Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap<",
            "TV;>;"
        }
    .end annotation

    .line 199
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-direct {v0, p0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;-><init>(Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->clone()Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    move-result-object v0

    return-object v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 112
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->convertKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected convertKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 240
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;>;"
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 122
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->convertKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 125
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .line 225
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "TV;)TV;"
        }
    .end annotation

    .line 133
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->convertKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 136
    iget-object p2, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {p2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p2
.end method

.method public hashCode()I
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 182
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 31
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TV;)TV;"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->convertKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 146
    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+",
            "Ljava/lang/String;",
            "+TV;>;)V"
        }
    .end annotation

    .line 153
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 157
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 158
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 164
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mCaseInsensitiveKeys:Ljava/util/HashMap;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->convertKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 167
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;)Z"
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method public size()I
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 188
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->mSource:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
