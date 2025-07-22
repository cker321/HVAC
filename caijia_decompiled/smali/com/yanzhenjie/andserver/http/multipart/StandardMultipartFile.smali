.class public Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;
.super Ljava/lang/Object;
.source "StandardMultipartFile.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;
.implements Ljava/io/Serializable;


# instance fields
.field private final fileItem:Lorg/apache/commons/fileupload/FileItem;

.field private final size:J


# direct methods
.method public constructor <init>(Lorg/apache/commons/fileupload/FileItem;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    .line 48
    invoke-interface {p1}, Lorg/apache/commons/fileupload/FileItem;->getSize()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->size:J

    return-void
.end method


# virtual methods
.method public getBytes()[B
    .locals 2

    .line 113
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 116
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->get()[B

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [B

    :goto_0
    return-object v0

    .line 114
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "File has been moved - cannot be read again."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 94
    :try_start_0
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    :catch_0
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    :goto_0
    return-object v0
.end method

.method public final getFileItem()Lorg/apache/commons/fileupload/FileItem;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 3

    .line 67
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->getName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    const-string v1, "/"

    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const-string v2, "\\"

    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    if-le v2, v1, :cond_1

    move v1, v2

    :cond_1
    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_2
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->getFieldName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 108
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->size:J

    return-wide v0
.end method

.method public getStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    invoke-static {}, Lcom/yanzhenjie/andserver/util/IOUtils;->createEmptyInput()Ljava/io/InputStream;

    move-result-object v0

    :goto_0
    return-object v0

    .line 124
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "File has been moved - cannot be read again."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected isAvailable()Z
    .locals 6

    .line 162
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->isInMemory()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    instance-of v2, v0, Lorg/apache/commons/fileupload/disk/DiskFileItem;

    if-eqz v2, :cond_1

    .line 167
    check-cast v0, Lorg/apache/commons/fileupload/disk/DiskFileItem;

    invoke-virtual {v0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getStoreLocation()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0

    .line 170
    :cond_1
    invoke-interface {v0}, Lorg/apache/commons/fileupload/FileItem;->getSize()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->size:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isEmpty()Z
    .locals 5

    .line 103
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public transferTo(Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 132
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 136
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Destination file ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "] already exists and could not be deleted."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->fileItem:Lorg/apache/commons/fileupload/FileItem;

    invoke-interface {v0, p1}, Lorg/apache/commons/fileupload/FileItem;->write(Ljava/io/File;)V
    :try_end_0
    .catch Lorg/apache/commons/fileupload/FileUploadException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 152
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File transfer failed"

    invoke-direct {v0, v1, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p1

    .line 150
    throw p1

    :catch_2
    move-exception p1

    .line 147
    throw p1

    :catch_3
    move-exception p1

    .line 144
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Lorg/apache/commons/fileupload/FileUploadException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 133
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "File has already been moved - cannot be transferred again."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
