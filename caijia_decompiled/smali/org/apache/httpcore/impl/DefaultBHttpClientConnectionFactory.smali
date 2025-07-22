.class public Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;
.super Ljava/lang/Object;
.source "DefaultBHttpClientConnectionFactory.java"

# interfaces
.implements Lorg/apache/httpcore/HttpConnectionFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/HttpConnectionFactory<",
        "Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;


# instance fields
.field private final cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

.field private final incomingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

.field private final outgoingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

.field private final requestWriterFactory:Lorg/apache/httpcore/io/HttpMessageWriterFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/io/HttpMessageWriterFactory<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final responseParserFactory:Lorg/apache/httpcore/io/HttpMessageParserFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/io/HttpMessageParserFactory<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    new-instance v0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->INSTANCE:Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    .line 85
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;-><init>(Lorg/apache/httpcore/config/ConnectionConfig;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/config/ConnectionConfig;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 81
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;-><init>(Lorg/apache/httpcore/config/ConnectionConfig;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/config/ConnectionConfig;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/config/ConnectionConfig;",
            "Lorg/apache/httpcore/entity/ContentLengthStrategy;",
            "Lorg/apache/httpcore/entity/ContentLengthStrategy;",
            "Lorg/apache/httpcore/io/HttpMessageWriterFactory<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;",
            "Lorg/apache/httpcore/io/HttpMessageParserFactory<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    sget-object p1, Lorg/apache/httpcore/config/ConnectionConfig;->DEFAULT:Lorg/apache/httpcore/config/ConnectionConfig;

    :goto_0
    iput-object p1, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

    .line 67
    iput-object p2, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->incomingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    .line 68
    iput-object p3, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->outgoingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    .line 69
    iput-object p4, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->requestWriterFactory:Lorg/apache/httpcore/io/HttpMessageWriterFactory;

    .line 70
    iput-object p5, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->responseParserFactory:Lorg/apache/httpcore/io/HttpMessageParserFactory;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/config/ConnectionConfig;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/config/ConnectionConfig;",
            "Lorg/apache/httpcore/io/HttpMessageWriterFactory<",
            "Lorg/apache/httpcore/HttpRequest;",
            ">;",
            "Lorg/apache/httpcore/io/HttpMessageParserFactory<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;)V"
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    .line 77
    invoke-direct/range {v0 .. v5}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;-><init>(Lorg/apache/httpcore/config/ConnectionConfig;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic createConnection(Ljava/net/Socket;)Lorg/apache/httpcore/HttpConnection;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->createConnection(Ljava/net/Socket;)Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    move-result-object p1

    return-object p1
.end method

.method public createConnection(Ljava/net/Socket;)Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    new-instance v10, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;

    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

    .line 91
    invoke-virtual {v0}, Lorg/apache/httpcore/config/ConnectionConfig;->getBufferSize()I

    move-result v1

    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

    .line 92
    invoke-virtual {v0}, Lorg/apache/httpcore/config/ConnectionConfig;->getFragmentSizeHint()I

    move-result v2

    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

    .line 93
    invoke-static {v0}, Lorg/apache/httpcore/impl/ConnSupport;->createDecoder(Lorg/apache/httpcore/config/ConnectionConfig;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

    .line 94
    invoke-static {v0}, Lorg/apache/httpcore/impl/ConnSupport;->createEncoder(Lorg/apache/httpcore/config/ConnectionConfig;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v4

    iget-object v0, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->cconfig:Lorg/apache/httpcore/config/ConnectionConfig;

    .line 95
    invoke-virtual {v0}, Lorg/apache/httpcore/config/ConnectionConfig;->getMessageConstraints()Lorg/apache/httpcore/config/MessageConstraints;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->incomingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    iget-object v7, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->outgoingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    iget-object v8, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->requestWriterFactory:Lorg/apache/httpcore/io/HttpMessageWriterFactory;

    iget-object v9, p0, Lorg/apache/httpcore/impl/DefaultBHttpClientConnectionFactory;->responseParserFactory:Lorg/apache/httpcore/io/HttpMessageParserFactory;

    move-object v0, v10

    invoke-direct/range {v0 .. v9}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/io/HttpMessageWriterFactory;Lorg/apache/httpcore/io/HttpMessageParserFactory;)V

    .line 100
    invoke-virtual {v10, p1}, Lorg/apache/httpcore/impl/DefaultBHttpClientConnection;->bind(Ljava/net/Socket;)V

    return-object v10
.end method
