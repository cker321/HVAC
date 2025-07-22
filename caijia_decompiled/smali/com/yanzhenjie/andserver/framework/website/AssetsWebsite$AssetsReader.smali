.class public Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;
.super Ljava/lang/Object;
.source "AssetsWebsite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AssetsReader"
.end annotation


# instance fields
.field private mAssetManager:Landroid/content/res/AssetManager;


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;)V
    .locals 0

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->mAssetManager:Landroid/content/res/AssetManager;

    return-void
.end method


# virtual methods
.method public getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1

    .line 185
    :try_start_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->mAssetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public isFile(Ljava/lang/String;)Z
    .locals 0

    .line 199
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public list(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 211
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 213
    :try_start_0
    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->mAssetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 214
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-object v0
.end method

.method public scanFile(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 229
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "The path cannot be empty."

    invoke-static {v0, v1}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 231
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 232
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 233
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 235
    :cond_0
    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->list(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 236
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 237
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 238
    invoke-virtual {p0, v2}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 239
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 241
    :cond_2
    invoke-virtual {p0, v2}, Lcom/yanzhenjie/andserver/framework/website/AssetsWebsite$AssetsReader;->scanFile(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 242
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 243
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_3
    :goto_1
    return-object v0
.end method
