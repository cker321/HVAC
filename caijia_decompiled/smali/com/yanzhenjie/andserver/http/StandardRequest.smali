.class public Lcom/yanzhenjie/andserver/http/StandardRequest;
.super Ljava/lang/Object;
.source "StandardRequest.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpRequest;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;
    }
.end annotation


# static fields
.field private static final COOKIE_PROCESSOR:Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;


# instance fields
.field private isParsedAccept:Z

.field private isParsedLocale:Z

.field private isParsedParameter:Z

.field private isParsedQuery:Z

.field private isParsedUri:Z

.field private mAccepts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Lcom/yanzhenjie/andserver/http/HttpContext;

.field private mHandler:Lcom/yanzhenjie/andserver/DispatcherHandler;

.field private mLocales:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation
.end field

.field private mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRequest:Lorg/apache/httpcore/HttpRequest;

.field private mRequestLine:Lorg/apache/httpcore/RequestLine;

.field private mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

.field private mUri:Lcom/yanzhenjie/andserver/http/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 59
    new-instance v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/http/StandardRequest;->COOKIE_PROCESSOR:Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpContext;Lcom/yanzhenjie/andserver/DispatcherHandler;Lcom/yanzhenjie/andserver/http/session/SessionManager;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    .line 85
    iput-object p2, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mContext:Lcom/yanzhenjie/andserver/http/HttpContext;

    .line 86
    iput-object p3, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mHandler:Lcom/yanzhenjie/andserver/DispatcherHandler;

    .line 87
    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequestLine:Lorg/apache/httpcore/RequestLine;

    .line 88
    iput-object p4, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    return-void
.end method

