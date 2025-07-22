package org.greenrobot.greendao.p009rx;

import java.util.concurrent.Callable;
import rx.Observable;
import rx.functions.Func0;

/* loaded from: classes.dex */
class RxUtils {
    RxUtils() {
    }

    static <T> Observable<T> fromCallable(final Callable<T> callable) {
        return Observable.defer(new Func0<Observable<T>>() { // from class: org.greenrobot.greendao.rx.RxUtils.1
            public Observable<T> call() {
                try {
                    return Observable.just(callable.call());
                } catch (Exception e) {
                    return Observable.error(e);
                }
            }
        });
    }
}
