.class public Lorg/apache/httpcore/protocol/ResponseServer;
.super Ljava/lang/Object;
.source "ResponseServer.java"

# interfaces
.implements Lorg/apache/httpcore/HttpResponseInterceptor;


# instance fields
.field private final originServer:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, v0}, Lorg/apache/httpcore/protocol/ResponseServer;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/apache/httpcore/protocol/ResponseServer;->originServer:Ljava/lang/String;

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

    .line 65
    invoke-static {p1, p2}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string p2, "Server"

    .line 66
    invoke-interface {p1, p2}, Lorg/apache/httpcore/HttpResponse;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    iget-object v0, p0, Lorg/apache/httpcore/protocol/ResponseServer;->originServer:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 68
    invoke-interface {p1, p2, v0}, Lorg/apache/httpcore/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
