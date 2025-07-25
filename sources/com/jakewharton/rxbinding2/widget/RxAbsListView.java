package com.jakewharton.rxbinding2.widget;

import android.widget.AbsListView;
import com.jakewharton.rxbinding2.internal.Preconditions;
import io.reactivex.Observable;

/* loaded from: classes.dex */
public final class RxAbsListView {
    public static Observable<AbsListViewScrollEvent> scrollEvents(AbsListView absListView) {
        Preconditions.checkNotNull(absListView, "absListView == null");
        return new AbsListViewScrollEventObservable(absListView);
    }

    private RxAbsListView() {
        throw new AssertionError("No instances.");
    }
}
