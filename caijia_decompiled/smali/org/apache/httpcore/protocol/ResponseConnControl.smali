.class public Lorg/apache/httpcore/protocol/ResponseConnControl;
.super Ljava/lang/Object;
.source "ResponseConnControl.java"

# interfaces
.implements Lorg/apache/httpcore/HttpResponseInterceptor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "HTTP response"

    .line 63
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    invoke-static {p2}, Lorg/apache/httpcore/protocol/HttpCoreContext;->adapt(Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/protocol/HttpCoreContext;

    move-result-object p2

    .line 68
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    const-string v1, "Close"

    const-string v2, "Connection"

    const/16 v3, 0x190

    if-eq v0, v3, :cond_6

    const/16 v3, 0x198

    if-eq v0, v3, :cond_6

    const/16 v3, 0x19b

    if-eq v0, v3, :cond_6

    const/16 v3, 0x19d

    if-eq v0, v3, :cond_6

    const/16 v3, 0x19e

    if-eq v0, v3, :cond_6

    const/16 v3, 0x1f7

    if-eq v0, v3, :cond_6

    const/16 v3, 0x1f5

    if-ne v0, v3, :cond_0

    goto :goto_1

    .line 79
    :cond_0
    invoke-interface {p1, v2}, Lorg/apache/httpcore/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 80
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 86
    :cond_1
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 88
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/httpcore/StatusLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v3

    .line 89
    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-gez v8, :cond_3

    .line 90
    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->isChunked()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {v3, v0}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 91
    :cond_2
    invoke-interface {p1, v2, v1}, Lorg/apache/httpcore/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 96
    :cond_3
    invoke-virtual {p2}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getRequest()Lorg/apache/httpcore/HttpRequest;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 98
    invoke-interface {p2, v2}, Lorg/apache/httpcore/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 100
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v2, p2}, Lorg/apache/httpcore/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 101
    :cond_4
    invoke-interface {p2}, Lorg/apache/httpcore/HttpRequest;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object p2

    sget-object v0, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {p2, v0}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 102
    invoke-interface {p1, v2, v1}, Lorg/apache/httpcore/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-void

    .line 76
    :cond_6
    :goto_1
    invoke-interface {p1, v2, v1}, Lorg/apache/httpcore/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
