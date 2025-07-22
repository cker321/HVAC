.class public abstract Lcom/yanzhenjie/andserver/framework/website/Website;
.super Ljava/lang/Object;
.source "Website.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;
.implements Lcom/yanzhenjie/andserver/framework/ETag;
.implements Lcom/yanzhenjie/andserver/framework/LastModified;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getBody(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/ResponseBody;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public getHandler(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;
    .locals 0

    .line 52
    new-instance p1, Lcom/yanzhenjie/andserver/framework/website/Website$1;

    invoke-direct {p1, p0}, Lcom/yanzhenjie/andserver/framework/website/Website$1;-><init>(Lcom/yanzhenjie/andserver/framework/website/Website;)V

    return-object p1
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const-wide/16 v0, 0x0

    return-wide v0
.end method
