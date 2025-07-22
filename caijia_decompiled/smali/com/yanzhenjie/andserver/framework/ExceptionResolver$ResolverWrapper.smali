.class public Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;
.super Ljava/lang/Object;
.source "ExceptionResolver.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/ExceptionResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/ExceptionResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResolverWrapper"
.end annotation


# instance fields
.field private final mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/framework/ExceptionResolver;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;->mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    return-void
.end method


# virtual methods
.method public onResolve(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Throwable;)V
    .locals 2

    .line 48
    instance-of v0, p3, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;

    if-eqz v0, :cond_0

    .line 49
    move-object v0, p3

    check-cast v0, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;->getMethods()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, ", "

    .line 51
    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Allow"

    invoke-interface {p2, v1, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;->mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    invoke-interface {v0, p1, p2, p3}, Lcom/yanzhenjie/andserver/framework/ExceptionResolver;->onResolve(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Throwable;)V

    return-void
.end method
