.class public Lorg/apache/commons/fileupload/MultipartStream;
.super Ljava/lang/Object;
.source "MultipartStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;,
        Lorg/apache/commons/fileupload/MultipartStream$IllegalBoundaryException;,
        Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;,
        Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;
    }
.end annotation


# static fields
.field protected static final BOUNDARY_PREFIX:[B

.field public static final CR:B = 0xdt

.field public static final DASH:B = 0x2dt

.field protected static final DEFAULT_BUFSIZE:I = 0x1000

.field protected static final FIELD_SEPARATOR:[B

.field public static final HEADER_PART_SIZE_MAX:I = 0x2800

.field protected static final HEADER_SEPARATOR:[B

.field public static final LF:B = 0xat

.field protected static final STREAM_TERMINATOR:[B


# instance fields
.field private final boundary:[B

.field private boundaryLength:I

.field private final boundaryTable:[I

.field private final bufSize:I

.field private final buffer:[B

.field private head:I

.field private headerEncoding:Ljava/lang/String;

.field private final input:Ljava/io/InputStream;

.field private final keepRegion:I

.field private final notifier:Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;

.field private tail:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x4

    new-array v1, v0, [B

    .line 188
    fill-array-data v1, :array_0

    sput-object v1, Lorg/apache/commons/fileupload/MultipartStream;->HEADER_SEPARATOR:[B

    const/4 v1, 0x2

    new-array v2, v1, [B

    .line 194
    fill-array-data v2, :array_1

    sput-object v2, Lorg/apache/commons/fileupload/MultipartStream;->FIELD_SEPARATOR:[B

    new-array v1, v1, [B

    .line 200
    fill-array-data v1, :array_2

    sput-object v1, Lorg/apache/commons/fileupload/MultipartStream;->STREAM_TERMINATOR:[B

    new-array v0, v0, [B

    .line 205
    fill-array-data v0, :array_3

    sput-object v0, Lorg/apache/commons/fileupload/MultipartStream;->BOUNDARY_PREFIX:[B

    return-void

    nop

    :array_0
    .array-data 1
        0xdt
        0xat
        0xdt
        0xat
    .end array-data

    :array_1
    .array-data 1
        0xdt
        0xat
    .end array-data

    nop

    :array_2
    .array-data 1
        0x2dt
        0x2dt
    .end array-data

    nop

    :array_3
    .array-data 1
        0xdt
        0xat
        0x2dt
        0x2dt
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 279
    invoke-direct {p0, v0, v0, v0}, Lorg/apache/commons/fileupload/MultipartStream;-><init>(Ljava/io/InputStream;[BLorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[B)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/16 v0, 0x1000

    const/4 v1, 0x0

    .line 388
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/fileupload/MultipartStream;-><init>(Ljava/io/InputStream;[BILorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[BI)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 301
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/fileupload/MultipartStream;-><init>(Ljava/io/InputStream;[BILorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[BILorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;)V
    .locals 2

    .line 326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_1

    .line 333
    array-length v0, p2

    sget-object v1, Lorg/apache/commons/fileupload/MultipartStream;->BOUNDARY_PREFIX:[B

    array-length v1, v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    add-int/lit8 v1, v0, 0x1

    if-lt p3, v1, :cond_0

    .line 339
    iput-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->input:Ljava/io/InputStream;

    mul-int/lit8 v0, v0, 0x2

    .line 340
    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->bufSize:I

    .line 341
    new-array p1, p1, [B

    iput-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->buffer:[B

    .line 342
    iput-object p4, p0, Lorg/apache/commons/fileupload/MultipartStream;->notifier:Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;

    .line 344
    iget p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    new-array p3, p1, [B

    iput-object p3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    add-int/lit8 p1, p1, 0x1

    .line 345
    new-array p1, p1, [I

    iput-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryTable:[I

    .line 346
    array-length p1, p3

    iput p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->keepRegion:I

    .line 348
    sget-object p1, Lorg/apache/commons/fileupload/MultipartStream;->BOUNDARY_PREFIX:[B

    array-length p4, p1

    const/4 v0, 0x0

    invoke-static {p1, v0, p3, v0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 350
    iget-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    sget-object p3, Lorg/apache/commons/fileupload/MultipartStream;->BOUNDARY_PREFIX:[B

    array-length p3, p3

    array-length p4, p2

    invoke-static {p2, v0, p1, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 352
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream;->computeBoundaryTable()V

    .line 354
    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    .line 355
    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    return-void

    .line 335
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The buffer size specified for the MultipartStream is too small"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 329
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "boundary may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method constructor <init>(Ljava/io/InputStream;[BLorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;)V
    .locals 1

    const/16 v0, 0x1000

    .line 372
    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/fileupload/MultipartStream;-><init>(Ljava/io/InputStream;[BILorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;)V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/fileupload/MultipartStream;)I
    .locals 0

    .line 84
    iget p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    return p0
.end method

.method static synthetic access$002(Lorg/apache/commons/fileupload/MultipartStream;I)I
    .locals 0

    .line 84
    iput p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    return p1
.end method

.method static synthetic access$100(Lorg/apache/commons/fileupload/MultipartStream;)I
    .locals 0

    .line 84
    iget p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    return p0
.end method

.method static synthetic access$102(Lorg/apache/commons/fileupload/MultipartStream;I)I
    .locals 0

    .line 84
    iput p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    return p1
.end method

.method static synthetic access$108(Lorg/apache/commons/fileupload/MultipartStream;)I
    .locals 2

    .line 84
    iget v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    return v0
.end method

.method static synthetic access$200(Lorg/apache/commons/fileupload/MultipartStream;)I
    .locals 0

    .line 84
    iget p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->keepRegion:I

    return p0
.end method

.method static synthetic access$300(Lorg/apache/commons/fileupload/MultipartStream;)[B
    .locals 0

    .line 84
    iget-object p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->buffer:[B

    return-object p0
.end method

.method static synthetic access$400(Lorg/apache/commons/fileupload/MultipartStream;)Ljava/io/InputStream;
    .locals 0

    .line 84
    iget-object p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->input:Ljava/io/InputStream;

    return-object p0
.end method

.method static synthetic access$500(Lorg/apache/commons/fileupload/MultipartStream;)I
    .locals 0

    .line 84
    iget p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->bufSize:I

    return p0
.end method

.method static synthetic access$600(Lorg/apache/commons/fileupload/MultipartStream;)Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;
    .locals 0

    .line 84
    iget-object p0, p0, Lorg/apache/commons/fileupload/MultipartStream;->notifier:Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;

    return-object p0
.end method

.method public static arrayequals([B[BI)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_1

    .line 696
    aget-byte v2, p0, v1

    aget-byte v3, p1, v1

    if-eq v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private computeBoundaryTable()V
    .locals 5

    .line 524
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryTable:[I

    const/4 v1, -0x1

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v1, 0x1

    .line 525
    aput v2, v0, v1

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 527
    :goto_0
    iget v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    if-gt v0, v3, :cond_2

    .line 528
    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    add-int/lit8 v4, v0, -0x1

    aget-byte v4, v3, v4

    aget-byte v3, v3, v1

    if-ne v4, v3, :cond_0

    .line 529
    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryTable:[I

    add-int/lit8 v1, v1, 0x1

    aput v1, v3, v0

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-lez v1, :cond_1

    .line 533
    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryTable:[I

    aget v1, v3, v1

    goto :goto_0

    .line 535
    :cond_1
    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryTable:[I

    aput v2, v3, v0

    goto :goto_1

    :cond_2
    return-void
.end method


# virtual methods
.method public discardBodyData()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 646
    invoke-virtual {p0, v0}, Lorg/apache/commons/fileupload/MultipartStream;->readBodyData(Ljava/io/OutputStream;)I

    move-result v0

    return v0
.end method

.method protected findByte(BI)I
    .locals 1

    .line 715
    :goto_0
    iget v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    if-ge p2, v0, :cond_1

    .line 716
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->buffer:[B

    aget-byte v0, v0, p2

    if-ne v0, p1, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method protected findSeparator()I
    .locals 4

    .line 734
    iget v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    const/4 v1, 0x0

    .line 737
    :cond_0
    iget v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    if-ge v0, v2, :cond_2

    :goto_0
    if-ltz v1, :cond_1

    .line 738
    iget-object v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->buffer:[B

    aget-byte v2, v2, v0

    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    aget-byte v3, v3, v1

    if-eq v2, v3, :cond_1

    .line 739
    iget-object v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryTable:[I

    aget v1, v2, v1

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    .line 743
    iget v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    if-ne v1, v2, :cond_0

    sub-int/2addr v0, v2

    return v0

    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public getHeaderEncoding()Ljava/lang/String;
    .locals 1

    .line 401
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->headerEncoding:Ljava/lang/String;

    return-object v0
.end method

.method newInputStream()Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;
    .locals 1

    .line 630
    new-instance v0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;

    invoke-direct {v0, p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;-><init>(Lorg/apache/commons/fileupload/MultipartStream;)V

    return-object v0
.end method

.method public readBodyData(Ljava/io/OutputStream;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 622
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream;->newInputStream()Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/apache/commons/fileupload/util/Streams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;Z)J

    move-result-wide v0

    long-to-int p1, v0

    return p1
.end method

.method public readBoundary()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;,
            Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;
        }
    .end annotation

    const/4 v0, 0x2

    new-array v1, v0, [B

    .line 456
    iget v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    iget v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    add-int/2addr v2, v3

    iput v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    .line 458
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream;->readByte()B

    move-result v2

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    .line 459
    aget-byte v2, v1, v3

    const/16 v4, 0xa

    const/4 v5, 0x1

    if-ne v2, v4, :cond_0

    return v5

    .line 469
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream;->readByte()B

    move-result v2

    aput-byte v2, v1, v5

    .line 470
    sget-object v2, Lorg/apache/commons/fileupload/MultipartStream;->STREAM_TERMINATOR:[B

    invoke-static {v1, v2, v0}, Lorg/apache/commons/fileupload/MultipartStream;->arrayequals([B[BI)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 472
    :cond_1
    sget-object v2, Lorg/apache/commons/fileupload/MultipartStream;->FIELD_SEPARATOR:[B

    invoke-static {v1, v2, v0}, Lorg/apache/commons/fileupload/MultipartStream;->arrayequals([B[BI)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v3, 0x1

    :goto_0
    return v3

    .line 475
    :cond_2
    new-instance v0, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;

    const-string v1, "Unexpected characters follow a boundary"

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 482
    :catch_0
    new-instance v0, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;

    const-string v1, "Stream ended unexpectedly"

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_1
    move-exception v0

    .line 480
    throw v0
.end method

.method public readByte()B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 425
    iget v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    iget v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    .line 426
    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    .line 428
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->input:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->buffer:[B

    iget v3, p0, Lorg/apache/commons/fileupload/MultipartStream;->bufSize:I

    invoke-virtual {v1, v2, v0, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->tail:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 433
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->notifier:Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;

    if-eqz v1, :cond_1

    .line 434
    invoke-virtual {v1, v0}, Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;->noteBytesRead(I)V

    goto :goto_0

    .line 431
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No more data is available"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 437
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->buffer:[B

    iget v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->head:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public readHeaders()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;,
            Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;
        }
    .end annotation

    .line 561
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 563
    :goto_0
    sget-object v4, Lorg/apache/commons/fileupload/MultipartStream;->HEADER_SEPARATOR:[B

    array-length v4, v4

    if-ge v2, v4, :cond_2

    .line 565
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream;->readByte()B

    move-result v4
    :try_end_0
    .catch Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v5, 0x1

    add-int/2addr v3, v5

    const/16 v6, 0x2800

    if-gt v3, v6, :cond_1

    .line 577
    sget-object v5, Lorg/apache/commons/fileupload/MultipartStream;->HEADER_SEPARATOR:[B

    aget-byte v5, v5, v2

    if-ne v4, v5, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 582
    :goto_1
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 573
    :cond_1
    new-instance v0, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;

    new-array v2, v5, [Ljava/lang/Object;

    .line 575
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v1, "Header section has more than %s bytes (maybe it is not properly terminated)"

    .line 574
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 570
    :catch_0
    new-instance v0, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;

    const-string v1, "Stream ended unexpectedly"

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_1
    move-exception v0

    .line 568
    throw v0

    .line 586
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->headerEncoding:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 588
    :try_start_1
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    .line 592
    :catch_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 595
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    return-object v0
.end method

.method public setBoundary([B)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/fileupload/MultipartStream$IllegalBoundaryException;
        }
    .end annotation

    .line 508
    array-length v0, p1

    iget v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    sget-object v2, Lorg/apache/commons/fileupload/MultipartStream;->BOUNDARY_PREFIX:[B

    array-length v3, v2

    sub-int/2addr v1, v3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 512
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v2, v2

    array-length v3, p1

    invoke-static {p1, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 514
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream;->computeBoundaryTable()V

    return-void

    .line 509
    :cond_0
    new-instance p1, Lorg/apache/commons/fileupload/MultipartStream$IllegalBoundaryException;

    const-string v0, "The length of a boundary token cannot be changed"

    invoke-direct {p1, v0}, Lorg/apache/commons/fileupload/MultipartStream$IllegalBoundaryException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHeaderEncoding(Ljava/lang/String;)V
    .locals 0

    .line 412
    iput-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream;->headerEncoding:Ljava/lang/String;

    return-void
.end method

.method public skipPreamble()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 659
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v1, v0

    const/4 v2, 0x2

    sub-int/2addr v1, v2

    const/4 v3, 0x0

    invoke-static {v0, v2, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 660
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v0, v0

    sub-int/2addr v0, v2

    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    .line 661
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream;->computeBoundaryTable()V

    const/16 v0, 0xa

    const/4 v1, 0x1

    const/16 v4, 0xd

    .line 664
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream;->discardBodyData()I

    .line 668
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream;->readBoundary()Z

    move-result v5
    :try_end_0
    .catch Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 673
    iget-object v6, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v7, v6

    sub-int/2addr v7, v2

    invoke-static {v6, v3, v6, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 674
    iget-object v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v6, v2

    iput v6, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    .line 675
    aput-byte v4, v2, v3

    .line 676
    aput-byte v0, v2, v1

    .line 677
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream;->computeBoundaryTable()V

    return v5

    :catchall_0
    move-exception v5

    .line 673
    iget-object v6, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v7, v6

    sub-int/2addr v7, v2

    invoke-static {v6, v3, v6, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 674
    iget-object v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v6, v2

    iput v6, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    .line 675
    aput-byte v4, v2, v3

    .line 676
    aput-byte v0, v2, v1

    .line 677
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream;->computeBoundaryTable()V

    .line 678
    throw v5

    .line 673
    :catch_0
    iget-object v5, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v6, v5

    sub-int/2addr v6, v2

    invoke-static {v5, v3, v5, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 674
    iget-object v2, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundary:[B

    array-length v5, v2

    iput v5, p0, Lorg/apache/commons/fileupload/MultipartStream;->boundaryLength:I

    .line 675
    aput-byte v4, v2, v3

    .line 676
    aput-byte v0, v2, v1

    .line 677
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream;->computeBoundaryTable()V

    return v3
.end method
