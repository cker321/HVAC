.class public interface abstract Lcom/yanzhenjie/andserver/http/HttpResponse;
.super Ljava/lang/Object;
.source "HttpResponse.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/StatusCode;
.implements Lcom/yanzhenjie/andserver/http/HttpHeaders;


# virtual methods
.method public abstract addCookie(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)V
.end method

.method public abstract addDateHeader(Ljava/lang/String;J)V
.end method

.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addIntHeader(Ljava/lang/String;I)V
.end method

.method public abstract containsHeader(Ljava/lang/String;)Z
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

.method public abstract getStatus()I
.end method

.method public abstract sendRedirect(Ljava/lang/String;)V
.end method

.method public abstract setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V
.end method

.method public abstract setDateHeader(Ljava/lang/String;J)V
.end method

.method public abstract setHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setIntHeader(Ljava/lang/String;I)V
.end method

.method public abstract setStatus(I)V
.end method
