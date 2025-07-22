.class Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;
.super Ljava/lang/Object;
.source "HttpService.java"

# interfaces
.implements Lorg/apache/httpcore/protocol/HttpRequestHandlerMapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/httpcore/protocol/HttpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HttpRequestHandlerResolverAdapter"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final resolver:Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;)V
    .locals 0

    .line 453
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 454
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;->resolver:Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;

    return-void
.end method


# virtual methods
.method public lookup(Lorg/apache/httpcore/HttpRequest;)Lorg/apache/httpcore/protocol/HttpRequestHandler;
    .locals 1

    .line 459
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpService$HttpRequestHandlerResolverAdapter;->resolver:Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;

    invoke-interface {p1}, Lorg/apache/httpcore/HttpRequest;->getRequestLine()Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/httpcore/RequestLine;->getUri()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/apache/httpcore/protocol/HttpRequestHandlerResolver;->lookup(Ljava/lang/String;)Lorg/apache/httpcore/protocol/HttpRequestHandler;

    move-result-object p1

    return-object p1
.end method
