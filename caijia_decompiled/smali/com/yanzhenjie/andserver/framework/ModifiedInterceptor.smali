.class public Lcom/yanzhenjie/andserver/framework/ModifiedInterceptor;
.super Ljava/lang/Object;
.source "ModifiedInterceptor.java"

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
    .locals 4

    const-string v0, "AndServer"

    .line 38
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v1

    .line 39
    sget-object v2, Lcom/yanzhenjie/andserver/http/HttpMethod;->GET:Lcom/yanzhenjie/andserver/http/HttpMethod;

    if-eq v1, v2, :cond_1

    sget-object v2, Lcom/yanzhenjie/andserver/http/HttpMethod;->HEAD:Lcom/yanzhenjie/andserver/http/HttpMethod;

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 42
    :try_start_0
    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;->getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v2

    .line 44
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    const-wide/16 v2, -0x1

    .line 48
    :try_start_1
    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;->getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J

    move-result-wide v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p3

    .line 50
    invoke-static {v0, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    :goto_2
    new-instance p3, Lcom/yanzhenjie/andserver/http/Modified;

    invoke-direct {p3, p1, p2}, Lcom/yanzhenjie/andserver/http/Modified;-><init>(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    invoke-virtual {p3, v1, v2, v3}, Lcom/yanzhenjie/andserver/http/Modified;->process(Ljava/lang/String;J)Z

    move-result p1

    return p1
.end method
