package com.jakewharton.rxbinding2.view;

import android.view.View;

/* loaded from: classes.dex */
final class AutoValue_ViewAttachDetachedEvent extends ViewAttachDetachedEvent {
    private final View view;

    AutoValue_ViewAttachDetachedEvent(View view) {
        if (view == null) {
            throw new NullPointerException("Null view");
        }
        this.view = view;
    }

    @Override // com.jakewharton.rxbinding2.view.ViewAttachEvent
    public View view() {
        return this.view;
    }

    public String toString() {
        return "ViewAttachDetachedEvent{view=" + this.view + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof ViewAttachDetachedEvent) {
            return this.view.equals(((ViewAttachDetachedEvent) obj).view());
        }
        return false;
    }

    public int hashCode() {
        return this.view.hashCode() ^ 1000003;
    }
}
