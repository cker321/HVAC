.class public Lcom/yanzhenjie/andserver/http/StandardResponse;
.super Ljava/lang/Object;
.source "StandardResponse.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpResponse;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;
    }
.end annotation


# static fields
.field private static final COOKIE_PROCESSOR:Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;


# instance fields
.field private mResponse:Lorg/apache/httpcore/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    new-instance v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/http/StandardResponse;->COOKIE_PROCESSOR:Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/HttpResponse;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    return-void
.end method


# virtual methods
.method public addCookie(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)V
    .locals 1

    .line 135
    sget-object v0, Lcom/yanzhenjie/andserver/http/StandardResponse;->COOKIE_PROCESSOR:Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;->generateHeader(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Set-Cookie"

    invoke-virtual {p0, v0, p1}, Lcom/yanzhenjie/andserver/http/StandardResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addDateHeader(Ljava/lang/String;J)V
    .locals 0

    .line 85
    invoke-static {p2, p3}, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->formatDate(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/StandardResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0, p1, p2}, Lorg/apache/httpcore/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addIntHeader(Ljava/lang/String;I)V
    .locals 0

    .line 95
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/StandardResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 75
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

    .line 121
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpResponse;->getAllHeaders()[Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 122
    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_1

    .line 126
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 127
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 128
    invoke-interface {v4}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v1

    .line 123
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

    .line 106
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 107
    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_1

    .line 111
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 112
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 113
    invoke-interface {v3}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    .line 108
    :cond_2
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getStatus()I
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public sendRedirect(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x12e

    .line 140
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/http/StandardResponse;->setStatus(I)V

    const-string v0, "Location"

    .line 141
    invoke-virtual {p0, v0, p1}, Lcom/yanzhenjie/andserver/http/StandardResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V
    .locals 3

    .line 146
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    new-instance v1, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;-><init>(Lcom/yanzhenjie/andserver/http/ResponseBody;Lcom/yanzhenjie/andserver/http/StandardResponse$1;)V

    invoke-interface {v0, v1}, Lorg/apache/httpcore/HttpResponse;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    return-void
.end method

.method public setDateHeader(Ljava/lang/String;J)V
    .locals 0

    .line 80
    invoke-static {p2, p3}, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->formatDate(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/StandardResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0, p1, p2}, Lorg/apache/httpcore/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setIntHeader(Ljava/lang/String;I)V
    .locals 0

    .line 90
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/StandardResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setStatus(I)V
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse;->mResponse:Lorg/apache/httpcore/HttpResponse;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpResponse;->setStatusCode(I)V

    return-void
.end method
