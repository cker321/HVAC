.class public Lorg/apache/httpcore/protocol/ResponseDate;
.super Ljava/lang/Object;
.source "ResponseDate.java"

# interfaces
.implements Lorg/apache/httpcore/HttpResponseInterceptor;


# static fields
.field private static final DATE_GENERATOR:Lorg/apache/httpcore/protocol/HttpDateGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    new-instance v0, Lorg/apache/httpcore/protocol/HttpDateGenerator;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/HttpDateGenerator;-><init>()V

    sput-object v0, Lorg/apache/httpcore/protocol/ResponseDate;->DATE_GENERATOR:Lorg/apache/httpcore/protocol/HttpDateGenerator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string p2, "HTTP response"

    .line 59
    invoke-static {p1, p2}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    invoke-interface {p1}, Lorg/apache/httpcore/HttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result p2

    const/16 v0, 0xc8

    if-lt p2, v0, :cond_0

    const-string p2, "Date"

    .line 62
    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 63
    sget-object v0, Lorg/apache/httpcore/protocol/ResponseDate;->DATE_GENERATOR:Lorg/apache/httpcore/protocol/HttpDateGenerator;

    invoke-virtual {v0}, Lorg/apache/httpcore/protocol/HttpDateGenerator;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    .line 64
    invoke-interface {p1, p2, v0}, Lorg/apache/httpcore/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
