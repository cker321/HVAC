.class public Lcom/yanzhenjie/andserver/error/MethodNotSupportException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "MethodNotSupportException.java"


# static fields
.field private static final MESSAGE:Ljava/lang/String; = "The request method [%s] is not supported."


# instance fields
.field private mMethods:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpMethod;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 33
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/HttpMethod;->value()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "The request method [%s] is not supported."

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x195

    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpMethod;Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 37
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/HttpMethod;->value()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "The request method [%s] is not supported."

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x195

    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public getMethods()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
            ">;"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;->mMethods:Ljava/util/List;

    return-object v0
.end method

.method public setMethods(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
            ">;)V"
        }
    .end annotation

    .line 45
    iput-object p1, p0, Lcom/yanzhenjie/andserver/error/MethodNotSupportException;->mMethods:Ljava/util/List;

    return-void
.end method
