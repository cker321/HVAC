.class public abstract Lorg/apache/commons/fileupload/util/LimitedInputStream;
.super Ljava/io/FilterInputStream;
.source "LimitedInputStream.java"

# interfaces
.implements Lorg/apache/commons/fileupload/util/Closeable;


# instance fields
.field private closed:Z

.field private count:J

.field private final sizeMax:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;J)V
    .locals 0

    .line 52
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 53
    iput-wide p2, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->sizeMax:J

    return-void
.end method

.method private checkLimit()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-wide v0, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->count:J

    iget-wide v2, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->sizeMax:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 76
    invoke-virtual {p0, v2, v3, v0, v1}, Lorg/apache/commons/fileupload/util/LimitedInputStream;->raiseError(JJ)V

    :cond_0
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

    const/4 v0, 0x1

    .line 162
    iput-boolean v0, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->closed:Z

    .line 163
    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    return-void
.end method

.method public isClosed()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 148
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->closed:Z

    return v0
.end method

.method protected abstract raiseError(JJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 101
    iget-wide v1, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->count:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->count:J

    .line 102
    invoke-direct {p0}, Lorg/apache/commons/fileupload/util/LimitedInputStream;->checkLimit()V

    :cond_0
    return v0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterInputStream;->read([BII)I

    move-result p1

    if-lez p1, :cond_0

    .line 134
    iget-wide p2, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->count:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/commons/fileupload/util/LimitedInputStream;->count:J

    .line 135
    invoke-direct {p0}, Lorg/apache/commons/fileupload/util/LimitedInputStream;->checkLimit()V

    :cond_0
    return p1
.end method
