.class public abstract Lorg/apache/commons/fileupload/FileUploadBase;
.super Ljava/lang/Object;
.source "FileUploadBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;,
        Lorg/apache/commons/fileupload/FileUploadBase$SizeLimitExceededException;,
        Lorg/apache/commons/fileupload/FileUploadBase$UnknownSizeException;,
        Lorg/apache/commons/fileupload/FileUploadBase$SizeException;,
        Lorg/apache/commons/fileupload/FileUploadBase$IOFileUploadException;,
        Lorg/apache/commons/fileupload/FileUploadBase$InvalidContentTypeException;,
        Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;,
        Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;
    }
.end annotation


# static fields
.field public static final ATTACHMENT:Ljava/lang/String; = "attachment"

.field public static final CONTENT_DISPOSITION:Ljava/lang/String; = "Content-disposition"

.field public static final CONTENT_LENGTH:Ljava/lang/String; = "Content-length"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "Content-type"

.field public static final FORM_DATA:Ljava/lang/String; = "form-data"

.field public static final MAX_HEADER_SIZE:I = 0x400
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final MULTIPART:Ljava/lang/String; = "multipart/"

.field public static final MULTIPART_FORM_DATA:Ljava/lang/String; = "multipart/form-data"

.field public static final MULTIPART_MIXED:Ljava/lang/String; = "multipart/mixed"


# instance fields
.field private fileSizeMax:J

.field private headerEncoding:Ljava/lang/String;

.field private listener:Lorg/apache/commons/fileupload/ProgressListener;

.field private sizeMax:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 140
    iput-wide v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->sizeMax:J

    .line 146
    iput-wide v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->fileSizeMax:J

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J
    .locals 2

    .line 53
    iget-wide v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->fileSizeMax:J

    return-wide v0
.end method

.method static synthetic access$400(Lorg/apache/commons/fileupload/FileUploadBase;)J
    .locals 2

    .line 53
    iget-wide v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->sizeMax:J

    return-wide v0
.end method

.method static synthetic access$500(Lorg/apache/commons/fileupload/FileUploadBase;)Ljava/lang/String;
    .locals 0

    .line 53
    iget-object p0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->headerEncoding:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lorg/apache/commons/fileupload/FileUploadBase;)Lorg/apache/commons/fileupload/ProgressListener;
    .locals 0

    .line 53
    iget-object p0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->listener:Lorg/apache/commons/fileupload/ProgressListener;

    return-object p0
.end method

.method private getFieldName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    .line 473
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 474
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "form-data"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 475
    new-instance v0, Lorg/apache/commons/fileupload/ParameterParser;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/ParameterParser;-><init>()V

    const/4 v1, 0x1

    .line 476
    invoke-virtual {v0, v1}, Lorg/apache/commons/fileupload/ParameterParser;->setLowerCaseNames(Z)V

    const/16 v1, 0x3b

    .line 478
    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/fileupload/ParameterParser;->parse(Ljava/lang/String;C)Ljava/util/Map;

    move-result-object p1

    const-string v0, "name"

    .line 479
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 481
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :cond_1
    :goto_0
    return-object p1
.end method

