.class public abstract Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;
.super Ljava/lang/Object;
.source "MappingHandler.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;


# instance fields
.field private final mAddition:Lcom/yanzhenjie/andserver/framework/mapping/Addition;

.field private final mCrossOrigin:Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

.field private final mHost:Ljava/lang/Object;

.field private final mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mHost:Ljava/lang/Object;

    .line 58
    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    .line 59
    iput-object p3, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mAddition:Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    .line 60
    iput-object p4, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mCrossOrigin:Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    return-void
.end method

.method private varargs invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;[Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/view/View;
    .locals 1

    const/16 v0, 0x193

    .line 178
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    if-eqz p2, :cond_0

    .line 179
    array-length v0, p2

    if-lez v0, :cond_0

    const-string v0, ", "

    .line 180
    invoke-static {v0, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "Allow"

    invoke-interface {p1, v0, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    :cond_0
    new-instance p1, Lcom/yanzhenjie/andserver/framework/view/BodyView;

    new-instance p2, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    const-string v0, "Invalid CORS request."

    invoke-direct {p2, v0}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/framework/view/BodyView;-><init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-object p1
.end method


# virtual methods
.method public getAddition()Lcom/yanzhenjie/andserver/framework/mapping/Addition;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mAddition:Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    return-object v0
.end method

.method public getCrossOrigin()Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mCrossOrigin:Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    return-object v0
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 65
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->getHost()Ljava/lang/Object;

    move-result-object v0

    .line 66
    instance-of v1, v0, Lcom/yanzhenjie/andserver/framework/ETag;

    if-eqz v1, :cond_0

    .line 67
    check-cast v0, Lcom/yanzhenjie/andserver/framework/ETag;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/framework/ETag;->getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getHost()Ljava/lang/Object;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mHost:Ljava/lang/Object;

    return-object v0
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->getHost()Ljava/lang/Object;

    move-result-object v0

    .line 75
    instance-of v1, v0, Lcom/yanzhenjie/andserver/framework/LastModified;

    if-eqz v1, :cond_0

    .line 76
    check-cast v0, Lcom/yanzhenjie/andserver/framework/LastModified;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/framework/LastModified;->getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getMapping()Lcom/yanzhenjie/andserver/framework/mapping/Mapping;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    return-object v0
.end method

.method protected getPathVariable(Ljava/lang/String;)Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 113
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->pathToList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getPath()Lcom/yanzhenjie/andserver/framework/mapping/Path;

    move-result-object v1

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->getRuleList()Ljava/util/List;

    move-result-object v1

    .line 115
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;

    .line 116
    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;->getSegments()Ljava/util/List;

    move-result-object v2

    .line 117
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-eq v3, v4, :cond_1

    goto :goto_0

    .line 121
    :cond_1
    invoke-static {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->listToPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    .line 122
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 123
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 128
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-ge v4, v6, :cond_6

    .line 129
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    .line 130
    invoke-virtual {v6}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->isBlurred()Z

    move-result v8

    if-nez v5, :cond_4

    if-eqz v8, :cond_3

    goto :goto_2

    :cond_3
    const/4 v5, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v5, 0x1

    .line 132
    :goto_3
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    if-nez v8, :cond_5

    const/4 v4, 0x0

    goto :goto_4

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_6
    const/4 v4, 0x1

    :goto_4
    if-eqz v4, :cond_0

    if-eqz v5, :cond_0

    .line 139
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 140
    :goto_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v3, v1, :cond_8

    .line 141
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    .line 142
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->isBlurred()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 143
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    .line 145
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 146
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v7

    invoke-virtual {v1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 147
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_8
    return-object p1

    .line 154
    :cond_9
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string v0, "Origin"

    .line 159
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 160
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mCrossOrigin:Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    if-eqz v2, :cond_1

    .line 161
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v2

    .line 163
    iget-object v3, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mCrossOrigin:Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->getMethods()[Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 164
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 p1, 0x0

    new-array p1, p1, [Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 165
    invoke-direct {p0, p2, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;[Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v2, "Access-Control-Allow-Origin"

    .line 168
    invoke-interface {p2, v2, v1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->mCrossOrigin:Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->isAllowCredentials()Z

    move-result v1

    .line 170
    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Access-Control-Allow-Credentials"

    invoke-interface {p2, v2, v1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Vary"

    .line 171
    invoke-interface {p2, v1, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;->onHandle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1
.end method

.method protected abstract onHandle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
