.class public Lorg/apache/httpcore/message/BasicHttpRequest;
.super Lorg/apache/httpcore/message/AbstractHttpMessage;
.source "BasicHttpRequest.java"

# interfaces
.implements Lorg/apache/httpcore/HttpRequest;


# instance fields
.field private final method:Ljava/lang/String;

.field private requestline:Lorg/apache/httpcore/RequestLine;

.field private final uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 56
    invoke-direct {p0}, Lorg/apache/httpcore/message/AbstractHttpMessage;-><init>()V

    const-string v0, "Method name"

    .line 57
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->method:Ljava/lang/String;

    const-string p1, "Request URI"

    .line 58
    invoke-static {p2, p1}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->uri:Ljava/lang/String;

    const/4 p1, 0x0

    .line 59
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->requestline:Lorg/apache/httpcore/RequestLine;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)V
    .locals 1

    .line 71
    new-instance v0, Lorg/apache/httpcore/message/BasicRequestLine;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/httpcore/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)V

    invoke-direct {p0, v0}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Lorg/apache/httpcore/RequestLine;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/RequestLine;)V
    .locals 1

    .line 80
    invoke-direct {p0}, Lorg/apache/httpcore/message/AbstractHttpMessage;-><init>()V

    const-string v0, "Request line"

    .line 81
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/RequestLine;

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->requestline:Lorg/apache/httpcore/RequestLine;

    .line 82
    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->method:Ljava/lang/String;

    .line 83
    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getUri()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->uri:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;
    .locals 1

    .line 93
    invoke-virtual {p0}, Lorg/apache/httpcore/message/BasicHttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/RequestLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    return-object v0
.end method

.method public getRequestLine()Lorg/apache/httpcore/RequestLine;
    .locals 4

    .line 103
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->requestline:Lorg/apache/httpcore/RequestLine;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Lorg/apache/httpcore/message/BasicRequestLine;

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->method:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->uri:Ljava/lang/String;

    sget-object v3, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/httpcore/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)V

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->requestline:Lorg/apache/httpcore/RequestLine;

    .line 106
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->requestline:Lorg/apache/httpcore/RequestLine;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->uri:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHttpRequest;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
