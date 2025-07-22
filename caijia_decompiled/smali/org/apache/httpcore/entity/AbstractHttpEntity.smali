.class public abstract Lorg/apache/httpcore/entity/AbstractHttpEntity;
.super Ljava/lang/Object;
.source "AbstractHttpEntity.java"

# interfaces
.implements Lorg/apache/httpcore/HttpEntity;


# static fields
.field protected static final OUTPUT_BUFFER_SIZE:I = 0x1000


# instance fields
.field protected chunked:Z

.field protected contentEncoding:Lorg/apache/httpcore/Header;

.field protected contentType:Lorg/apache/httpcore/Header;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public consumeContent()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public getContentEncoding()Lorg/apache/httpcore/Header;
    .locals 1

    .line 89
    iget-object v0, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentEncoding:Lorg/apache/httpcore/Header;

    return-object v0
.end method

.method public getContentType()Lorg/apache/httpcore/Header;
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentType:Lorg/apache/httpcore/Header;

    return-object v0
.end method

.method public isChunked()Z
    .locals 1

    .line 101
    iget-boolean v0, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->chunked:Z

    return v0
.end method

.method public setChunked(Z)V
    .locals 0

    .line 178
    iput-boolean p1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->chunked:Z

    return-void
.end method

.method public setContentEncoding(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 157
    new-instance v0, Lorg/apache/httpcore/message/BasicHeader;

    const-string v1, "Content-Encoding"

    invoke-direct {v0, v1, p1}, Lorg/apache/httpcore/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 159
    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;->setContentEncoding(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public setContentEncoding(Lorg/apache/httpcore/Header;)V
    .locals 0

    .line 143
    iput-object p1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentEncoding:Lorg/apache/httpcore/Header;

    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 128
    new-instance v0, Lorg/apache/httpcore/message/BasicHeader;

    const-string v1, "Content-Type"

    invoke-direct {v0, v1, p1}, Lorg/apache/httpcore/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 130
    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;->setContentType(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public setContentType(Lorg/apache/httpcore/Header;)V
    .locals 0

    .line 114
    iput-object p1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentType:Lorg/apache/httpcore/Header;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x5b

    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    iget-object v1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentType:Lorg/apache/httpcore/Header;

    const/16 v2, 0x2c

    if-eqz v1, :cond_0

    const-string v1, "Content-Type: "

    .line 198
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    iget-object v1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentType:Lorg/apache/httpcore/Header;

    invoke-interface {v1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 202
    :cond_0
    iget-object v1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentEncoding:Lorg/apache/httpcore/Header;

    if-eqz v1, :cond_1

    const-string v1, "Content-Encoding: "

    .line 203
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    iget-object v1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->contentEncoding:Lorg/apache/httpcore/Header;

    invoke-interface {v1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 207
    :cond_1
    invoke-virtual {p0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;->getContentLength()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-ltz v1, :cond_2

    const-string v1, "Content-Length: "

    .line 209
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 211
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2
    const-string v1, "Chunked: "

    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    iget-boolean v1, p0, Lorg/apache/httpcore/entity/AbstractHttpEntity;->chunked:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 216
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
