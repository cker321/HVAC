package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.ArrayDeque;

/* loaded from: classes.dex */
public final class ObservableTakeLast<T> extends AbstractObservableWithUpstream<T, T> {
    final int count;

    public ObservableTakeLast(ObservableSource<T> observableSource, int i) {
        super(observableSource);
        this.count = i;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> observer) {
        this.source.subscribe(new TakeLastObserver(observer, this.count));
    }

    static final class TakeLastObserver<T> extends ArrayDeque<T> implements Observer<T>, Disposable {
        private static final long serialVersionUID = 7240042530241604978L;
        volatile boolean cancelled;
        final int count;
        final Observer<? super T> downstream;
        Disposable upstream;

        TakeLastObserver(Observer<? super T> observer, int i) {
            this.downstream = observer;
            this.count = i;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.upstream, disposable)) {
                this.upstream = disposable;
                this.downstream.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.count == size()) {
                poll();
            }
            offer(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable th) {
            this.downstream.onError(th);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            Observer<? super T> observer = this.downstream;
            while (!this.cancelled) {
                T tPoll = poll();
                if (tPoll == null) {
                    if (this.cancelled) {
                        return;
                    }
                    observer.onComplete();
                    return;
                }
                observer.onNext(tPoll);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (this.cancelled) {
                return;
            }
            this.cancelled = true;
            this.upstream.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }
    }
}
