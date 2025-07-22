.class public final Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;
.super Ljava/lang/Object;
.source "RxSchedulerUtils.java"


# static fields
.field private static sIOExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "u can\'t instantiate me..."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static _io_f()Lio/reactivex/FlowableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/FlowableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 90
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _io_io_f()Lio/reactivex/FlowableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/FlowableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 110
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _io_io_o()Lio/reactivex/ObservableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 176
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _io_main_f()Lio/reactivex/FlowableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/FlowableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 100
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _io_main_o()Lio/reactivex/ObservableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 165
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _io_o()Lio/reactivex/ObservableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 154
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _main_f()Lio/reactivex/FlowableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/FlowableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 79
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static _main_o()Lio/reactivex/ObservableTransformer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 143
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V

    return-object v0
.end method

.method public static getIOExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 32
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->sIOExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public static io()Lio/reactivex/Scheduler;
    .locals 1

    .line 36
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->sIOExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    return-object v0
.end method

.method public static io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;
    .locals 0

    if-eqz p0, :cond_0

    .line 42
    invoke-static {p0}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static main()Lio/reactivex/Scheduler;
    .locals 1

    .line 39
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->main()Lio/reactivex/Scheduler;

    move-result-object v0

    return-object v0
.end method

.method public static main(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;
    .locals 0

    if-eqz p0, :cond_0

    .line 45
    invoke-static {p0}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static setIOExecutor(Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 28
    sput-object p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->sIOExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public static toIo(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable<",
            "TT;>;)",
            "Lio/reactivex/Flowable<",
            "TT;>;"
        }
    .end annotation

    .line 68
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static toIo(Lio/reactivex/Observable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable<",
            "TT;>;)",
            "Lio/reactivex/Observable<",
            "TT;>;"
        }
    .end annotation

    .line 131
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static toMain(Lio/reactivex/Flowable;)Lio/reactivex/Flowable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Flowable<",
            "TT;>;)",
            "Lio/reactivex/Flowable<",
            "TT;>;"
        }
    .end annotation

    .line 59
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static toMain(Lio/reactivex/Observable;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable<",
            "TT;>;)",
            "Lio/reactivex/Observable<",
            "TT;>;"
        }
    .end annotation

    .line 122
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method