.method private parseAccept()V
    .locals 5

    .line 258
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedAccept:Z

    if-eqz v0, :cond_0

    return-void

    .line 262
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mAccepts:Ljava/util/List;

    .line 263
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    const-string v1, "Accept"

    invoke-interface {v0, v1}, Lorg/apache/httpcore/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 264
    array-length v1, v0

    if-lez v1, :cond_1

    .line 265
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 266
    invoke-interface {v3}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaTypes(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 267
    iget-object v4, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mAccepts:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 270
    :cond_1
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mAccepts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 271
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mAccepts:Ljava/util/List;

    sget-object v1, Lcom/yanzhenjie/andserver/util/MediaType;->ALL:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    const/4 v0, 0x1

    .line 274
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedAccept:Z

    return-void
.end method

.method private parseLocale()V
    .locals 6

    .line 291
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedLocale:Z

    if-eqz v0, :cond_0

    return-void

    .line 295
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mLocales:Ljava/util/List;

    .line 296
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    const-string v1, "Accept-Language"

    invoke-interface {v0, v1}, Lorg/apache/httpcore/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 297
    array-length v1, v0

    if-lez v1, :cond_2

    .line 298
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 299
    invoke-interface {v3}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/yanzhenjie/andserver/http/AcceptLanguage;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 300
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/yanzhenjie/andserver/http/AcceptLanguage;

    .line 301
    iget-object v5, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mLocales:Ljava/util/List;

    invoke-virtual {v4}, Lcom/yanzhenjie/andserver/http/AcceptLanguage;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 305
    :cond_2
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mLocales:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 306
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mLocales:Ljava/util/List;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    const/4 v0, 0x1

    .line 309
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedLocale:Z

    return-void
.end method

.method private parseParameter()V
    .locals 2

    .line 406
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedParameter:Z

    if-eqz v0, :cond_0

    return-void

    .line 410
    :cond_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/HttpMethod;->allowBody()Z

    move-result v0

    if-nez v0, :cond_1

    .line 411
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-void

    .line 415
    :cond_1
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getContentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    .line 416
    sget-object v1, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_FORM_URLENCODED:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v1, v0}, Lcom/yanzhenjie/andserver/util/MediaType;->includes(Lcom/yanzhenjie/andserver/util/MediaType;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 418
    :try_start_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getBody()Lcom/yanzhenjie/andserver/http/RequestBody;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, ""

    goto :goto_0

    .line 419
    :cond_2
    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/RequestBody;->string()Ljava/lang/String;

    move-result-object v0

    .line 420
    :goto_0
    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseParameters(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    .line 424
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    if-nez v0, :cond_4

    .line 425
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    :cond_4
    const/4 v0, 0x1

    .line 427
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedParameter:Z

    return-void
.end method

.method private static parseParameters(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 543
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>()V

    .line 544
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v2, "&"

    invoke-direct {v1, p0, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 546
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p0

    const-string v2, "="

    .line 547
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_0

    .line 549
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_0

    const/4 v3, 0x0

    .line 550
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    .line 551
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 552
    sget-object v2, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p0, v2}, Lcom/yanzhenjie/andserver/util/UrlCoder;->urlDecode(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v3, p0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private parseQuery()V
    .locals 1

    .line 165
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedQuery:Z

    if-eqz v0, :cond_0

    return-void

    .line 168
    :cond_0
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseUri()V

    .line 170
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mUri:Lcom/yanzhenjie/andserver/http/Uri;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/Uri;->getParams()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    const/4 v0, 0x1

    .line 171
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedQuery:Z

    return-void
.end method

.method private parseUri()V
    .locals 1

    .line 112
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedUri:Z

    if-eqz v0, :cond_0

    return-void

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getURI()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->newBuilder(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mUri:Lcom/yanzhenjie/andserver/http/Uri;

    .line 117
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedUri:Z

    if-eqz v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x1

    .line 120
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedUri:Z

    return-void
.end method


# virtual methods
.method public changeSessionId()Ljava/lang/String;
    .locals 2

    .line 499
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 503
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    invoke-interface {v1, v0}, Lcom/yanzhenjie/andserver/http/session/SessionManager;->changeSessionId(Lcom/yanzhenjie/andserver/http/session/Session;)V

    .line 504
    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/session/Session;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 501
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No session associated with this request."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAccept()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 2

    .line 246
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getAccepts()Ljava/util/List;

    move-result-object v0

    .line 247
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yanzhenjie/andserver/util/MediaType;

    :goto_0
    return-object v0
.end method

.method public getAcceptLanguage()Ljava/util/Locale;
    .locals 2

    .line 280
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getAcceptLanguages()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Locale;

    return-object v0
.end method

.method public getAcceptLanguages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation

    .line 286
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseLocale()V

    .line 287
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mLocales:Ljava/util/List;

    return-object v0
.end method

.method public getAccepts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation

    .line 253
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseAccept()V

    .line 254
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mAccepts:Ljava/util/List;

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 527
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mContext:Lcom/yanzhenjie/andserver/http/HttpContext;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getBody()Lcom/yanzhenjie/andserver/http/RequestBody;
    .locals 3

    .line 433
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/HttpMethod;->allowBody()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 434
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    instance-of v1, v0, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 435
    check-cast v0, Lorg/apache/httpcore/HttpEntityEnclosingRequest;

    .line 436
    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v2

    .line 440
    :cond_0
    new-instance v1, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;

    invoke-direct {v1, v0, v2}, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;-><init>(Lorg/apache/httpcore/HttpEntity;Lcom/yanzhenjie/andserver/http/StandardRequest$1;)V

    return-object v1

    :cond_1
    return-object v2

    .line 444
    :cond_2
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This method does not allow body."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentLength()J
    .locals 4

    const-string v0, "Content-Length"

    .line 346
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 347
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-wide/16 v2, -0x1

    if-eqz v1, :cond_0

    return-wide v2

    .line 351
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    return-wide v2
.end method

.method public getContentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 2

    const-string v0, "Content-Type"

    .line 360
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 361
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 364
    :cond_0
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public getContext()Lcom/yanzhenjie/andserver/http/HttpContext;
    .locals 1

    .line 521
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mContext:Lcom/yanzhenjie/andserver/http/HttpContext;

    return-object v0
.end method

.method public getCookie(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/cookie/Cookie;
    .locals 4

    .line 325
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getCookies()Ljava/util/List;

    move-result-object v0

    .line 326
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 330
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/http/cookie/Cookie;

    .line 331
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v1

    :cond_2
    return-object v2
.end method

.method public getCookieValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 315
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getCookie(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/cookie/Cookie;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 317
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCookies()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .line 341
    sget-object v0, Lcom/yanzhenjie/andserver/http/StandardRequest;->COOKIE_PROCESSOR:Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    const-string v2, "Cookie"

    invoke-interface {v1, v2}, Lorg/apache/httpcore/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;->parseCookieHeader([Lorg/apache/httpcore/Header;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDateHeader(Ljava/lang/String;)J
    .locals 5

    .line 213
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    const-wide/16 v0, -0x1

    if-nez p1, :cond_0

    return-wide v0

    .line 218
    :cond_0
    invoke-interface {p1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p1

    .line 219
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->parseDate(Ljava/lang/String;)J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-eqz v4, :cond_1

    return-wide v2

    :cond_1
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "The %s cannot be converted to date."

    .line 222
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 223
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 193
    :cond_0
    invoke-interface {p1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getHeaderNames()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 177
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpRequest;->getAllHeaders()[Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 178
    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_1

    .line 182
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 183
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 184
    invoke-interface {v4}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v1

    .line 179
    :cond_2
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 199
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 200
    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_1

    .line 204
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 205
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 206
    invoke-interface {v3}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    .line 201
    :cond_2
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getIntHeader(Ljava/lang/String;)I
    .locals 2

    .line 231
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequest:Lorg/apache/httpcore/HttpRequest;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, -0x1

    return p1

    .line 237
    :cond_0
    :try_start_0
    invoke-interface {p1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 239
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequestLine:Lorg/apache/httpcore/RequestLine;

    invoke-interface {v0}, Lorg/apache/httpcore/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/HttpMethod;->reverse(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    return-object v0
.end method

.method public getParameter()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 401
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseParameter()V

    .line 402
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getQuery()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    :goto_0
    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 382
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseParameter()V

    .line 383
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->getFirst(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 384
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getQuery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getParameterNames()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 370
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseParameter()V

    .line 371
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 372
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getQueryNames()Ljava/util/List;

    move-result-object v1

    .line 373
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 374
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-object v0
.end method

.method public getParameters(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 390
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseParameter()V

    .line 391
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mParameter:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 392
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    return-object v0

    .line 393
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getQueries(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 131
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseUri()V

    .line 132
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mUri:Lcom/yanzhenjie/andserver/http/Uri;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQueries(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 152
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseQuery()V

    .line 153
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_0

    .line 154
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public getQuery()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 160
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseQuery()V

    .line 161
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object v0
.end method

.method public getQuery(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 145
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseQuery()V

    .line 146
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->getFirst(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getQueryNames()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 138
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseQuery()V

    .line 139
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getRequestDispatcher(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;
    .locals 1

    .line 516
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mHandler:Lcom/yanzhenjie/andserver/DispatcherHandler;

    invoke-virtual {v0, p0, p1}, Lcom/yanzhenjie/andserver/DispatcherHandler;->getRequestDispatcher(Lcom/yanzhenjie/andserver/http/HttpRequest;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;

    move-result-object p1

    return-object p1
.end method

.method public getSession()Lcom/yanzhenjie/andserver/http/session/Session;
    .locals 5

    const-string v0, "http.request.Session"

    .line 463
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 464
    instance-of v1, v0, Lcom/yanzhenjie/andserver/http/session/Session;

    if-eqz v1, :cond_0

    .line 465
    check-cast v0, Lcom/yanzhenjie/andserver/http/session/Session;

    return-object v0

    .line 468
    :cond_0
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getCookies()Ljava/util/List;

    move-result-object v0

    .line 469
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    return-object v2

    .line 474
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/http/cookie/Cookie;

    .line 475
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ASESSIONID"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 476
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    move-object v0, v2

    .line 481
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v2

    .line 487
    :cond_4
    :try_start_0
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    invoke-interface {v1, v0}, Lcom/yanzhenjie/andserver/http/session/SessionManager;->findSession(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 491
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v0

    .line 489
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-object v2
.end method

.method public getURI()Ljava/lang/String;
    .locals 2

    .line 100
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->isParsedUri:Z

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mUri:Lcom/yanzhenjie/andserver/http/Uri;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mRequestLine:Lorg/apache/httpcore/RequestLine;

    invoke-interface {v0}, Lorg/apache/httpcore/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "/"

    :cond_1
    return-object v0
.end method

.method public getValidSession()Lcom/yanzhenjie/andserver/http/session/Session;
    .locals 2

    .line 450
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    if-nez v0, :cond_0

    .line 452
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/session/SessionManager;->createSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    goto :goto_0

    .line 453
    :cond_0
    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/session/Session;->isValid()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 454
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/session/SessionManager;->createSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    :cond_1
    :goto_0
    const-string v1, "http.request.Session"

    .line 457
    invoke-virtual {p0, v1, v0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public isSessionValid()Z
    .locals 1

    .line 509
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->getSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 510
    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/session/Session;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 538
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mContext:Lcom/yanzhenjie/andserver/http/HttpContext;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 532
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mContext:Lcom/yanzhenjie/andserver/http/HttpContext;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/http/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 1

    .line 124
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest;->parseUri()V

    .line 125
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mUri:Lcom/yanzhenjie/andserver/http/Uri;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/Uri;->builder()Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->setPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->build()Lcom/yanzhenjie/andserver/http/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest;->mUri:Lcom/yanzhenjie/andserver/http/Uri;

    return-void
.end method
