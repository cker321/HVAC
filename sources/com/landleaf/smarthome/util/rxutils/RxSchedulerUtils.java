package com.landleaf.smarthome.util.rxutils;

import io.reactivex.Flowable;
import io.reactivex.FlowableTransformer;
import io.reactivex.Observable;
import io.reactivex.ObservableTransformer;
import io.reactivex.Scheduler;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class RxSchedulerUtils {
    private static Executor sIOExecutor;

    public static void setIOExecutor(Executor executor) {
        sIOExecutor = executor;
    }

    public static Executor getIOExecutor() {
        return sIOExecutor;
    }

    /* renamed from: io */
    public static Scheduler m28io() {
        return m29io(sIOExecutor);
    }

    public static Scheduler main() {
        return main();
    }

    /* renamed from: io */
    public static Scheduler m29io(Executor executor) {
        return executor != null ? Schedulers.from(executor) : Schedulers.m42io();
    }

    public static Scheduler main(Executor executor) {
        return executor != null ? Schedulers.from(executor) : AndroidSchedulers.mainThread();
    }

    private RxSchedulerUtils() {
        throw new UnsupportedOperationException("u can't instantiate me...");
    }

    public static <T> Flowable<T> toMain(Flowable<T> flowable) {
        return flowable.observeOn(AndroidSchedulers.mainThread());
    }

    public static <T> Flowable<T> toIo(Flowable<T> flowable) {
        return flowable.observeOn(Schedulers.m42io());
    }

    public static <T> FlowableTransformer<T, T> _main_f() {
        return new RxSchedulerTransformer(SchedulerType._main);
    }

    public static <T> FlowableTransformer<T, T> _io_f() {
        return new RxSchedulerTransformer(SchedulerType._io);
    }

    public static <T> FlowableTransformer<T, T> _io_main_f() {
        return new RxSchedulerTransformer(SchedulerType._io_main);
    }

    public static <T> FlowableTransformer<T, T> _io_io_f() {
        return new RxSchedulerTransformer(SchedulerType._io_io);
    }

    public static <T> Observable<T> toMain(Observable<T> observable) {
        return observable.observeOn(AndroidSchedulers.mainThread());
    }

    public static <T> Observable<T> toIo(Observable<T> observable) {
        return observable.observeOn(Schedulers.m42io());
    }

    public static <T> ObservableTransformer<T, T> _main_o() {
        return new RxSchedulerTransformer(SchedulerType._main);
    }

    public static <T> ObservableTransformer<T, T> _io_o() {
        return new RxSchedulerTransformer(SchedulerType._io);
    }

    public static <T> ObservableTransformer<T, T> _io_main_o() {
        return new RxSchedulerTransformer(SchedulerType._io_main);
    }

    public static <T> ObservableTransformer<T, T> _io_io_o() {
        return new RxSchedulerTransformer(SchedulerType._io_io);
    }
}
