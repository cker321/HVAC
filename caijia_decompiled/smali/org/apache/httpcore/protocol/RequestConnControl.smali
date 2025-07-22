.class public Lorg/apache/httpcore/protocol/RequestConnControl;
.super Ljava/lang/Object;
.source "RequestConnControl.java"

# interfaces
.implements Lorg/apache/httpcore/HttpRequestInterceptor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string p2, "HTTP request"

    .line 57
    invoke-static {p1, p2}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object p2

    const-string v0, "CONNECT"

    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    :cond_0
    const-string p2, "Connection"

    .line 64
    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Keep-Alive"

    .line 67
    invoke-interface {p1, p2, v0}, Lorg/apache/httpcore/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method
