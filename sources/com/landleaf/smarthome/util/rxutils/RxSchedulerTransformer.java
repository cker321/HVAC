package com.landleaf.smarthome.util.rxutils;

import io.reactivex.Completable;
import io.reactivex.CompletableSource;
import io.reactivex.CompletableTransformer;
import io.reactivex.Flowable;
import io.reactivex.FlowableTransformer;
import io.reactivex.Maybe;
import io.reactivex.MaybeSource;
import io.reactivex.MaybeTransformer;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
import io.reactivex.Single;
import io.reactivex.SingleSource;
import io.reactivex.SingleTransformer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import java.util.concurrent.Executor;
import org.reactivestreams.Publisher;

/* loaded from: classes.dex */
public class RxSchedulerTransformer<T> implements ObservableTransformer<T, T>, FlowableTransformer<T, T>, SingleTransformer<T, T>, MaybeTransformer<T, T>, CompletableTransformer {
    private Executor mIOExecutor;
    private SchedulerType mSchedulerType;

    public RxSchedulerTransformer() {
        this(SchedulerType._io_main, RxSchedulerUtils.getIOExecutor());
    }

    public RxSchedulerTransformer(SchedulerType schedulerType) {
        this(schedulerType, RxSchedulerUtils.getIOExecutor());
    }

    public RxSchedulerTransformer(Executor executor) {
        this(SchedulerType._io_main, executor);
    }

    public RxSchedulerTransformer(SchedulerType schedulerType, Executor executor) {
        this.mSchedulerType = schedulerType;
        this.mIOExecutor = executor;
    }

    public RxSchedulerTransformer<T> setIOExecutor(Executor executor) {
        this.mIOExecutor = executor;
        return this;
    }

    public RxSchedulerTransformer<T> setSchedulerType(SchedulerType schedulerType) {
        this.mSchedulerType = schedulerType;
        return this;
    }

    /* renamed from: com.landleaf.smarthome.util.rxutils.RxSchedulerTransformer$1 */
    static /* synthetic */ class C07171 {
        static final /* synthetic */ int[] $SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType;

        static {
            int[] iArr = new int[SchedulerType.values().length];
            $SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType = iArr;
            try {
                iArr[SchedulerType._main.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[SchedulerType._io.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[SchedulerType._io_main.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[SchedulerType._io_io.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    @Override // io.reactivex.ObservableTransformer
    public ObservableSource<T> apply(Observable<T> observable) {
        int i = C07171.$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[this.mSchedulerType.ordinal()];
        if (i == 1) {
            return observable.observeOn(AndroidSchedulers.mainThread());
        }
        if (i == 2) {
            return observable.observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        if (i != 3) {
            return i != 4 ? observable : observable.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        return observable.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(AndroidSchedulers.mainThread());
    }

    @Override // io.reactivex.FlowableTransformer
    public Publisher<T> apply(Flowable<T> flowable) {
        int i = C07171.$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[this.mSchedulerType.ordinal()];
        if (i == 1) {
            return flowable.observeOn(AndroidSchedulers.mainThread());
        }
        if (i == 2) {
            return flowable.observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        if (i != 3) {
            return i != 4 ? flowable : flowable.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        return flowable.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(AndroidSchedulers.mainThread());
    }

    @Override // io.reactivex.MaybeTransformer
    public MaybeSource<T> apply(Maybe<T> maybe) {
        int i = C07171.$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[this.mSchedulerType.ordinal()];
        if (i == 1) {
            return maybe.observeOn(AndroidSchedulers.mainThread());
        }
        if (i == 2) {
            return maybe.observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        if (i != 3) {
            return i != 4 ? maybe : maybe.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        return maybe.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(AndroidSchedulers.mainThread());
    }

    @Override // io.reactivex.SingleTransformer
    public SingleSource<T> apply(Single<T> single) {
        int i = C07171.$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[this.mSchedulerType.ordinal()];
        if (i == 1) {
            return single.observeOn(AndroidSchedulers.mainThread());
        }
        if (i == 2) {
            return single.observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        if (i != 3) {
            return i != 4 ? single : single.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        return single.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(AndroidSchedulers.mainThread());
    }

    @Override // io.reactivex.CompletableTransformer
    public CompletableSource apply(Completable completable) {
        int i = C07171.$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType[this.mSchedulerType.ordinal()];
        if (i == 1) {
            return completable.observeOn(AndroidSchedulers.mainThread());
        }
        if (i == 2) {
            return completable.observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        if (i != 3) {
            return i != 4 ? completable : completable.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(RxSchedulerUtils.m29io(this.mIOExecutor));
        }
        return completable.subscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).unsubscribeOn(RxSchedulerUtils.m29io(this.mIOExecutor)).observeOn(AndroidSchedulers.mainThread());
    }
}
