.class public Lorg/apache/httpcore/impl/pool/BasicConnPool;
.super Lorg/apache/httpcore/pool/AbstractConnPool;
.source "BasicConnPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/httpcore/pool/AbstractConnPool<",
        "Lorg/apache/httpcore/HttpHost;",
        "Lorg/apache/httpcore/HttpClientConnection;",
        "Lorg/apache/httpcore/impl/pool/BasicPoolEntry;",
        ">;"
    }
.end annotation


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/pool/BasicConnPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 80
    new-instance v0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;

    sget-object v1, Lorg/apache/httpcore/config/SocketConfig;->DEFAULT:Lorg/apache/httpcore/config/SocketConfig;

    sget-object v2, Lorg/apache/httpcore/config/ConnectionConfig;->DEFAULT:Lorg/apache/httpcore/config/ConnectionConfig;

    invoke-direct {v0, v1, v2}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Lorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V

    const/4 v1, 0x2

    const/16 v2, 0x14

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/httpcore/pool/AbstractConnPool;-><init>(Lorg/apache/httpcore/pool/ConnFactory;II)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V
    .locals 1

    .line 73
    new-instance v0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;

    invoke-direct {v0, p1, p2}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Lorg/apache/httpcore/config/SocketConfig;Lorg/apache/httpcore/config/ConnectionConfig;)V

    const/4 p1, 0x2

    const/16 p2, 0x14

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/httpcore/pool/AbstractConnPool;-><init>(Lorg/apache/httpcore/pool/ConnFactory;II)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/params/HttpParams;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 66
    new-instance v0, Lorg/apache/httpcore/impl/pool/BasicConnFactory;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/impl/pool/BasicConnFactory;-><init>(Lorg/apache/httpcore/params/HttpParams;)V

    const/4 p1, 0x2

    const/16 v1, 0x14

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/httpcore/pool/AbstractConnPool;-><init>(Lorg/apache/httpcore/pool/ConnFactory;II)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/pool/ConnFactory;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/pool/ConnFactory<",
            "Lorg/apache/httpcore/HttpHost;",
            "Lorg/apache/httpcore/HttpClientConnection;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x2

    const/16 v1, 0x14

    .line 58
    invoke-direct {p0, p1, v0, v1}, Lorg/apache/httpcore/pool/AbstractConnPool;-><init>(Lorg/apache/httpcore/pool/ConnFactory;II)V

    return-void
.end method


# virtual methods
.method protected createEntry(Lorg/apache/httpcore/HttpHost;Lorg/apache/httpcore/HttpClientConnection;)Lorg/apache/httpcore/impl/pool/BasicPoolEntry;
    .locals 3

    .line 87
    new-instance v0, Lorg/apache/httpcore/impl/pool/BasicPoolEntry;

    sget-object v1, Lorg/apache/httpcore/impl/pool/BasicConnPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/apache/httpcore/impl/pool/BasicPoolEntry;-><init>(Ljava/lang/String;Lorg/apache/httpcore/HttpHost;Lorg/apache/httpcore/HttpClientConnection;)V

    return-object v0
.end method

.method protected bridge synthetic createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolEntry;
    .locals 0

    .line 51
    check-cast p1, Lorg/apache/httpcore/HttpHost;

    check-cast p2, Lorg/apache/httpcore/HttpClientConnection;

    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/impl/pool/BasicConnPool;->createEntry(Lorg/apache/httpcore/HttpHost;Lorg/apache/httpcore/HttpClientConnection;)Lorg/apache/httpcore/impl/pool/BasicPoolEntry;

    move-result-object p1

    return-object p1
.end method

.method protected validate(Lorg/apache/httpcore/impl/pool/BasicPoolEntry;)Z
    .locals 0

    .line 92
    invoke-virtual {p1}, Lorg/apache/httpcore/impl/pool/BasicPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/HttpClientConnection;

    invoke-interface {p1}, Lorg/apache/httpcore/HttpClientConnection;->isStale()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method protected bridge synthetic validate(Lorg/apache/httpcore/pool/PoolEntry;)Z
    .locals 0

    .line 51
    check-cast p1, Lorg/apache/httpcore/impl/pool/BasicPoolEntry;

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/impl/pool/BasicConnPool;->validate(Lorg/apache/httpcore/impl/pool/BasicPoolEntry;)Z

    move-result p1

    return p1
.end method
