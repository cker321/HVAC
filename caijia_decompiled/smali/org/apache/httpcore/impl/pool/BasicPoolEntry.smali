.class public Lorg/apache/httpcore/impl/pool/BasicPoolEntry;
.super Lorg/apache/httpcore/pool/PoolEntry;
.source "BasicPoolEntry.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/httpcore/pool/PoolEntry<",
        "Lorg/apache/httpcore/HttpHost;",
        "Lorg/apache/httpcore/HttpClientConnection;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/httpcore/HttpHost;Lorg/apache/httpcore/HttpClientConnection;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/httpcore/pool/PoolEntry;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 55
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/pool/BasicPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpClientConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 57
    :try_start_1
    invoke-interface {v0}, Lorg/apache/httpcore/HttpClientConnection;->getSocketTimeout()I

    move-result v1

    const/16 v2, 0x3e8

    if-lez v1, :cond_0

    if-le v1, v2, :cond_1

    .line 59
    :cond_0
    invoke-interface {v0, v2}, Lorg/apache/httpcore/HttpClientConnection;->setSocketTimeout(I)V

    .line 61
    :cond_1
    invoke-interface {v0}, Lorg/apache/httpcore/HttpClientConnection;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 63
    :catch_0
    :try_start_2
    invoke-interface {v0}, Lorg/apache/httpcore/HttpClientConnection;->shutdown()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :goto_0
    return-void
.end method

.method public isClosed()Z
    .locals 1

    .line 71
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/pool/BasicPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpClientConnection;

    invoke-interface {v0}, Lorg/apache/httpcore/HttpClientConnection;->isOpen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
