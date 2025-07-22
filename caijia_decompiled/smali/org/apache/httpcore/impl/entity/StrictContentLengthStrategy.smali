.class public Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;
.super Ljava/lang/Object;
.source "StrictContentLengthStrategy.java"

# interfaces
.implements Lorg/apache/httpcore/entity/ContentLengthStrategy;


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;


# instance fields
.field private final implicitLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    new-instance v0, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;->INSTANCE:Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, -0x1

    .line 76
    invoke-direct {p0, v0}, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput p1, p0, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;->implicitLen:I

    return-void
.end method


# virtual methods
.method public determineLength(Lorg/apache/httpcore/HttpMessage;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    const-string v0, "HTTP message"

    .line 81
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Transfer-Encoding"

    .line 85
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 87
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string v1, "chunked"

    .line 88
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    invoke-interface {p1}, Lorg/apache/httpcore/HttpMessage;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    sget-object v1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/ProtocolVersion;->lessEquals(Lorg/apache/httpcore/ProtocolVersion;)Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, -0x2

    return-wide v0

    .line 90
    :cond_0
    new-instance v0, Lorg/apache/httpcore/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Chunked transfer encoding not allowed for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-interface {p1}, Lorg/apache/httpcore/HttpMessage;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string p1, "identity"

    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-wide/16 v0, -0x1

    return-wide v0

    .line 98
    :cond_2
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported transfer encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    const-string v0, "Content-Length"

    .line 102
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 104
    invoke-interface {p1}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object p1

    .line 106
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_4

    return-wide v0

    .line 108
    :cond_4
    new-instance v0, Lorg/apache/httpcore/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Negative content length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :catch_0
    new-instance v0, Lorg/apache/httpcore/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid content length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_5
    iget p1, p0, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;->implicitLen:I

    int-to-long v0, p1

    return-wide v0
.end method
