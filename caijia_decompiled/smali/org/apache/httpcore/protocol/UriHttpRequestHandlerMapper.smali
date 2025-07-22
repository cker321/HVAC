.class public Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;
.super Ljava/lang/Object;
.source "UriHttpRequestHandlerMapper.java"

# interfaces
.implements Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;


# instance fields
.field private final matcher:Lorg/apache/httpcore/protocol/UriPatternMatcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/protocol/UriPatternMatcher<",
            "Lorg/apache/httpcore/protocol/HttpRequestHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    new-instance v0, Lorg/apache/httpcore/protocol/UriPatternMatcher;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/UriPatternMatcher;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;-><init>(Lorg/apache/httpcore/protocol/UriPatternMatcher;)V

    return-void
.end method

.method protected constructor <init>(Lorg/apache/httpcore/protocol/UriPatternMatcher;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/protocol/UriPatternMatcher<",
            "Lorg/apache/httpcore/protocol/HttpRequestHandler;",
            ">;)V"
        }
    .end annotation

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Pattern matcher"

    .line 59
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/protocol/UriPatternMatcher;

    iput-object p1, p0, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->matcher:Lorg/apache/httpcore/protocol/UriPatternMatcher;

    return-void
.end method


# virtual methods
.method protected getRequestPath(Lorg/apache/httpcore/HttpRequest;)Ljava/lang/String;
    .locals 3

    .line 92
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getUri()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x3f

    .line 93
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 95
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/16 v0, 0x23

    .line 97
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v2, :cond_1

    .line 99
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_1
    :goto_0
    return-object p1
.end method

.method public lookup(Lorg/apache/httpcore/HttpRequest;)Lorg/apache/httpcore/protocol/HttpRequestHandler;
    .locals 1

    const-string v0, "HTTP request"

    .line 113
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    iget-object v0, p0, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->matcher:Lorg/apache/httpcore/protocol/UriPatternMatcher;

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->getRequestPath(Lorg/apache/httpcore/HttpRequest;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/UriPatternMatcher;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/protocol/HttpRequestHandler;

    return-object p1
.end method

.method public register(Ljava/lang/String;Lorg/apache/httpcore/protocol/HttpRequestHandler;)V
    .locals 1

    const-string v0, "Pattern"

    .line 74
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Handler"

    .line 75
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    iget-object v0, p0, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->matcher:Lorg/apache/httpcore/protocol/UriPatternMatcher;

    invoke-virtual {v0, p1, p2}, Lorg/apache/httpcore/protocol/UriPatternMatcher;->register(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public unregister(Ljava/lang/String;)V
    .locals 1

    .line 85
    iget-object v0, p0, Lorg/apache/httpcore/protocol/UriHttpRequestHandlerMapper;->matcher:Lorg/apache/httpcore/protocol/UriPatternMatcher;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/protocol/UriPatternMatcher;->unregister(Ljava/lang/String;)V

    return-void
.end method
