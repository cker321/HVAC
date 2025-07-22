.class Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;
.super Ljava/lang/Object;
.source "StandardRequest.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/RequestBody;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/http/StandardRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EntityToBody"
.end annotation


# instance fields
.field private mEntity:Lorg/apache/httpcore/HttpEntity;


# direct methods
.method private constructor <init>(Lorg/apache/httpcore/HttpEntity;)V
    .locals 0

    .line 562
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 563
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->mEntity:Lorg/apache/httpcore/HttpEntity;

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/httpcore/HttpEntity;Lcom/yanzhenjie/andserver/http/StandardRequest$1;)V
    .locals 0

    .line 558
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;-><init>(Lorg/apache/httpcore/HttpEntity;)V

    return-void
.end method


# virtual methods
.method public contentEncoding()Ljava/lang/String;
    .locals 1

    .line 568
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->mEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    .line 569
    :cond_0
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public contentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 580
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->mEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 585
    :cond_0
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 586
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    return-object v0
.end method

.method public length()J
    .locals 2

    .line 574
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->mEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public stream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 592
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->mEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 593
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->contentEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "gzip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 594
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v1

    :cond_0
    return-object v0
.end method

.method public string()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 602
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->contentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 603
    :cond_0
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MimeType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    .line 606
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->stream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 608
    :cond_1
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/StandardRequest$EntityToBody;->stream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/yanzhenjie/andserver/util/IOUtils;->toString(Ljava/io/InputStream;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
