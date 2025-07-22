package com.landleaf.smarthome.util.rxutils;

import com.landleaf.smarthome.util.LogUtils;
import com.trello.rxlifecycle3.android.ActivityEvent;
import com.trello.rxlifecycle3.android.FragmentEvent;
import com.trello.rxlifecycle3.components.support.RxAppCompatActivity;
import com.trello.rxlifecycle3.components.support.RxFragment;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.FlowableTransformer;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
import io.reactivex.Scheduler;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.observers.DisposableObserver;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class RxJavaUtils {
    private static final String TAG = "RxJavaUtils";

    private RxJavaUtils() {
        throw new UnsupportedOperationException("u can't instantiate me...");
    }

    public static <T> Observable<T> createObservable(final T t) {
        return Observable.create(new ObservableOnSubscribe<T>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // io.reactivex.ObservableOnSubscribe
            public void subscribe(ObservableEmitter<T> observableEmitter) throws Exception {
                try {
                    observableEmitter.onNext(t);
                    observableEmitter.onComplete();
                } catch (Throwable th) {
                    observableEmitter.onError(th);
                }
            }
        });
    }

    public static <T> ObservableTransformer<T, T> composeFragment(final RxFragment rxFragment) {
        return new ObservableTransformer<T, T>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.2
            @Override // io.reactivex.ObservableTransformer
            public ObservableSource<T> apply(Observable<T> observable) {
                return observable.compose(RxSchedulerUtils._io_main_o()).compose(rxFragment.bindUntilEvent(FragmentEvent.DESTROY));
            }
        };
    }

    public static <T> ObservableTransformer<T, T> composeAct(final RxAppCompatActivity rxAppCompatActivity) {
        return new ObservableTransformer<T, T>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.3
            @Override // io.reactivex.ObservableTransformer
            public ObservableSource<T> apply(Observable<T> observable) {
                return observable.compose(RxSchedulerUtils._io_main_o()).compose(rxAppCompatActivity.bindUntilEvent(ActivityEvent.DESTROY));
            }
        };
    }

    public static <T> Flowable<T> createFlowable(final T t) {
        return Flowable.create(new FlowableOnSubscribe<T>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.4
            /* JADX WARN: Multi-variable type inference failed */
            @Override // io.reactivex.FlowableOnSubscribe
            public void subscribe(FlowableEmitter<T> flowableEmitter) throws Exception {
                try {
                    flowableEmitter.onNext(t);
                    flowableEmitter.onComplete();
                } catch (Throwable th) {
                    flowableEmitter.onError(th);
                }
            }
        }, BackpressureStrategy.LATEST);
    }

    public static Flowable<Long> polling(long j) {
        return polling(0L, j, TimeUnit.SECONDS);
    }

    public static Flowable<Long> polling(long j, TimeUnit timeUnit) {
        return polling(0L, j, timeUnit);
    }

    public static Disposable polling(long j, Consumer<Long> consumer) {
        return polling(0L, j, consumer);
    }

    public static Disposable polling(long j, long j2, Consumer<Long> consumer) {
        return polling(j, j2, TimeUnit.SECONDS, consumer, new Consumer<Throwable>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.5
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
                LogUtils.m18d("轮询操作异常:" + th.getMessage());
            }
        });
    }

    public static Flowable<Long> polling(long j, long j2, TimeUnit timeUnit) {
        return Flowable.interval(j, j2, timeUnit).observeOn(AndroidSchedulers.mainThread());
    }

    public static Disposable polling(long j, long j2, TimeUnit timeUnit, Consumer<Long> consumer, Consumer<Throwable> consumer2) {
        return Flowable.interval(j, j2, timeUnit).observeOn(AndroidSchedulers.mainThread()).subscribe(consumer, consumer2);
    }

    public static Disposable countDown(long j, DisposableObserver<Long> disposableObserver) {
        return (Disposable) countDown(j, 1L, TimeUnit.SECONDS).subscribeWith(disposableObserver);
    }

    public static Observable<Long> countDown(long j) {
        return countDown(j, 1L, TimeUnit.SECONDS);
    }

    public static Observable<Long> countDown(final long j, long j2, TimeUnit timeUnit) {
        Observable<Long> observableInterval = Observable.interval(0L, j2, timeUnit);
        Double.isNaN(j);
        Double.isNaN(j2);
        return observableInterval.take(((int) Math.floor(r0 / r4)) + 1).map(new Function<Long, Long>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.6
            @Override // io.reactivex.functions.Function
            public Long apply(Long l) throws Exception {
                return Long.valueOf(j - l.longValue());
            }
        }).compose(RxSchedulerUtils._io_main_o());
    }

    public static Observable<Long> interval(long j, long j2, TimeUnit timeUnit) {
        return Observable.interval(0L, j2, timeUnit).take(j).map(new Function<Long, Long>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.7
            @Override // io.reactivex.functions.Function
            public Long apply(Long l) throws Exception {
                return l;
            }
        }).compose(RxSchedulerUtils._io_main_o());
    }

    public static Disposable delay(long j, TimeUnit timeUnit, Consumer<Long> consumer, Consumer<Throwable> consumer2) {
        return Flowable.timer(j, timeUnit).observeOn(AndroidSchedulers.mainThread()).subscribe(consumer, consumer2);
    }

    public static Observable<Long> delay(long j, TimeUnit timeUnit) {
        return Observable.timer(j, timeUnit).observeOn(AndroidSchedulers.mainThread());
    }

    public static Observable<Long> delay(long j, TimeUnit timeUnit, Scheduler scheduler) {
        return Observable.timer(j, timeUnit, scheduler).observeOn(AndroidSchedulers.mainThread());
    }

    public static Disposable delay(long j, TimeUnit timeUnit, DisposableObserver<Long> disposableObserver) {
        return (Disposable) Observable.timer(j, timeUnit).observeOn(AndroidSchedulers.mainThread()).subscribeWith(disposableObserver);
    }

    public static <T> Observable<T> delay(T t, long j, TimeUnit timeUnit) {
        return Observable.just(t).delay(j, timeUnit).observeOn(AndroidSchedulers.mainThread());
    }

    public static <T> Disposable delay(T t, long j, TimeUnit timeUnit, DisposableObserver<T> disposableObserver) {
        return (Disposable) Observable.just(t).delay(j, timeUnit).observeOn(AndroidSchedulers.mainThread()).subscribeWith(disposableObserver);
    }

    public static <T, R> Flowable<R> executeAsyncTask(T t, FlowableTransformer<T, R> flowableTransformer) {
        return Flowable.just(t).compose(flowableTransformer).compose(RxSchedulerUtils._io_main_f());
    }

    public static <T, R> Observable<R> executeAsyncTask(T t, ObservableTransformer<T, R> observableTransformer) {
        return Observable.just(t).compose(observableTransformer).compose(RxSchedulerUtils._io_main_o());
    }

    public static <T, R> Disposable executeAsyncTask(T t, FlowableTransformer<T, R> flowableTransformer, Consumer<R> consumer, Consumer<Throwable> consumer2) {
        return executeAsyncTask(t, flowableTransformer).subscribe(consumer, consumer2);
    }

    public static <T, R> Disposable executeAsyncTask(T t, ObservableTransformer<T, R> observableTransformer, DisposableObserver<R> disposableObserver) {
        return (Disposable) executeAsyncTask(t, observableTransformer).subscribeWith(disposableObserver);
    }

    public static <T> ObservableTransformer<T, T> comActCompose(final RxAppCompatActivity rxAppCompatActivity) {
        return new ObservableTransformer<T, T>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.8
            @Override // io.reactivex.ObservableTransformer
            public ObservableSource<T> apply(Observable<T> observable) {
                return observable.compose(RxSchedulerUtils._io_main_o()).compose(rxAppCompatActivity.bindUntilEvent(ActivityEvent.DESTROY));
            }
        };
    }

    public static <T> ObservableTransformer<T, T> comFrgCompose(final RxFragment rxFragment) {
        return new ObservableTransformer<T, T>() { // from class: com.landleaf.smarthome.util.rxutils.RxJavaUtils.9
            @Override // io.reactivex.ObservableTransformer
            public ObservableSource<T> apply(Observable<T> observable) {
                return observable.compose(RxSchedulerUtils._io_main_o()).compose(rxFragment.bindUntilEvent(FragmentEvent.DESTROY));
            }
        };
    }
}
