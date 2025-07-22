.class public abstract Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;
.super Lcom/yanzhenjie/andserver/framework/website/Website;
.source "BasicWebsite.java"


# static fields
.field public static final DEFAULT_INDEX:Ljava/lang/String; = "index.html"


# instance fields
.field private final mIndexFileName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "index.html"

    .line 37
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 45
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/framework/website/Website;-><init>()V

    .line 46
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "The indexFileName cannot be empty."

    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 47
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;->mIndexFileName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected addEndSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 92
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method protected addStartSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 78
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public getETag(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method protected final getIndexFileName()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;->mIndexFileName:Ljava/lang/String;

    return-object v0
.end method

.method public getLastModified(Lcom/yanzhenjie/andserver/http/HttpRequest;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected trimEndSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 119
    :goto_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 120
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method protected trimSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 132
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;->trimStartSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 133
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/BasicWebsite;->trimEndSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected trimStartSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 106
    :goto_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 107
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    return-object p1
.end method
