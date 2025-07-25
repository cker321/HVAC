package io.reactivex;

import io.reactivex.disposables.Disposable;

/* loaded from: classes.dex */
public interface MaybeObserver<T> {
    void onComplete();

    void onError(Throwable th);

    void onSubscribe(Disposable disposable);

    void onSuccess(T t);
}
