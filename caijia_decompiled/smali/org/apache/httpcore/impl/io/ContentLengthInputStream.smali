.class public Lorg/apache/httpcore/impl/io/ContentLengthInputStream;
.super Ljava/io/InputStream;
.source "ContentLengthInputStream.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x800


# instance fields
.field private closed:Z

.field private final contentLength:J

.field private in:Lorg/apache/httpcore/io/SessionInputBuffer;

.field private pos:J


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;J)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const-wide/16 v0, 0x0

    .line 64
    iput-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    const/4 v0, 0x0

    .line 67
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->closed:Z

    const/4 v0, 0x0

    .line 72
    iput-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    const-string v0, "Session input buffer"

    .line 84
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionInputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    const-string p1, "Content length"

    .line 85
    invoke-static {p2, p3, p1}, Lorg/apache/httpcore/util/Args;->notNegative(JLjava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    return-void
.end method


# virtual methods
.method public available()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    instance-of v1, v0, Lorg/apache/httpcore/io/BufferInfo;

    if-eqz v1, :cond_0

    .line 116
    check-cast v0, Lorg/apache/httpcore/io/BufferInfo;

    invoke-interface {v0}, Lorg/apache/httpcore/io/BufferInfo;->length()I

    move-result v0

    .line 117
    iget-wide v1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    sub-long/2addr v1, v3

    long-to-int v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public close()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->closed:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 99
    :try_start_0
    iget-wide v1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v5, v1, v3

    if-gez v5, :cond_0

    const/16 v1, 0x800

    new-array v1, v1, [B

    .line 101
    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->read([B)I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ltz v2, :cond_0

    goto :goto_0

    .line 108
    :cond_0
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->closed:Z

    goto :goto_1

    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->closed:Z

    .line 109
    throw v1

    :cond_1
    :goto_1
    return-void
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->closed:Z

    if-nez v0, :cond_3

    .line 134
    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v2, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    const/4 v4, -0x1

    cmp-long v5, v0, v2

    if-ltz v5, :cond_0

    return v4

    .line 137
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionInputBuffer;->read()I

    move-result v0

    if-ne v0, v4, :cond_2

    .line 139
    iget-wide v1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v5, v1, v3

    if-ltz v5, :cond_1

    goto :goto_0

    .line 140
    :cond_1
    new-instance v0, Lorg/apache/httpcore/ConnectionClosedException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    .line 142
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "Premature end of Content-Length delimited message body (expected: %,d; received: %,d)"

    invoke-direct {v0, v2, v1}, Lorg/apache/httpcore/ConnectionClosedException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    .line 145
    :cond_2
    iget-wide v1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    :goto_0
    return v0

    .line 131
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

    .line 198
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->closed:Z

    if-nez v0, :cond_5

    .line 168
    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v2, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    const/4 v4, -0x1

    cmp-long v5, v0, v2

    if-ltz v5, :cond_0

    return v4

    :cond_0
    int-to-long v5, p3

    add-long/2addr v5, v0

    cmp-long v7, v5, v2

    if-lez v7, :cond_1

    sub-long/2addr v2, v0

    long-to-int p3, v2

    .line 176
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/httpcore/io/SessionInputBuffer;->read([BII)I

    move-result p1

    if-ne p1, v4, :cond_3

    .line 177
    iget-wide p2, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    goto :goto_0

    .line 178
    :cond_2
    new-instance p1, Lorg/apache/httpcore/ConnectionClosedException;

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p3, 0x0

    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    .line 180
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, p2, p3

    const/4 p3, 0x1

    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, p2, p3

    const-string p3, "Premature end of Content-Length delimited message body (expected: %,d; received: %,d)"

    invoke-direct {p1, p3, p2}, Lorg/apache/httpcore/ConnectionClosedException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p1

    :cond_3
    :goto_0
    if-lez p1, :cond_4

    .line 183
    iget-wide p2, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    :cond_4
    return p1

    .line 165
    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Attempted read from closed stream."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public skip(J)J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    return-wide v0

    :cond_0
    const/16 v2, 0x800

    new-array v2, v2, [B

    .line 217
    iget-wide v3, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->contentLength:J

    iget-wide v5, p0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->pos:J

    sub-long/2addr v3, v5

    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    move-wide v3, v0

    :goto_0
    cmp-long v5, p1, v0

    if-lez v5, :cond_2

    const/4 v5, 0x0

    const-wide/16 v6, 0x800

    .line 221
    invoke-static {v6, v7, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v7, v6

    invoke-virtual {p0, v2, v5, v7}, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;->read([BII)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_1

    goto :goto_1

    :cond_1
    int-to-long v5, v5

    add-long/2addr v3, v5

    sub-long/2addr p1, v5

    goto :goto_0

    :cond_2
    :goto_1
    return-wide v3
.end method
