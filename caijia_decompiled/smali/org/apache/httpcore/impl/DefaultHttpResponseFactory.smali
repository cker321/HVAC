.class public Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;
.super Ljava/lang/Object;
.source "DefaultHttpResponseFactory.java"

# interfaces
.implements Lorg/apache/httpcore/HttpResponseFactory;


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;


# instance fields
.field protected final reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    new-instance v0, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 72
    sget-object v0, Lorg/apache/httpcore/impl/EnglishReasonPhraseCatalog;->INSTANCE:Lorg/apache/httpcore/impl/EnglishReasonPhraseCatalog;

    invoke-direct {p0, v0}, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;-><init>(Lorg/apache/httpcore/ReasonPhraseCatalog;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/ReasonPhraseCatalog;)V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Reason phrase catalog"

    .line 64
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/ReasonPhraseCatalog;

    iput-object p1, p0, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    return-void
.end method


# virtual methods
.method protected determineLocale(Lorg/apache/httpcore/protocol/HttpContext;)Ljava/util/Locale;
    .locals 0

    .line 109
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    return-object p1
.end method

.method public newHttpResponse(Lorg/apache/httpcore/ProtocolVersion;ILorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;
    .locals 2

    const-string v0, "HTTP version"

    .line 82
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    invoke-virtual {p0, p3}, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->determineLocale(Lorg/apache/httpcore/protocol/HttpContext;)Ljava/util/Locale;

    move-result-object p3

    .line 84
    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    invoke-interface {v0, p2, p3}, Lorg/apache/httpcore/ReasonPhraseCatalog;->getReason(ILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 85
    new-instance v1, Lorg/apache/httpcore/message/BasicStatusLine;

    invoke-direct {v1, p1, p2, v0}, Lorg/apache/httpcore/message/BasicStatusLine;-><init>(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V

    .line 86
    new-instance p1, Lorg/apache/httpcore/message/BasicHttpResponse;

    iget-object p2, p0, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    invoke-direct {p1, v1, p2, p3}, Lorg/apache/httpcore/message/BasicHttpResponse;-><init>(Lorg/apache/httpcore/StatusLine;Lorg/apache/httpcore/ReasonPhraseCatalog;Ljava/util/Locale;)V

    return-object p1
.end method

.method public newHttpResponse(Lorg/apache/httpcore/StatusLine;Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/HttpResponse;
    .locals 2

    const-string v0, "Status line"

    .line 95
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 96
    new-instance v0, Lorg/apache/httpcore/message/BasicHttpResponse;

    iget-object v1, p0, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    invoke-virtual {p0, p2}, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->determineLocale(Lorg/apache/httpcore/protocol/HttpContext;)Ljava/util/Locale;

    move-result-object p2

    invoke-direct {v0, p1, v1, p2}, Lorg/apache/httpcore/message/BasicHttpResponse;-><init>(Lorg/apache/httpcore/StatusLine;Lorg/apache/httpcore/ReasonPhraseCatalog;Ljava/util/Locale;)V

    return-object v0
.end method
