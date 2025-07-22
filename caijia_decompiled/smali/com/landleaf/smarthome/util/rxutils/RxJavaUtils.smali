.class public final Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;
.super Ljava/lang/Object;
.source "RxJavaUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "RxJavaUtils"


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "u can\'t instantiate me..."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static comActCompose(Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;)Lio/reactivex/ObservableTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;",
            ")",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 366
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$8;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$8;-><init>(Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;)V

    return-object v0
.end method

.method public static comFrgCompose(Lcom/trello/rxlifecycle3/components/support/RxFragment;)Lio/reactivex/ObservableTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trello/rxlifecycle3/components/support/RxFragment;",
            ")",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 378
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$9;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$9;-><init>(Lcom/trello/rxlifecycle3/components/support/RxFragment;)V

    return-object v0
.end method

.method public static composeAct(Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;)Lio/reactivex/ObservableTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;",
            ")",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 78
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$3;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$3;-><init>(Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;)V

    return-object v0
.end method

.method public static composeFragment(Lcom/trello/rxlifecycle3/components/support/RxFragment;)Lio/reactivex/ObservableTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trello/rxlifecycle3/components/support/RxFragment;",
            ")",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TT;>;"
        }
    .end annotation

    .line 67
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$2;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$2;-><init>(Lcom/trello/rxlifecycle3/components/support/RxFragment;)V

    return-object v0
.end method

