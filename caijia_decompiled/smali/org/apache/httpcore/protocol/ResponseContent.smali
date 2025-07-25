.class public Lorg/apache/httpcore/protocol/ResponseContent;
.super Ljava/lang/Object;
.source "ResponseContent.java"

# interfaces
.implements Lorg/apache/httpcore/HttpResponseInterceptor;


# instance fields
.field private final overwrite:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-direct {p0, v0}, Lorg/apache/httpcore/protocol/ResponseContent;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-boolean p1, p0, Lorg/apache/httpcore/protocol/ResponseContent;->overwrite:Z

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string p2, "HTTP response"

    .line 94
    invoke-static {p1, p2}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 95
    iget-boolean p2, p0, Lorg/apache/httpcore/protocol/ResponseContent;->overwrite:Z

    const-string v0, "Transfer-Encoding"

    const-string v1, "Content-Length"

    if-eqz p2, :cond_0

    .line 96
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 97
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    goto :goto_0

    .line 99
    :cond_0
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 102
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 106
    :goto_0
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/httpcore/StatusLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object p2

    .line 107
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 109
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v3

    .line 110
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->isChunked()Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v5, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {p2, v5}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "chunked"

    .line 111
    invoke-interface {p1, v0, p2}, Lorg/apache/httpcore/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    const-wide/16 v5, 0x0

    cmp-long p2, v3, v5

    if-ltz p2, :cond_2

    .line 113
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v1, p2}, Lorg/apache/httpcore/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    :cond_2
    :goto_1
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object p2

    if-eqz p2, :cond_3

    const-string p2, "Content-Type"

    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 118
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->addHeader(Lorg/apache/httpcore/Header;)V

    .line 121
    :cond_3
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->getContentEncoding()Lorg/apache/httpcore/Header;

    move-result-object p2

    if-eqz p2, :cond_5

    const-string p2, "Content-Encoding"

    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    .line 123
    invoke-interface {v2}, Lorg/apache/httpcore/HttpEntity;->getContentEncoding()Lorg/apache/httpcore/Header;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->addHeader(Lorg/apache/httpcore/Header;)V

    goto :goto_2

    .line 126
    :cond_4
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result p2

    const/16 v0, 0xcc

    if-eq p2, v0, :cond_5

    const/16 v0, 0x130

    if-eq p2, v0, :cond_5

    const/16 v0, 0xcd

    if-eq p2, v0, :cond_5

    const-string p2, "0"

    .line 130
    invoke-interface {p1, v1, p2}, Lorg/apache/httpcore/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_2
    return-void

    .line 103
    :cond_6
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    const-string p2, "Content-Length header already present"

    invoke-direct {p1, p2}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 100
    :cond_7
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    const-string p2, "Transfer-encoding header already present"

    invoke-direct {p1, p2}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
