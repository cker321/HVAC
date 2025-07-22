package com.jakewharton.rxbinding2.view;

import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes.dex */
public abstract class ViewGroupHierarchyChangeEvent {
    public abstract View child();

    public abstract ViewGroup view();

    ViewGroupHierarchyChangeEvent() {
    }
}
