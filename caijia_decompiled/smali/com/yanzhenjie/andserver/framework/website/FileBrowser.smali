.class public Lcom/yanzhenjie/andserver/framework/website/FileBrowser;
.super Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;
.source "FileBrowser.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# static fields
.field private static final FOLDER_HTML_PREFIX:Ljava/lang/String; = "<!DOCTYPE html><html><head><meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\"><metaname=\"format-detection\" content=\"telephone=no\"/> <title>%1$s</title><style>.center_horizontal{margin:0 auto;text-align:center;} *,*::after,*::before {box-sizing: border-box;margin: 0;padding: 0;}a:-webkit-any-link {color: -webkit-link;cursor: auto;text-decoration: underline;}ul {list-style: none;display: block;list-style-type: none;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;-webkit-padding-start: 40px;}li {display: list-item;text-align: -webkit-match-parent;margin-bottom: 5px;}</style></head><body><h1 class=\"center_horizontal\">%2$s</h1><ul>"

.field private static final FOLDER_HTML_SUFFIX:Ljava/lang/String; = "</ul></body></html>"

.field private static final FOLDER_ITEM:Ljava/lang/String; = "<li><a href=\"%1$s\">%2$s</a></li>"


# instance fields
.field private final mRootPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;-><init>()V

    .line 47
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "The rootPath cannot be empty."

    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 48
    sget-object v0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->PATH:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "The format of [%s] is wrong, it should be like [/root/project]."

    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 49
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->mRootPath:Ljava/lang/String;

    return-void
.end method

.method private findPathResource(Ljava/lang/String;)Ljava/io/File;
    .locals 3

    const-string v0, "/"

    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 68
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->mRootPath:Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 69
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v1, p1

    :cond_0
    return-object v1

    .line 71
    :cond_1
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->mRootPath:Ljava/lang/String;

    invoke-direct {v0, v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    return-object v0

    :cond_2
    return-object v1
.end method


# virtual methods
.method public getBody(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/ResponseBody;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 104
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 109
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "file_browser"

    const-string v1, ".html"

    .line 110
    invoke-static {p1, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 111
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 113
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v6, 0x1

    aput-object v2, v4, v6

    const-string v2, "<!DOCTYPE html><html><head><meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\"><metaname=\"format-detection\" content=\"telephone=no\"/> <title>%1$s</title><style>.center_horizontal{margin:0 auto;text-align:center;} *,*::after,*::before {box-sizing: border-box;margin: 0;padding: 0;}a:-webkit-any-link {color: -webkit-link;cursor: auto;text-decoration: underline;}ul {list-style: none;display: block;list-style-type: none;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;-webkit-padding-start: 40px;}li {display: list-item;text-align: -webkit-match-parent;margin-bottom: 5px;}</style></head><body><h1 class=\"center_horizontal\">%2$s</h1><ul>"

    .line 114
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "utf-8"

    .line 115
    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 117
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 118
    array-length v2, v0

    if-lez v2, :cond_0

    .line 119
    array-length v2, v0

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v2, :cond_0

    aget-object v8, v0, v7

    .line 120
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    .line 121
    iget-object v10, p0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->mRootPath:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    .line 122
    iget-object v11, p0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->mRootPath:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v10, v11

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 123
    invoke-virtual {p0, v9}, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->addStartSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-array v10, v3, [Ljava/lang/Object;

    aput-object v9, v10, v5

    .line 124
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v10, v6

    const-string v8, "<li><a href=\"%1$s\">%2$s</a></li>"

    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 125
    invoke-virtual {v8, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/io/OutputStream;->write([B)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_0
    const-string v0, "</ul></body></html>"

    .line 129
    invoke-virtual {v0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 130
    new-instance v0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser$1;

    invoke-direct {v0, p0, p1}, Lcom/yanzhenjie/andserver/framework/website/FileBrowser$1;-><init>(Lcom/yanzhenjie/andserver/framework/website/FileBrowser;Ljava/io/File;)V

    return-object v0

    .line 142
    :cond_1
    new-instance p1, Lcom/yanzhenjie/andserver/framework/body/FileBody;

    invoke-direct {p1, v0}, Lcom/yanzhenjie/andserver/framework/body/FileBody;-><init>(Ljava/io/File;)V

    return-object p1

    .line 106
    :cond_2
    new-instance v0, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 81
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 82
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 84
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

    .line 85
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

    .line 92
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 93
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 95
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public intercept(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z
    .locals 0

    .line 54
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 55
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->findPathResource(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
