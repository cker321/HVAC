.class public final Lorg/apache/httpcore/entity/ContentType;
.super Ljava/lang/Object;
.source "ContentType.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final APPLICATION_ATOM_XML:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_FORM_URLENCODED:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_JSON:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_OCTET_STREAM:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_SOAP_XML:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_SVG_XML:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_XHTML_XML:Lorg/apache/httpcore/entity/ContentType;

.field public static final APPLICATION_XML:Lorg/apache/httpcore/entity/ContentType;

.field private static final CONTENT_TYPE_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/httpcore/entity/ContentType;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_BINARY:Lorg/apache/httpcore/entity/ContentType;

.field public static final DEFAULT_TEXT:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_BMP:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_GIF:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_JPEG:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_PNG:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_SVG:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_TIFF:Lorg/apache/httpcore/entity/ContentType;

.field public static final IMAGE_WEBP:Lorg/apache/httpcore/entity/ContentType;

.field public static final MULTIPART_FORM_DATA:Lorg/apache/httpcore/entity/ContentType;

.field public static final TEXT_HTML:Lorg/apache/httpcore/entity/ContentType;

.field public static final TEXT_PLAIN:Lorg/apache/httpcore/entity/ContentType;

.field public static final TEXT_XML:Lorg/apache/httpcore/entity/ContentType;

.field public static final WILDCARD:Lorg/apache/httpcore/entity/ContentType;

.field private static final serialVersionUID:J = -0x6bcff2af98b1a2b8L


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private final mimeType:Ljava/lang/String;

