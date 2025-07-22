.class public abstract Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;
.super Ljava/lang/Object;
.source "MappingAdapter.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static findMappingByMethod(Ljava/util/List;Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/mapping/Mapping;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            ">;",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
            ")",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;"
        }
    .end annotation

    .line 331
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    .line 332
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getMethod()Lcom/yanzhenjie/andserver/framework/mapping/Method;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->getRuleList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static findSupportMethods(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
            ">;"
        }
    .end annotation

    .line 323
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 324
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    .line 325
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getMethod()Lcom/yanzhenjie/andserver/framework/mapping/Method;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->getRuleList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getBlurredMappings(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            ">;"
        }
    .end annotation

    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 163
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getMappingMap()Ljava/util/Map;

    move-result-object v1

    .line 164
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    .line 165
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getPath()Lcom/yanzhenjie/andserver/framework/mapping/Path;

    move-result-object v3

    .line 166
    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->getRuleList()Ljava/util/List;

    move-result-object v3

    .line 167
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;

    .line 168
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;->getSegments()Ljava/util/List;

    move-result-object v4

    invoke-direct {p0, v4, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->matchBlurredPath(Ljava/util/List;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 169
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private getExactMappings(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            ">;"
        }
    .end annotation

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 136
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getMappingMap()Ljava/util/Map;

    move-result-object v1

    .line 137
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    .line 138
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getPath()Lcom/yanzhenjie/andserver/framework/mapping/Path;

    move-result-object v3

    .line 139
    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->getRuleList()Ljava/util/List;

    move-result-object v3

    .line 140
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;

    .line 141
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;->getSegments()Ljava/util/List;

    move-result-object v4

    invoke-direct {p0, v4, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->matchExactPath(Ljava/util/List;Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 142
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private matchBlurredPath(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;)Z"
        }
    .end annotation

    .line 177
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x0

    .line 181
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 182
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    .line 183
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->isBlurred()Z

    move-result v1

    if-nez v1, :cond_1

    return v2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method private matchExactPath(Ljava/util/List;Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;)Z"
        }
    .end annotation

    .line 150
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 154
    :cond_0
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->listToPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->listToPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v2
.end method

.method private validateConsume(Lcom/yanzhenjie/andserver/framework/mapping/Mime;Lcom/yanzhenjie/andserver/http/HttpRequest;)V
    .locals 5

    .line 247
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Mime;->getRuleList()Ljava/util/List;

    move-result-object p1

    .line 248
    invoke-interface {p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getContentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p2

    .line 250
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 251
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;

    .line 252
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "!"

    .line 253
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 255
    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 257
    :cond_0
    new-instance v2, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;->getSubtype()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v4, :cond_2

    .line 260
    invoke-virtual {v2, p2}, Lcom/yanzhenjie/andserver/util/MediaType;->equalsExcludeParameter(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 261
    :cond_1
    new-instance p1, Lcom/yanzhenjie/andserver/error/ContentNotSupportedException;

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/ContentNotSupportedException;-><init>(Lcom/yanzhenjie/andserver/util/MediaType;)V

    throw p1

    .line 264
    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    .line 269
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/util/MediaType;

    .line 270
    invoke-virtual {v1, p2}, Lcom/yanzhenjie/andserver/util/MediaType;->includes(Lcom/yanzhenjie/andserver/util/MediaType;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_1

    :cond_5
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_6

    return-void

    .line 276
    :cond_6
    new-instance p1, Lcom/yanzhenjie/andserver/error/ContentNotSupportedException;

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/ContentNotSupportedException;-><init>(Lcom/yanzhenjie/andserver/util/MediaType;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method private validateHeaders(Lcom/yanzhenjie/andserver/framework/mapping/Pair;Lcom/yanzhenjie/andserver/http/HttpRequest;)V
    .locals 8

    .line 220
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->getRuleList()Ljava/util/List;

    move-result-object p1

    .line 221
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;

    .line 222
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 223
    invoke-interface {p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeaderNames()Ljava/util/List;

    move-result-object v2

    .line 224
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 225
    invoke-interface {p2, v1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeaders(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 226
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->isNoKey()Z

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_2

    .line 227
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 228
    :cond_1
    new-instance p1, Lcom/yanzhenjie/andserver/error/HeaderValidateException;

    new-array p2, v7, [Ljava/lang/Object;

    aput-object v1, p2, v6

    const-string v0, "The header [%s] is not allowed."

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/HeaderValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 230
    :cond_2
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->isNoValue()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 231
    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 232
    :cond_3
    new-instance p1, Lcom/yanzhenjie/andserver/error/HeaderValidateException;

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/Object;

    aput-object v1, p2, v6

    aput-object v3, p2, v7

    const-string v0, "The value of header %s cannot be %s."

    .line 233
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/HeaderValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 235
    :cond_4
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 236
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_1

    .line 237
    :cond_5
    new-instance p1, Lcom/yanzhenjie/andserver/error/HeaderValidateException;

    new-array p2, v7, [Ljava/lang/Object;

    aput-object v1, p2, v6

    const-string v0, "The value of header %s is missing or wrong."

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/HeaderValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 238
    :cond_6
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto/16 :goto_0

    .line 240
    :cond_7
    new-instance p1, Lcom/yanzhenjie/andserver/error/HeaderValidateException;

    new-array p2, v7, [Ljava/lang/Object;

    aput-object v1, p2, v6

    const-string v0, "The header %s is missing."

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/HeaderValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    return-void
.end method

.method private validateParams(Lcom/yanzhenjie/andserver/framework/mapping/Pair;Lcom/yanzhenjie/andserver/http/HttpRequest;)V
    .locals 8

    .line 191
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->getRuleList()Ljava/util/List;

    move-result-object p1

    .line 192
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;

    .line 193
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 194
    invoke-interface {p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameterNames()Ljava/util/List;

    move-result-object v2

    .line 195
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 196
    invoke-interface {p2, v1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameters(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 197
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->isNoKey()Z

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_2

    .line 198
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 199
    :cond_1
    new-instance p1, Lcom/yanzhenjie/andserver/error/ParamValidateException;

    new-array p2, v7, [Ljava/lang/Object;

    aput-object v1, p2, v6

    const-string v0, "The parameter [%s] is not allowed."

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/ParamValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 201
    :cond_2
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->isNoValue()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 202
    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 203
    :cond_3
    new-instance p1, Lcom/yanzhenjie/andserver/error/ParamValidateException;

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/Object;

    aput-object v1, p2, v6

    aput-object v3, p2, v7

    const-string v0, "The value of parameter %s cannot be %s."

    .line 204
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/ParamValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 206
    :cond_4
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 207
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_0

    .line 208
    :cond_5
    new-instance p1, Lcom/yanzhenjie/andserver/error/ParamValidateException;

    new-array p2, v7, [Ljava/lang/Object;

    aput-object v1, p2, v6

    const-string v0, "The value of parameter %s is missing or wrong."

    .line 209
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/ParamValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 211
    :cond_6
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto/16 :goto_0

    .line 213
    :cond_7
    new-instance p1, Lcom/yanzhenjie/andserver/error/ParamValidateException;

    new-array p2, v7, [Ljava/lang/Object;

    aput-object v1, p2, v6

    const-string v0, "The parameter %s is missing."

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/error/ParamValidateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    return-void
.end method

.method private validateProduce(Lcom/yanzhenjie/andserver/framework/mapping/Mime;Lcom/yanzhenjie/andserver/http/HttpRequest;)V
    .locals 6

    .line 281
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Mime;->getRuleList()Ljava/util/List;

    move-result-object p1

    .line 282
    invoke-interface {p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAccepts()Ljava/util/List;

    move-result-object p2

    .line 283
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;

    .line 284
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;->getType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "!"

    .line 285
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 287
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 289
    :cond_1
    new-instance v4, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;->getSubtype()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v1, v0}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 292
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/yanzhenjie/andserver/util/MediaType;

    .line 293
    invoke-virtual {v5, v4}, Lcom/yanzhenjie/andserver/util/MediaType;->includes(Lcom/yanzhenjie/andserver/util/MediaType;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_3
    if-eqz v2, :cond_5

    if-nez v0, :cond_4

    goto :goto_2

    .line 298
    :cond_4
    new-instance p1, Lcom/yanzhenjie/andserver/error/ContentNotAcceptableException;

    invoke-direct {p1}, Lcom/yanzhenjie/andserver/error/ContentNotAcceptableException;-><init>()V

    throw p1

    :cond_5
    :goto_2
    if-nez v2, :cond_0

    if-eqz v0, :cond_6

    goto :goto_0

    .line 301
    :cond_6
    new-instance p1, Lcom/yanzhenjie/andserver/error/ContentNotAcceptableException;

    invoke-direct {p1}, Lcom/yanzhenjie/andserver/error/ContentNotAcceptableException;-><init>()V

    throw p1

    :cond_7
    return-void
.end method


# virtual methods
.method public getHandler(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;
    .locals 6

    .line 98
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->pathToList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 100
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getExactMappings(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 101
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getBlurredMappings(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 105
    :cond_0
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    .line 106
    invoke-static {v1, v0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->findMappingByMethod(Ljava/util/List;Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    move-result-object v2

    .line 108
    sget-object v3, Lcom/yanzhenjie/andserver/http/HttpMethod;->OPTIONS:Lcom/yanzhenjie/andserver/http/HttpMethod;

    invoke-virtual {v0, v3}, Lcom/yanzhenjie/andserver/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez v2, :cond_1

    .line 109
    new-instance v0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getMappingMap()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;-><init>(Lcom/yanzhenjie/andserver/http/HttpRequest;Ljava/util/List;Ljava/util/Map;)V

    return-object v0

    :cond_1
    const/4 v0, 0x0

    if-nez v2, :cond_2

    return-object v0

    .line 116
    :cond_2
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getProduce()Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 118
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mime;->getRuleList()Ljava/util/List;

    move-result-object v1

    .line 120
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;

    .line 121
    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "!"

    .line 122
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    move-object v0, v3

    :cond_4
    const-string v1, "http.response.Produce"

    .line 127
    invoke-interface {p1, v1, v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 130
    :cond_5
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getMappingMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;

    return-object p1
.end method

.method protected abstract getHost()Ljava/lang/Object;
.end method

.method protected abstract getMappingMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            "Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;",
            ">;"
        }
    .end annotation
.end method

.method public intercept(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z
    .locals 4

    .line 49
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->pathToList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 51
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getExactMappings(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 52
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 53
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->getBlurredMappings(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 55
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 59
    :cond_1
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    .line 60
    sget-object v2, Lcom/yanzhenjie/andserver/http/HttpMethod;->OPTIONS:Lcom/yanzhenjie/andserver/http/HttpMethod;

    invoke-virtual {v0, v2}, Lcom/yanzhenjie/andserver/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    return v3

    .line 64
    :cond_2
    invoke-static {v1, v0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->findMappingByMethod(Ljava/util/List;Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 72
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getParam()Lcom/yanzhenjie/andserver/framework/mapping/Pair;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 74
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->validateParams(Lcom/yanzhenjie/andserver/framework/mapping/Pair;Lcom/yanzhenjie/andserver/http/HttpRequest;)V

    .line 77
    :cond_3
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getHeader()Lcom/yanzhenjie/andserver/framework/mapping/Pair;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 79
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->validateHeaders(Lcom/yanzhenjie/andserver/framework/mapping/Pair;Lcom/yanzhenjie/andserver/http/HttpRequest;)V

    .line 82
    :cond_4
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getConsume()Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 84
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->validateConsume(Lcom/yanzhenjie/andserver/framework/mapping/Mime;Lcom/yanzhenjie/andserver/http/HttpRequest;)V

    .line 87
    :cond_5
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getProduce()Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 89
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->validateProduce(Lcom/yanzhenjie/andserver/framework/mapping/Mime;Lcom/yanzhenjie/andserver/http/HttpRequest;)V

    :cond_6
    return v3

    .line 66
    :cond_7
    new-instance p1, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;

    invoke-direct {p1, v0}, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;-><init>(Lcom/yanzhenjie/andserver/http/HttpMethod;)V

    .line 67
    invoke-static {v1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->findSupportMethods(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;->setMethods(Ljava/util/List;)V

    .line 69
    throw p1
.end method
