package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.subscriptions.SubscriptionArbiter;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

/* loaded from: classes.dex */
public final class FlowableRetryPredicate<T> extends AbstractFlowableWithUpstream<T, T> {
    final long count;
    final Predicate<? super Throwable> predicate;

    public FlowableRetryPredicate(Flowable<T> flowable, long j, Predicate<? super Throwable> predicate) {
        super(flowable);
        this.predicate = predicate;
        this.count = j;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super T> subscriber) {
        SubscriptionArbiter subscriptionArbiter = new SubscriptionArbiter();
        subscriber.onSubscribe(subscriptionArbiter);
        new RetrySubscriber(subscriber, this.count, this.predicate, subscriptionArbiter, this.source).subscribeNext();
    }

    static final class RetrySubscriber<T> extends AtomicInteger implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -7098360935104053232L;
        final Subscriber<? super T> downstream;
        final Predicate<? super Throwable> predicate;
        long produced;
        long remaining;

        /* renamed from: sa */
        final SubscriptionArbiter f200sa;
        final Publisher<? extends T> source;

        RetrySubscriber(Subscriber<? super T> subscriber, long j, Predicate<? super Throwable> predicate, SubscriptionArbiter subscriptionArbiter, Publisher<? extends T> publisher) {
            this.downstream = subscriber;
            this.f200sa = subscriptionArbiter;
            this.source = publisher;
            this.predicate = predicate;
            this.remaining = j;
        }

        @Override // io.reactivex.FlowableSubscriber, org.reactivestreams.Subscriber
        public void onSubscribe(Subscription subscription) {
            this.f200sa.setSubscription(subscription);
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            this.produced++;
            this.downstream.onNext(t);
        }

        @Override // org.reactivestreams.Subscriber
        public void onError(Throwable th) {
            long j = this.remaining;
            if (j != Long.MAX_VALUE) {
                this.remaining = j - 1;
            }
            if (j == 0) {
                this.downstream.onError(th);
                return;
            }
            try {
                if (!this.predicate.test(th)) {
                    this.downstream.onError(th);
                } else {
                    subscribeNext();
                }
            } catch (Throwable th2) {
                Exceptions.throwIfFatal(th2);
                this.downstream.onError(new CompositeException(th, th2));
            }
        }

        @Override // org.reactivestreams.Subscriber
        public void onComplete() {
            this.downstream.onComplete();
        }

        void subscribeNext() {
            if (getAndIncrement() == 0) {
                int iAddAndGet = 1;
                while (!this.f200sa.isCancelled()) {
                    long j = this.produced;
                    if (j != 0) {
                        this.produced = 0L;
                        this.f200sa.produced(j);
                    }
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
