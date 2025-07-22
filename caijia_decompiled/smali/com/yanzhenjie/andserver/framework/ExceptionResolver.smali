.class public interface abstract Lcom/yanzhenjie/andserver/framework/ExceptionResolver;
.super Ljava/lang/Object;
.source "ExceptionResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;
    }
.end annotation


# static fields
.field public static final DEFAULT:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    new-instance v0, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$1;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$1;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/framework/ExceptionResolver;->DEFAULT:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    return-void
.end method


# virtual methods
.method public abstract onResolve(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Throwable;)V
.end method
