.class public Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;
.super Ljava/lang/Object;
.source "DefaultHttpResponseParserFactory.java"

# interfaces
.implements Lorg/apache/httpcore/io/HttpMessageParserFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/io/HttpMessageParserFactory<",
        "Lorg/apache/httpcore/HttpResponse;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;


# instance fields
.field private final lineParser:Lorg/apache/httpcore/message/LineParser;

.field private final responseFactory:Lorg/apache/httpcore/HttpResponseFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    new-instance v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;->INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, v0, v0}, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;-><init>(Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpResponseFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpResponseFactory;)V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 58
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    :goto_0
    iput-object p1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;->lineParser:Lorg/apache/httpcore/message/LineParser;

    if-eqz p2, :cond_1

    goto :goto_1

    .line 59
    :cond_1
    sget-object p2, Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultHttpResponseFactory;

    :goto_1
    iput-object p2, p0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/io/HttpMessageParser;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/io/SessionInputBuffer;",
            "Lorg/apache/httpcore/config/MessageConstraints;",
            ")",
            "Lorg/apache/httpcore/io/HttpMessageParser<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;"
        }
    .end annotation

    .line 70
    new-instance v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParser;

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;->lineParser:Lorg/apache/httpcore/message/LineParser;

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParserFactory;->responseFactory:Lorg/apache/httpcore/HttpResponseFactory;

    invoke-direct {v0, p1, v1, v2, p2}, Lorg/apache/httpcore/impl/io/DefaultHttpResponseParser;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/HttpResponseFactory;Lorg/apache/httpcore/config/MessageConstraints;)V

    return-object v0
.end method
