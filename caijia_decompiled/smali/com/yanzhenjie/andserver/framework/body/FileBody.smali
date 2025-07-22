.class public Lcom/yanzhenjie/andserver/framework/body/FileBody;
.super Ljava/lang/Object;
.source "FileBody.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/ResponseBody;


# instance fields
.field private mBody:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 42
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/body/FileBody;->mBody:Ljava/io/File;

    return-void

    .line 40
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The file cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/FileBody;->mBody:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public contentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/FileBody;->mBody:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->getFileMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/framework/body/FileBody;->mBody:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 64
    invoke-static {v0, p1}, Lcom/yanzhenjie/andserver/util/IOUtils;->write(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 65
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-void
.end method
