.class public Lcom/dnake/desktop/component/AppConfig;
.super Ljava/lang/Object;
.source "AppConfig.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/config/WebConfig;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfig(Landroid/content/Context;Lcom/yanzhenjie/andserver/framework/config/WebConfig$Delegate;)V
    .locals 3

    .line 35
    new-instance v0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;

    const-string v1, "/web"

    invoke-direct {v0, p1, v1}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Lcom/yanzhenjie/andserver/framework/config/WebConfig$Delegate;->addWebsite(Lcom/yanzhenjie/andserver/framework/website/Website;)V

    .line 37
    invoke-static {}, Lcom/yanzhenjie/andserver/framework/config/Multipart;->newBuilder()Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;

    move-result-object v0

    const-wide/32 v1, 0x1400000

    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->allFileMaxSize(J)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;

    move-result-object v0

    const-wide/32 v1, 0x500000

    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->fileMaxSize(J)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;

    move-result-object v0

    const/16 v1, 0x2800

    .line 40
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->maxInMemorySize(I)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v2, "_server_upload_cache_"

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->uploadTempDir(Ljava/io/File;)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;

    move-result-object p1

    .line 42
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->build()Lcom/yanzhenjie/andserver/framework/config/Multipart;

    move-result-object p1

    .line 37
    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/framework/config/WebConfig$Delegate;->setMultipart(Lcom/yanzhenjie/andserver/framework/config/Multipart;)V

    return-void
.end method
