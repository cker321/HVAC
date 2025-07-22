.class public Lorg/apache/httpcore/entity/StringEntity;
.super Lorg/apache/httpcore/entity/AbstractHttpEntity;
.source "StringEntity.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field protected final content:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 146
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/httpcore/entity/ContentType;

    invoke-direct {p0, p1, v0}, Lorg/apache/httpcore/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/httpcore/entity/ContentType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .line 116
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->TEXT_PLAIN:Lorg/apache/httpcore/entity/ContentType;

    invoke-virtual {v0}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lorg/apache/httpcore/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/httpcore/entity/ContentType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 94
    invoke-direct {p0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;-><init>()V

    const-string v0, "Source string"

    .line 95
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const-string p2, "text/plain"

    :goto_0
    if-eqz p3, :cond_1

    goto :goto_1

    :cond_1
    const-string p3, "ISO-8859-1"

    .line 98
    :goto_1
    invoke-virtual {p1, p3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/entity/StringEntity;->content:[B

    .line 99
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "; charset="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 1

    .line 132
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->TEXT_PLAIN:Lorg/apache/httpcore/entity/ContentType;

    invoke-virtual {v0}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lorg/apache/httpcore/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/httpcore/entity/ContentType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/httpcore/entity/ContentType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;-><init>()V

    const-string v0, "Source string"

    .line 65
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    .line 66
    invoke-virtual {p2}, Lorg/apache/httpcore/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 68
    sget-object v0, Lorg/apache/httpcore/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    .line 70
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/entity/StringEntity;->content:[B

    if-eqz p2, :cond_2

    .line 72
    invoke-virtual {p2}, Lorg/apache/httpcore/entity/ContentType;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 183
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/httpcore/entity/StringEntity;->content:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 156
    iget-object v0, p0, Lorg/apache/httpcore/entity/StringEntity;->content:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

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

    const-string v0, "Output stream"

    .line 166
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 167
    iget-object v0, p0, Lorg/apache/httpcore/entity/StringEntity;->content:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 168
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    return-void
.end method
