.class public final Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;
.super Ljava/lang/Object;
.source "ImmutableHttpProcessor.java"

# interfaces
.implements Lorg/apache/httpcore/protocol/HttpProcessor;


# instance fields
.field private final requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

.field private final responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apache/httpcore/HttpRequestInterceptor;",
            ">;",
            "Ljava/util/List<",
            "Lorg/apache/httpcore/HttpResponseInterceptor;",
            ">;)V"
        }
    .end annotation

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 79
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 80
    new-array v1, v1, [Lorg/apache/httpcore/HttpRequestInterceptor;

    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/httpcore/HttpRequestInterceptor;

    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    goto :goto_0

    :cond_0
    new-array p1, v0, [Lorg/apache/httpcore/HttpRequestInterceptor;

    .line 82
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    :goto_0
    if-eqz p2, :cond_1

    .line 85
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    .line 86
    new-array p1, p1, [Lorg/apache/httpcore/HttpResponseInterceptor;

    invoke-interface {p2, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/httpcore/HttpResponseInterceptor;

    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    goto :goto_1

    :cond_1
    new-array p1, v0, [Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 88
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    :goto_1
    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpRequestInterceptorList;Lorg/apache/httpcore/protocol/HttpResponseInterceptorList;)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 101
    invoke-interface {p1}, Lorg/apache/httpcore/protocol/HttpRequestInterceptorList;->getRequestInterceptorCount()I

    move-result v1

    .line 102
    new-array v2, v1, [Lorg/apache/httpcore/HttpRequestInterceptor;

    iput-object v2, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 104
    iget-object v3, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    invoke-interface {p1, v2}, Lorg/apache/httpcore/protocol/HttpRequestInterceptorList;->getRequestInterceptor(I)Lorg/apache/httpcore/HttpRequestInterceptor;

    move-result-object v4

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-array p1, v0, [Lorg/apache/httpcore/HttpRequestInterceptor;

    .line 107
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    :cond_1
    if-eqz p2, :cond_2

    .line 110
    invoke-interface {p2}, Lorg/apache/httpcore/protocol/HttpResponseInterceptorList;->getResponseInterceptorCount()I

    move-result p1

    .line 111
    new-array v1, p1, [Lorg/apache/httpcore/HttpResponseInterceptor;

    iput-object v1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    :goto_1
    if-ge v0, p1, :cond_3

    .line 113
    iget-object v1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    invoke-interface {p2, v0}, Lorg/apache/httpcore/protocol/HttpResponseInterceptorList;->getResponseInterceptor(I)Lorg/apache/httpcore/HttpResponseInterceptor;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    new-array p1, v0, [Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 116
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    :cond_3
    return-void
.end method

.method public varargs constructor <init>([Lorg/apache/httpcore/HttpRequestInterceptor;)V
    .locals 1

    const/4 v0, 0x0

    .line 121
    invoke-direct {p0, p1, v0}, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/httpcore/HttpRequestInterceptor;[Lorg/apache/httpcore/HttpResponseInterceptor;)V

    return-void
.end method

.method public constructor <init>([Lorg/apache/httpcore/HttpRequestInterceptor;[Lorg/apache/httpcore/HttpResponseInterceptor;)V
    .locals 3

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 56
    array-length v1, p1

    .line 57
    new-array v2, v1, [Lorg/apache/httpcore/HttpRequestInterceptor;

    iput-object v2, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    .line 58
    invoke-static {p1, v0, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_0
    new-array p1, v0, [Lorg/apache/httpcore/HttpRequestInterceptor;

    .line 60
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    :goto_0
    if-eqz p2, :cond_1

    .line 63
    array-length p1, p2

    .line 64
    new-array v1, p1, [Lorg/apache/httpcore/HttpResponseInterceptor;

    iput-object v1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 65
    invoke-static {p2, v0, v1, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    :cond_1
    new-array p1, v0, [Lorg/apache/httpcore/HttpResponseInterceptor;

    .line 67
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    :goto_1
    return-void
.end method

.method public varargs constructor <init>([Lorg/apache/httpcore/HttpResponseInterceptor;)V
    .locals 1

    const/4 v0, 0x0

    .line 125
    invoke-direct {p0, v0, p1}, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/httpcore/HttpRequestInterceptor;[Lorg/apache/httpcore/HttpResponseInterceptor;)V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/httpcore/HttpRequestInterceptor;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 133
    invoke-interface {v3, p1, p2}, Lorg/apache/httpcore/HttpRequestInterceptor;->process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lorg/apache/httpcore/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/httpcore/HttpResponseInterceptor;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 142
    invoke-interface {v3, p1, p2}, Lorg/apache/httpcore/HttpResponseInterceptor;->process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
