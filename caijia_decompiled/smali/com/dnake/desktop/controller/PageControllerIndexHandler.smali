.class public final Lcom/dnake/desktop/controller/PageControllerIndexHandler;
.super Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;
.source "PageControllerIndexHandler.java"


# instance fields
.field private mHost:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/yanzhenjie/andserver/framework/handler/MappingHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 30
    iput-object p1, p0, Lcom/dnake/desktop/controller/PageControllerIndexHandler;->mHost:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected onHandle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string p2, "android.context"

    .line 35
    invoke-interface {p1, p2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Context;

    .line 36
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p2

    .line 37
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    const-string v1, "http.message.converter"

    .line 39
    invoke-interface {p1, v1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 41
    instance-of v2, v1, Lcom/yanzhenjie/andserver/framework/MessageConverter;

    if-eqz v2, :cond_0

    .line 42
    check-cast v1, Lcom/yanzhenjie/andserver/framework/MessageConverter;

    .line 46
    :cond_0
    instance-of v1, p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    if-eqz v1, :cond_1

    .line 47
    move-object v1, p1

    check-cast v1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    .line 51
    :cond_1
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/HttpMethod;->allowBody()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 52
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getBody()Lcom/yanzhenjie/andserver/http/RequestBody;

    .line 55
    :cond_2
    invoke-virtual {p0, p2}, Lcom/dnake/desktop/controller/PageControllerIndexHandler;->getPathVariable(Ljava/lang/String;)Ljava/util/Map;

    .line 58
    iget-object p1, p0, Lcom/dnake/desktop/controller/PageControllerIndexHandler;->mHost:Ljava/lang/Object;

    check-cast p1, Lcom/dnake/desktop/controller/PageController;

    invoke-virtual {p1}, Lcom/dnake/desktop/controller/PageController;->index()Ljava/lang/String;

    move-result-object p1

    .line 59
    new-instance p2, Lcom/yanzhenjie/andserver/framework/view/ObjectView;

    const/4 v0, 0x0

    invoke-direct {p2, v0, p1}, Lcom/yanzhenjie/andserver/framework/view/ObjectView;-><init>(ZLjava/lang/Object;)V

    return-object p2
.end method
