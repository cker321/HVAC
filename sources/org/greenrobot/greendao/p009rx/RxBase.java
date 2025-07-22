package org.greenrobot.greendao.p009rx;

import java.util.concurrent.Callable;
import rx.Observable;
import rx.Scheduler;

/* loaded from: classes.dex */
class RxBase {
    protected final Scheduler scheduler;

    RxBase() {
        this.scheduler = null;
    }

    RxBase(Scheduler scheduler) {
        this.scheduler = scheduler;
    }

    public Scheduler getScheduler() {
        return this.scheduler;
    }

    protected <R> Observable<R> wrap(Callable<R> callable) {
        return wrap(RxUtils.fromCallable(callable));
    }

    protected <R> Observable<R> wrap(Observable<R> observable) {
        Scheduler scheduler = this.scheduler;
        return scheduler != null ? observable.subscribeOn(scheduler) : observable;
    }
}
