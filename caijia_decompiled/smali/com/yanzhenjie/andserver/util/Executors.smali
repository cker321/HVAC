.class public Lcom/yanzhenjie/andserver/util/Executors;
.super Ljava/lang/Object;
.source "Executors.java"


# static fields
.field private static instance:Lcom/yanzhenjie/andserver/util/Executors;

.field private static mHandler:Landroid/os/Handler;


# instance fields
.field private final mService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/util/Executors;->mService:Ljava/util/concurrent/ExecutorService;

    .line 60
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/yanzhenjie/andserver/util/Executors;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static getInstance()Lcom/yanzhenjie/andserver/util/Executors;
    .locals 2

    .line 38
    sget-object v0, Lcom/yanzhenjie/andserver/util/Executors;->instance:Lcom/yanzhenjie/andserver/util/Executors;

    if-nez v0, :cond_1

    .line 39
    const-class v0, Lcom/yanzhenjie/andserver/util/Executors;

    monitor-enter v0

    .line 40
    :try_start_0
    sget-object v1, Lcom/yanzhenjie/andserver/util/Executors;->instance:Lcom/yanzhenjie/andserver/util/Executors;

    if-nez v1, :cond_0

    .line 41
    new-instance v1, Lcom/yanzhenjie/andserver/util/Executors;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/util/Executors;-><init>()V

    sput-object v1, Lcom/yanzhenjie/andserver/util/Executors;->instance:Lcom/yanzhenjie/andserver/util/Executors;

    .line 43
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 45
    :cond_1
    :goto_0
    sget-object v0, Lcom/yanzhenjie/andserver/util/Executors;->instance:Lcom/yanzhenjie/andserver/util/Executors;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/Executors;->mService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1

    .line 95
    sget-object v0, Lcom/yanzhenjie/andserver/util/Executors;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public postDelayed(Ljava/lang/Runnable;J)V
    .locals 1

    .line 102
    sget-object v0, Lcom/yanzhenjie/andserver/util/Executors;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/Executors;->mService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TT;)",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/Executors;->mService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1, p2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/Executors;->mService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method
