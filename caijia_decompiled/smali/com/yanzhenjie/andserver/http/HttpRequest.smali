.class public interface abstract Lcom/yanzhenjie/andserver/http/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpContext;
.implements Lcom/yanzhenjie/andserver/http/HttpHeaders;


# static fields
.field public static final SESSION_NAME:Ljava/lang/String; = "ASESSIONID"


# virtual methods
.method public abstract changeSessionId()Ljava/lang/String;
.end method

.method public abstract getAccept()Lcom/yanzhenjie/andserver/util/MediaType;
.end method

.method public abstract getAcceptLanguage()Ljava/util/Locale;
.end method

.method public abstract getAcceptLanguages()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAccepts()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getBody()Lcom/yanzhenjie/andserver/http/RequestBody;
.end method

.method public abstract getContentLength()J
.end method

.method public abstract getContentType()Lcom/yanzhenjie/andserver/util/MediaType;
.end method

.method public abstract getContext()Lcom/yanzhenjie/andserver/http/HttpContext;
.end method

.method public abstract getCookie(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/cookie/Cookie;
.end method

.method public abstract getCookieValue(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getCookies()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDateHeader(Ljava/lang/String;)J
.end method

.method public abstract getHeader(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getHeaderNames()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHeaders(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract getIntHeader(Ljava/lang/String;)I
.end method

.method public abstract getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;
.end method

.method public abstract getParameter()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getParameter(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getParameterNames()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getParameters(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract getPath()Ljava/lang/String;
.end method

.method public abstract getQueries(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract getQuery()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getQuery(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getQueryNames()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRequestDispatcher(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;
.end method

.method public abstract getSession()Lcom/yanzhenjie/andserver/http/session/Session;
.end method

.method public abstract getURI()Ljava/lang/String;
.end method

.method public abstract getValidSession()Lcom/yanzhenjie/andserver/http/session/Session;
.end method

.method public abstract isSessionValid()Z
.end method
