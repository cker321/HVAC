.class public Lorg/apache/commons/fileupload/disk/DiskFileItem;
.super Ljava/lang/Object;
.source "DiskFileItem.java"

# interfaces
.implements Lorg/apache/commons/fileupload/FileItem;


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static final DEFAULT_CHARSET:Ljava/lang/String; = "ISO-8859-1"

.field private static final UID:Ljava/lang/String;


# instance fields
.field private cachedContent:[B

.field private final contentType:Ljava/lang/String;

.field private defaultCharset:Ljava/lang/String;

.field private transient dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

.field private fieldName:Ljava/lang/String;

.field private final fileName:Ljava/lang/String;

.field private headers:Lorg/apache/commons/fileupload/FileItemHeaders;

.field private isFormField:Z

.field private final repository:Ljava/io/File;

.field private size:J

.field private final sizeThreshold:I

.field private transient tempFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 90
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2d

    const/16 v2, 0x5f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->UID:Ljava/lang/String;

    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->COUNTER:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ILjava/io/File;)V
    .locals 2

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 122
    iput-wide v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->size:J

    const-string v0, "ISO-8859-1"

    .line 159
    iput-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->defaultCharset:Ljava/lang/String;

    .line 183
    iput-object p1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->fieldName:Ljava/lang/String;

    .line 184
    iput-object p2, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->contentType:Ljava/lang/String;

    .line 185
    iput-boolean p3, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isFormField:Z

    .line 186
    iput-object p4, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->fileName:Ljava/lang/String;

    .line 187
    iput p5, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->sizeThreshold:I

    .line 188
    iput-object p6, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->repository:Ljava/io/File;

    return-void
.end method

.method private static getUniqueId()Ljava/lang/String;
    .locals 3

    .line 586
    sget-object v0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->COUNTER:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    .line 587
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x5f5e100

    if-ge v0, v2, :cond_0

    .line 592
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "00000000"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_0
    return-object v1
.end method


# virtual methods
.method public delete()V
    .locals 2

    const/4 v0, 0x0

    .line 426
    iput-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    .line 427
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getStoreLocation()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 428
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isInMemory()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 429
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 2

    .line 541
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->isInMemory()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 544
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 546
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 547
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_1
    :goto_0
    return-void
.end method

