.class public Lorg/apache/httpcore/impl/io/ChunkedInputStream;
.super Ljava/io/InputStream;
.source "ChunkedInputStream.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x800

.field private static final CHUNK_CRLF:I = 0x3

.field private static final CHUNK_DATA:I = 0x2

.field private static final CHUNK_INVALID:I = 0x7fffffff

.field private static final CHUNK_LEN:I = 0x1


# instance fields
.field private final buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

.field private chunkSize:J

.field private closed:Z

.field private final constraints:Lorg/apache/httpcore/config/MessageConstraints;

.field private eof:Z

.field private footers:[Lorg/apache/httpcore/Header;

.field private final in:Lorg/apache/httpcore/io/SessionInputBuffer;

.field private pos:J

.field private state:I


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;)V
    .locals 1

    const/4 v0, 0x0

    .line 114
    invoke-direct {p0, p1, v0}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)V
    .locals 2

    .line 100
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    .line 86
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->closed:Z

    new-array v0, v0, [Lorg/apache/httpcore/Header;

    .line 88
    iput-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->footers:[Lorg/apache/httpcore/Header;

    const-string v0, "Session input buffer"

    .line 101
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionInputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    const-wide/16 v0, 0x0

    .line 102
    iput-wide v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    .line 103
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 v0, 0x10

    invoke-direct {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 104
    :cond_0
    sget-object p2, Lorg/apache/httpcore/config/MessageConstraints;->DEFAULT:Lorg/apache/httpcore/config/MessageConstraints;

    :goto_0
    iput-object p2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->constraints:Lorg/apache/httpcore/config/MessageConstraints;

    const/4 p1, 0x1

    .line 105
    iput p1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    return-void
.end method

.method private getChunkSize()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    iget v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    .line 247
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->clear()V

    .line 248
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    iget-object v3, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {v0, v3}, Lorg/apache/httpcore/io/SessionInputBuffer;->readLine(Lorg/apache/httpcore/util/CharArrayBuffer;)I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 253
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    iput v2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    goto :goto_0

    .line 254
    :cond_0
    new-instance v0, Lorg/apache/httpcore/MalformedChunkCodingException;

    const-string v1, "Unexpected content at the end of chunk"

    invoke-direct {v0, v1}, Lorg/apache/httpcore/MalformedChunkCodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 250
    :cond_1
    new-instance v0, Lorg/apache/httpcore/MalformedChunkCodingException;

    const-string v1, "CRLF expected at end of chunk"

    invoke-direct {v0, v1}, Lorg/apache/httpcore/MalformedChunkCodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Inconsistent codec state"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 260
    :cond_3
    :goto_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->clear()V

    .line 261
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-interface {v0, v2}, Lorg/apache/httpcore/io/SessionInputBuffer;->readLine(Lorg/apache/httpcore/util/CharArrayBuffer;)I

    move-result v0

    if-eq v0, v1, :cond_5

    .line 266
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_4

    .line 268
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v0

    .line 270
    :cond_4
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x10

    .line 272
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 274
    :catch_0
    new-instance v1, Lorg/apache/httpcore/MalformedChunkCodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad chunk header: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/apache/httpcore/MalformedChunkCodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 263
    :cond_5
    new-instance v0, Lorg/apache/httpcore/ConnectionClosedException;

    const-string v1, "Premature end of chunk coded message body: closing chunk expected"

    invoke-direct {v0, v1}, Lorg/apache/httpcore/ConnectionClosedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private nextChunk()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    iget v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    const v1, 0x7fffffff

    if-eq v0, v1, :cond_2

    .line 222
    :try_start_0
    invoke-direct {p0}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->getChunkSize()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->chunkSize:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_1

    const/4 v0, 0x2

    .line 226
    iput v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    .line 227
    iput-wide v4, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 229
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    .line 230
    invoke-direct {p0}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->parseTrailerHeaders()V

    :cond_0
    return-void

    .line 224
    :cond_1
    new-instance v0, Lorg/apache/httpcore/MalformedChunkCodingException;

    const-string v2, "Negative chunk size"

    invoke-direct {v0, v2}, Lorg/apache/httpcore/MalformedChunkCodingException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lorg/apache/httpcore/MalformedChunkCodingException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 233
    iput v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    .line 234
    throw v0

    .line 219
    :cond_2
    new-instance v0, Lorg/apache/httpcore/MalformedChunkCodingException;

    const-string v1, "Corrupt data stream"

    invoke-direct {v0, v1}, Lorg/apache/httpcore/MalformedChunkCodingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private parseTrailerHeaders()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 287
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->constraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 288
    invoke-virtual {v1}, Lorg/apache/httpcore/config/MessageConstraints;->getMaxHeaderCount()I

    move-result v1

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->constraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 289
    invoke-virtual {v2}, Lorg/apache/httpcore/config/MessageConstraints;->getMaxLineLength()I

    move-result v2

    const/4 v3, 0x0

    .line 287
    invoke-static {v0, v1, v2, v3}, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->parseHeaders(Lorg/apache/httpcore/io/SessionInputBuffer;IILorg/apache/httpcore/message/LineParser;)[Lorg/apache/httpcore/Header;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->footers:[Lorg/apache/httpcore/Header;
    :try_end_0
    .catch Lorg/apache/httpcore/HttpException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 292
    new-instance v1, Lorg/apache/httpcore/MalformedChunkCodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid footer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    invoke-virtual {v0}, Lorg/apache/httpcore/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/httpcore/MalformedChunkCodingException;-><init>(Ljava/lang/String;)V

    .line 294
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 295
    throw v1
.end method


# virtual methods
.method public available()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    instance-of v1, v0, Lorg/apache/httpcore/io/BufferInfo;

    if-eqz v1, :cond_0

    .line 120
    check-cast v0, Lorg/apache/httpcore/io/BufferInfo;

    invoke-interface {v0}, Lorg/apache/httpcore/io/BufferInfo;->length()I

    move-result v0

    int-to-long v0, v0

    .line 121
    iget-wide v2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->chunkSize:J

    iget-wide v4, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v1, v0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->closed:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 309
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    if-nez v1, :cond_0

    iget v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    const v2, 0x7fffffff

    if-eq v1, v2, :cond_0

    const/16 v1, 0x800

    new-array v1, v1, [B

    .line 312
    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->read([B)I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ltz v2, :cond_0

    goto :goto_0

    .line 316
    :cond_0
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    .line 317
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->closed:Z

    goto :goto_1

    :catchall_0
    move-exception v1

    .line 316
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    .line 317
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->closed:Z

    .line 318
    throw v1

    :cond_1
    :goto_1
    return-void
.end method

.method public getFooters()[Lorg/apache/httpcore/Header;
    .locals 1

    .line 323
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->footers:[Lorg/apache/httpcore/Header;

    invoke-virtual {v0}, [Lorg/apache/httpcore/Header;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/httpcore/Header;

    return-object v0
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->closed:Z

    if-nez v0, :cond_3

    .line 143
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 146
    :cond_0
    iget v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    .line 147
    invoke-direct {p0}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->nextChunk()V

    .line 148
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    if-eqz v0, :cond_1

    return v1

    .line 152
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionInputBuffer;->read()I

    move-result v0

    if-eq v0, v1, :cond_2

    .line 154
    iget-wide v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    .line 155
    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->chunkSize:J

    cmp-long v5, v1, v3

    if-ltz v5, :cond_2

    const/4 v1, 0x3

    .line 156
    iput v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    :cond_2
    return v0

    .line 141
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Attempted read from closed stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->closed:Z

    if-nez v0, :cond_4

    .line 179
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 182
    :cond_0
    iget v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    .line 183
    invoke-direct {p0}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->nextChunk()V

    .line 184
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    if-eqz v0, :cond_1

    return v1

    .line 188
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    int-to-long v3, p3

    iget-wide v5, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->chunkSize:J

    iget-wide v7, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    sub-long/2addr v5, v7

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int p3, v3

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/httpcore/io/SessionInputBuffer;->read([BII)I

    move-result p1

    if-eq p1, v1, :cond_3

    .line 190
    iget-wide p2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    .line 191
    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->chunkSize:J

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    const/4 p2, 0x3

    .line 192
    iput p2, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->state:I

    :cond_2
    return p1

    :cond_3
    const/4 p1, 0x1

    .line 196
    iput-boolean p1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->eof:Z

    .line 197
    new-instance p2, Lorg/apache/httpcore/TruncatedChunkException;

    new-array p3, v2, [Ljava/lang/Object;

    const/4 v0, 0x0

    iget-wide v1, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->chunkSize:J

    .line 198
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, p3, v0

    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ChunkedInputStream;->pos:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, p3, p1

    const-string p1, "Truncated chunk (expected size: %,d; actual size: %,d)"

    invoke-direct {p2, p1, p3}, Lorg/apache/httpcore/TruncatedChunkException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p2

    .line 176
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Attempted read from closed stream."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
