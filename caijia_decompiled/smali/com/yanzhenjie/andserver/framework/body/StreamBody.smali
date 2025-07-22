.class public Lcom/yanzhenjie/andserver/framework/body/StreamBody;
.super Ljava/lang/Object;
.source "StreamBody.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/ResponseBody;


# instance fields
.field private mLength:J

.field private mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

.field private mStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 40
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-direct {p0, p1, v0}, Lcom/yanzhenjie/andserver/framework/body/StreamBody;-><init>(Ljava/io/InputStream;Lcom/yanzhenjie/andserver/util/MediaType;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;J)V
    .locals 1

    .line 44
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/yanzhenjie/andserver/framework/body/StreamBody;-><init>(Ljava/io/InputStream;JLcom/yanzhenjie/andserver/util/MediaType;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JLcom/yanzhenjie/andserver/util/MediaType;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mStream:Ljava/io/InputStream;

    .line 53
    iput-wide p2, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mLength:J

    .line 54
    iput-object p4, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lcom/yanzhenjie/andserver/util/MediaType;)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 48
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/yanzhenjie/andserver/framework/body/StreamBody;-><init>(Ljava/io/InputStream;JLcom/yanzhenjie/andserver/util/MediaType;)V

    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 5

    .line 64
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mLength:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mStream:Ljava/io/InputStream;

    instance-of v1, v0, Ljava/io/FileInputStream;

    if-eqz v1, :cond_0

    .line 66
    :try_start_0
    check-cast v0, Ljava/io/FileInputStream;

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mLength:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 72
    :cond_0
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mLength:J

    return-wide v0
.end method

.method public contentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    return-object v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mStream:Ljava/io/InputStream;

    invoke-static {v0, p1}, Lcom/yanzhenjie/andserver/util/IOUtils;->write(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 84
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/body/StreamBody;->mStream:Ljava/io/InputStream;

    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-void
.end method
