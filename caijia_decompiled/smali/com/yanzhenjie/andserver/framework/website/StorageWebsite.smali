.class public Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;
.super Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;
.source "StorageWebsite.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# instance fields
.field private final mRootPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const-string v0, "index.html"

    .line 46
    invoke-direct {p0, p1, v0}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 56
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    const-string v0, "The rootPath cannot be empty."

    invoke-static {p2, v0}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 58
    sget-object p2, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->PATH:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p2

    const-string v0, "The format of [%s] is wrong, it should be like [/root/project]."

    invoke-static {p2, v0}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 60
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->mRootPath:Ljava/lang/String;

    return-void
.end method

.method private findPathResource(Ljava/lang/String;)Ljava/io/File;
    .locals 2

    const-string v0, "/"

    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->mRootPath:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->getIndexFileName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object p1

    .line 84
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->mRootPath:Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 86
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v0

    .line 89
    :cond_1
    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->getIndexFileName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public getBody(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/ResponseBody;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 124
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 128
    new-instance p1, Lcom/yanzhenjie/andserver/framework/body/FileBody;

    invoke-direct {p1, v0}, Lcom/yanzhenjie/andserver/framework/body/FileBody;-><init>(Ljava/io/File;)V

    return-object p1

    .line 126
    :cond_0
    new-instance v0, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 101
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 102
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 105
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->md5DigestAsHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 112
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 113
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 115
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public intercept(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z
    .locals 0

    .line 65
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 66
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/StorageWebsite;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
