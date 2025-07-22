.class final Lcom/yanzhenjie/andserver/framework/ExceptionResolver$1;
.super Ljava/lang/Object;
.source "ExceptionResolver.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/ExceptionResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/ExceptionResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResolve(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Throwable;)V
    .locals 0

    .line 61
    instance-of p1, p3, Lcom/yanzhenjie/andserver/error/BasicException;

    if-eqz p1, :cond_0

    .line 62
    move-object p1, p3

    check-cast p1, Lcom/yanzhenjie/andserver/error/BasicException;

    .line 63
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/error/BasicException;->getStatusCode()I

    move-result p1

    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x1f4

    .line 65
    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    .line 67
    :goto_0
    new-instance p1, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-void
.end method