.method public get()[B
    .locals 4

    .line 301
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isInMemory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 302
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    if-eqz v0, :cond_0

    .line 303
    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getData()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    .line 305
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    return-object v0

    .line 308
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getSize()J

    move-result-wide v0

    long-to-int v1, v0

    new-array v0, v1, [B

    const/4 v1, 0x0

    .line 312
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v3}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 313
    :try_start_1
    invoke-static {v2, v0}, Lorg/apache/commons/io/IOUtils;->readFully(Ljava/io/InputStream;[B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 317
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_0

    :catchall_1
    move-exception v0

    :goto_0
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 318
    throw v0

    :catch_0
    move-object v2, v1

    .line 317
    :catch_1
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    move-object v0, v1

    :goto_1
    return-object v0
.end method

.method public getCharSet()Ljava/lang/String;
    .locals 3

    .line 235
    new-instance v0, Lorg/apache/commons/fileupload/ParameterParser;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/ParameterParser;-><init>()V

    const/4 v1, 0x1

    .line 236
    invoke-virtual {v0, v1}, Lorg/apache/commons/fileupload/ParameterParser;->setLowerCaseNames(Z)V

    .line 238
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getContentType()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3b

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/fileupload/ParameterParser;->parse(Ljava/lang/String;C)Ljava/util/Map;

    move-result-object v0

    const-string v1, "charset"

    .line 239
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 224
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getDefaultCharset()Ljava/lang/String;
    .locals 1

    .line 633
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->defaultCharset:Ljava/lang/String;

    return-object v0
.end method

.method public getFieldName()Ljava/lang/String;
    .locals 1

    .line 444
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->fieldName:Ljava/lang/String;

    return-object v0
.end method

.method public getHeaders()Lorg/apache/commons/fileupload/FileItemHeaders;
    .locals 1

    .line 615
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->headers:Lorg/apache/commons/fileupload/FileItemHeaders;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isInMemory()Z

    move-result v0

    if-nez v0, :cond_0

    .line 206
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v1}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0

    .line 209
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    if-nez v0, :cond_1

    .line 210
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getData()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    .line 212
    :cond_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 253
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->fileName:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/fileupload/util/Streams;->checkFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 502
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    if-nez v0, :cond_0

    .line 503
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getTempFile()Ljava/io/File;

    move-result-object v0

    .line 504
    new-instance v1, Lorg/apache/commons/io/output/DeferredFileOutputStream;

    iget v2, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->sizeThreshold:I

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;-><init>(ILjava/io/File;)V

    iput-object v1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    .line 506
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    return-object v0
.end method

.method public getSize()J
    .locals 5

    .line 280
    iget-wide v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    return-wide v0

    .line 282
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    if-eqz v0, :cond_1

    .line 283
    array-length v0, v0

    int-to-long v0, v0

    return-wide v0

    .line 284
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->isInMemory()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 285
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getData()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0

    .line 287
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getStoreLocation()Ljava/io/File;
    .locals 2

    .line 525
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 528
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isInMemory()Z

    move-result v0

    if-eqz v0, :cond_1

    return-object v1

    .line 531
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .locals 3

    .line 352
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->get()[B

    move-result-object v0

    .line 353
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getCharSet()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 355
    iget-object v1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->defaultCharset:Ljava/lang/String;

    .line 358
    :cond_0
    :try_start_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 360
    :catch_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    return-object v1
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 338
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->get()[B

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method protected getTempFile()Ljava/io/File;
    .locals 4

    .line 563
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->tempFile:Ljava/io/File;

    if-nez v0, :cond_1

    .line 564
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->repository:Ljava/io/File;

    if-nez v0, :cond_0

    .line 566
    new-instance v0, Ljava/io/File;

    const-string v1, "java.io.tmpdir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 569
    sget-object v3, Lorg/apache/commons/fileupload/disk/DiskFileItem;->UID:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getUniqueId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "upload_%s_%s.tmp"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 571
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->tempFile:Ljava/io/File;

    .line 573
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->tempFile:Ljava/io/File;

    return-object v0
.end method

.method public isFormField()Z
    .locals 1

    .line 472
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isFormField:Z

    return v0
.end method

.method public isInMemory()Z
    .locals 1

    .line 267
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->cachedContent:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 270
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->dfos:Lorg/apache/commons/io/output/DeferredFileOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/io/output/DeferredFileOutputStream;->isInMemory()Z

    move-result v0

    return v0
.end method

.method public setDefaultCharset(Ljava/lang/String;)V
    .locals 0

    .line 642
    iput-object p1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->defaultCharset:Ljava/lang/String;

    return-void
.end method

.method public setFieldName(Ljava/lang/String;)V
    .locals 0

    .line 457
    iput-object p1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->fieldName:Ljava/lang/String;

    return-void
.end method

.method public setFormField(Z)V
    .locals 0

    .line 487
    iput-boolean p1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isFormField:Z

    return-void
.end method

.method public setHeaders(Lorg/apache/commons/fileupload/FileItemHeaders;)V
    .locals 0

    .line 624
    iput-object p1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->headers:Lorg/apache/commons/fileupload/FileItemHeaders;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    .line 605
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getStoreLocation()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getSize()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 606
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isFormField()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getFieldName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "name=%s, StoreLocation=%s, size=%s bytes, isFormField=%s, FieldName=%s"

    .line 604
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 386
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->isInMemory()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 389
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 390
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->get()[B

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 391
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p1

    :goto_0
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 394
    throw p1

    .line 396
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/disk/DiskFileItem;->getStoreLocation()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 399
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    iput-wide v1, p0, Lorg/apache/commons/fileupload/disk/DiskFileItem;->size:J

    .line 405
    invoke-static {v0, p1}, Lorg/apache/commons/io/FileUtils;->moveFile(Ljava/io/File;Ljava/io/File;)V

    :goto_1
    return-void

    .line 411
    :cond_1
    new-instance p1, Lorg/apache/commons/fileupload/FileUploadException;

    const-string v0, "Cannot write uploaded file to disk!"

    invoke-direct {p1, v0}, Lorg/apache/commons/fileupload/FileUploadException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
