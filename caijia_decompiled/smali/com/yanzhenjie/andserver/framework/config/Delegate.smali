.class public Lcom/yanzhenjie/andserver/framework/config/Delegate;
.super Ljava/lang/Object;
.source "Delegate.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/config/WebConfig$Delegate;


# instance fields
.field private mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

.field private mWebsites:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/website/Website;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/framework/config/Delegate;->mWebsites:Ljava/util/List;

    return-void
.end method

.method public static newInstance()Lcom/yanzhenjie/andserver/framework/config/Delegate;
    .locals 1

    .line 29
    new-instance v0, Lcom/yanzhenjie/andserver/framework/config/Delegate;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/config/Delegate;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addWebsite(Lcom/yanzhenjie/andserver/framework/website/Website;)V
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/config/Delegate;->mWebsites:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getMultipart()Lcom/yanzhenjie/andserver/framework/config/Multipart;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/config/Delegate;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    return-object v0
.end method

.method public getWebsites()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/website/Website;",
            ">;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/config/Delegate;->mWebsites:Ljava/util/List;

    return-object v0
.end method

.method public setMultipart(Lcom/yanzhenjie/andserver/framework/config/Multipart;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/config/Delegate;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    return-void
.end method
