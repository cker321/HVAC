.class public Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;
.super Ljava/lang/Object;
.source "OptionsHandler.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;


# static fields
.field public static final INVALID_CORS_REQUEST:Ljava/lang/String; = "Invalid CORS request."


# instance fields
.field private mHandler:Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

.field private mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

.field private mMappingMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            "Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;",
            ">;"
        }
    .end annotation
.end field

.field private mMappings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpRequest;Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/http/HttpRequest;",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            "Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;",
            ">;)V"
        }
    .end annotation

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMappings:Ljava/util/List;

    .line 59
    iput-object p3, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMappingMap:Ljava/util/Map;

    const/4 p3, 0x0

    .line 61
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    const-string p2, "Access-Control-Request-Method"

    .line 62
    invoke-interface {p1, p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 63
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 64
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/HttpMethod;->reverse(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object p1

    .line 65
    iget-object p2, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMappings:Ljava/util/List;

    invoke-static {p2, p1}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->findMappingByMethod(Ljava/util/List;Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 67
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    .line 71
    :cond_0
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMappingMap:Ljava/util/Map;

    iget-object p2, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mHandler:Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    return-void
.end method

.method private invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .locals 2

    const/16 v0, 0x193

    .line 194
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    .line 195
    invoke-static {}, Lcom/yanzhenjie/andserver/http/HttpMethod;->values()[Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    const-string v1, ", "

    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Allow"

    invoke-interface {p1, v1, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    new-instance p1, Lcom/yanzhenjie/andserver/framework/view/BodyView;

    new-instance v0, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    const-string v1, "Invalid CORS request."

    invoke-direct {v0, v1}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/yanzhenjie/andserver/framework/view/BodyView;-><init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-object p1
.end method


# virtual methods
.method public getAddition()Lcom/yanzhenjie/andserver/framework/mapping/Addition;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mHandler:Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;->getAddition()Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    move-result-object v0

    return-object v0
.end method

.method public getCrossOrigin()Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mHandler:Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;->getCrossOrigin()Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    move-result-object v0

    return-object v0
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 201
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mHandler:Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;->getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mHandler:Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;->getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMapping()Lcom/yanzhenjie/andserver/framework/mapping/Mapping;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMapping:Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    return-object v0
.end method

.method public handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string v0, "Origin"

    .line 94
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 95
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 96
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v2, "Access-Control-Request-Method"

    .line 99
    invoke-interface {p1, v2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 100
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 101
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    .line 104
    :cond_1
    invoke-static {v2}, Lcom/yanzhenjie/andserver/http/HttpMethod;->reverse(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v2

    .line 105
    iget-object v3, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMappings:Ljava/util/List;

    invoke-static {v3, v2}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;->findMappingByMethod(Ljava/util/List;Lcom/yanzhenjie/andserver/http/HttpMethod;)Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    move-result-object v3

    if-nez v3, :cond_2

    .line 107
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    .line 110
    :cond_2
    iget-object v4, p0, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->mMappingMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;

    if-eqz v4, :cond_11

    .line 115
    invoke-interface {v4}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;->getCrossOrigin()Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;

    move-result-object v4

    if-nez v4, :cond_3

    .line 117
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    .line 120
    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 121
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->getMethods()[Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 122
    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->getMethod()Lcom/yanzhenjie/andserver/framework/mapping/Method;

    move-result-object v3

    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->getRuleList()Ljava/util/List;

    move-result-object v3

    .line 123
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 124
    invoke-interface {v5, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 126
    :cond_4
    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 127
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    .line 130
    :cond_5
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->getOrigins()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 131
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const-string v6, "*"

    if-nez v3, :cond_6

    invoke-interface {v2, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 132
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    .line 135
    :cond_6
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->getAllowedHeaders()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 136
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v7, "Access-Control-Request-Headers"

    .line 137
    invoke-interface {p1, v7}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 138
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 139
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_8

    .line 140
    new-instance v8, Ljava/util/StringTokenizer;

    const-string v9, ","

    invoke-direct {v8, p1, v9}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    :cond_7
    :goto_0
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 142
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p1

    .line 143
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 144
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_7

    .line 145
    invoke-interface {v7, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 149
    :cond_8
    invoke-interface {v2, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 150
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_e

    .line 151
    invoke-interface {v3, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 153
    :cond_9
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_d

    .line 154
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_e

    .line 155
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 156
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_b
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 157
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 158
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 162
    :cond_c
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 163
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/handler/OptionsHandler;->invalidCORS(Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object p1

    return-object p1

    .line 166
    :cond_d
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_e

    .line 167
    invoke-interface {v3, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 170
    :cond_e
    :goto_2
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->getExposedHeaders()[Ljava/lang/String;

    move-result-object p1

    const-string v2, "Access-Control-Allow-Origin"

    .line 172
    invoke-interface {p2, v2, v1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", "

    .line 173
    invoke-static {v1, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "Access-Control-Allow-Methods"

    invoke-interface {p2, v5, v2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_f

    .line 175
    invoke-static {v1, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Access-Control-Allow-Headers"

    invoke-interface {p2, v3, v2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    :cond_f
    array-length v2, p1

    if-lez v2, :cond_10

    .line 178
    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "Access-Control-Expose-Headers"

    invoke-interface {p2, v2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    :cond_10
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->isAllowCredentials()Z

    move-result p1

    .line 182
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    const-string v2, "Access-Control-Allow-Credentials"

    invoke-interface {p2, v2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->getMaxAge()J

    move-result-wide v2

    .line 185
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    const-string v2, "Access-Control-Max-Age"

    invoke-interface {p2, v2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    invoke-static {}, Lcom/yanzhenjie/andserver/http/HttpMethod;->values()[Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "Allow"

    invoke-interface {p2, v1, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Vary"

    .line 188
    invoke-interface {p2, p1, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    new-instance p1, Lcom/yanzhenjie/andserver/framework/view/BodyView;

    new-instance p2, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    const-string v0, "OK"

    invoke-direct {p2, v0}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/framework/view/BodyView;-><init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-object p1

    .line 112
    :cond_11
    new-instance p1, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>()V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method
