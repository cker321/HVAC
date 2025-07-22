.class public Lcom/dnake/desktop/component/AppExceptionResolver;
.super Ljava/lang/Object;
.source "AppExceptionResolver.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/ExceptionResolver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method failedJson(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 50
    new-instance v0, Lcom/dnake/desktop/bean/ReturnData;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/ReturnData;-><init>()V

    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/ReturnData;->setSuccess(Z)V

    .line 52
    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/ReturnData;->setErrorCode(I)V

    .line 53
    invoke-virtual {v0, p2}, Lcom/dnake/desktop/bean/ReturnData;->setErrorMsg(Ljava/lang/String;)V

    .line 54
    invoke-static {v0}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public onResolve(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Throwable;)V
    .locals 0

    .line 38
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    instance-of p1, p3, Lcom/yanzhenjie/andserver/error/BasicException;

    if-eqz p1, :cond_0

    .line 40
    move-object p1, p3

    check-cast p1, Lcom/yanzhenjie/andserver/error/BasicException;

    .line 41
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/error/BasicException;->getStatusCode()I

    move-result p1

    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x1f4

    .line 43
    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    .line 45
    :goto_0
    invoke-interface {p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getStatus()I

    move-result p1

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/dnake/desktop/component/AppExceptionResolver;->failedJson(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 46
    new-instance p3, Lcom/yanzhenjie/andserver/framework/body/JsonBody;

    invoke-direct {p3, p1}, Lcom/yanzhenjie/andserver/framework/body/JsonBody;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p3}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-void
.end method
