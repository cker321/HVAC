.class public Lorg/apache/httpcore/protocol/RequestExpectContinue;
.super Ljava/lang/Object;
.source "RequestExpectContinue.java"

# interfaces
.implements Lorg/apache/httpcore/HttpRequestInterceptor;


# instance fields
.field private final activeByDefault:Z


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, v0}, Lorg/apache/httpcore/protocol/RequestExpectContinue;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-boolean p1, p0, Lorg/apache/httpcore/protocol/RequestExpectContinue;->activeByDefault:Z

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string p2, "HTTP request"

    .line 76
    invoke-static {p1, p2}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string p2, "Expect"

    .line 78
    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 79
    instance-of v0, p1, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_0

    .line 80
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/RequestLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    .line 81
    move-object v1, p1

    check-cast v1, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    invoke-interface {v1}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 84
    invoke-interface {v1}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_0

    sget-object v1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getParams()Lorg/apache/httpcore/params/HttpParams;

    move-result-object v0

    iget-boolean v1, p0, Lorg/apache/httpcore/protocol/RequestExpectContinue;->activeByDefault:Z

    const-string v2, "http.protocol.expect-continue"

    invoke-interface {v0, v2, v1}, Lorg/apache/httpcore/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "100-continue"

    .line 88
    invoke-interface {p1, p2, v0}, Lorg/apache/httpcore/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
