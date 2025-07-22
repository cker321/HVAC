.class public Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;
.super Ljava/lang/Object;
.source "DefaultConnectionReuseStrategy.java"

# interfaces
.implements Lorg/apache/httpcore/ConnectionReuseStrategy;


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 70
    new-instance v0, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 223
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object p1

    const-string v1, "HEAD"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    .line 226
    :cond_0
    invoke-interface {p2}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result p1

    const/16 p2, 0xc8

    if-lt p1, p2, :cond_1

    const/16 p2, 0xcc

    if-eq p1, p2, :cond_1

    const/16 p2, 0x130

    if-eq p1, p2, :cond_1

    const/16 p2, 0xcd

    if-eq p1, p2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method


# virtual methods
.method protected createTokenIterator(Lorg/apache/httpcore/HeaderIterator;)Lorg/apache/httpcore/TokenIterator;
    .locals 1

    .line 219
    new-instance v0, Lorg/apache/httpcore/message/BasicTokenIterator;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/message/BasicTokenIterator;-><init>(Lorg/apache/httpcore/HeaderIterator;)V

    return-object v0
.end method

.method public keepAlive(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)Z
    .locals 9

    const-string v0, "HTTP response"

    .line 80
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP context"

    .line 81
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 86
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    const-string v1, "Transfer-Encoding"

    const-string v2, "Content-Length"

    const/4 v3, 0x0

    const/16 v4, 0xcc

    if-ne v0, v4, :cond_1

    .line 87
    invoke-interface {p1, v2}, Lorg/apache/httpcore/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 90
    :try_start_0
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v0, :cond_0

    return v3

    :catch_0
    nop

    .line 99
    :cond_0
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_1

    return v3

    :cond_1
    const-string v0, "http.request"

    .line 105
    invoke-interface {p2, v0}, Lorg/apache/httpcore/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/httpcore/HttpRequest;

    const-string v0, "Close"

    const-string v4, "Connection"

    if-eqz p2, :cond_3

    .line 108
    :try_start_1
    new-instance v5, Lorg/apache/httpcore/message/BasicTokenIterator;

    invoke-interface {p2, v4}, Lorg/apache/httpcore/HttpRequest;->headerIterator(Ljava/lang/String;)Lorg/apache/httpcore/HeaderIterator;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/httpcore/message/BasicTokenIterator;-><init>(Lorg/apache/httpcore/HeaderIterator;)V

    .line 109
    :cond_2
    invoke-interface {v5}, Lorg/apache/httpcore/TokenIterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 110
    invoke-interface {v5}, Lorg/apache/httpcore/TokenIterator;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 111
    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6
    :try_end_1
    .catch Lorg/apache/httpcore/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v6, :cond_2

    :catch_1
    return v3

    .line 123
    :cond_3
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/httpcore/StatusLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v5

    .line 124
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v1

    const/4 v6, 0x1

    if-eqz v1, :cond_4

    .line 126
    invoke-interface {v1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p2

    const-string v1, "chunked"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    return v3

    .line 130
    :cond_4
    invoke-direct {p0, p2, p1}, Lorg/apache/httpcore/impl/DefaultConnectionReuseStrategy;->canResponseHaveBody(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 131
    invoke-interface {p1, v2}, Lorg/apache/httpcore/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object p2

    .line 133
    array-length v1, p2

    if-ne v1, v6, :cond_5

    .line 134
    aget-object p2, p2, v3

    .line 136
    :try_start_2
    invoke-interface {p2}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    const-wide/16 v7, 0x0

    cmp-long p2, v1, v7

    if-gez p2, :cond_6

    :catch_2
    :cond_5
    return v3

    .line 152
    :cond_6
    invoke-interface {p1, v4}, Lorg/apache/httpcore/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/httpcore/HeaderIterator;

    move-result-object p2

    .line 153
    invoke-interface {p2}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_7

    const-string p2, "Proxy-Connection"

    .line 154
    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/httpcore/HeaderIterator;

    move-result-object p2

    .line 180
    :cond_7
    invoke-interface {p2}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 182
    :try_start_3
    new-instance p1, Lorg/apache/httpcore/message/BasicTokenIterator;

    invoke-direct {p1, p2}, Lorg/apache/httpcore/message/BasicTokenIterator;-><init>(Lorg/apache/httpcore/HeaderIterator;)V

    const/4 p2, 0x0

    .line 184
    :cond_8
    :goto_0
    invoke-interface {p1}, Lorg/apache/httpcore/TokenIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 185
    invoke-interface {p1}, Lorg/apache/httpcore/TokenIterator;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 186
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    return v3

    :cond_9
    const-string v2, "Keep-Alive"

    .line 188
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1
    :try_end_3
    .catch Lorg/apache/httpcore/ParseException; {:try_start_3 .. :try_end_3} :catch_3

    if-eqz v1, :cond_8

    const/4 p2, 0x1

    goto :goto_0

    :cond_a
    if-eqz p2, :cond_b

    return v6

    :catch_3
    return v3

    .line 205
    :cond_b
    sget-object p1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {v5, p1}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result p1

    xor-int/2addr p1, v6

    return p1
.end method
