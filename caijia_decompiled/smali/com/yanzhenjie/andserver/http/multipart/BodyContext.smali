.class public Lcom/yanzhenjie/andserver/http/multipart/BodyContext;
.super Ljava/lang/Object;
.source "BodyContext.java"

# interfaces
.implements Lorg/apache/commons/fileupload/UploadContext;


# instance fields
.field private final mBody:Lcom/yanzhenjie/andserver/http/RequestBody;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/RequestBody;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->mBody:Lcom/yanzhenjie/andserver/http/RequestBody;

    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 58
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->mBody:Lcom/yanzhenjie/andserver/http/RequestBody;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/RequestBody;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCharacterEncoding()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->mBody:Lcom/yanzhenjie/andserver/http/RequestBody;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/RequestBody;->contentEncoding()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()I
    .locals 5

    .line 52
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->contentLength()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const v0, 0x7fffffff

    goto :goto_0

    :cond_0
    long-to-int v0, v0

    :goto_0
    return v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->mBody:Lcom/yanzhenjie/andserver/http/RequestBody;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/RequestBody;->contentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->mBody:Lcom/yanzhenjie/andserver/http/RequestBody;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/RequestBody;->stream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 68
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->contentLength()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/multipart/BodyContext;->getContentType()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "ContentLength=%s, Mime=%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