.method public static countDown(J)Lio/reactivex/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Observable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 196
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-static {p0, p1, v1, v2, v0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->countDown(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static countDown(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 208
    invoke-static {v0, v1, p2, p3, p4}, Lio/reactivex/Observable;->interval(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p4

    long-to-double v0, p0

    long-to-double p2, p2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, p2

    .line 209
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p2

    double-to-int p2, p2

    add-int/lit8 p2, p2, 0x1

    int-to-long p2, p2

    invoke-virtual {p4, p2, p3}, Lio/reactivex/Observable;->take(J)Lio/reactivex/Observable;

    move-result-object p2

    new-instance p3, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$6;

    invoke-direct {p3, p0, p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$6;-><init>(J)V

    .line 210
    invoke-virtual {p2, p3}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p0

    .line 216
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_main_o()Lio/reactivex/ObservableTransformer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static countDown(JLio/reactivex/observers/DisposableObserver;)Lio/reactivex/disposables/Disposable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lio/reactivex/observers/DisposableObserver<",
            "Ljava/lang/Long;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 185
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-static {p0, p1, v1, v2, v0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->countDown(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p0

    .line 186
    invoke-virtual {p0, p2}, Lio/reactivex/Observable;->subscribeWith(Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object p0

    check-cast p0, Lio/reactivex/disposables/Disposable;

    return-object p0
.end method

.method public static createFlowable(Ljava/lang/Object;)Lio/reactivex/Flowable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/Flowable<",
            "TT;>;"
        }
    .end annotation

    .line 95
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$4;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$4;-><init>(Ljava/lang/Object;)V

    sget-object p0, Lio/reactivex/BackpressureStrategy;->LATEST:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, p0}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static createObservable(Ljava/lang/Object;)Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/Observable<",
            "TT;>;"
        }
    .end annotation

    .line 53
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$1;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$1;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static delay(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 254
    invoke-static {p0, p1, p2}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p0

    .line 255
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Observable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 264
    invoke-static {p0, p1, p2, p3}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    .line 265
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static delay(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable<",
            "TT;>;"
        }
    .end annotation

    .line 289
    invoke-static {p0}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object p0

    .line 290
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p0

    .line 291
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Long;",
            ">;",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 242
    invoke-static {p0, p1, p2}, Lio/reactivex/Flowable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 243
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 244
    invoke-virtual {p0, p3, p4}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p0

    return-object p0
.end method

.method public static delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/observers/DisposableObserver;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/observers/DisposableObserver<",
            "Ljava/lang/Long;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 276
    invoke-static {p0, p1, p2}, Lio/reactivex/Observable;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p0

    .line 277
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    .line 278
    invoke-virtual {p0, p3}, Lio/reactivex/Observable;->subscribeWith(Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object p0

    check-cast p0, Lio/reactivex/disposables/Disposable;

    return-object p0
.end method

.method public static delay(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lio/reactivex/observers/DisposableObserver;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/observers/DisposableObserver<",
            "TT;>;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 303
    invoke-static {p0}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object p0

    .line 304
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p0

    .line 305
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p0

    .line 306
    invoke-virtual {p0, p4}, Lio/reactivex/Observable;->subscribeWith(Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object p0

    check-cast p0, Lio/reactivex/disposables/Disposable;

    return-object p0
.end method

.method public static executeAsyncTask(Ljava/lang/Object;Lio/reactivex/FlowableTransformer;)Lio/reactivex/Flowable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/reactivex/FlowableTransformer<",
            "TT;TR;>;)",
            "Lio/reactivex/Flowable<",
            "TR;>;"
        }
    .end annotation

    .line 320
    invoke-static {p0}, Lio/reactivex/Flowable;->just(Ljava/lang/Object;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 321
    invoke-virtual {p0, p1}, Lio/reactivex/Flowable;->compose(Lio/reactivex/FlowableTransformer;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 322
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_main_f()Lio/reactivex/FlowableTransformer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Flowable;->compose(Lio/reactivex/FlowableTransformer;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static executeAsyncTask(Ljava/lang/Object;Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TR;>;)",
            "Lio/reactivex/Observable<",
            "TR;>;"
        }
    .end annotation

    .line 333
    invoke-static {p0}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object p0

    .line 334
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p0

    .line 335
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_main_o()Lio/reactivex/ObservableTransformer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static executeAsyncTask(Ljava/lang/Object;Lio/reactivex/FlowableTransformer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/reactivex/FlowableTransformer<",
            "TT;TR;>;",
            "Lio/reactivex/functions/Consumer<",
            "TR;>;",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 349
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->executeAsyncTask(Ljava/lang/Object;Lio/reactivex/FlowableTransformer;)Lio/reactivex/Flowable;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p0

    return-object p0
.end method

.method public static executeAsyncTask(Ljava/lang/Object;Lio/reactivex/ObservableTransformer;Lio/reactivex/observers/DisposableObserver;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/reactivex/ObservableTransformer<",
            "TT;TR;>;",
            "Lio/reactivex/observers/DisposableObserver<",
            "TR;>;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 361
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->executeAsyncTask(Ljava/lang/Object;Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p0

    invoke-virtual {p0, p2}, Lio/reactivex/Observable;->subscribeWith(Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object p0

    check-cast p0, Lio/reactivex/disposables/Disposable;

    return-object p0
.end method

.method public static interval(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Observable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 220
    invoke-static {v0, v1, p2, p3, p4}, Lio/reactivex/Observable;->interval(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p2

    .line 221
    invoke-virtual {p2, p0, p1}, Lio/reactivex/Observable;->take(J)Lio/reactivex/Observable;

    move-result-object p0

    new-instance p1, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$7;

    invoke-direct {p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$7;-><init>()V

    .line 222
    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p0

    .line 228
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_main_o()Lio/reactivex/ObservableTransformer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p0

    return-object p0
.end method

.method public static polling(J)Lio/reactivex/Flowable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/reactivex/Flowable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 117
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, p0, p1, v0}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->polling(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static polling(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Flowable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 156
    invoke-static {p0, p1, p2, p3, p4}, Lio/reactivex/Flowable;->interval(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 157
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static polling(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lio/reactivex/Flowable<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 120
    invoke-static {v0, v1, p0, p1, p2}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->polling(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object p0

    return-object p0
.end method

.method public static polling(JJLio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Long;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 140
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$5;

    invoke-direct {v6}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$5;-><init>()V

    move-wide v0, p0

    move-wide v2, p2

    move-object v5, p4

    invoke-static/range {v0 .. v6}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->polling(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p0

    return-object p0
.end method

.method public static polling(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Long;",
            ">;",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .line 170
    invoke-static {p0, p1, p2, p3, p4}, Lio/reactivex/Flowable;->interval(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 171
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object p0

    .line 172
    invoke-virtual {p0, p5, p6}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p0

    return-object p0
.end method

.method public static polling(JLio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lio/reactivex/functions/Consumer<",
            "Ljava/lang/Long;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 129
    invoke-static {v0, v1, p0, p1, p2}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->polling(JJLio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p0

    return-object p0
.end method
