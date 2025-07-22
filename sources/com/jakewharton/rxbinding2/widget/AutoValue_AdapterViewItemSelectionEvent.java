package com.jakewharton.rxbinding2.widget;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: classes.dex */
final class AutoValue_AdapterViewItemSelectionEvent extends AdapterViewItemSelectionEvent {

    /* renamed from: id */
    private final long f136id;
    private final int position;
    private final View selectedView;
    private final AdapterView<?> view;

    AutoValue_AdapterViewItemSelectionEvent(AdapterView<?> adapterView, View view, int i, long j) {
        if (adapterView == null) {
            throw new NullPointerException("Null view");
        }
        this.view = adapterView;
        if (view == null) {
            throw new NullPointerException("Null selectedView");
        }
        this.selectedView = view;
        this.position = i;
        this.f136id = j;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewSelectionEvent
    public AdapterView<?> view() {
        return this.view;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemSelectionEvent
    public View selectedView() {
        return this.selectedView;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemSelectionEvent
    public int position() {
        return this.position;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemSelectionEvent
    /* renamed from: id */
    public long mo16id() {
        return this.f136id;
    }

    public String toString() {
        return "AdapterViewItemSelectionEvent{view=" + this.view + ", selectedView=" + this.selectedView + ", position=" + this.position + ", id=" + this.f136id + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AdapterViewItemSelectionEvent)) {
            return false;
        }
        AdapterViewItemSelectionEvent adapterViewItemSelectionEvent = (AdapterViewItemSelectionEvent) obj;
        return this.view.equals(adapterViewItemSelectionEvent.view()) && this.selectedView.equals(adapterViewItemSelectionEvent.selectedView()) && this.position == adapterViewItemSelectionEvent.position() && this.f136id == adapterViewItemSelectionEvent.mo16id();
    }

    public int hashCode() {
        long jHashCode = (((((this.view.hashCode() ^ 1000003) * 1000003) ^ this.selectedView.hashCode()) * 1000003) ^ this.position) * 1000003;
        long j = this.f136id;
        return (int) (jHashCode ^ (j ^ (j >>> 32)));
    }
}
