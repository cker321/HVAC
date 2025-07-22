.class public Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;
.super Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;
.source "AssetsWebsite.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;
    }
.end annotation


# instance fields
.field private isScanned:Z

.field private final mPackageInfo:Landroid/content/pm/PackageInfo;

.field private final mPatternMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mReader:Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

.field private final mRootPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const-string v0, "index.html"

    .line 63
    invoke-direct {p0, p1, p2, v0}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 73
    invoke-direct {p0, p3}, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;-><init>(Ljava/lang/String;)V

    .line 74
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "The rootPath cannot be empty."

    invoke-static {v0, v2}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 75
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    xor-int/2addr p3, v1

    const-string v0, "The indexFileName cannot be empty."

    invoke-static {p3, v0}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 77
    sget-object p3, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->PATH:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 82
    new-instance p3, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-direct {p3, v1}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;-><init>(Landroid/content/res/AssetManager;)V

    iput-object p3, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mReader:Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

    .line 83
    invoke-virtual {p0, p2}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->trimStartSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mRootPath:Ljava/lang/String;

    .line 84
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    .line 86
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    .line 88
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPackageInfo:Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 90
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :cond_0
    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v0

    const-string p2, "The format of [%s] is wrong, it should be like [/root/project]."

    .line 78
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 79
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private tryScanFile()V
    .locals 7

    .line 106
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->isScanned:Z

    if-nez v0, :cond_3

    .line 107
    const-class v0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;

    monitor-enter v0

    .line 108
    :try_start_0
    iget-boolean v1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->isScanned:Z

    if-nez v1, :cond_2

    .line 109
    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mReader:Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mRootPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->scanFile(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 110
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 111
    iget-object v4, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mRootPath:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 112
    invoke-virtual {p0, v4}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->addStartSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 113
    iget-object v5, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-interface {v5, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->getIndexFileName()Ljava/lang/String;

    move-result-object v5

    .line 116
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x0

    .line 117
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    sub-int/2addr v5, v3

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 118
    invoke-virtual {p0, v3}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->addStartSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 119
    iget-object v4, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    iget-object v4, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-virtual {p0, v3}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->addEndSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 123
    :cond_1
    iput-boolean v3, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->isScanned:Z

    .line 125
    :cond_2
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public getBody(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/ResponseBody;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 150
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 151
    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mReader:Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

    invoke-virtual {v1, v0}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 155
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->getFileMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p1

    .line 156
    new-instance v0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;

    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    move-result v2

    int-to-long v2, v2

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/yanzhenjie/andserver/framework/body/StreamBody;-><init>(Ljava/io/InputStream;JLcom/yanzhenjie/andserver/util/MediaType;)V

    return-object v0

    .line 153
    :cond_0
    new-instance v0, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 131
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 132
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 133
    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mReader:Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

    invoke-virtual {v1, v0}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 135
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->md5DigestAsHex(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 137
    :cond_0
    new-instance v0, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 142
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 143
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mReader:Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-wide v0, p1, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public intercept(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z
    .locals 1

    .line 96
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->tryScanFile()V

    .line 98
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 99
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;->mPatternMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
