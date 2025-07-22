.class public Lcom/dnake/desktop/component/LoggerInterceptor;
.super Ljava/lang/Object;
.source "LoggerInterceptor.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIntercept(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;)Z
    .locals 0

    .line 37
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    .line 38
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 39
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getParameter()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    const/4 p1, 0x0

    return p1
.end method
