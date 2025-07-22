.class Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;
.super Ljava/lang/Object;
.source "StandardResponse.java"

# interfaces
.implements Lorg/apache/httpcore/HttpEntity;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/http/StandardResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BodyToEntity"
.end annotation


# instance fields
.field private mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;


# direct methods
.method private constructor <init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V
    .locals 0

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;->mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;

    return-void
.end method

.method synthetic constructor <init>(Lcom/yanzhenjie/andserver/http/ResponseBody;Lcom/yanzhenjie/andserver/http/StandardResponse$1;)V
    .locals 0

    .line 149
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;-><init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    return-void
.end method


# virtual methods
.method public consumeContent()V
    .locals 0

    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentEncoding()Lorg/apache/httpcore/Header;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;->mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/ResponseBody;->contentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentType()Lorg/apache/httpcore/Header;
    .locals 3

    .line 174
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;->mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/ResponseBody;->contentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 178
    :cond_0
    new-instance v1, Lorg/apache/httpcore/message/BasicHeader;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Content-Type"

    invoke-direct {v1, v2, v0}, Lorg/apache/httpcore/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public isChunked()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isStreaming()Z
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

    .line 193
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/StandardResponse$BodyToEntity;->mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/ResponseBody;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
