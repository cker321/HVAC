package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiPredicate;
import io.reactivex.internal.disposables.SequentialDisposable;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public final class ObservableRetryBiPredicate<T> extends AbstractObservableWithUpstream<T, T> {
    final BiPredicate<? super Integer, ? super Throwable> predicate;

    public ObservableRetryBiPredicate(Observable<T> observable, BiPredicate<? super Integer, ? super Throwable> biPredicate) {
        super(observable);
        this.predicate = biPredicate;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> observer) {
        SequentialDisposable sequentialDisposable = new SequentialDisposable();
        observer.onSubscribe(sequentialDisposable);
        new RetryBiObserver(observer, this.predicate, sequentialDisposable, this.source).subscribeNext();
    }

    static final class RetryBiObserver<T> extends AtomicInteger implements Observer<T> {
        private static final long serialVersionUID = -7098360935104053232L;
        final Observer<? super T> downstream;
        final BiPredicate<? super Integer, ? super Throwable> predicate;
        int retries;
        final ObservableSource<? extends T> source;
        final SequentialDisposable upstream;

        RetryBiObserver(Observer<? super T> observer, BiPredicate<? super Integer, ? super Throwable> biPredicate, SequentialDisposable sequentialDisposable, ObservableSource<? extends T> observableSource) {
            this.downstream = observer;
            this.upstream = sequentialDisposable;
            this.source = observableSource;
            this.predicate = biPredicate;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable disposable) {
            this.upstream.update(disposable);
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.downstream.onNext(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable th) {
            try {
                BiPredicate<? super Integer, ? super Throwable> biPredicate = this.predicate;
                int i = this.retries + 1;
                this.retries = i;
                if (!biPredicate.test(Integer.valueOf(i), th)) {
                    this.downstream.onError(th);
                } else {
                    subscribeNext();
                }
            } catch (Throwable th2) {
                Exceptions.throwIfFatal(th2);
                this.downstream.onError(new CompositeException(th, th2));
            }
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.downstream.onComplete();
        }

        void subscribeNext() {
            if (getAndIncrement() == 0) {
                int iAddAndGet = 1;
                while (!this.upstream.isDisposed()) {
                    this.source.subscribe(this);
                    iAddAndGet = addAndGet(-iAddAndGet);
                    if (iAddAndGet == 0) {
                        return;
                    }
                }
            }
        }
    }
}
