.class public Lorg/apache/httpcore/protocol/RequestUserAgent;
.super Ljava/lang/Object;
.source "RequestUserAgent.java"

# interfaces
.implements Lorg/apache/httpcore/HttpRequestInterceptor;


# instance fields
.field private final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, v0}, Lorg/apache/httpcore/protocol/RequestUserAgent;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/apache/httpcore/protocol/RequestUserAgent;->userAgent:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string p2, "HTTP request"

    .line 65
    invoke-static {p1, p2}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string p2, "User-Agent"

    .line 66
    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    .line 68
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getParams()Lorg/apache/httpcore/params/HttpParams;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v0, "http.useragent"

    .line 70
    invoke-interface {v1, v0}, Lorg/apache/httpcore/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :cond_0
    if-nez v0, :cond_1

    .line 73
    iget-object v0, p0, Lorg/apache/httpcore/protocol/RequestUserAgent;->userAgent:Ljava/lang/String;

    :cond_1
    if-eqz v0, :cond_2

    .line 76
    invoke-interface {p1, p2, v0}, Lorg/apache/httpcore/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
