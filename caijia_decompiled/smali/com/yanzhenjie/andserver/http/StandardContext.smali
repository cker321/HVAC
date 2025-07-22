.class public Lcom/yanzhenjie/andserver/http/StandardContext;
.super Ljava/lang/Object;
.source "StandardContext.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpContext;


# instance fields
.field private mContext:Lorg/apache/httpcore/protocol/HttpContext;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardContext;->mContext:Lorg/apache/httpcore/protocol/HttpContext;

    return-void
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardContext;->mContext:Lorg/apache/httpcore/protocol/HttpContext;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardContext;->mContext:Lorg/apache/httpcore/protocol/HttpContext;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardContext;->mContext:Lorg/apache/httpcore/protocol/HttpContext;

    invoke-interface {v0, p1, p2}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
