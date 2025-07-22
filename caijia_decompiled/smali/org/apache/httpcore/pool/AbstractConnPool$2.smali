.class Lorg/apache/httpcore/pool/AbstractConnPool$2;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/httpcore/pool/AbstractConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/httpcore/concurrent/FutureCallback;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final done:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final entryRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "TE;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

.field final synthetic val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

.field final synthetic val$route:Ljava/lang/Object;

.field final synthetic val$state:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/httpcore/pool/AbstractConnPool;Lorg/apache/httpcore/concurrent/FutureCallback;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 198
    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    iput-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

    iput-object p3, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$route:Ljava/lang/Object;

    iput-object p4, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$state:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 201
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 202
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->entryRef:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 2

    .line 206
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 207
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 208
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-static {p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$000(Lorg/apache/httpcore/pool/AbstractConnPool;)Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 210
    :try_start_0
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-static {p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$100(Lorg/apache/httpcore/pool/AbstractConnPool;)Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-static {p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$000(Lorg/apache/httpcore/pool/AbstractConnPool;)Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 214
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

    if-eqz p1, :cond_0

    .line 215
    invoke-interface {p1}, Lorg/apache/httpcore/concurrent/FutureCallback;->cancelled()V

    :cond_0
    return v1

    :catchall_0
    move-exception p1

    .line 212
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-static {v0}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$000(Lorg/apache/httpcore/pool/AbstractConnPool;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 213
    throw p1

    :cond_1
    return v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 198
    invoke-virtual {p0}, Lorg/apache/httpcore/pool/AbstractConnPool$2;->get()Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 198
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/httpcore/pool/AbstractConnPool$2;->get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object p1

    return-object p1
.end method

.method public get()Lorg/apache/httpcore/pool/PoolEntry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 235
    :try_start_0
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/httpcore/pool/AbstractConnPool$2;->get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object v0
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 237
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/httpcore/pool/PoolEntry;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 244
    :goto_0
    monitor-enter p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 246
    :try_start_0
    iget-object v2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->entryRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/httpcore/pool/PoolEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 248
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v2

    .line 250
    :cond_0
    :try_start_2
    iget-object v2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_4

    .line 253
    iget-object v3, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    iget-object v4, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$route:Ljava/lang/Object;

    iget-object v5, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$state:Ljava/lang/Object;

    move-wide v6, p1

    move-object v8, p3

    move-object v9, p0

    invoke-static/range {v3 .. v9}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$300(Lorg/apache/httpcore/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/Future;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object v2

    .line 254
    iget-object v3, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-static {v3}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$400(Lorg/apache/httpcore/pool/AbstractConnPool;)I

    move-result v3

    if-lez v3, :cond_1

    .line 255
    invoke-virtual {v2}, Lorg/apache/httpcore/pool/PoolEntry;->getUpdated()J

    move-result-wide v3

    iget-object v5, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-static {v5}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$400(Lorg/apache/httpcore/pool/AbstractConnPool;)I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-gtz v7, :cond_1

    .line 256
    iget-object v3, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-virtual {v3, v2}, Lorg/apache/httpcore/pool/AbstractConnPool;->validate(Lorg/apache/httpcore/pool/PoolEntry;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 257
    invoke-virtual {v2}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    .line 258
    iget-object v3, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-virtual {v3, v2, v0}, Lorg/apache/httpcore/pool/AbstractConnPool;->release(Lorg/apache/httpcore/pool/PoolEntry;Z)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 259
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 263
    :cond_1
    :try_start_4
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 264
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->entryRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 265
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 266
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-virtual {p1, v2}, Lorg/apache/httpcore/pool/AbstractConnPool;->onLease(Lorg/apache/httpcore/pool/PoolEntry;)V

    .line 267
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

    if-eqz p1, :cond_2

    .line 268
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

    invoke-interface {p1, v2}, Lorg/apache/httpcore/concurrent/FutureCallback;->completed(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 270
    :cond_2
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    return-object v2

    .line 272
    :cond_3
    :try_start_6
    iget-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    invoke-virtual {p1, v2, v1}, Lorg/apache/httpcore/pool/AbstractConnPool;->release(Lorg/apache/httpcore/pool/PoolEntry;Z)V

    .line 273
    new-instance p1, Ljava/util/concurrent/ExecutionException;

    invoke-static {}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$200()Ljava/lang/Exception;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 251
    :cond_4
    new-instance p1, Ljava/util/concurrent/ExecutionException;

    invoke-static {}, Lorg/apache/httpcore/pool/AbstractConnPool;->access$200()Ljava/lang/Exception;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    .line 276
    :try_start_7
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 277
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

    if-eqz p2, :cond_5

    .line 278
    iget-object p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->val$callback:Lorg/apache/httpcore/concurrent/FutureCallback;

    invoke-interface {p2, p1}, Lorg/apache/httpcore/concurrent/FutureCallback;->failed(Ljava/lang/Exception;)V

    .line 281
    :cond_5
    new-instance p2, Ljava/util/concurrent/ExecutionException;

    invoke-direct {p2, p1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 283
    :goto_1
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public isCancelled()Z
    .locals 1

    .line 224
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .line 229
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool$2;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
