.class public Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;
.super Ljava/lang/Object;
.source "DefaultHttpRequestFactory.java"

# interfaces
.implements Lorg/apache/httpcore/HttpRequestFactory;


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;

.field private static final RFC2616_COMMON_METHODS:[Ljava/lang/String;

.field private static final RFC2616_ENTITY_ENC_METHODS:[Ljava/lang/String;

.field private static final RFC2616_SPECIAL_METHODS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 48
    new-instance v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;

    const-string v0, "GET"

    .line 50
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_COMMON_METHODS:[Ljava/lang/String;

    const-string v0, "POST"

    const-string v1, "PUT"

    const-string v2, "DELETE"

    const-string v3, "PATCH"

    .line 54
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_ENTITY_ENC_METHODS:[Ljava/lang/String;

    const-string v0, "HEAD"

    const-string v1, "OPTIONS"

    const-string v2, "TRACE"

    const-string v3, "CONNECT"

    .line 61
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_SPECIAL_METHODS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isOneOf([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 73
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p0, v2

    .line 74
    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method


# virtual methods
.method public newHttpRequest(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/MethodNotSupportedException;
        }
    .end annotation

    .line 100
    sget-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_COMMON_METHODS:[Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->isOneOf([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpRequest;

    invoke-direct {v0, p1, p2}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 102
    :cond_0
    sget-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_ENTITY_ENC_METHODS:[Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->isOneOf([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 103
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;

    invoke-direct {v0, p1, p2}, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 104
    :cond_1
    sget-object v0, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_SPECIAL_METHODS:[Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->isOneOf([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 105
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpRequest;

    invoke-direct {v0, p1, p2}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 107
    :cond_2
    new-instance p2, Lorg/apache/httpcore/MethodNotSupportedException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " method not supported"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public newHttpRequest(Lorg/apache/httpcore/RequestLine;)Lorg/apache/httpcore/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/MethodNotSupportedException;
        }
    .end annotation

    const-string v0, "Request line"

    .line 84
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 86
    sget-object v1, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_COMMON_METHODS:[Ljava/lang/String;

    invoke-static {v1, v0}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->isOneOf([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpRequest;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Lorg/apache/httpcore/RequestLine;)V

    return-object v0

    .line 88
    :cond_0
    sget-object v1, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_ENTITY_ENC_METHODS:[Ljava/lang/String;

    invoke-static {v1, v0}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->isOneOf([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;-><init>(Lorg/apache/httpcore/RequestLine;)V

    return-object v0

    .line 90
    :cond_1
    sget-object v1, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->RFC2616_SPECIAL_METHODS:[Ljava/lang/String;

    invoke-static {v1, v0}, Lorg/apache/httpcore/impl/DefaultHttpRequestFactory;->isOneOf([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 91
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpRequest;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Lorg/apache/httpcore/RequestLine;)V

    return-object v0

    .line 93
    :cond_2
    new-instance p1, Lorg/apache/httpcore/MethodNotSupportedException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " method not supported"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/apache/httpcore/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
