.class public Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;
.super Ljava/lang/Object;
.source "StandardMultipartResolver.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;
    }
.end annotation


# instance fields
.field private mFileItemFactory:Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

.field private mFileUpload:Lorg/apache/commons/fileupload/FileUpload;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileItemFactory:Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

    .line 58
    new-instance v1, Lorg/apache/commons/fileupload/FileUpload;

    invoke-direct {v1, v0}, Lorg/apache/commons/fileupload/FileUpload;-><init>(Lorg/apache/commons/fileupload/FileItemFactory;)V

    iput-object v1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileUpload:Lorg/apache/commons/fileupload/FileUpload;

    return-void
.end method

.method private determineEncoding(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;
    .locals 0

    .line 163
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getContentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p1

    if-nez p1, :cond_0

    .line 165
    sget-object p1, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 167
    :cond_0
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    if-nez p1, :cond_1

    .line 168
    sget-object p1, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_1
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private determineEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 253
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p2

    .line 256
    :cond_0
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p1

    .line 257
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 258
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p2

    :cond_1
    return-object p2
.end method

.method private parseRequest(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/yanzhenjie/andserver/error/MultipartException;
        }
    .end annotation

    .line 135
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->determineEncoding(Lcom/yanzhenjie/andserver/http/HttpRequest;)Ljava/lang/String;

    move-result-object v0

    .line 136
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->prepareFileUpload(Ljava/lang/String;)Lorg/apache/commons/fileupload/FileUpload;

    move-result-object v1

    .line 138
    :try_start_0
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getBody()Lcom/yanzhenjie/andserver/http/RequestBody;

    move-result-object p1

    const-string v2, "The body cannot be null."

    .line 139
    invoke-static {p1, v2}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    new-instance v2, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;

    invoke-direct {v2, p1}, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;-><init>(Lcom/yanzhenjie/andserver/http/RequestBody;)V

    invoke-virtual {v1, v2}, Lorg/apache/commons/fileupload/FileUpload;->parseRequest(Lorg/apache/commons/fileupload/RequestContext;)Ljava/util/List;

    move-result-object p1

    .line 141
    invoke-virtual {p0, p1, v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->parseFileItems(Ljava/util/List;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;

    move-result-object p1
    :try_end_0
    .catch Lorg/apache/commons/fileupload/FileUploadBase$SizeLimitExceededException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/apache/commons/fileupload/FileUploadException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 147
    new-instance v0, Lcom/yanzhenjie/andserver/error/MultipartException;

    const-string v1, "Failed to parse multipart servlet request."

    invoke-direct {v0, v1, p1}, Lcom/yanzhenjie/andserver/error/MultipartException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p1

    .line 145
    new-instance v0, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;

    invoke-virtual {v1}, Lorg/apache/commons/fileupload/FileUpload;->getFileSizeMax()J

    move-result-wide v1

    invoke-direct {v0, v1, v2, p1}, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;-><init>(JLjava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception p1

    .line 143
    new-instance v0, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;

    invoke-virtual {v1}, Lorg/apache/commons/fileupload/FileUpload;->getSizeMax()J

    move-result-wide v1

    invoke-direct {v0, v1, v2, p1}, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;-><init>(JLjava/lang/Throwable;)V

    throw v0
.end method

.method private prepareFileUpload(Ljava/lang/String;)Lorg/apache/commons/fileupload/FileUpload;
    .locals 3

    .line 182
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileUpload:Lorg/apache/commons/fileupload/FileUpload;

    .line 183
    invoke-virtual {v0}, Lorg/apache/commons/fileupload/FileUpload;->getHeaderEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 184
    new-instance v0, Lorg/apache/commons/fileupload/FileUpload;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileItemFactory:Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/FileUpload;-><init>(Lorg/apache/commons/fileupload/FileItemFactory;)V

    .line 185
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileUpload:Lorg/apache/commons/fileupload/FileUpload;

    invoke-virtual {v1}, Lorg/apache/commons/fileupload/FileUpload;->getSizeMax()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/fileupload/FileUpload;->setSizeMax(J)V

    .line 186
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileUpload:Lorg/apache/commons/fileupload/FileUpload;

    invoke-virtual {v1}, Lorg/apache/commons/fileupload/FileUpload;->getFileSizeMax()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/fileupload/FileUpload;->setFileSizeMax(J)V

    .line 187
    invoke-virtual {v0, p1}, Lorg/apache/commons/fileupload/FileUpload;->setHeaderEncoding(Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public cleanupMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;)V
    .locals 3

    if-eqz p1, :cond_2

    .line 110
    :try_start_0
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;->getMultiFileMap()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object p1

    .line 111
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 112
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;

    .line 113
    instance-of v2, v1, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;

    if-eqz v2, :cond_1

    .line 114
    check-cast v1, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;

    .line 115
    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->getFileItem()Lorg/apache/commons/fileupload/FileItem;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/fileupload/FileItem;->delete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const-string p1, "AndServer"

    const-string v0, "Failed to perform multipart cleanup for servlet request."

    .line 120
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method protected createMultipartFile(Lorg/apache/commons/fileupload/FileItem;)Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;
    .locals 1

    .line 249
    new-instance v0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;-><init>(Lorg/apache/commons/fileupload/FileItem;)V

    return-object v0
.end method

.method public isMultipart(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z
    .locals 2

    .line 87
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/HttpMethod;->allowBody()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 91
    :cond_0
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getBody()Lcom/yanzhenjie/andserver/http/RequestBody;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 92
    new-instance v0, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;-><init>(Lcom/yanzhenjie/andserver/http/RequestBody;)V

    invoke-static {v0}, Lorg/apache/commons/fileupload/FileUploadBase;->isMultipartContent(Lorg/apache/commons/fileupload/RequestContext;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method protected parseFileItems(Ljava/util/List;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/apache/commons/fileupload/FileItem;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;"
        }
    .end annotation

    .line 204
    new-instance v0, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>()V

    .line 205
    new-instance v1, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/util/LinkedMultiValueMap;-><init>()V

    .line 206
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 209
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/fileupload/FileItem;

    .line 210
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->isFormField()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 212
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getContentType()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, p2}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->determineEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 215
    :try_start_0
    invoke-interface {v3, v4}, Lorg/apache/commons/fileupload/FileItem;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 217
    :catch_0
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 220
    :cond_0
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getString()Ljava/lang/String;

    move-result-object v4

    .line 222
    :goto_1
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getFieldName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-nez v5, :cond_1

    .line 225
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 226
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getFieldName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v5}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 230
    :cond_1
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    :goto_2
    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getFieldName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getContentType()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 234
    :cond_2
    invoke-virtual {p0, v3}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->createMultipartFile(Lorg/apache/commons/fileupload/FileItem;)Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;

    move-result-object v3

    .line 235
    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v3}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 238
    :cond_3
    new-instance p1, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;

    invoke-direct {p1, v0, v1, v2}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;-><init>(Lcom/yanzhenjie/andserver/util/MultiValueMap;Lcom/yanzhenjie/andserver/util/MultiValueMap;Ljava/util/Map;)V

    return-object p1
.end method

.method public resolveMultipart(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/yanzhenjie/andserver/error/MultipartException;
        }
    .end annotation

    .line 97
    instance-of v0, p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    if-eqz v0, :cond_0

    .line 98
    check-cast p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    return-object p1

    .line 101
    :cond_0
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->parseRequest(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;

    move-result-object v0

    .line 102
    new-instance v1, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->getMultipartFiles()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v2

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->getMultipartParameters()Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v3

    .line 103
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->getMultipartContentTypes()Ljava/util/Map;

    move-result-object v0

    invoke-direct {v1, p1, v2, v3, v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartRequest;-><init>(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/util/MultiValueMap;Lcom/yanzhenjie/andserver/util/MultiValueMap;Ljava/util/Map;)V

    return-object v1
.end method

.method public setAllFileMaxSize(J)V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileUpload:Lorg/apache/commons/fileupload/FileUpload;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/fileupload/FileUpload;->setSizeMax(J)V

    return-void
.end method

.method public setFileMaxSize(J)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileUpload:Lorg/apache/commons/fileupload/FileUpload;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/fileupload/FileUpload;->setFileSizeMax(J)V

    return-void
.end method

.method public setMaxInMemorySize(I)V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileItemFactory:Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

    invoke-virtual {v0, p1}, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;->setSizeThreshold(I)V

    return-void
.end method

.method public setUploadTempDir(Ljava/io/File;)V
    .locals 2

    .line 78
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Given uploadTempDir ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "] could not be created."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;->mFileItemFactory:Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

    invoke-virtual {v0, p1}, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;->setRepository(Ljava/io/File;)V

    return-void
.end method
