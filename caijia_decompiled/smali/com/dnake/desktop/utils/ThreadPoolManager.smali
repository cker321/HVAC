.class public Lcom/dnake/desktop/utils/ThreadPoolManager;
.super Ljava/lang/Object;
.source "ThreadPoolManager.java"


# static fields
.field private static final CORE_POOL_SIZE:I

.field private static final CPU_COUNT:I

.field private static final MAXIMUM_POOL_SIZE:I

.field private static final TAG:Ljava/lang/String;

.field private static cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static fixedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static instance:Lcom/dnake/desktop/utils/ThreadPoolManager;


# instance fields
.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private executorServiceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ExecutorService;",
            ">;"
        }
    .end annotation
.end field

.field private priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

.field private scheduledExecutorServiceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 30
    const-class v0, Lcom/dnake/desktop/utils/ThreadPoolManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->TAG:Ljava/lang/String;

    .line 38
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    sput v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->CPU_COUNT:I

    add-int/lit8 v1, v0, 0x1

    .line 39
    sput v1, Lcom/dnake/desktop/utils/ThreadPoolManager;->CORE_POOL_SIZE:I

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    .line 40
    sput v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->MAXIMUM_POOL_SIZE:I

    return-void
.end method

.method private constructor <init>()V
    .locals 18

    move-object/from16 v0, p0

    .line 60
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    .line 58
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    .line 62
    new-instance v1, Lcom/dnake/desktop/utils/PriorityThreadFactory;

    sget-object v2, Lcom/dnake/desktop/utils/ThreadPoolManager;->TAG:Ljava/lang/String;

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;-><init>(Ljava/lang/String;I)V

    iput-object v1, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    .line 64
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget v5, Lcom/dnake/desktop/utils/ThreadPoolManager;->CORE_POOL_SIZE:I

    sget v6, Lcom/dnake/desktop/utils/ThreadPoolManager;->MAXIMUM_POOL_SIZE:I

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v10, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v10}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-wide/16 v7, 0x0

    move-object v4, v1

    invoke-direct/range {v4 .. v10}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v1, Lcom/dnake/desktop/utils/ThreadPoolManager;->fixedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 65
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v16, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v17, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct/range {v17 .. v17}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    const/4 v12, 0x0

    const v13, 0x7fffffff

    const-wide/16 v14, 0x3c

    move-object v11, v1

    invoke-direct/range {v11 .. v17}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v1, Lcom/dnake/desktop/utils/ThreadPoolManager;->cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;
    .locals 2

    const-class v0, Lcom/dnake/desktop/utils/ThreadPoolManager;

    monitor-enter v0

    .line 70
    :try_start_0
    sget-object v1, Lcom/dnake/desktop/utils/ThreadPoolManager;->instance:Lcom/dnake/desktop/utils/ThreadPoolManager;

    if-nez v1, :cond_0

    .line 71
    new-instance v1, Lcom/dnake/desktop/utils/ThreadPoolManager;

    invoke-direct {v1}, Lcom/dnake/desktop/utils/ThreadPoolManager;-><init>()V

    sput-object v1, Lcom/dnake/desktop/utils/ThreadPoolManager;->instance:Lcom/dnake/desktop/utils/ThreadPoolManager;

    .line 73
    :cond_0
    sget-object v1, Lcom/dnake/desktop/utils/ThreadPoolManager;->instance:Lcom/dnake/desktop/utils/ThreadPoolManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public removeAllScheduleJob()V
    .locals 2

    .line 243
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 244
    invoke-virtual {p0, v1}, Lcom/dnake/desktop/utils/ThreadPoolManager;->removeScheduleJob(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeFixJob(Ljava/lang/Runnable;)Z
    .locals 1

    .line 116
    sget-object v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->fixedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public removeJob(Ljava/lang/Runnable;)Z
    .locals 1

    .line 129
    sget-object v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public removeScheduleJob(Ljava/lang/String;)V
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 236
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 237
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 238
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public removeSingleFixJob(Ljava/lang/String;)V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 80
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 81
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public submitFixJob(Ljava/lang/Runnable;Ljava/lang/String;I)Ljava/util/concurrent/Future;
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/Class;Ljava/lang/String;)V

    .line 122
    iget-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p2, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 123
    sget-object p2, Lcom/dnake/desktop/utils/ThreadPoolManager;->fixedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p2, p3}, Ljava/util/concurrent/ThreadPoolExecutor;->setThreadFactory(Ljava/util/concurrent/ThreadFactory;)V

    .line 124
    sget-object p2, Lcom/dnake/desktop/utils/ThreadPoolManager;->fixedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submitJob(Ljava/lang/Runnable;ILjava/lang/String;)Ljava/util/concurrent/Future;
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/Class;Ljava/lang/String;)V

    .line 142
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p3, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 143
    sget-object p2, Lcom/dnake/desktop/utils/ThreadPoolManager;->cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p2, p3}, Ljava/util/concurrent/ThreadPoolExecutor;->setThreadFactory(Ljava/util/concurrent/ThreadFactory;)V

    .line 144
    sget-object p2, Lcom/dnake/desktop/utils/ThreadPoolManager;->cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submitJob(Ljava/util/concurrent/Callable;ILjava/lang/String;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "*>;I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future;"
        }
    .end annotation

    .line 156
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {v0, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/String;)V

    .line 157
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p3, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 158
    sget-object p2, Lcom/dnake/desktop/utils/ThreadPoolManager;->cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p2, p3}, Ljava/util/concurrent/ThreadPoolExecutor;->setThreadFactory(Ljava/util/concurrent/ThreadFactory;)V

    .line 159
    sget-object p2, Lcom/dnake/desktop/utils/ThreadPoolManager;->cachedThreadPool:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submitScheduleJob(Ljava/lang/Runnable;ILjava/lang/String;JJLjava/util/concurrent/TimeUnit;Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 9

    move-object v0, p0

    move-object v1, p3

    .line 207
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    move-object/from16 v3, p9

    invoke-virtual {v2, p3, v3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    move v3, p2

    invoke-virtual {v2, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 209
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 210
    sget v2, Lcom/dnake/desktop/utils/ThreadPoolManager;->CORE_POOL_SIZE:I

    iget-object v3, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {v2, v3}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 211
    iget-object v3, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v3, p3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 213
    :cond_0
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 215
    :goto_0
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    move-object v3, p1

    move-wide v4, p4

    move-wide v6, p6

    move-object/from16 v8, p8

    invoke-interface/range {v2 .. v8}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    return-object v1
.end method

.method public submitScheduleWithFixedDealyJob(Ljava/lang/Runnable;ILjava/lang/String;JJLjava/util/concurrent/TimeUnit;Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 9

    move-object v0, p0

    move-object v1, p3

    .line 221
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    move-object/from16 v3, p9

    invoke-virtual {v2, p3, v3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    move v3, p2

    invoke-virtual {v2, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 223
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 224
    sget v2, Lcom/dnake/desktop/utils/ThreadPoolManager;->CORE_POOL_SIZE:I

    iget-object v3, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {v2, v3}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 225
    iget-object v3, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v3, p3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 227
    :cond_0
    iget-object v2, v0, Lcom/dnake/desktop/utils/ThreadPoolManager;->scheduledExecutorServiceMap:Ljava/util/Map;

    invoke-interface {v2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 229
    :goto_0
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    move-object v3, p1

    move-wide v4, p4

    move-wide v6, p6

    move-object/from16 v8, p8

    invoke-interface/range {v2 .. v8}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    return-object v1
.end method

.method public submitSingleFixJob(Ljava/lang/Runnable;Ljava/lang/String;I)Ljava/util/concurrent/Future;
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/Class;Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {v0, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 89
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 90
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {p3}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p3

    iput-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 91
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 93
    :cond_0
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/concurrent/ExecutorService;

    iput-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 94
    invoke-virtual {p0, p2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->removeSingleFixJob(Ljava/lang/String;)V

    .line 96
    :goto_0
    iget-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p2, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submitSingleFixJob(Ljava/util/concurrent/Callable;Ljava/lang/String;I)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "*>;",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/concurrent/Future;"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/Class;Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {v0, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 103
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 104
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {p3}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p3

    iput-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 105
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 107
    :cond_0
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/concurrent/ExecutorService;

    iput-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 108
    invoke-virtual {p0, p2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->removeSingleFixJob(Ljava/lang/String;)V

    .line 110
    :goto_0
    iget-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p2, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submitSingleJob(Ljava/lang/Runnable;Ljava/lang/String;ILjava/lang/String;)Ljava/util/concurrent/Future;
    .locals 2

    .line 172
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p4}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/Class;Ljava/lang/String;)V

    .line 173
    iget-object p4, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p4, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 174
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 175
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {p3}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p3

    iput-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 176
    iget-object p4, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p4, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 178
    :cond_0
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/ExecutorService;

    iput-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 180
    :goto_0
    iget-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/ExecutorService;

    invoke-interface {p2, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submitSingleJob(Ljava/util/concurrent/Callable;Ljava/lang/String;ILjava/lang/String;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "*>;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/Future;"
        }
    .end annotation

    .line 193
    iget-object v0, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {v0, p2, p4}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setName(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    iget-object p4, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-virtual {p4, p3}, Lcom/dnake/desktop/utils/PriorityThreadFactory;->setPriority(I)V

    .line 195
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 196
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->priorityThreadFactory:Lcom/dnake/desktop/utils/PriorityThreadFactory;

    invoke-static {p3}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p3

    iput-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 197
    iget-object p4, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p4, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 199
    :cond_0
    iget-object p3, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorServiceMap:Ljava/util/Map;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/ExecutorService;

    iput-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 201
    :goto_0
    iget-object p2, p0, Lcom/dnake/desktop/utils/ThreadPoolManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/ExecutorService;

    invoke-interface {p2, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method
