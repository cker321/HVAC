.class public interface abstract Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;
.super Ljava/lang/Object;
.source "RequestHandler.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/ETag;
.implements Lcom/yanzhenjie/andserver/framework/LastModified;


# virtual methods
.method public abstract handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
