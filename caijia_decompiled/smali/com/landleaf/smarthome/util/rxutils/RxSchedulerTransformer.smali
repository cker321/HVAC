.class public Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;
.super Ljava/lang/Object;
.source "RxSchedulerTransformer.java"

# interfaces
.implements Lio/reactivex/ObservableTransformer;
.implements Lio/reactivex/FlowableTransformer;
.implements Lio/reactivex/SingleTransformer;
.implements Lio/reactivex/MaybeTransformer;
.implements Lio/reactivex/CompletableTransformer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableTransformer<",
        "TT;TT;>;",
        "Lio/reactivex/FlowableTransformer<",
        "TT;TT;>;",
        "Lio/reactivex/SingleTransformer<",
        "TT;TT;>;",
        "Lio/reactivex/MaybeTransformer<",
        "TT;TT;>;",
        "Lio/reactivex/CompletableTransformer;"
    }
.end annotation


# instance fields
.field private mIOExecutor:Ljava/util/concurrent/Executor;

.field private mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 47
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->getIOExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public constructor <init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)V
    .locals 1

    .line 56
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->getIOExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public constructor <init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    .line 76
    iput-object p2, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 65
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-direct {p0, v0, p1}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;-><init>(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method public apply(Lio/reactivex/Completable;)Lio/reactivex/CompletableSource;
    .locals 2

    .line 193
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    iget-object v1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    return-object p1

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 205
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 206
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 207
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    return-object p1

    .line 199
    :cond_1
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 200
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 201
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    .line 202
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    return-object p1

    .line 197
    :cond_2
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    return-object p1

    .line 195
    :cond_3
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/reactivex/Maybe;)Lio/reactivex/MaybeSource;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Maybe<",
            "TT;>;)",
            "Lio/reactivex/MaybeSource<",
            "TT;>;"
        }
    .end annotation

    .line 147
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    iget-object v1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    return-object p1

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 159
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 160
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 161
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    return-object p1

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 154
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 155
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    .line 156
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    return-object p1

    .line 151
    :cond_2
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    return-object p1

    .line 149
    :cond_3
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Maybe;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Maybe;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observable<",
            "TT;>;)",
            "Lio/reactivex/ObservableSource<",
            "TT;>;"
        }
    .end annotation

    .line 101
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    iget-object v1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    return-object p1

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 113
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 114
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 115
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    return-object p1

    .line 107
    :cond_1
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 108
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 109
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    .line 110
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    return-object p1

    .line 105
    :cond_2
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    return-object p1

    .line 103
    :cond_3
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/reactivex/Single;)Lio/reactivex/SingleSource;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Single<",
            "TT;>;)",
            "Lio/reactivex/SingleSource<",
            "TT;>;"
        }
    .end annotation

    .line 170
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    iget-object v1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    return-object p1

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 182
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 183
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 184
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    return-object p1

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 177
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 178
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    .line 179
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    return-object p1

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    return-object p1

    .line 172
    :cond_3
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    return-object p1
.end method

.method public apply(Lio/reactivex/Flowable;)Lorg/reactivestreams/Publisher;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable<",
            "TT;>;)",
            "Lorg/reactivestreams/Publisher<",
            "TT;>;"
        }
    .end annotation

    .line 124
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    iget-object v1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    return-object p1

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 136
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 137
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 138
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    return-object p1

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 131
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    .line 132
    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->unsubscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    .line 133
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    return-object p1

    .line 128
    :cond_2
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->io(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    return-object p1

    .line 126
    :cond_3
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p1

    return-object p1
.end method

.method public setIOExecutor(Ljava/util/concurrent/Executor;)Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer<",
            "TT;>;"
        }
    .end annotation

    .line 85
    iput-object p1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mIOExecutor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method public setSchedulerType(Lcom/landleaf/smarthome/util/rxutils/SchedulerType;)Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/util/rxutils/SchedulerType;",
            ")",
            "Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer<",
            "TT;>;"
        }
    .end annotation

    .line 95
    iput-object p1, p0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;->mSchedulerType:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    return-object p0
.end method
