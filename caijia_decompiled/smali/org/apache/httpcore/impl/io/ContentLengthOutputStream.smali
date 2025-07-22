.class public Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;
.super Ljava/io/OutputStream;
.source "ContentLengthOutputStream.java"


# instance fields
.field private closed:Z

.field private final contentLength:J

.field private final out:Lorg/apache/httpcore/io/SessionOutputBuffer;

.field private total:J


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionOutputBuffer;J)V
    .locals 1

    .line 79
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const-string v0, "Session output buffer"

    .line 80
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionOutputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    const-string p1, "Content length"

    .line 81
    invoke-static {p2, p3, p1}, Lorg/apache/httpcore/util/Args;->notNegative(JLjava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->contentLength:J

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 92
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->closed:Z

    .line 93
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->flush()V

    :cond_0
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->flush()V

    return-void
.end method

.method public write(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->closed:Z

    if-nez v0, :cond_1

    .line 128
    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->total:J

    iget-wide v2, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->contentLength:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 129
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/io/SessionOutputBuffer;->write(I)V

    .line 130
    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->total:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->total:J

    :cond_0
    return-void

    .line 126
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Attempted write to closed stream."

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->closed:Z

    if-nez v0, :cond_2

    .line 107
    iget-wide v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->total:J

    iget-wide v2, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->contentLength:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    sub-long/2addr v2, v0

    int-to-long v0, p3

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    long-to-int p3, v2

    .line 113
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/httpcore/io/SessionOutputBuffer;->write([BII)V

    .line 114
    iget-wide p1, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->total:J

    int-to-long v0, p3

    add-long/2addr p1, v0

    iput-wide p1, p0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;->total:J

    :cond_1
    return-void

    .line 105
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Attempted write to closed stream."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
