package com.jakewharton.rxbinding2.widget;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: classes.dex */
public abstract class AdapterViewItemSelectionEvent extends AdapterViewSelectionEvent {
    /* renamed from: id */
    public abstract long mo16id();

    public abstract int position();

    public abstract View selectedView();

    public static AdapterViewSelectionEvent create(AdapterView<?> adapterView, View view, int i, long j) {
        return new AutoValue_AdapterViewItemSelectionEvent(adapterView, view, i, j);
    }

    AdapterViewItemSelectionEvent() {
    }
}
