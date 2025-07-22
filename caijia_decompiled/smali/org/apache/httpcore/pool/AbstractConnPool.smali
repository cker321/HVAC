.class public abstract Lorg/apache/httpcore/pool/AbstractConnPool;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lorg/apache/httpcore/pool/ConnPool;
.implements Lorg/apache/httpcore/pool/ConnPoolControl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "E:",
        "Lorg/apache/httpcore/pool/PoolEntry<",
        "TT;TC;>;>",
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/pool/ConnPool<",
        "TT;TE;>;",
        "Lorg/apache/httpcore/pool/ConnPoolControl<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final available:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final condition:Ljava/util/concurrent/locks/Condition;

.field private final connFactory:Lorg/apache/httpcore/pool/ConnFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/httpcore/pool/ConnFactory<",
            "TT;TC;>;"
        }
    .end annotation
.end field

.field private volatile defaultMaxPerRoute:I

.field private volatile isShutDown:Z

.field private final leased:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final maxPerRoute:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile maxTotal:I

.field private final pending:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/util/concurrent/Future<",
            "TE;>;>;"
        }
    .end annotation
.end field

.field private final routeToPool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TT;",
            "Lorg/apache/httpcore/pool/RouteSpecificPool<",
            "TT;TC;TE;>;>;"
        }
    .end annotation
.end field

.field private volatile validateAfterInactivity:I


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/pool/ConnFactory;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/pool/ConnFactory<",
            "TT;TC;>;II)V"
        }
    .end annotation

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Connection factory"

    .line 92
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/pool/ConnFactory;

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->connFactory:Lorg/apache/httpcore/pool/ConnFactory;

    const-string p1, "Max per route value"

    .line 93
    invoke-static {p2, p1}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->defaultMaxPerRoute:I

    const-string p1, "Max total value"

    .line 94
    invoke-static {p3, p1}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxTotal:I

    .line 95
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    .line 96
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->condition:Ljava/util/concurrent/locks/Condition;

    .line 97
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    .line 98
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 99
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 100
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 101
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/httpcore/pool/AbstractConnPool;)Ljava/util/concurrent/locks/Lock;
    .locals 0

    .line 70
    iget-object p0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/httpcore/pool/AbstractConnPool;)Ljava/util/concurrent/locks/Condition;
    .locals 0

    .line 70
    iget-object p0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->condition:Ljava/util/concurrent/locks/Condition;

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/Exception;
    .locals 1

    .line 70
    invoke-static {}, Lorg/apache/httpcore/pool/AbstractConnPool;->operationAborted()Ljava/lang/Exception;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/apache/httpcore/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/Future;)Lorg/apache/httpcore/pool/PoolEntry;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 70
    invoke-direct/range {p0 .. p6}, Lorg/apache/httpcore/pool/AbstractConnPool;->getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/Future;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lorg/apache/httpcore/pool/AbstractConnPool;)I
    .locals 0

    .line 70
    iget p0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->validateAfterInactivity:I

    return p0
.end method

