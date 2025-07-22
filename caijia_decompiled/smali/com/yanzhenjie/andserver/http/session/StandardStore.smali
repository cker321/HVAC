.class public Lcom/yanzhenjie/andserver/http/session/StandardStore;
.super Ljava/lang/Object;
.source "StandardStore.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/session/Store;


# instance fields
.field private mDirectory:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public getSession(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/session/StandardSession;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 78
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    .line 84
    :try_start_0
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    new-instance v2, Ljava/io/ObjectInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    :try_start_1
    new-instance v0, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;-><init>()V

    .line 91
    invoke-virtual {v0, v2}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->readObject(Ljava/io/ObjectInputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 97
    invoke-static {v2}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    .line 94
    :goto_1
    :try_start_2
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    invoke-direct {v1, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/IOUtils;->delFileOrFolder(Ljava/io/File;)Z

    .line 95
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p1

    move-object v0, v2

    .line 97
    :goto_2
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 98
    throw p1

    .line 79
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The id can not be empty or null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public remove(Lcom/yanzhenjie/andserver/http/session/StandardSession;)Z
    .locals 2

    .line 103
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->getId()Ljava/lang/String;

    move-result-object v0

    .line 104
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->delFileOrFolder(Ljava/io/File;)Z

    move-result p1

    return p1

    .line 105
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "The session id can not be empty or null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public replace(Lcom/yanzhenjie/andserver/http/session/StandardSession;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "The session can not be null."

    .line 46
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->getId()Ljava/lang/String;

    move-result-object v0

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x0

    .line 55
    :try_start_0
    iget-object v2, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    invoke-static {v2}, Lcom/yanzhenjie/andserver/util/IOUtils;->createFolder(Ljava/io/File;)Z

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 71
    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return v3

    .line 59
    :cond_0
    :try_start_1
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    invoke-direct {v2, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 60
    invoke-static {v2}, Lcom/yanzhenjie/andserver/util/IOUtils;->createNewFile(Ljava/io/File;)Z

    move-result v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v4, :cond_1

    .line 71
    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return v3

    .line 64
    :cond_1
    :try_start_2
    new-instance v3, Ljava/io/ObjectOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 65
    :try_start_3
    invoke-virtual {p1, v3}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->writeObject(Ljava/io/ObjectOutputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 p1, 0x1

    .line 71
    invoke-static {v3}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return p1

    :catchall_0
    move-exception p1

    move-object v1, v3

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v1, v3

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 68
    :goto_0
    :try_start_4
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/yanzhenjie/andserver/http/session/StandardStore;->mDirectory:Ljava/io/File;

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/yanzhenjie/andserver/util/IOUtils;->delFileOrFolder(Ljava/io/File;)Z

    .line 69
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 71
    :goto_1
    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 72
    throw p1

    .line 50
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "The session id can not be empty or null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
