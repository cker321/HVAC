.class public final Lorg/apache/httpcore/util/EntityUtils;
.super Ljava/lang/Object;
.source "EntityUtils.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x1000


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static consume(Lorg/apache/httpcore/HttpEntity;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p0, :cond_0

    return-void

    .line 87
    :cond_0
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 90
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_1
    return-void
.end method

.method public static consumeQuietly(Lorg/apache/httpcore/HttpEntity;)V
    .locals 0

    .line 69
    :try_start_0
    invoke-static {p0}, Lorg/apache/httpcore/util/EntityUtils;->consume(Lorg/apache/httpcore/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public static getContentCharSet(Lorg/apache/httpcore/HttpEntity;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Entity"

    .line 159
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 161
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 162
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object p0

    invoke-interface {p0}, Lorg/apache/httpcore/Header;->getElements()[Lorg/apache/httpcore/HeaderElement;

    move-result-object p0

    .line 163
    array-length v0, p0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 164
    aget-object p0, p0, v0

    const-string v0, "charset"

    invoke-interface {p0, v0}, Lorg/apache/httpcore/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 166
    invoke-interface {p0}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static getContentMimeType(Lorg/apache/httpcore/HttpEntity;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Entity"

    .line 187
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 189
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 190
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object p0

    invoke-interface {p0}, Lorg/apache/httpcore/Header;->getElements()[Lorg/apache/httpcore/HeaderElement;

    move-result-object p0

    .line 191
    array-length v0, p0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 192
    aget-object p0, p0, v0

    invoke-interface {p0}, Lorg/apache/httpcore/HeaderElement;->getName()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static toByteArray(Lorg/apache/httpcore/HttpEntity;)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Entity"

    .line 123
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 124
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 129
    :cond_0
    :try_start_0
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v1

    const-wide/32 v3, 0x7fffffff

    const/4 v5, 0x0

    cmp-long v6, v1, v3

    if-gtz v6, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    const-string v2, "HTTP entity too large to be buffered in memory"

    invoke-static {v1, v2}, Lorg/apache/httpcore/util/Args;->check(ZLjava/lang/String;)V

    .line 131
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v1

    long-to-int p0, v1

    const/16 v1, 0x1000

    if-gez p0, :cond_2

    const/16 p0, 0x1000

    .line 135
    :cond_2
    new-instance v2, Lorg/apache/httpcore/util/ByteArrayBuffer;

    invoke-direct {v2, p0}, Lorg/apache/httpcore/util/ByteArrayBuffer;-><init>(I)V

    new-array p0, v1, [B

    .line 138
    :goto_1
    invoke-virtual {v0, p0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_3

    .line 139
    invoke-virtual {v2, p0, v5, v1}, Lorg/apache/httpcore/util/ByteArrayBuffer;->append([BII)V

    goto :goto_1

    .line 141
    :cond_3
    invoke-virtual {v2}, Lorg/apache/httpcore/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 144
    goto :goto_3

    :goto_2
    throw p0

    :goto_3
    goto :goto_2
.end method

.method public static toString(Lorg/apache/httpcore/HttpEntity;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Entity"

    .line 307
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 308
    invoke-static {p0}, Lorg/apache/httpcore/entity/ContentType;->get(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/httpcore/util/EntityUtils;->toString(Lorg/apache/httpcore/HttpEntity;Lorg/apache/httpcore/entity/ContentType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toString(Lorg/apache/httpcore/HttpEntity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 290
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p0, p1}, Lorg/apache/httpcore/util/EntityUtils;->toString(Lorg/apache/httpcore/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toString(Lorg/apache/httpcore/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Entity"

    .line 254
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 257
    :try_start_0
    invoke-static {p0}, Lorg/apache/httpcore/entity/ContentType;->get(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0
    :try_end_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {v0}, Lorg/apache/httpcore/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    if-nez v1, :cond_1

    .line 265
    invoke-virtual {v0, p1}, Lorg/apache/httpcore/entity/ContentType;->withCharset(Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    goto :goto_1

    .line 268
    :cond_0
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/httpcore/entity/ContentType;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/entity/ContentType;->withCharset(Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    .line 270
    :cond_1
    :goto_1
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/EntityUtils;->toString(Lorg/apache/httpcore/HttpEntity;Lorg/apache/httpcore/entity/ContentType;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 260
    :cond_2
    new-instance p0, Ljava/io/UnsupportedEncodingException;

    invoke-virtual {v0}, Ljava/nio/charset/UnsupportedCharsetException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static toString(Lorg/apache/httpcore/HttpEntity;Lorg/apache/httpcore/entity/ContentType;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 201
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 206
    :cond_0
    :try_start_0
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v2

    const-wide/32 v4, 0x7fffffff

    const/4 v6, 0x0

    cmp-long v7, v2, v4

    if-gtz v7, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    const-string v3, "HTTP entity too large to be buffered in memory"

    invoke-static {v2, v3}, Lorg/apache/httpcore/util/Args;->check(ZLjava/lang/String;)V

    .line 208
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentLength()J

    move-result-wide v2

    long-to-int p0, v2

    if-gez p0, :cond_2

    const/16 p0, 0x1000

    :cond_2
    if-eqz p1, :cond_4

    .line 214
    invoke-virtual {p1}, Lorg/apache/httpcore/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    if-nez v2, :cond_3

    .line 216
    invoke-virtual {p1}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/httpcore/entity/ContentType;->getByMimeType(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 217
    invoke-virtual {p1}, Lorg/apache/httpcore/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    move-object v1, p1

    goto :goto_1

    :cond_3
    move-object v1, v2

    :cond_4
    :goto_1
    if-nez v1, :cond_5

    .line 221
    sget-object v1, Lorg/apache/httpcore/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    .line 223
    :cond_5
    new-instance p1, Ljava/io/InputStreamReader;

    invoke-direct {p1, v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 224
    new-instance v1, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-direct {v1, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    const/16 p0, 0x400

    new-array p0, p0, [C

    .line 227
    :goto_2
    invoke-virtual {p1, p0}, Ljava/io/Reader;->read([C)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_6

    .line 228
    invoke-virtual {v1, p0, v6, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->append([CII)V

    goto :goto_2

    .line 230
    :cond_6
    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 233
    goto :goto_4

    :goto_3
    throw p0

    :goto_4
    goto :goto_3
.end method

.method public static updateEntity(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/HttpEntity;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Response"

    .line 108
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    invoke-interface {p0}, Lorg/apache/httpcore/HttpResponse;->getEntity()Lorg/apache/httpcore/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/httpcore/util/EntityUtils;->consume(Lorg/apache/httpcore/HttpEntity;)V

    .line 110
    invoke-interface {p0, p1}, Lorg/apache/httpcore/HttpResponse;->setEntity(Lorg/apache/httpcore/HttpEntity;)V

    return-void
.end method