.method private getMax(Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 447
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_0

    .line 448
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_0
    iget p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->defaultMaxPerRoute:I

    :goto_0
    return p1
.end method

.method private getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/apache/httpcore/pool/RouteSpecificPool<",
            "TT;TC;TE;>;"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/pool/RouteSpecificPool;

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Lorg/apache/httpcore/pool/AbstractConnPool$1;

    invoke-direct {v0, p0, p1, p1}, Lorg/apache/httpcore/pool/AbstractConnPool$1;-><init>(Lorg/apache/httpcore/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 176
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/Future;)Lorg/apache/httpcore/pool/PoolEntry;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ljava/util/concurrent/Future<",
            "TE;>;)TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-lez v2, :cond_0

    .line 317
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p3

    add-long/2addr v1, p3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 319
    :goto_0
    iget-object p3, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 321
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;

    move-result-object p3

    .line 324
    :cond_1
    :goto_1
    iget-boolean p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->isShutDown:Z

    const/4 p5, 0x1

    const/4 v1, 0x0

    if-nez p4, :cond_2

    const/4 p4, 0x1

    goto :goto_2

    :cond_2
    const/4 p4, 0x0

    :goto_2
    const-string v2, "Connection pool shut down"

    invoke-static {p4, v2}, Lorg/apache/httpcore/util/Asserts;->check(ZLjava/lang/String;)V

    .line 325
    invoke-interface {p6}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result p4

    if-nez p4, :cond_e

    .line 329
    :goto_3
    invoke-virtual {p3, p2}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getFree(Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object p4

    if-nez p4, :cond_3

    goto :goto_4

    .line 333
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p4, v2, v3}, Lorg/apache/httpcore/pool/PoolEntry;->isExpired(J)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 334
    invoke-virtual {p4}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    .line 336
    :cond_4
    invoke-virtual {p4}, Lorg/apache/httpcore/pool/PoolEntry;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 337
    iget-object v2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2, p4}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 338
    invoke-virtual {p3, p4, v1}, Lorg/apache/httpcore/pool/RouteSpecificPool;->free(Lorg/apache/httpcore/pool/PoolEntry;Z)V

    goto :goto_3

    :cond_5
    :goto_4
    if-eqz p4, :cond_6

    .line 344
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {p1, p4}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 345
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 346
    invoke-virtual {p0, p4}, Lorg/apache/httpcore/pool/AbstractConnPool;->onReuse(Lorg/apache/httpcore/pool/PoolEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 414
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p4

    .line 351
    :cond_6
    :try_start_1
    invoke-direct {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result p4

    .line 353
    invoke-virtual {p3}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v2

    add-int/2addr v2, p5

    sub-int/2addr v2, p4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-lez v2, :cond_8

    const/4 v3, 0x0

    :goto_5
    if-ge v3, v2, :cond_8

    .line 356
    invoke-virtual {p3}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getLastUsed()Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object v4

    if-nez v4, :cond_7

    goto :goto_6

    .line 360
    :cond_7
    invoke-virtual {v4}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    .line 361
    iget-object v5, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v5, v4}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 362
    invoke-virtual {p3, v4}, Lorg/apache/httpcore/pool/RouteSpecificPool;->remove(Lorg/apache/httpcore/pool/PoolEntry;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 366
    :cond_8
    :goto_6
    invoke-virtual {p3}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v2

    if-ge v2, p4, :cond_a

    .line 367
    iget-object p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {p4}, Ljava/util/Set;->size()I

    move-result p4

    .line 368
    iget v2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxTotal:I

    sub-int/2addr v2, p4

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result p4

    if-lez p4, :cond_a

    .line 370
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {p2}, Ljava/util/LinkedList;->size()I

    move-result p2

    sub-int/2addr p4, p5

    if-le p2, p4, :cond_9

    .line 372
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {p2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_9

    .line 373
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {p2}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/httpcore/pool/PoolEntry;

    .line 374
    invoke-virtual {p2}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    .line 375
    invoke-virtual {p2}, Lorg/apache/httpcore/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object p4

    invoke-direct {p0, p4}, Lorg/apache/httpcore/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;

    move-result-object p4

    .line 376
    invoke-virtual {p4, p2}, Lorg/apache/httpcore/pool/RouteSpecificPool;->remove(Lorg/apache/httpcore/pool/PoolEntry;)Z

    .line 379
    :cond_9
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->connFactory:Lorg/apache/httpcore/pool/ConnFactory;

    invoke-interface {p2, p1}, Lorg/apache/httpcore/pool/ConnFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 380
    invoke-virtual {p3, p1}, Lorg/apache/httpcore/pool/RouteSpecificPool;->add(Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object p1

    .line 381
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 414
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    .line 388
    :cond_a
    :try_start_2
    invoke-virtual {p3, p6}, Lorg/apache/httpcore/pool/RouteSpecificPool;->queue(Ljava/util/concurrent/Future;)V

    .line 389
    iget-object p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {p4, p6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    if-eqz v0, :cond_b

    .line 391
    iget-object p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p4, v0}, Ljava/util/concurrent/locks/Condition;->awaitUntil(Ljava/util/Date;)Z

    move-result p5

    goto :goto_7

    .line 393
    :cond_b
    iget-object p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p4}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 396
    :goto_7
    invoke-interface {p6}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result p4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez p4, :cond_d

    .line 404
    :try_start_3
    invoke-virtual {p3, p6}, Lorg/apache/httpcore/pool/RouteSpecificPool;->unqueue(Ljava/util/concurrent/Future;)V

    .line 405
    iget-object p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {p4, p6}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    if-nez p5, :cond_1

    if-eqz v0, :cond_1

    .line 408
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide p4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    cmp-long v3, p4, v1

    if-lez v3, :cond_c

    goto/16 :goto_1

    .line 412
    :cond_c
    new-instance p1, Ljava/util/concurrent/TimeoutException;

    const-string p2, "Timeout waiting for connection"

    invoke-direct {p1, p2}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 397
    :cond_d
    :try_start_4
    new-instance p1, Ljava/util/concurrent/ExecutionException;

    invoke-static {}, Lorg/apache/httpcore/pool/AbstractConnPool;->operationAborted()Ljava/lang/Exception;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    .line 404
    :try_start_5
    invoke-virtual {p3, p6}, Lorg/apache/httpcore/pool/RouteSpecificPool;->unqueue(Ljava/util/concurrent/Future;)V

    .line 405
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {p2, p6}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 406
    throw p1

    .line 326
    :cond_e
    new-instance p1, Ljava/util/concurrent/ExecutionException;

    invoke-static {}, Lorg/apache/httpcore/pool/AbstractConnPool;->operationAborted()Ljava/lang/Exception;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    .line 414
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 415
    goto :goto_9

    :goto_8
    throw p1

    :goto_9
    goto :goto_8
.end method

.method private static operationAborted()Ljava/lang/Exception;
    .locals 2

    .line 182
    new-instance v0, Ljava/util/concurrent/CancellationException;

    const-string v1, "Operation aborted"

    invoke-direct {v0, v1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private purgePoolMap()V
    .locals 3

    .line 607
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 608
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 609
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 610
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/pool/RouteSpecificPool;

    .line 611
    invoke-virtual {v1}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getPendingCount()I

    move-result v2

    invoke-virtual {v1}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v1

    add-int/2addr v2, v1

    if-nez v2, :cond_0

    .line 612
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public closeExpired()V
    .locals 3

    .line 647
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 648
    new-instance v2, Lorg/apache/httpcore/pool/AbstractConnPool$4;

    invoke-direct {v2, p0, v0, v1}, Lorg/apache/httpcore/pool/AbstractConnPool$4;-><init>(Lorg/apache/httpcore/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v2}, Lorg/apache/httpcore/pool/AbstractConnPool;->enumAvailable(Lorg/apache/httpcore/pool/PoolEntryCallback;)V

    return-void
.end method

.method public closeIdle(JLjava/util/concurrent/TimeUnit;)V
    .locals 2

    const-string v0, "Time unit"

    .line 625
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 626
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long p3, p1, v0

    if-gez p3, :cond_0

    move-wide p1, v0

    .line 630
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p1

    .line 631
    new-instance p1, Lorg/apache/httpcore/pool/AbstractConnPool$3;

    invoke-direct {p1, p0, v0, v1}, Lorg/apache/httpcore/pool/AbstractConnPool$3;-><init>(Lorg/apache/httpcore/pool/AbstractConnPool;J)V

    invoke-virtual {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->enumAvailable(Lorg/apache/httpcore/pool/PoolEntryCallback;)V

    return-void
.end method

.method protected abstract createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TC;)TE;"
        }
    .end annotation
.end method

.method protected enumAvailable(Lorg/apache/httpcore/pool/PoolEntryCallback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/pool/PoolEntryCallback<",
            "TT;TC;>;)V"
        }
    .end annotation

    .line 570
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 572
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 573
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 574
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/pool/PoolEntry;

    .line 575
    invoke-interface {p1, v1}, Lorg/apache/httpcore/pool/PoolEntryCallback;->process(Lorg/apache/httpcore/pool/PoolEntry;)V

    .line 576
    invoke-virtual {v1}, Lorg/apache/httpcore/pool/PoolEntry;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 577
    invoke-virtual {v1}, Lorg/apache/httpcore/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/httpcore/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;

    move-result-object v2

    .line 578
    invoke-virtual {v2, v1}, Lorg/apache/httpcore/pool/RouteSpecificPool;->remove(Lorg/apache/httpcore/pool/PoolEntry;)Z

    .line 579
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 582
    :cond_1
    invoke-direct {p0}, Lorg/apache/httpcore/pool/AbstractConnPool;->purgePoolMap()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 584
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 585
    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method protected enumLeased(Lorg/apache/httpcore/pool/PoolEntryCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/pool/PoolEntryCallback<",
            "TT;TC;>;)V"
        }
    .end annotation

    .line 594
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 596
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 597
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 598
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/pool/PoolEntry;

    .line 599
    invoke-interface {p1, v1}, Lorg/apache/httpcore/pool/PoolEntryCallback;->process(Lorg/apache/httpcore/pool/PoolEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 602
    :cond_0
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 603
    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public getDefaultMaxPerRoute()I
    .locals 2

    .line 485
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 487
    :try_start_0
    iget v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 489
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 490
    throw v0
.end method

.method public getMaxPerRoute(Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    const-string v0, "Route"

    .line 510
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 511
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 513
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 516
    throw p1
.end method

.method public getMaxTotal()I
    .locals 2

    .line 464
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 466
    :try_start_0
    iget v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxTotal:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 468
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 469
    throw v0
.end method

.method public getRoutes()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    .line 556
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 558
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 560
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 561
    throw v0
.end method

.method public getStats(Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolStats;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/apache/httpcore/pool/PoolStats;"
        }
    .end annotation

    const-string v0, "Route"

    .line 535
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 536
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 538
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;

    move-result-object v0

    .line 539
    new-instance v1, Lorg/apache/httpcore/pool/PoolStats;

    .line 540
    invoke-virtual {v0}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getLeasedCount()I

    move-result v2

    .line 541
    invoke-virtual {v0}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    .line 542
    invoke-virtual {v0}, Lorg/apache/httpcore/pool/RouteSpecificPool;->getAvailableCount()I

    move-result v0

    .line 543
    invoke-direct {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result p1

    invoke-direct {v1, v2, v3, v0, p1}, Lorg/apache/httpcore/pool/PoolStats;-><init>(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 545
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 546
    throw p1
.end method

.method public getTotalStats()Lorg/apache/httpcore/pool/PoolStats;
    .locals 5

    .line 521
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 523
    :try_start_0
    new-instance v0, Lorg/apache/httpcore/pool/PoolStats;

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 524
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 525
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget-object v3, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 526
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    iget v4, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxTotal:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/httpcore/pool/PoolStats;-><init>(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 529
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 530
    throw v0
.end method

.method public getValidateAfterInactivity()I
    .locals 1

    .line 665
    iget v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->validateAfterInactivity:I

    return v0
.end method

.method public isShutdown()Z
    .locals 1

    .line 135
    iget-boolean v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->isShutDown:Z

    return v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future<",
            "TE;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 307
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/httpcore/pool/AbstractConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/httpcore/concurrent/FutureCallback;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/httpcore/concurrent/FutureCallback;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "Lorg/apache/httpcore/concurrent/FutureCallback<",
            "TE;>;)",
            "Ljava/util/concurrent/Future<",
            "TE;>;"
        }
    .end annotation

    const-string v0, "Route"

    .line 195
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 196
    iget-boolean v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->isShutDown:Z

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Connection pool shut down"

    invoke-static {v0, v1}, Lorg/apache/httpcore/util/Asserts;->check(ZLjava/lang/String;)V

    .line 198
    new-instance v0, Lorg/apache/httpcore/pool/AbstractConnPool$2;

    invoke-direct {v0, p0, p3, p1, p2}, Lorg/apache/httpcore/pool/AbstractConnPool$2;-><init>(Lorg/apache/httpcore/pool/AbstractConnPool;Lorg/apache/httpcore/concurrent/FutureCallback;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected onLease(Lorg/apache/httpcore/pool/PoolEntry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    return-void
.end method

.method protected onRelease(Lorg/apache/httpcore/pool/PoolEntry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    return-void
.end method

.method protected onReuse(Lorg/apache/httpcore/pool/PoolEntry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    return-void
.end method

.method public bridge synthetic release(Ljava/lang/Object;Z)V
    .locals 0

    .line 69
    check-cast p1, Lorg/apache/httpcore/pool/PoolEntry;

    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/pool/AbstractConnPool;->release(Lorg/apache/httpcore/pool/PoolEntry;Z)V

    return-void
.end method

.method public release(Lorg/apache/httpcore/pool/PoolEntry;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)V"
        }
    .end annotation

    .line 420
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 422
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 423
    invoke-virtual {p1}, Lorg/apache/httpcore/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/httpcore/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;

    move-result-object v0

    .line 424
    invoke-virtual {v0, p1, p2}, Lorg/apache/httpcore/pool/RouteSpecificPool;->free(Lorg/apache/httpcore/pool/PoolEntry;Z)V

    if-eqz p2, :cond_0

    .line 425
    iget-boolean p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->isShutDown:Z

    if-nez p2, :cond_0

    .line 426
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_0

    .line 428
    :cond_0
    invoke-virtual {p1}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    .line 430
    :goto_0
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->onRelease(Lorg/apache/httpcore/pool/PoolEntry;)V

    .line 431
    invoke-virtual {v0}, Lorg/apache/httpcore/pool/RouteSpecificPool;->nextPending()Ljava/util/concurrent/Future;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 433
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {p2, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 435
    :cond_1
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Future;

    :goto_1
    if-eqz p1, :cond_2

    .line 438
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 442
    :cond_2
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 443
    throw p1
.end method

.method public setDefaultMaxPerRoute(I)V
    .locals 1

    const-string v0, "Max per route value"

    .line 474
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    .line 475
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 477
    :try_start_0
    iput p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 479
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 480
    throw p1
.end method

.method public setMaxPerRoute(Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    const-string v0, "Route"

    .line 495
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 496
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v0, -0x1

    if-le p2, v0, :cond_0

    .line 499
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 501
    :cond_0
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 504
    :goto_0
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 505
    throw p1
.end method

.method public setMaxTotal(I)V
    .locals 1

    const-string v0, "Max value"

    .line 453
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    .line 454
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 456
    :try_start_0
    iput p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->maxTotal:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 458
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 459
    throw p1
.end method

.method public setValidateAfterInactivity(I)V
    .locals 0

    .line 673
    iput p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->validateAfterInactivity:I

    return-void
.end method

.method public shutdown()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    iget-boolean v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->isShutDown:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 145
    iput-boolean v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->isShutDown:Z

    .line 146
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 148
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/pool/PoolEntry;

    .line 149
    invoke-virtual {v1}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    goto :goto_0

    .line 151
    :cond_1
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/pool/PoolEntry;

    .line 152
    invoke-virtual {v1}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    goto :goto_1

    .line 154
    :cond_2
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/httpcore/pool/RouteSpecificPool;

    .line 155
    invoke-virtual {v1}, Lorg/apache/httpcore/pool/RouteSpecificPool;->shutdown()V

    goto :goto_2

    .line 157
    :cond_3
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 158
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 159
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 162
    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 678
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 680
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[leased: "

    .line 681
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 682
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "][available: "

    .line 683
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "][pending: "

    .line 685
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    .line 687
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 688
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 690
    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 691
    throw v0
.end method

.method protected validate(Lorg/apache/httpcore/pool/PoolEntry;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    const/4 p1, 0x1

    return p1
.end method
