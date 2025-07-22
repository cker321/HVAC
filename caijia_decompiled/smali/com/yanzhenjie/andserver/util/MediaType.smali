.class public Lcom/yanzhenjie/andserver/util/MediaType;
.super Lcom/yanzhenjie/andserver/util/MimeType;
.source "MediaType.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ALL:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final ALL_VALUE:Ljava/lang/String; = "*/*"

.field public static final APPLICATION_ATOM_XML:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_ATOM_XML_VALUE:Ljava/lang/String; = "application/atom+xml"

.field public static final APPLICATION_FORM_URLENCODED:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_FORM_URLENCODED_VALUE:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field public static final APPLICATION_JSON:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_JSON_UTF8:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_JSON_UTF8_VALUE:Ljava/lang/String; = "application/json;charset=UTF-8"

.field public static final APPLICATION_JSON_VALUE:Ljava/lang/String; = "application/json"

.field public static final APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_OCTET_STREAM_VALUE:Ljava/lang/String; = "application/octet-stream"

.field public static final APPLICATION_PDF:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_PDF_VALUE:Ljava/lang/String; = "application/pdf"

.field public static final APPLICATION_RSS_XML:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_RSS_XML_VALUE:Ljava/lang/String; = "application/rss+xml"

.field public static final APPLICATION_XHTML_XML:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_XHTML_XML_VALUE:Ljava/lang/String; = "application/xhtml+xml"

.field public static final APPLICATION_XML:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_XML_UTF8:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final APPLICATION_XML_UTF8_VALUE:Ljava/lang/String; = "application/xml;charset=UTF-8"

.field public static final APPLICATION_XML_VALUE:Ljava/lang/String; = "application/xml"

.field public static final IMAGE_GIF:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final IMAGE_GIF_VALUE:Ljava/lang/String; = "image/gif"

.field public static final IMAGE_JPEG:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final IMAGE_JPEG_VALUE:Ljava/lang/String; = "image/jpeg"

.field public static final IMAGE_PNG:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final IMAGE_PNG_VALUE:Ljava/lang/String; = "image/png"

.field public static final MULTIPART_FORM_DATA:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final MULTIPART_FORM_DATA_VALUE:Ljava/lang/String; = "multipart/form-data"

.field private static final PARAM_QUALITY_FACTOR:Ljava/lang/String; = "q"

.field public static final QUALITY_VALUE_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPECIFICITY_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEXT_EVENT_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final TEXT_EVENT_STREAM_VALUE:Ljava/lang/String; = "text/event-stream"

.field public static final TEXT_HTML:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final TEXT_HTML_VALUE:Ljava/lang/String; = "text/html"

.field public static final TEXT_MARKDOWN:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final TEXT_MARKDOWN_VALUE:Ljava/lang/String; = "text/markdown"

.field public static final TEXT_PLAIN:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final TEXT_PLAIN_VALUE:Ljava/lang/String; = "text/plain"

.field public static final TEXT_XML:Lcom/yanzhenjie/andserver/util/MediaType;

.field public static final TEXT_XML_VALUE:Ljava/lang/String; = "text/xml"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "*/*"

    .line 248
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->ALL:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/json"

    .line 249
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_JSON:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/json;charset=UTF-8"

    .line 250
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_JSON_UTF8:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/xml"

    .line 251
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_XML:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/xml;charset=UTF-8"

    .line 252
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_XML_UTF8:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/atom+xml"

    .line 253
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_ATOM_XML:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/x-www-form-urlencoded"

    .line 254
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_FORM_URLENCODED:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/octet-stream"

    .line 255
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/rss+xml"

    .line 256
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_RSS_XML:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/xhtml+xml"

    .line 257
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_XHTML_XML:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "application/pdf"

    .line 258
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_PDF:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "image/gif"

    .line 259
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->IMAGE_GIF:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "image/jpeg"

    .line 260
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->IMAGE_JPEG:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "image/png"

    .line 261
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->IMAGE_PNG:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "multipart/form-data"

    .line 262
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->MULTIPART_FORM_DATA:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "text/event-stream"

    .line 263
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_EVENT_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "text/html"

    .line 264
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_HTML:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "text/markdown"

    .line 265
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_MARKDOWN:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "text/plain"

    .line 266
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_PLAIN:Lcom/yanzhenjie/andserver/util/MediaType;

    const-string v0, "text/xml"

    .line 267
    invoke-static {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->TEXT_XML:Lcom/yanzhenjie/andserver/util/MediaType;

    .line 637
    new-instance v0, Lcom/yanzhenjie/andserver/util/MediaType$1;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/MediaType$1;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->QUALITY_VALUE_COMPARATOR:Ljava/util/Comparator;

    .line 673
    new-instance v0, Lcom/yanzhenjie/andserver/util/MediaType$2;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/util/MediaType$2;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->SPECIFICITY_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MediaType;Ljava/nio/charset/Charset;)V
    .locals 0

    .line 332
    invoke-direct {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Lcom/yanzhenjie/andserver/util/MimeType;Ljava/nio/charset/Charset;)V

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MediaType;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 345
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 279
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 293
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;D)V
    .locals 0

    .line 319
    invoke-static {p3, p4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p3

    const-string p4, "q"

    invoke-static {p4, p3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 0

    .line 306
    invoke-direct {p0, p1, p2, p3}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 358
    invoke-direct {p0, p1, p2, p3}, Lcom/yanzhenjie/andserver/util/MimeType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static getFileMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 609
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->getUrlExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 610
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->hasExtension(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 611
    sget-object p0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    return-object p0

    .line 614
    :cond_0
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 616
    :try_start_0
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 618
    :catch_0
    sget-object p0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_OCTET_STREAM:Lcom/yanzhenjie/andserver/util/MediaType;

    return-object p0
.end method

.method public static getUrlExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 630
    invoke-static {p0}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 631
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, ""

    :cond_0
    return-object p0
.end method

.method public static parseMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 4

    .line 464
    :try_start_0
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/MimeType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MimeType;

    move-result-object v0
    :try_end_0
    .catch Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 469
    :try_start_1
    new-instance v1, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MimeType;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MimeType;->getSubtype()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MimeType;->getParameters()Ljava/util/Map;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 471
    new-instance v1, Lcom/yanzhenjie/andserver/error/InvalidMediaTypeException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/yanzhenjie/andserver/error/InvalidMediaTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    :catch_1
    move-exception p0

    .line 466
    new-instance v0, Lcom/yanzhenjie/andserver/error/InvalidMediaTypeException;

    invoke-direct {v0, p0}, Lcom/yanzhenjie/andserver/error/InvalidMediaTypeException;-><init>(Lcom/yanzhenjie/andserver/error/InvalidMimeTypeException;)V

    throw v0
.end method

.method public static parseMediaTypes(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation

    .line 487
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 488
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 491
    :cond_0
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, ","

    invoke-direct {v0, p0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 493
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 494
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 495
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 496
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 497
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 501
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 502
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 503
    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method public static parseMediaTypes(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;"
        }
    .end annotation

    if-eqz p0, :cond_3

    .line 520
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 522
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    .line 523
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaTypes(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 525
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 526
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 527
    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaTypes(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_2
    return-object v0

    .line 521
    :cond_3
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static sortByQualityValue(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;)V"
        }
    .end annotation

    const-string v0, "\'mediaTypes\' must not be null"

    .line 583
    invoke-static {p0, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 584
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 585
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->QUALITY_VALUE_COMPARATOR:Ljava/util/Comparator;

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    return-void
.end method

.method public static sortBySpecificity(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;)V"
        }
    .end annotation

    const-string v0, "\'mediaTypes\' must not be null"

    .line 558
    invoke-static {p0, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 559
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 560
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->SPECIFICITY_COMPARATOR:Ljava/util/Comparator;

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    return-void
.end method

.method public static sortBySpecificityAndQuality(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            ">;)V"
        }
    .end annotation

    const-string v0, "\'mediaTypes\' must not be null"

    .line 594
    invoke-static {p0, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 595
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 596
    new-instance v0, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/util/Comparator;

    const/4 v3, 0x0

    sget-object v4, Lcom/yanzhenjie/andserver/util/MediaType;->SPECIFICITY_COMPARATOR:Ljava/util/Comparator;

    aput-object v4, v2, v3

    sget-object v3, Lcom/yanzhenjie/andserver/util/MediaType;->QUALITY_VALUE_COMPARATOR:Ljava/util/Comparator;

    aput-object v3, v2, v1

    invoke-direct {v0, v2}, Lcom/yanzhenjie/andserver/util/comparator/CompoundComparator;-><init>([Ljava/util/Comparator;)V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 0

    .line 449
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->parseMediaType(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected checkParameters(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 363
    invoke-super {p0, p1, p2}, Lcom/yanzhenjie/andserver/util/MimeType;->checkParameters(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "q"

    .line 364
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 365
    invoke-virtual {p0, p2}, Lcom/yanzhenjie/andserver/util/MediaType;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 366
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 367
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid quality value \'"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\': should be between 0.0 and 1.0"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-wide/16 v2, 0x0

    cmpl-double p2, v0, v2

    if-ltz p2, :cond_0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpg-double p2, v0, v2

    if-gtz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 368
    :goto_0
    invoke-static {p2, p1}, Lcom/yanzhenjie/andserver/util/Assert;->isTrue(ZLjava/lang/String;)V

    :cond_1
    return-void
.end method

.method public copyQualityValue(Lcom/yanzhenjie/andserver/util/MediaType;)Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 3

    .line 416
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object v0

    const-string v1, "q"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 419
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 420
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    new-instance p1, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-direct {p1, p0, v0}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Lcom/yanzhenjie/andserver/util/MediaType;Ljava/util/Map;)V

    return-object p1
.end method

.method public getQualityValue()D
    .locals 2

    const-string v0, "q"

    .line 378
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 379
    invoke-virtual {p0, v0}, Lcom/yanzhenjie/andserver/util/MediaType;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    :goto_0
    return-wide v0
.end method

.method public includes(Lcom/yanzhenjie/andserver/util/MediaType;)Z
    .locals 0

    .line 393
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->includes(Lcom/yanzhenjie/andserver/util/MimeType;)Z

    move-result p1

    return p1
.end method

.method public isCompatibleWith(Lcom/yanzhenjie/andserver/util/MediaType;)Z
    .locals 0

    .line 407
    invoke-super {p0, p1}, Lcom/yanzhenjie/andserver/util/MimeType;->isCompatibleWith(Lcom/yanzhenjie/andserver/util/MimeType;)Z

    move-result p1

    return p1
.end method

.method public removeQualityValue()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 3

    .line 430
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object v0

    const-string v1, "q"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 433
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 434
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    new-instance v1, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-direct {v1, p0, v0}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Lcom/yanzhenjie/andserver/util/MediaType;Ljava/util/Map;)V

    return-object v1
.end method
