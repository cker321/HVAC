.class public Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;
.super Lcom/yanzhenjie/andserver/http/RequestWrapper;
.source "StandardMultipartRequest.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;


# instance fields
.field private mMultipartContentTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation
.end field

.field private mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/util/MultiValueMap;Lcom/yanzhenjie/andserver/util/MultiValueMap;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/http/HttpRequest;",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 48
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/RequestWrapper;-><init>(Lcom/yanzhenjie/andserver/http/HttpRequest;)V

    .line 49
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    .line 50
    new-instance p1, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>(Ljava/util/Map;)V

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    .line 51
    new-instance p1, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>(Ljava/util/Map;)V

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    .line 52
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartContentTypes:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getFile(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->getFirst(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;

    return-object p1
.end method

.method public getFileMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->toSingleValueMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getFileNames()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getFiles(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_0

    return-object p1

    .line 74
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getMultiFileMap()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object v0
.end method

.method public getMultipartContentType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 93
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->getFile(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;

    move-result-object v0

    if-nez v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartContentTypes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;->getContentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getParameter()Lcom/yanzhenjie/andserver/util/MultiValueMap;
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

    .line 130
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameter()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    :goto_0
    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->getFirst(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 117
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getParameterNames()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameterNames()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 104
    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 105
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameterNames()Ljava/util/List;

    move-result-object v1

    .line 106
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 107
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 109
    :cond_1
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public getParameters(Ljava/lang/String;)Ljava/util/List;
    .locals 1
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

    .line 123
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mMultipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameters(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    :cond_0
    return-object v0
.end method
