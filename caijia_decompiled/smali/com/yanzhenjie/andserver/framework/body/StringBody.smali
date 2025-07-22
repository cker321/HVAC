.class public Lcom/yanzhenjie/andserver/framework/body/StringBody;
.super Ljava/lang/Object;
.source "StringBody.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/ResponseBody;


# instance fields
.field private mBody:[B

.field private mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 42
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_PLAIN:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-direct {p0, p1, v0}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;Lcom/yanzhenjie/andserver/util/MediaType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/yanzhenjie/andserver/util/MediaType;)V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 50
    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    if-nez p2, :cond_0

    .line 52
    new-instance p2, Lcom/yanzhenjie/andserver/util/MediaType;

    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_PLAIN:Lcom/yanzhenjie/andserver/util/MediaType;

    sget-object v1, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p2, v0, v1}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Lcom/yanzhenjie/andserver/util/MediaType;Ljava/nio/charset/Charset;)V

    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    .line 55
    :cond_0
    iget-object p2, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p2

    if-nez p2, :cond_1

    .line 57
    sget-object p2, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 59
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mBody:[B

    return-void

    .line 47
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The content cannot be null or empty."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mBody:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public contentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 4

    .line 75
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    if-nez v0, :cond_0

    .line 77
    sget-object v0, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 78
    new-instance v1, Lcom/yanzhenjie/andserver/util/MediaType;

    iget-object v2, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v3}, Lcom/yanzhenjie/andserver/util/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-object v1

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mMediaType:Lcom/yanzhenjie/andserver/util/MediaType;

    return-object v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/body/StringBody;->mBody:[B

    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->write(Ljava/io/OutputStream;[B)V

    return-void
.end method
