.class public Lcom/yanzhenjie/andserver/http/RequestWrapper;
.super Ljava/lang/Object;
.source "RequestWrapper.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpRequest;


# instance fields
.field private mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpRequest;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    return-void
.end method


# virtual methods
.method public changeSessionId()Ljava/lang/String;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->changeSessionId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAccept()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAccept()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public getAcceptLanguage()Ljava/util/Locale;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAcceptLanguage()Ljava/util/Locale;

    move-result-object v0

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

    .line 140
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAcceptLanguages()Ljava/util/List;

    move-result-object v0

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

    .line 128
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAccepts()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getBody()Lcom/yanzhenjie/andserver/http/RequestBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 199
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getBody()Lcom/yanzhenjie/andserver/http/RequestBody;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getContentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public getContext()Lcom/yanzhenjie/andserver/http/HttpContext;
    .locals 1

    .line 233
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getContext()Lcom/yanzhenjie/andserver/http/HttpContext;

    move-result-object v0

    return-object v0
.end method

.method public getCookie(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/cookie/Cookie;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getCookie(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/cookie/Cookie;

    move-result-object p1

    return-object p1
.end method

.method public getCookieValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getCookieValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCookies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .line 158
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getCookies()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDateHeader(Ljava/lang/String;)J
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getDateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getHeaderNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeaderNames()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/List;
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

    .line 106
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeaders(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getIntHeader(Ljava/lang/String;)I
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getIntHeader(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

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

    .line 193
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameter()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getParameterNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 175
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameterNames()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getParameters(Ljava/lang/String;)Ljava/util/List;
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

    .line 187
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameters(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

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

    .line 82
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getQueries(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

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

    .line 88
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getQuery()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    return-object v0
.end method

.method public getQuery(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getQuery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getQueryNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getQueryNames()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRequest()Lcom/yanzhenjie/andserver/http/HttpRequest;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    return-object v0
.end method

.method public getRequestDispatcher(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getRequestDispatcher(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;

    move-result-object p1

    return-object p1
.end method

.method public getSession()Lcom/yanzhenjie/andserver/http/session/Session;
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValidSession()Lcom/yanzhenjie/andserver/http/session/Session;
    .locals 1

    .line 205
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getValidSession()Lcom/yanzhenjie/andserver/http/session/Session;

    move-result-object v0

    return-object v0
.end method

.method public isSessionValid()Z
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->isSessionValid()Z

    move-result v0

    return v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/RequestWrapper;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
