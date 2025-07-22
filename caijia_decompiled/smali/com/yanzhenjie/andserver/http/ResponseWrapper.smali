.class public Lcom/yanzhenjie/andserver/http/ResponseWrapper;
.super Ljava/lang/Object;
.source "ResponseWrapper.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpResponse;


# instance fields
.field private mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    return-void
.end method


# virtual methods
.method public addCookie(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)V
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->addCookie(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)V

    return-void
.end method

.method public addDateHeader(Ljava/lang/String;J)V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1, p2, p3}, Lcom/yanzhenjie/andserver/http/HttpResponse;->addDateHeader(Ljava/lang/String;J)V

    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->addIntHeader(Ljava/lang/String;I)V

    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;

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

    .line 105
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getHeaderNames()Ljava/util/List;

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

    .line 99
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getHeaders(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getResponse()Lcom/yanzhenjie/andserver/http/HttpResponse;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getStatus()I

    move-result v0

    return v0
.end method

.method public sendRedirect(Ljava/lang/String;)V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->sendRedirect(Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-void
.end method

.method public setDateHeader(Ljava/lang/String;J)V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1, p2, p3}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setDateHeader(Ljava/lang/String;J)V

    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setIntHeader(Ljava/lang/String;I)V

    return-void
.end method

.method public setStatus(I)V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/ResponseWrapper;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    return-void
.end method
