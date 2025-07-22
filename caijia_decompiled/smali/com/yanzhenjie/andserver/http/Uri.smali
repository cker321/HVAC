.class public Lcom/yanzhenjie/andserver/http/Uri;
.super Ljava/lang/Object;
.source "Uri.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/http/Uri$Builder;
    }
.end annotation


# instance fields
.field private final mFragment:Ljava/lang/String;

.field private final mHost:Ljava/lang/String;

.field private final mPath:Ljava/lang/String;

.field private final mPort:I

.field private final mQuery:Ljava/lang/String;

.field private final mScheme:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/yanzhenjie/andserver/http/Uri$Builder;)V
    .locals 1

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->access$100(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mScheme:Ljava/lang/String;

    .line 83
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->access$200(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mHost:Ljava/lang/String;

    .line 84
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->access$300(Lcom/yanzhenjie/andserver/http/Uri$Builder;)I

    move-result v0

    iput v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPort:I

    .line 85
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->access$400(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->path(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPath:Ljava/lang/String;

    .line 86
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->access$500(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->query(Lcom/yanzhenjie/andserver/util/MultiValueMap;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mQuery:Ljava/lang/String;

    .line 87
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->access$600(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mFragment:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/yanzhenjie/andserver/http/Uri$Builder;Lcom/yanzhenjie/andserver/http/Uri$1;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri;-><init>(Lcom/yanzhenjie/andserver/http/Uri$Builder;)V

    return-void
.end method

.method static synthetic access$700(Ljava/lang/String;)Ljava/util/List;
    .locals 0

    .line 68
    invoke-static {p0}, Lcom/yanzhenjie/andserver/http/Uri;->convertPath(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 0

    .line 68
    invoke-static {p0}, Lcom/yanzhenjie/andserver/http/Uri;->convertQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object p0

    return-object p0
.end method

.method private static convertPath(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    :goto_0
    const-string v0, "/"

    .line 354
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 355
    :cond_0
    :goto_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 357
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 358
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 359
    :goto_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 360
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 361
    invoke-static {v1, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    :cond_3
    return-object v1
.end method

.method private static convertQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 367
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>()V

    .line 368
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "?"

    .line 369
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 370
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 373
    :cond_0
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v3, "&"

    invoke-direct {v1, p0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 375
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p0

    const-string v3, "="

    .line 376
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_1

    .line 378
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v2

    if-ge v3, v4, :cond_1

    const/4 v4, 0x0

    .line 379
    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    .line 380
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 381
    sget-object v3, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p0, v3}, Lcom/yanzhenjie/andserver/util/UrlCoder;->urlDecode(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v4, p0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 2

    .line 71
    new-instance v0, Lcom/yanzhenjie/andserver/http/Uri$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;-><init>(Ljava/lang/String;Lcom/yanzhenjie/andserver/http/Uri$1;)V

    return-object v0
.end method

.method private static path(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "/"

    if-eqz p0, :cond_2

    .line 389
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 392
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 393
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 394
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 396
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_1
    return-object v0
.end method

.method private static query(Lcom/yanzhenjie/andserver/util/MultiValueMap;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 400
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 401
    invoke-interface {p0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 402
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "="

    if-eqz v1, :cond_1

    .line 403
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 404
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 405
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_0

    .line 406
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 407
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 408
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 411
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 416
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 417
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 418
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    const-string v4, "&"

    if-eqz v1, :cond_2

    .line 419
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 420
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 421
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 424
    :cond_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 427
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public builder()Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 3

    .line 131
    new-instance v0, Lcom/yanzhenjie/andserver/http/Uri$Builder;

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;-><init>(Ljava/lang/String;Lcom/yanzhenjie/andserver/http/Uri$1;)V

    return-object v0
.end method

.method public copyPath()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->convertPath(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFragment()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mFragment:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mHost:Ljava/lang/String;

    return-object v0
.end method

.method public getParams()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mQuery:Ljava/lang/String;

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->convertQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 101
    iget v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPort:I

    return v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mQuery:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri;->mScheme:Ljava/lang/String;

    return-object v0
.end method

.method public location(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri;
    .locals 6

    .line 163
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 167
    :cond_0
    invoke-static {p1}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 168
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri;->newBuilder(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object p1

    return-object p1

    .line 171
    :cond_1
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    const-string v1, "/"

    .line 172
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 173
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->builder()Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    .line 174
    invoke-virtual {v0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    .line 175
    invoke-virtual {v0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setFragment(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    .line 176
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object p1

    return-object p1

    :cond_2
    const-string v2, "../"

    .line 177
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 178
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri;->convertPath(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 179
    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/yanzhenjie/andserver/http/Uri;->convertPath(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    const-string v3, ".."

    .line 181
    invoke-interface {v2, v3}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v3

    add-int/lit8 v4, v3, 0x1

    .line 182
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-interface {v2, v4, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 183
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    const/4 v4, 0x0

    .line 184
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v3

    add-int/lit8 v5, v5, -0x2

    invoke-interface {p1, v4, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    .line 185
    invoke-interface {p1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 186
    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    .line 187
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->builder()Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setFragment(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object p1

    return-object p1

    .line 189
    :cond_3
    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    .line 190
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->builder()Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setFragment(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object p1

    return-object p1

    .line 192
    :cond_4
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri;->convertPath(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 193
    invoke-virtual {v0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/yanzhenjie/andserver/http/Uri;->convertPath(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 194
    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    .line 195
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/Uri;->builder()Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {v0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setFragment(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mScheme:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, ":"

    if-nez v1, :cond_0

    .line 139
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mScheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    :cond_0
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mHost:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPort:I

    if-lez v1, :cond_1

    const-string v1, "//"

    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPort:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    :cond_1
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 147
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_2
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mQuery:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "?"

    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mQuery:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    :cond_3
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mFragment:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "#"

    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri;->mFragment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