.method private getFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_2

    .line 431
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "form-data"

    .line 432
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "attachment"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 433
    :cond_0
    new-instance v0, Lorg/apache/commons/fileupload/ParameterParser;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/ParameterParser;-><init>()V

    const/4 v1, 0x1

    .line 434
    invoke-virtual {v0, v1}, Lorg/apache/commons/fileupload/ParameterParser;->setLowerCaseNames(Z)V

    const/16 v1, 0x3b

    .line 436
    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/fileupload/ParameterParser;->parse(Ljava/lang/String;C)Ljava/util/Map;

    move-result-object p1

    const-string v0, "filename"

    .line 437
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 438
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 440
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, ""

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public static final isMultipartContent(Lorg/apache/commons/fileupload/RequestContext;)Z
    .locals 2

    .line 72
    invoke-interface {p0}, Lorg/apache/commons/fileupload/RequestContext;->getContentType()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 76
    :cond_0
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "multipart/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method private parseEndOfLine(Ljava/lang/String;I)I
    .locals 3

    :goto_0
    const/16 v0, 0xd

    .line 618
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->indexOf(II)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    add-int/lit8 v0, p2, 0x1

    .line 619
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 623
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    return p2

    :cond_0
    move p2, v0

    goto :goto_0

    .line 620
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Expected headers to be terminated by an empty line."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method private parseHeaderLine(Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;Ljava/lang/String;)V
    .locals 3

    const/16 v0, 0x3a

    .line 636
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x0

    .line 641
    invoke-virtual {p2, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 643
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 644
    invoke-virtual {p1, v1, p2}, Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected createItem(Ljava/util/Map;Z)Lorg/apache/commons/fileupload/FileItem;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Lorg/apache/commons/fileupload/FileItem;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/FileUploadException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 519
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/FileUploadBase;->getFileItemFactory()Lorg/apache/commons/fileupload/FileItemFactory;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getFieldName(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Content-type"

    .line 520
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/fileupload/FileUploadBase;->getHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 522
    invoke-virtual {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getFileName(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    .line 519
    invoke-interface {v0, v1, v2, p2, p1}, Lorg/apache/commons/fileupload/FileItemFactory;->createItem(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lorg/apache/commons/fileupload/FileItem;

    move-result-object p1

    return-object p1
.end method

.method protected getBoundary(Ljava/lang/String;)[B
    .locals 2

    .line 379
    new-instance v0, Lorg/apache/commons/fileupload/ParameterParser;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/ParameterParser;-><init>()V

    const/4 v1, 0x1

    .line 380
    invoke-virtual {v0, v1}, Lorg/apache/commons/fileupload/ParameterParser;->setLowerCaseNames(Z)V

    const/4 v1, 0x2

    new-array v1, v1, [C

    .line 382
    fill-array-data v1, :array_0

    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/fileupload/ParameterParser;->parse(Ljava/lang/String;[C)Ljava/util/Map;

    move-result-object p1

    const-string v0, "boundary"

    .line 383
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    :try_start_0
    const-string v0, "ISO-8859-1"

    .line 390
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 392
    :catch_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    :goto_0
    return-object p1

    nop

    :array_0
    .array-data 2
        0x3bs
        0x2cs
    .end array-data
.end method

.method protected getFieldName(Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Content-disposition"

    .line 498
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/fileupload/FileUploadBase;->getHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getFieldName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getFieldName(Lorg/apache/commons/fileupload/FileItemHeaders;)Ljava/lang/String;
    .locals 1

    const-string v0, "Content-disposition"

    .line 462
    invoke-interface {p1, v0}, Lorg/apache/commons/fileupload/FileItemHeaders;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getFieldName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public abstract getFileItemFactory()Lorg/apache/commons/fileupload/FileItemFactory;
.end method

.method protected getFileName(Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Content-disposition"

    .line 408
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/fileupload/FileUploadBase;->getHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getFileName(Lorg/apache/commons/fileupload/FileItemHeaders;)Ljava/lang/String;
    .locals 1

    const-string v0, "Content-disposition"

    .line 420
    invoke-interface {p1, v0}, Lorg/apache/commons/fileupload/FileItemHeaders;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getFileSizeMax()J
    .locals 2

    .line 210
    iget-wide v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->fileSizeMax:J

    return-wide v0
.end method

.method protected final getHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 661
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getHeaderEncoding()Ljava/lang/String;
    .locals 1

    .line 233
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->headerEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getItemIterator(Lorg/apache/commons/fileupload/RequestContext;)Lorg/apache/commons/fileupload/FileItemIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/FileUploadException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 269
    :try_start_0
    new-instance v0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;-><init>(Lorg/apache/commons/fileupload/FileUploadBase;Lorg/apache/commons/fileupload/RequestContext;)V
    :try_end_0
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 272
    invoke-virtual {p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/fileupload/FileUploadException;

    throw p1
.end method

.method protected getParsedHeaders(Ljava/lang/String;)Lorg/apache/commons/fileupload/FileItemHeaders;
    .locals 7

    .line 538
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 539
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/FileUploadBase;->newFileItemHeaders()Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;

    move-result-object v1

    const/4 v2, 0x0

    .line 542
    :goto_0
    invoke-direct {p0, p1, v2}, Lorg/apache/commons/fileupload/FileUploadBase;->parseEndOfLine(Ljava/lang/String;I)I

    move-result v3

    if-ne v2, v3, :cond_0

    return-object v1

    .line 546
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x2

    move v2, v3

    :goto_1
    if-ge v2, v0, :cond_4

    move v3, v2

    :goto_2
    if-ge v3, v0, :cond_2

    .line 551
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x20

    if-eq v5, v6, :cond_1

    const/16 v6, 0x9

    if-eq v5, v6, :cond_1

    goto :goto_3

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_2
    :goto_3
    if-ne v3, v2, :cond_3

    goto :goto_4

    .line 561
    :cond_3
    invoke-direct {p0, p1, v3}, Lorg/apache/commons/fileupload/FileUploadBase;->parseEndOfLine(Ljava/lang/String;I)I

    move-result v2

    const-string v5, " "

    .line 562
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 565
    :cond_4
    :goto_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lorg/apache/commons/fileupload/FileUploadBase;->parseHeaderLine(Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getProgressListener()Lorg/apache/commons/fileupload/ProgressListener;
    .locals 1

    .line 1455
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->listener:Lorg/apache/commons/fileupload/ProgressListener;

    return-object v0
.end method

.method public getSizeMax()J
    .locals 2

    .line 185
    iget-wide v0, p0, Lorg/apache/commons/fileupload/FileUploadBase;->sizeMax:J

    return-wide v0
.end method

.method protected newFileItemHeaders()Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;
    .locals 1

    .line 575
    new-instance v0, Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/util/FileItemHeadersImpl;-><init>()V

    return-object v0
.end method

.method protected parseHeaders(Ljava/lang/String;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 593
    invoke-virtual {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getParsedHeaders(Ljava/lang/String;)Lorg/apache/commons/fileupload/FileItemHeaders;

    move-result-object p1

    .line 594
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 595
    invoke-interface {p1}, Lorg/apache/commons/fileupload/FileItemHeaders;->getHeaderNames()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 596
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 597
    invoke-interface {p1, v2}, Lorg/apache/commons/fileupload/FileItemHeaders;->getHeaders(Ljava/lang/String;)Ljava/util/Iterator;

    move-result-object v3

    .line 598
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 599
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, ","

    .line 600
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 602
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public parseParameterMap(Lorg/apache/commons/fileupload/RequestContext;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/fileupload/RequestContext;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/apache/commons/fileupload/FileItem;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/FileUploadException;
        }
    .end annotation

    .line 350
    invoke-virtual {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->parseRequest(Lorg/apache/commons/fileupload/RequestContext;)Ljava/util/List;

    move-result-object p1

    .line 351
    new-instance v0, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 353
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/fileupload/FileItem;

    .line 354
    invoke-interface {v1}, Lorg/apache/commons/fileupload/FileItem;->getFieldName()Ljava/lang/String;

    move-result-object v2

    .line 355
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-nez v3, :cond_0

    .line 358
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 359
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    :cond_0
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public parseRequest(Lorg/apache/commons/fileupload/RequestContext;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/fileupload/RequestContext;",
            ")",
            "Ljava/util/List<",
            "Lorg/apache/commons/fileupload/FileItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/FileUploadException;
        }
    .end annotation

    .line 290
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 293
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/fileupload/FileUploadBase;->getItemIterator(Lorg/apache/commons/fileupload/RequestContext;)Lorg/apache/commons/fileupload/FileItemIterator;

    move-result-object p1

    .line 294
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/FileUploadBase;->getFileItemFactory()Lorg/apache/commons/fileupload/FileItemFactory;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 298
    :goto_0
    invoke-interface {p1}, Lorg/apache/commons/fileupload/FileItemIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 299
    invoke-interface {p1}, Lorg/apache/commons/fileupload/FileItemIterator;->next()Lorg/apache/commons/fileupload/FileItemStream;

    move-result-object v2

    .line 301
    move-object v3, v2

    check-cast v3, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;

    invoke-static {v3}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->access$000(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;)Ljava/lang/String;

    move-result-object v3

    .line 302
    invoke-interface {v2}, Lorg/apache/commons/fileupload/FileItemStream;->getFieldName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2}, Lorg/apache/commons/fileupload/FileItemStream;->getContentType()Ljava/lang/String;

    move-result-object v5

    .line 303
    invoke-interface {v2}, Lorg/apache/commons/fileupload/FileItemStream;->isFormField()Z

    move-result v6

    .line 302
    invoke-interface {v1, v4, v5, v6, v3}, Lorg/apache/commons/fileupload/FileItemFactory;->createItem(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lorg/apache/commons/fileupload/FileItem;

    move-result-object v3

    .line 304
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x1

    .line 306
    :try_start_1
    invoke-interface {v2}, Lorg/apache/commons/fileupload/FileItemStream;->openStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-interface {v3}, Lorg/apache/commons/fileupload/FileItem;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-static {v5, v6, v4}, Lorg/apache/commons/fileupload/util/Streams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;Z)J
    :try_end_1
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 313
    :try_start_2
    invoke-interface {v2}, Lorg/apache/commons/fileupload/FileItemStream;->getHeaders()Lorg/apache/commons/fileupload/FileItemHeaders;

    move-result-object v2

    .line 314
    invoke-interface {v3, v2}, Lorg/apache/commons/fileupload/FileItem;->setHeaders(Lorg/apache/commons/fileupload/FileItemHeaders;)V

    goto :goto_0

    :catch_0
    move-exception p1

    .line 310
    new-instance v1, Lorg/apache/commons/fileupload/FileUploadBase$IOFileUploadException;

    const-string v2, "Processing of %s request failed. %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "multipart/form-data"

    aput-object v6, v3, v5

    .line 311
    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 310
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/commons/fileupload/FileUploadBase$IOFileUploadException;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v1

    :catch_1
    move-exception p1

    .line 308
    invoke-virtual {p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/fileupload/FileUploadException;

    throw p1

    :cond_0
    return-object v0

    .line 296
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v1, "No FileItemFactory has been set."

    invoke-direct {p1, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_2
    move-exception p1

    .line 321
    :try_start_3
    new-instance v1, Lorg/apache/commons/fileupload/FileUploadException;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/commons/fileupload/FileUploadException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_3
    move-exception p1

    .line 319
    invoke-virtual {p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/fileupload/FileUploadException;

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 324
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/fileupload/FileItem;

    .line 326
    :try_start_4
    invoke-interface {v1}, Lorg/apache/commons/fileupload/FileItem;->delete()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_2

    :catch_4
    nop

    goto :goto_2

    .line 332
    :cond_2
    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public abstract setFileItemFactory(Lorg/apache/commons/fileupload/FileItemFactory;)V
.end method

.method public setFileSizeMax(J)V
    .locals 0

    .line 221
    iput-wide p1, p0, Lorg/apache/commons/fileupload/FileUploadBase;->fileSizeMax:J

    return-void
.end method

.method public setHeaderEncoding(Ljava/lang/String;)V
    .locals 0

    .line 245
    iput-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase;->headerEncoding:Ljava/lang/String;

    return-void
.end method

.method public setProgressListener(Lorg/apache/commons/fileupload/ProgressListener;)V
    .locals 0

    .line 1464
    iput-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase;->listener:Lorg/apache/commons/fileupload/ProgressListener;

    return-void
.end method

.method public setSizeMax(J)V
    .locals 0

    .line 199
    iput-wide p1, p0, Lorg/apache/commons/fileupload/FileUploadBase;->sizeMax:J

    return-void
.end method
