.class public Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
.super Ljava/lang/Object;
.source "HttpProcessorBuilder.java"


# instance fields
.field private requestChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/protocol/ChainBuilder<",
            "Lorg/apache/httpcore/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/protocol/ChainBuilder<",
            "Lorg/apache/httpcore/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    .line 44
    new-instance v0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;-><init>()V

    return-object v0
.end method

.method private getRequestChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/httpcore/protocol/ChainBuilder<",
            "Lorg/apache/httpcore/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lorg/apache/httpcore/protocol/ChainBuilder;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/ChainBuilder;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    .line 55
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object v0
.end method

.method private getResponseChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/httpcore/protocol/ChainBuilder<",
            "Lorg/apache/httpcore/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Lorg/apache/httpcore/protocol/ChainBuilder;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/ChainBuilder;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    .line 62
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object v0
.end method


# virtual methods
.method public add(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 0

    .line 82
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    move-result-object p1

    return-object p1
.end method

.method public add(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 0

    .line 122
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    move-result-object p1

    return-object p1
.end method

.method public varargs addAll([Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 0

    .line 102
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addAllLast([Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    move-result-object p1

    return-object p1
.end method

.method public varargs addAll([Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->addAllLast([Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;

    move-result-object p1

    return-object p1
.end method

.method public varargs addAllFirst([Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 89
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addAllFirst([Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public varargs addAllFirst([Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 129
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addAllFirst([Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public varargs addAllLast([Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 97
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addAllLast([Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public varargs addAllLast([Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 137
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addAllLast([Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public addFirst(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 69
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addFirst(Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public addFirst(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 109
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addFirst(Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public addLast(Lorg/apache/httpcore/HttpRequestInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 77
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addLast(Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public addLast(Lorg/apache/httpcore/HttpResponseInterceptor;)Lorg/apache/httpcore/protocol/HttpProcessorBuilder;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 117
    :cond_0
    invoke-direct {p0}, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/httpcore/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/ChainBuilder;->addLast(Ljava/lang/Object;)Lorg/apache/httpcore/protocol/ChainBuilder;

    return-object p0
.end method

.method public build()Lorg/apache/httpcore/protocol/HttpProcessor;
    .locals 4

    .line 146
    new-instance v0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;

    iget-object v1, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 147
    invoke-virtual {v1}, Lorg/apache/httpcore/protocol/ChainBuilder;->build()Ljava/util/LinkedList;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    iget-object v3, p0, Lorg/apache/httpcore/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/httpcore/protocol/ChainBuilder;

    if-eqz v3, :cond_1

    .line 148
    invoke-virtual {v3}, Lorg/apache/httpcore/protocol/ChainBuilder;->build()Ljava/util/LinkedList;

    move-result-object v2

    :cond_1
    invoke-direct {v0, v1, v2}, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method
