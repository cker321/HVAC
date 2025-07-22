.class public interface abstract Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;
.super Ljava/lang/Object;
.source "CookieProcessor.java"


# virtual methods
.method public abstract generateHeader(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)Ljava/lang/String;
.end method

.method public abstract parseCookieHeader([Lorg/apache/httpcore/Header;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/httpcore/Header;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end method
