.class public Lorg/apache/httpcore/entity/HttpEntityWrapper;
.super Ljava/lang/Object;
.source "HttpEntityWrapper.java"

# interfaces
.implements Lorg/apache/httpcore/HttpEntity;


# instance fields
.field protected wrappedEntity:Lorg/apache/httpcore/HttpEntity;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/HttpEntity;)V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Wrapped entity"

    .line 59
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/HttpEntity;

    iput-object p1, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    return-void
.end method


# virtual methods
.method public consumeContent()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 111
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->consumeContent()V

    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getContentEncoding()Lorg/apache/httpcore/Header;
    .locals 1

    .line 84
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentEncoding()Lorg/apache/httpcore/Header;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 74
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentType()Lorg/apache/httpcore/Header;
    .locals 1

    .line 79
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object v0

    return-object v0
.end method

.method public isChunked()Z
    .locals 1

    .line 69
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->isChunked()Z

    move-result v0

    return v0
.end method

.method public isRepeatable()Z
    .locals 1

    .line 64
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->isRepeatable()Z

    move-result v0

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    .line 101
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpEntity;->isStreaming()Z

    move-result v0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lorg/apache/httpcore/entity/HttpEntityWrapper;->wrappedEntity:Lorg/apache/httpcore/HttpEntity;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
