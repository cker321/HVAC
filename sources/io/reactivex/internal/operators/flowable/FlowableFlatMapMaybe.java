package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

/* loaded from: classes.dex */
public final class FlowableFlatMapMaybe<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final boolean delayErrors;
    final Function<? super T, ? extends MaybeSource<? extends R>> mapper;
    final int maxConcurrency;

    public FlowableFlatMapMaybe(Flowable<T> flowable, Function<? super T, ? extends MaybeSource<? extends R>> function, boolean z, int i) {
        super(flowable);
        this.mapper = function;
        this.delayErrors = z;
        this.maxConcurrency = i;
    }

    @Override // io.reactivex.Flowable
    protected void subscribeActual(Subscriber<? super R> subscriber) {
        this.source.subscribe((FlowableSubscriber) new FlatMapMaybeSubscriber(subscriber, this.mapper, this.delayErrors, this.maxConcurrency));
    }

    static final class FlatMapMaybeSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 8600231336733376951L;
        volatile boolean cancelled;
        final boolean delayErrors;
        final Subscriber<? super R> downstream;
        final Function<? super T, ? extends MaybeSource<? extends R>> mapper;
        final int maxConcurrency;
        Subscription upstream;
        final AtomicLong requested = new AtomicLong();
        final CompositeDisposable set = new CompositeDisposable();
        final AtomicThrowable errors = new AtomicThrowable();
        final AtomicInteger active = new AtomicInteger(1);
        final AtomicReference<SpscLinkedArrayQueue<R>> queue = new AtomicReference<>();

        FlatMapMaybeSubscriber(Subscriber<? super R> subscriber, Function<? super T, ? extends MaybeSource<? extends R>> function, boolean z, int i) {
            this.downstream = subscriber;
            this.mapper = function;
            this.delayErrors = z;
            this.maxConcurrency = i;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.upstream, subscription)) {
                this.upstream = subscription;
                this.downstream.onSubscribe(this);
                int i = this.maxConcurrency;
                if (i == Integer.MAX_VALUE) {
                    subscription.request(Long.MAX_VALUE);
                } else {
                    subscription.request(i);
                }
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            try {
                MaybeSource maybeSource = (MaybeSource) ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null MaybeSource");
                this.active.getAndIncrement();
                InnerObserver innerObserver = new InnerObserver();
                if (this.cancelled || !this.set.add(innerObserver)) {
                    return;
                }
                maybeSource.subscribe(innerObserver);
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                this.upstream.cancel();
                onError(th);
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable th) {
            this.active.decrementAndGet();
            if (this.errors.addThrowable(th)) {
                if (!this.delayErrors) {
                    this.set.dispose();
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.active.decrementAndGet();
            drain();
        }

        @Override // org.reactivestreams.Subscription
        public void cancel() {
            this.cancelled = true;
            this.upstream.cancel();
            this.set.dispose();
        }

        @Override // org.reactivestreams.Subscription
        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:35:0x007b  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        void innerSuccess(io.reactivex.internal.operators.flowable.FlowableFlatMapMaybe.FlatMapMaybeSubscriber<T, R>.InnerObserver r6, R r7) {
            /*
                r5 = this;
                io.reactivex.disposables.CompositeDisposable r0 = r5.set
                r0.delete(r6)
                int r6 = r5.get()
                if (r6 != 0) goto L7b
                r6 = 1
                r0 = 0
                boolean r1 = r5.compareAndSet(r0, r6)
                if (r1 == 0) goto L7b
                java.util.concurrent.atomic.AtomicInteger r1 = r5.active
                int r1 = r1.decrementAndGet()
                if (r1 != 0) goto L1c
                goto L1d
            L1c:
                r6 = 0
            L1d:
                java.util.concurrent.atomic.AtomicLong r0 = r5.requested
                long r0 = r0.get()
                r2 = 0
                int r4 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
                if (r4 == 0) goto L68
                org.reactivestreams.Subscriber<? super R> r0 = r5.downstream
                r0.onNext(r7)
                java.util.concurrent.atomic.AtomicReference<io.reactivex.internal.queue.SpscLinkedArrayQueue<R>> r7 = r5.queue
                java.lang.Object r7 = r7.get()
                io.reactivex.internal.queue.SpscLinkedArrayQueue r7 = (io.reactivex.internal.queue.SpscLinkedArrayQueue) r7
                if (r6 == 0) goto L54
                if (r7 == 0) goto L40
                boolean r6 = r7.isEmpty()
                if (r6 == 0) goto L54
            L40:
                io.reactivex.internal.util.AtomicThrowable r6 = r5.errors
                java.lang.Throwable r6 = r6.terminate()
                if (r6 == 0) goto L4e
                org.reactivestreams.Subscriber<? super R> r7 = r5.downstream
                r7.onError(r6)
                goto L53
            L4e:
                org.reactivestreams.Subscriber<? super R> r6 = r5.downstream
                r6.onComplete()
            L53:
                return
            L54:
                java.util.concurrent.atomic.AtomicLong r6 = r5.requested
                r0 = 1
                io.reactivex.internal.util.BackpressureHelper.produced(r6, r0)
                int r6 = r5.maxConcurrency
                r7 = 2147483647(0x7fffffff, float:NaN)
                if (r6 == r7) goto L71
                org.reactivestreams.Subscription r6 = r5.upstream
                r6.request(r0)
                goto L71
            L68:
                io.reactivex.internal.queue.SpscLinkedArrayQueue r6 = r5.getOrCreateQueue()
                monitor-enter(r6)
                r6.offer(r7)     // Catch: java.lang.Throwable -> L78
                monitor-exit(r6)     // Catch: java.lang.Throwable -> L78
            L71:
                int r6 = r5.decrementAndGet()
                if (r6 != 0) goto L90
                return
            L78:
                r7 = move-exception
                monitor-exit(r6)     // Catch: java.lang.Throwable -> L78
                throw r7
            L7b:
                io.reactivex.internal.queue.SpscLinkedArrayQueue r6 = r5.getOrCreateQueue()
                monitor-enter(r6)
                r6.offer(r7)     // Catch: java.lang.Throwable -> L94
                monitor-exit(r6)     // Catch: java.lang.Throwable -> L94
                java.util.concurrent.atomic.AtomicInteger r6 = r5.active
                r6.decrementAndGet()
                int r6 = r5.getAndIncrement()
                if (r6 == 0) goto L90
                return
            L90:
                r5.drainLoop()
                return
            L94:
                r7 = move-exception
                monitor-exit(r6)     // Catch: java.lang.Throwable -> L94
                throw r7
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFlatMapMaybe.FlatMapMaybeSubscriber.innerSuccess(io.reactivex.internal.operators.flowable.FlowableFlatMapMaybe$FlatMapMaybeSubscriber$InnerObserver, java.lang.Object):void");
        }

        SpscLinkedArrayQueue<R> getOrCreateQueue() {
            SpscLinkedArrayQueue<R> spscLinkedArrayQueue;
            do {
                SpscLinkedArrayQueue<R> spscLinkedArrayQueue2 = this.queue.get();
                if (spscLinkedArrayQueue2 != null) {
                    return spscLinkedArrayQueue2;
                }
                spscLinkedArrayQueue = new SpscLinkedArrayQueue<>(Flowable.bufferSize());
            } while (!this.queue.compareAndSet(null, spscLinkedArrayQueue));
            return spscLinkedArrayQueue;
        }

        void innerError(FlatMapMaybeSubscriber<T, R>.InnerObserver innerObserver, Throwable th) {
            this.set.delete(innerObserver);
            if (this.errors.addThrowable(th)) {
                if (!this.delayErrors) {
                    this.upstream.cancel();
                    this.set.dispose();
                } else if (this.maxConcurrency != Integer.MAX_VALUE) {
                    this.upstream.request(1L);
                }
                this.active.decrementAndGet();
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        void innerComplete(FlatMapMaybeSubscriber<T, R>.InnerObserver innerObserver) {
            this.set.delete(innerObserver);
            if (get() == 0) {
                if (compareAndSet(0, 1)) {
                    boolean z = this.active.decrementAndGet() == 0;
                    SpscLinkedArrayQueue<R> spscLinkedArrayQueue = this.queue.get();
                    if (z && (spscLinkedArrayQueue == null || spscLinkedArrayQueue.isEmpty())) {
                        Throwable thTerminate = this.errors.terminate();
                        if (thTerminate != null) {
                            this.downstream.onError(thTerminate);
                            return;
                        } else {
                            this.downstream.onComplete();
                            return;
                        }
                    }
                    if (this.maxConcurrency != Integer.MAX_VALUE) {
                        this.upstream.request(1L);
                    }
                    if (decrementAndGet() == 0) {
                        return;
                    }
                    drainLoop();
                    return;
                }
            }
            this.active.decrementAndGet();
            if (this.maxConcurrency != Integer.MAX_VALUE) {
                this.upstream.request(1L);
            }
            drain();
        }

        void drain() {
            if (getAndIncrement() == 0) {
                drainLoop();
            }
        }

        void clear() {
            SpscLinkedArrayQueue<R> spscLinkedArrayQueue = this.queue.get();
            if (spscLinkedArrayQueue != null) {
                spscLinkedArrayQueue.clear();
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:38:0x0075, code lost:
        
            if (r9 != r5) goto L65;
         */
        /* JADX WARN: Code restructure failed: missing block: B:40:0x0079, code lost:
        
            if (r15.cancelled == false) goto L43;
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x007b, code lost:
        
            clear();
         */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x007e, code lost:
        
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:0x0081, code lost:
        
            if (r15.delayErrors != false) goto L49;
         */
        /* JADX WARN: Code restructure failed: missing block: B:46:0x008b, code lost:
        
            if (r15.errors.get() == null) goto L49;
         */
        /* JADX WARN: Code restructure failed: missing block: B:47:0x008d, code lost:
        
            r1 = r15.errors.terminate();
            clear();
            r0.onError(r1);
         */
        /* JADX WARN: Code restructure failed: missing block: B:48:0x0099, code lost:
        
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:50:0x009e, code lost:
        
            if (r1.get() != 0) goto L52;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x00a0, code lost:
        
            r5 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:52:0x00a2, code lost:
        
            r5 = false;
         */
        /* JADX WARN: Code restructure failed: missing block: B:53:0x00a3, code lost:
        
            r6 = r2.get();
         */
        /* JADX WARN: Code restructure failed: missing block: B:54:0x00a9, code lost:
        
            if (r6 == null) goto L57;
         */
        /* JADX WARN: Code restructure failed: missing block: B:56:0x00af, code lost:
        
            if (r6.isEmpty() == false) goto L58;
         */
        /* JADX WARN: Code restructure failed: missing block: B:57:0x00b1, code lost:
        
            r11 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:58:0x00b2, code lost:
        
            if (r5 == false) goto L65;
         */
        /* JADX WARN: Code restructure failed: missing block: B:59:0x00b4, code lost:
        
            if (r11 == false) goto L65;
         */
        /* JADX WARN: Code restructure failed: missing block: B:60:0x00b6, code lost:
        
            r1 = r15.errors.terminate();
         */
        /* JADX WARN: Code restructure failed: missing block: B:61:0x00bc, code lost:
        
            if (r1 == null) goto L63;
         */
        /* JADX WARN: Code restructure failed: missing block: B:62:0x00be, code lost:
        
            r0.onError(r1);
         */
        /* JADX WARN: Code restructure failed: missing block: B:63:0x00c2, code lost:
        
            r0.onComplete();
         */
        /* JADX WARN: Code restructure failed: missing block: B:64:0x00c5, code lost:
        
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:66:0x00c8, code lost:
        
            if (r9 == 0) goto L70;
         */
        /* JADX WARN: Code restructure failed: missing block: B:67:0x00ca, code lost:
        
            io.reactivex.internal.util.BackpressureHelper.produced(r15.requested, r9);
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x00d4, code lost:
        
            if (r15.maxConcurrency == Integer.MAX_VALUE) goto L70;
         */
        /* JADX WARN: Code restructure failed: missing block: B:69:0x00d6, code lost:
        
            r15.upstream.request(r9);
         */
        /* JADX WARN: Code restructure failed: missing block: B:70:0x00db, code lost:
        
            r4 = addAndGet(-r4);
         */
        /* JADX WARN: Code restructure failed: missing block: B:84:?, code lost:
        
            return;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        void drainLoop() {
            /*
                Method dump skipped, instructions count: 227
                To view this dump change 'Code comments level' option to 'DEBUG'
            */
            throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableFlatMapMaybe.FlatMapMaybeSubscriber.drainLoop():void");
        }

        final class InnerObserver extends AtomicReference<Disposable> implements MaybeObserver<R>, Disposable {
            private static final long serialVersionUID = -502562646270949838L;

            InnerObserver() {
            }

            @Override // io.reactivex.MaybeObserver
            public void onSubscribe(Disposable disposable) {
                DisposableHelper.setOnce(this, disposable);
            }

            @Override // io.reactivex.MaybeObserver
            public void onSuccess(R r) {
                FlatMapMaybeSubscriber.this.innerSuccess(this, r);
            }

            @Override // io.reactivex.MaybeObserver
            public void onError(Throwable th) {
                FlatMapMaybeSubscriber.this.innerError(this, th);
            }

            @Override // io.reactivex.MaybeObserver
            public void onComplete() {
                FlatMapMaybeSubscriber.this.innerComplete(this);
            }

            @Override // io.reactivex.disposables.Disposable
            public boolean isDisposed() {
                return DisposableHelper.isDisposed(get());
            }

            @Override // io.reactivex.disposables.Disposable
            public void dispose() {
                DisposableHelper.dispose(this);
            }
        }
    }
}