.field private final params:[Lorg/apache/httpcore/NameValuePair;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 72
    sget-object v0, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v1, "application/atom+xml"

    invoke-static {v1, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_ATOM_XML:Lorg/apache/httpcore/entity/ContentType;

    .line 74
    sget-object v0, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v1, "application/x-www-form-urlencoded"

    invoke-static {v1, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_FORM_URLENCODED:Lorg/apache/httpcore/entity/ContentType;

    .line 76
    sget-object v0, Lorg/apache/httpcore/Consts;->UTF_8:Ljava/nio/charset/Charset;

    const-string v1, "application/json"

    invoke-static {v1, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_JSON:Lorg/apache/httpcore/entity/ContentType;

    const/4 v0, 0x0

    .line 78
    check-cast v0, Ljava/nio/charset/Charset;

    const-string v1, "application/octet-stream"

    invoke-static {v1, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_OCTET_STREAM:Lorg/apache/httpcore/entity/ContentType;

    .line 80
    sget-object v1, Lorg/apache/httpcore/Consts;->UTF_8:Ljava/nio/charset/Charset;

    const-string v2, "application/soap+xml"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_SOAP_XML:Lorg/apache/httpcore/entity/ContentType;

    .line 82
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "application/svg+xml"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_SVG_XML:Lorg/apache/httpcore/entity/ContentType;

    .line 84
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "application/xhtml+xml"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_XHTML_XML:Lorg/apache/httpcore/entity/ContentType;

    .line 86
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "application/xml"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_XML:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/bmp"

    .line 88
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_BMP:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/gif"

    .line 90
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_GIF:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/jpeg"

    .line 92
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_JPEG:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/png"

    .line 94
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_PNG:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/svg+xml"

    .line 96
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_SVG:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/tiff"

    .line 98
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_TIFF:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "image/webp"

    .line 100
    invoke-static {v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->IMAGE_WEBP:Lorg/apache/httpcore/entity/ContentType;

    .line 102
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "multipart/form-data"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->MULTIPART_FORM_DATA:Lorg/apache/httpcore/entity/ContentType;

    .line 104
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "text/html"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->TEXT_HTML:Lorg/apache/httpcore/entity/ContentType;

    .line 106
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "text/plain"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->TEXT_PLAIN:Lorg/apache/httpcore/entity/ContentType;

    .line 108
    sget-object v1, Lorg/apache/httpcore/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    const-string v2, "text/xml"

    invoke-static {v2, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v1

    sput-object v1, Lorg/apache/httpcore/entity/ContentType;->TEXT_XML:Lorg/apache/httpcore/entity/ContentType;

    const-string v1, "*/*"

    .line 110
    invoke-static {v1, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->WILDCARD:Lorg/apache/httpcore/entity/ContentType;

    const/16 v0, 0x11

    new-array v1, v0, [Lorg/apache/httpcore/entity/ContentType;

    .line 117
    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_ATOM_XML:Lorg/apache/httpcore/entity/ContentType;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_FORM_URLENCODED:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_JSON:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x2

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_SVG_XML:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x3

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_XHTML_XML:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x4

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_XML:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x5

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_BMP:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x6

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_GIF:Lorg/apache/httpcore/entity/ContentType;

    const/4 v4, 0x7

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_JPEG:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0x8

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_PNG:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0x9

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_SVG:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0xa

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_TIFF:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0xb

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->IMAGE_WEBP:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0xc

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->MULTIPART_FORM_DATA:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0xd

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->TEXT_HTML:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0xe

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->TEXT_PLAIN:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0xf

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/httpcore/entity/ContentType;->TEXT_XML:Lorg/apache/httpcore/entity/ContentType;

    const/16 v4, 0x10

    aput-object v2, v1, v4

    .line 135
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    :goto_0
    if-ge v3, v0, :cond_0

    .line 136
    aget-object v4, v1, v3

    .line 137
    invoke-virtual {v4}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 139
    :cond_0
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->CONTENT_TYPE_MAP:Ljava/util/Map;

    .line 143
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->TEXT_PLAIN:Lorg/apache/httpcore/entity/ContentType;

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/httpcore/entity/ContentType;

    .line 144
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->APPLICATION_OCTET_STREAM:Lorg/apache/httpcore/entity/ContentType;

    sput-object v0, Lorg/apache/httpcore/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/httpcore/entity/ContentType;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    iput-object p1, p0, Lorg/apache/httpcore/entity/ContentType;->mimeType:Ljava/lang/String;

    .line 154
    iput-object p2, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    const/4 p1, 0x0

    .line 155
    iput-object p1, p0, Lorg/apache/httpcore/entity/ContentType;->params:[Lorg/apache/httpcore/NameValuePair;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;[Lorg/apache/httpcore/NameValuePair;)V
    .locals 0

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput-object p1, p0, Lorg/apache/httpcore/entity/ContentType;->mimeType:Ljava/lang/String;

    .line 163
    iput-object p2, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    .line 164
    iput-object p3, p0, Lorg/apache/httpcore/entity/ContentType;->params:[Lorg/apache/httpcore/NameValuePair;

    return-void
.end method

.method public static create(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;
    .locals 1

    const/4 v0, 0x0

    .line 241
    check-cast v0, Ljava/nio/charset/Charset;

    invoke-static {p0, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .line 257
    invoke-static {p1}, Lorg/apache/httpcore/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p0, p1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;
    .locals 2

    const-string v0, "MIME type"

    .line 228
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notBlank(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 229
    invoke-static {p0}, Lorg/apache/httpcore/entity/ContentType;->valid(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "MIME type may not contain reserved characters"

    invoke-static {v0, v1}, Lorg/apache/httpcore/util/Args;->check(ZLjava/lang/String;)V

    .line 230
    new-instance v0, Lorg/apache/httpcore/entity/ContentType;

    invoke-direct {v0, p0, p1}, Lorg/apache/httpcore/entity/ContentType;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static varargs create(Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;)Lorg/apache/httpcore/entity/ContentType;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    const-string v0, "MIME type"

    .line 296
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notBlank(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 297
    invoke-static {v0}, Lorg/apache/httpcore/entity/ContentType;->valid(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "MIME type may not contain reserved characters"

    invoke-static {v0, v1}, Lorg/apache/httpcore/util/Args;->check(ZLjava/lang/String;)V

    const/4 v0, 0x1

    .line 298
    invoke-static {p0, p1, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    return-object p0
.end method

.method private static create(Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/entity/ContentType;
    .locals 6

    .line 266
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x0

    if-ge v1, v0, :cond_2

    aget-object v3, p1, v1

    .line 267
    invoke-interface {v3}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "charset"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 268
    invoke-interface {v3}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 269
    invoke-static {v0}, Lorg/apache/httpcore/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 271
    :try_start_0
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p2
    :try_end_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    if-nez p2, :cond_0

    goto :goto_1

    .line 274
    :cond_0
    throw v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    move-object p2, v2

    .line 281
    :goto_2
    new-instance v0, Lorg/apache/httpcore/entity/ContentType;

    if-eqz p1, :cond_3

    array-length v1, p1

    if-lez v1, :cond_3

    goto :goto_3

    :cond_3
    move-object p1, v2

    :goto_3
    invoke-direct {v0, p0, p2, p1}, Lorg/apache/httpcore/entity/ContentType;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;[Lorg/apache/httpcore/NameValuePair;)V

    return-object v0
.end method

.method private static create(Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/entity/ContentType;
    .locals 1

    .line 261
    invoke-interface {p0}, Lorg/apache/httpcore/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/apache/httpcore/HeaderElement;->getParameters()[Lorg/apache/httpcore/NameValuePair;

    move-result-object p0

    invoke-static {v0, p0, p1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    return-object p0
.end method

.method public static get(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 341
    :cond_0
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 343
    invoke-interface {p0}, Lorg/apache/httpcore/Header;->getElements()[Lorg/apache/httpcore/HeaderElement;

    move-result-object p0

    .line 344
    array-length v1, p0

    if-lez v1, :cond_1

    const/4 v0, 0x0

    .line 345
    aget-object p0, p0, v0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v0
.end method

.method public static getByMimeType(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 424
    :cond_0
    sget-object v0, Lorg/apache/httpcore/entity/ContentType;->CONTENT_TYPE_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/apache/httpcore/entity/ContentType;

    return-object p0
.end method

.method public static getLenient(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 365
    :cond_0
    invoke-interface {p0}, Lorg/apache/httpcore/HttpEntity;->getContentType()Lorg/apache/httpcore/Header;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 368
    :try_start_0
    invoke-interface {p0}, Lorg/apache/httpcore/Header;->getElements()[Lorg/apache/httpcore/HeaderElement;

    move-result-object p0

    .line 369
    array-length v1, p0

    if-lez v1, :cond_1

    const/4 v1, 0x0

    .line 370
    aget-object p0, p0, v1

    invoke-static {p0, v1}, Lorg/apache/httpcore/entity/ContentType;->create(Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0
    :try_end_0
    .catch Lorg/apache/httpcore/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_1
    return-object v0
.end method

.method public static getLenientOrDefault(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .line 407
    invoke-static {p0}, Lorg/apache/httpcore/entity/ContentType;->get(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 408
    :cond_0
    sget-object p0, Lorg/apache/httpcore/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/httpcore/entity/ContentType;

    :goto_0
    return-object p0
.end method

.method public static getOrDefault(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .line 392
    invoke-static {p0}, Lorg/apache/httpcore/entity/ContentType;->get(Lorg/apache/httpcore/HttpEntity;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 393
    :cond_0
    sget-object p0, Lorg/apache/httpcore/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/httpcore/entity/ContentType;

    :goto_0
    return-object p0
.end method

.method public static parse(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    const-string v0, "Content type"

    .line 313
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 314
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 315
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 316
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    .line 317
    sget-object v2, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    invoke-virtual {v2, v0, v1}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->parseElements(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/HeaderElement;

    move-result-object v0

    .line 318
    array-length v1, v0

    if-lez v1, :cond_0

    .line 319
    aget-object p0, v0, v3

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/httpcore/entity/ContentType;->create(Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p0

    return-object p0

    .line 321
    :cond_0
    new-instance v0, Lorg/apache/httpcore/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid content type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static valid(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 210
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 211
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_1

    const/16 v3, 0x2c

    if-eq v2, v3, :cond_1

    const/16 v3, 0x3b

    if-ne v2, v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .line 172
    iget-object v0, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .line 168
    iget-object v0, p0, Lorg/apache/httpcore/entity/ContentType;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const-string v0, "Parameter name"

    .line 179
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notEmpty(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 180
    iget-object v0, p0, Lorg/apache/httpcore/entity/ContentType;->params:[Lorg/apache/httpcore/NameValuePair;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 183
    :cond_0
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 184
    invoke-interface {v4}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 185
    invoke-interface {v4}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 197
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 198
    iget-object v1, p0, Lorg/apache/httpcore/entity/ContentType;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 199
    iget-object v1, p0, Lorg/apache/httpcore/entity/ContentType;->params:[Lorg/apache/httpcore/NameValuePair;

    if-eqz v1, :cond_0

    const-string v1, "; "

    .line 200
    invoke-virtual {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 201
    sget-object v1, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    iget-object v2, p0, Lorg/apache/httpcore/entity/ContentType;->params:[Lorg/apache/httpcore/NameValuePair;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->formatParameters(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    goto :goto_0

    .line 202
    :cond_0
    iget-object v1, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    if-eqz v1, :cond_1

    const-string v1, "; charset="

    .line 203
    invoke-virtual {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 204
    iget-object v1, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 206
    :cond_1
    :goto_0
    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withCharset(Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;
    .locals 1

    .line 448
    invoke-virtual {p0}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p1

    return-object p1
.end method

.method public withCharset(Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;
    .locals 1

    .line 435
    invoke-virtual {p0}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p1

    return-object p1
.end method

.method public varargs withParameters([Lorg/apache/httpcore/NameValuePair;)Lorg/apache/httpcore/entity/ContentType;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .line 460
    array-length v0, p1

    if-nez v0, :cond_0

    return-object p0

    .line 463
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 464
    iget-object v1, p0, Lorg/apache/httpcore/entity/ContentType;->params:[Lorg/apache/httpcore/NameValuePair;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 465
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v1, v4

    .line 466
    invoke-interface {v5}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 469
    :cond_1
    array-length v1, p1

    :goto_1
    if-ge v2, v1, :cond_2

    aget-object v3, p1, v2

    .line 470
    invoke-interface {v3}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 472
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 473
    iget-object v1, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    if-eqz v1, :cond_3

    const-string v1, "charset"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 474
    new-instance v3, Lorg/apache/httpcore/message/BasicNameValuePair;

    iget-object v4, p0, Lorg/apache/httpcore/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/httpcore/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    :cond_3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 477
    new-instance v3, Lorg/apache/httpcore/message/BasicNameValuePair;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v3, v4, v1}, Lorg/apache/httpcore/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 479
    :cond_4
    invoke-virtual {p0}, Lorg/apache/httpcore/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/httpcore/NameValuePair;

    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/httpcore/NameValuePair;

    invoke-static {v0, p1, v2}, Lorg/apache/httpcore/entity/ContentType;->create(Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/entity/ContentType;

    move-result-object p1

    return-object p1
.end method
