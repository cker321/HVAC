.class public Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;
.super Ljava/lang/Object;
.source "SessionInputBufferImpl.java"

# interfaces
.implements Lorg/apache/httpcore/io/SessionInputBuffer;
.implements Lorg/apache/httpcore/io/BufferInfo;


# instance fields
.field private final buffer:[B

.field private bufferLen:I

.field private bufferPos:I

.field private cbuf:Ljava/nio/CharBuffer;

.field private final constraints:Lorg/apache/httpcore/config/MessageConstraints;

.field private final decoder:Ljava/nio/charset/CharsetDecoder;

.field private inStream:Ljava/io/InputStream;

.field private final lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

.field private final metrics:Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

.field private final minChunkLimit:I


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;I)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p2

    .line 109
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;-><init>(Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;IILorg/apache/httpcore/config/MessageConstraints;Ljava/nio/charset/CharsetDecoder;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;IILorg/apache/httpcore/config/MessageConstraints;Ljava/nio/charset/CharsetDecoder;)V
    .locals 1

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "HTTP transport metrcis"

    .line 94
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Buffer size"

    .line 95
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    .line 96
    iput-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

    .line 97
    new-array p1, p2, [B

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    const/4 p1, 0x0

    .line 98
    iput p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    .line 99
    iput p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    if-ltz p3, :cond_0

    goto :goto_0

    :cond_0
    const/16 p3, 0x200

    .line 100
    :goto_0
    iput p3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->minChunkLimit:I

    if-eqz p4, :cond_1

    goto :goto_1

    .line 101
    :cond_1
    sget-object p4, Lorg/apache/httpcore/config/MessageConstraints;->DEFAULT:Lorg/apache/httpcore/config/MessageConstraints;

    :goto_1
    iput-object p4, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->constraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 102
    new-instance p1, Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-direct {p1, p2}, Lorg/apache/httpcore/util/ByteArrayBuffer;-><init>(I)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    .line 103
    iput-object p5, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    return-void
.end method

.method private appendDecoded(Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 353
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 356
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    if-nez v0, :cond_1

    const/16 v0, 0x400

    .line 357
    invoke-static {v0}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    .line 359
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-virtual {v0}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 361
    :goto_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 362
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    const/4 v3, 0x1

    invoke-virtual {v0, p2, v2, v3}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 363
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v0

    add-int/2addr v1, v0

    goto :goto_0

    .line 365
    :cond_2
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 366
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result p1

    add-int/2addr v1, p1

    .line 367
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {p1}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    return v1
.end method

.method private handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 375
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 376
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 378
    :cond_0
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {p1}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 379
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {p1}, Ljava/nio/CharBuffer;->remaining()I

    move-result p1

    .line 380
    :goto_0
    iget-object p3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {p3}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 381
    iget-object p3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {p3}, Ljava/nio/CharBuffer;->get()C

    move-result p3

    invoke-virtual {p2, p3}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    goto :goto_0

    .line 383
    :cond_1
    iget-object p2, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {p2}, Ljava/nio/CharBuffer;->compact()Ljava/nio/CharBuffer;

    return p1
.end method

.method private lineFromLineBuffer(Lorg/apache/httpcore/util/CharArrayBuffer;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 309
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/ByteArrayBuffer;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 311
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Lorg/apache/httpcore/util/ByteArrayBuffer;->byteAt(I)I

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    add-int/lit8 v0, v0, -0x1

    :cond_0
    if-lez v0, :cond_1

    .line 316
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Lorg/apache/httpcore/util/ByteArrayBuffer;->byteAt(I)I

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_1

    add-int/lit8 v0, v0, -0x1

    .line 321
    :cond_1
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 322
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Lorg/apache/httpcore/util/ByteArrayBuffer;II)V

    goto :goto_0

    .line 324
    :cond_2
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/httpcore/util/ByteArrayBuffer;->buffer()[B

    move-result-object v1

    invoke-static {v1, v2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 325
    invoke-direct {p0, p1, v0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->appendDecoded(Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 327
    :goto_0
    iget-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {p1}, Lorg/apache/httpcore/util/ByteArrayBuffer;->clear()V

    return v0
.end method

.method private lineFromReadBuffer(Lorg/apache/httpcore/util/CharArrayBuffer;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 334
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    add-int/lit8 v1, p2, 0x1

    .line 336
    iput v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    if-le p2, v0, :cond_0

    .line 337
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    add-int/lit8 v2, p2, -0x1

    aget-byte v1, v1, v2

    const/16 v2, 0xd

    if-ne v1, v2, :cond_0

    add-int/lit8 p2, p2, -0x1

    :cond_0
    sub-int/2addr p2, v0

    .line 342
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez v1, :cond_1

    .line 343
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-virtual {p1, v1, v0, p2}, Lorg/apache/httpcore/util/CharArrayBuffer;->append([BII)V

    goto :goto_0

    .line 345
    :cond_1
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-static {v1, v0, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 346
    invoke-direct {p0, p1, p2}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->appendDecoded(Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result p2

    :goto_0
    return p2
.end method

.method private streamRead([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->inStream:Ljava/io/InputStream;

    const-string v1, "Input stream"

    invoke-static {v0, v1}, Lorg/apache/httpcore/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 137
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->inStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    return p1
.end method


# virtual methods
.method public available()I
    .locals 2

    .line 132
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->capacity()I

    move-result v0

    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->length()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bind(Ljava/io/InputStream;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->inStream:Ljava/io/InputStream;

    return-void
.end method

.method public capacity()I
    .locals 1

    .line 122
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 167
    iput v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    .line 168
    iput v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    return-void
.end method

.method public fillBuffer()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    if-lez v0, :cond_1

    .line 143
    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    sub-int/2addr v1, v0

    const/4 v2, 0x0

    if-lez v1, :cond_0

    .line 145
    iget-object v3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-static {v3, v0, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    :cond_0
    iput v2, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    .line 148
    iput v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    .line 151
    :cond_1
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    .line 152
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    array-length v2, v1

    sub-int/2addr v2, v0

    .line 153
    invoke-direct {p0, v1, v0, v2}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->streamRead([BII)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    return v2

    :cond_2
    add-int/2addr v0, v1

    .line 157
    iput v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    .line 158
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    return v1
.end method

.method public getMetrics()Lorg/apache/httpcore/io/HttpTransportMetrics;
    .locals 1

    .line 401
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

    return-object v0
.end method

.method public hasBufferedData()Z
    .locals 2

    .line 163
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBound()Z
    .locals 1

    .line 117
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->inStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDataAvailable(I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 396
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result p1

    return p1
.end method

.method public length()I
    .locals 2

    .line 127
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    :cond_0
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    if-nez v0, :cond_1

    .line 175
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return v1

    .line 180
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 221
    :cond_0
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 188
    :cond_0
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 189
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    sub-int/2addr v0, v1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 190
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 191
    iget p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    add-int/2addr p1, p3

    iput p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    return p3

    .line 196
    :cond_1
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->minChunkLimit:I

    if-le p3, v0, :cond_3

    .line 197
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->streamRead([BII)I

    move-result p1

    if-lez p1, :cond_2

    .line 199
    iget-object p2, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

    int-to-long v0, p1

    invoke-virtual {p2, v0, v1}, Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    :cond_2
    return p1

    .line 204
    :cond_3
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    if-nez v0, :cond_4

    .line 205
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    return v1

    .line 210
    :cond_4
    iget v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    sub-int/2addr v0, v1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 211
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 212
    iget p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    add-int/2addr p1, p3

    iput p1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    return p3
.end method

.method public readLine(Lorg/apache/httpcore/util/CharArrayBuffer;)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Char array buffer"

    .line 241
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 242
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->constraints:Lorg/apache/httpcore/config/MessageConstraints;

    invoke-virtual {v0}, Lorg/apache/httpcore/config/MessageConstraints;->getMaxLineLength()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_0
    :goto_0
    const/4 v4, -0x1

    if-eqz v1, :cond_9

    .line 248
    iget v5, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    :goto_1
    iget v6, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    if-ge v5, v6, :cond_2

    .line 249
    iget-object v6, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    aget-byte v6, v6, v5

    const/16 v7, 0xa

    if-ne v6, v7, :cond_1

    goto :goto_2

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, -0x1

    :goto_2
    if-lez v0, :cond_5

    .line 256
    iget-object v6, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/httpcore/util/ByteArrayBuffer;->length()I

    move-result v6

    if-ltz v5, :cond_3

    move v7, v5

    goto :goto_3

    :cond_3
    iget v7, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    :goto_3
    add-int/2addr v6, v7

    iget v7, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    sub-int/2addr v6, v7

    if-ge v6, v0, :cond_4

    goto :goto_4

    .line 259
    :cond_4
    new-instance p1, Lorg/apache/httpcore/MessageConstraintException;

    const-string v0, "Maximum line length limit exceeded"

    invoke-direct {p1, v0}, Lorg/apache/httpcore/MessageConstraintException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :goto_4
    if-eq v5, v4, :cond_7

    .line 265
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/httpcore/util/ByteArrayBuffer;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 267
    invoke-direct {p0, p1, v5}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineFromReadBuffer(Lorg/apache/httpcore/util/CharArrayBuffer;I)I

    move-result p1

    return p1

    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 270
    iget v1, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    sub-int v4, v5, v1

    .line 271
    iget-object v6, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    iget-object v7, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-virtual {v6, v7, v1, v4}, Lorg/apache/httpcore/util/ByteArrayBuffer;->append([BII)V

    .line 272
    iput v5, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    :goto_5
    const/4 v1, 0x0

    goto :goto_0

    .line 275
    :cond_7
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 276
    iget v3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    iget v5, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    sub-int/2addr v3, v5

    .line 277
    iget-object v6, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    iget-object v7, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-virtual {v6, v7, v5, v3}, Lorg/apache/httpcore/util/ByteArrayBuffer;->append([BII)V

    .line 278
    iget v3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferLen:I

    iput v3, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bufferPos:I

    .line 280
    :cond_8
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result v3

    if-ne v3, v4, :cond_0

    goto :goto_5

    :cond_9
    if-ne v3, v4, :cond_a

    .line 286
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineBuffer:Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/ByteArrayBuffer;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    return v4

    .line 290
    :cond_a
    invoke-direct {p0, p1}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->lineFromLineBuffer(Lorg/apache/httpcore/util/CharArrayBuffer;)I

    move-result p1

    return p1
.end method

.method public readLine()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 389
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 390
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->readLine(Lorg/apache/httpcore/util/CharArrayBuffer;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 391
    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
