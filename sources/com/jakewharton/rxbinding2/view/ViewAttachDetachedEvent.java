package com.jakewharton.rxbinding2.view;

import android.view.View;

/* loaded from: classes.dex */
public abstract class ViewAttachDetachedEvent extends ViewAttachEvent {
    public static ViewAttachDetachedEvent create(View view) {
        return new AutoValue_ViewAttachDetachedEvent(view);
    }

    ViewAttachDetachedEvent() {
    }
}
