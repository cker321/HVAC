.class Lcom/yanzhenjie/andserver/framework/website/Website$1;
.super Ljava/lang/Object;
.source "Website.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/framework/website/Website;->getHandler(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/framework/website/Website;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/framework/website/Website;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/Website$1;->this$0:Lcom/yanzhenjie/andserver/framework/website/Website;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/Website$1;->this$0:Lcom/yanzhenjie/andserver/framework/website/Website;

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/website/Website;->getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/Website$1;->this$0:Lcom/yanzhenjie/andserver/framework/website/Website;

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/website/Website;->getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J

    move-result-wide v0

    return-wide v0
.end method

.method public handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 66
    new-instance p2, Lcom/yanzhenjie/andserver/framework/view/BodyView;

    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/Website$1;->this$0:Lcom/yanzhenjie/andserver/framework/website/Website;

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/website/Website;->getBody(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/ResponseBody;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/framework/view/BodyView;-><init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-object p2
.end method
