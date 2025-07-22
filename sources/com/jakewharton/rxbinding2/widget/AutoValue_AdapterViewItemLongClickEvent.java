package com.jakewharton.rxbinding2.widget;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: classes.dex */
final class AutoValue_AdapterViewItemLongClickEvent extends AdapterViewItemLongClickEvent {
    private final View clickedView;

    /* renamed from: id */
    private final long f135id;
    private final int position;
    private final AdapterView<?> view;

    AutoValue_AdapterViewItemLongClickEvent(AdapterView<?> adapterView, View view, int i, long j) {
        if (adapterView == null) {
            throw new NullPointerException("Null view");
        }
        this.view = adapterView;
        if (view == null) {
            throw new NullPointerException("Null clickedView");
        }
        this.clickedView = view;
        this.position = i;
        this.f135id = j;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemLongClickEvent
    public AdapterView<?> view() {
        return this.view;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemLongClickEvent
    public View clickedView() {
        return this.clickedView;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemLongClickEvent
    public int position() {
        return this.position;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemLongClickEvent
    /* renamed from: id */
    public long mo15id() {
        return this.f135id;
    }

    public String toString() {
        return "AdapterViewItemLongClickEvent{view=" + this.view + ", clickedView=" + this.clickedView + ", position=" + this.position + ", id=" + this.f135id + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AdapterViewItemLongClickEvent)) {
            return false;
        }
        AdapterViewItemLongClickEvent adapterViewItemLongClickEvent = (AdapterViewItemLongClickEvent) obj;
        return this.view.equals(adapterViewItemLongClickEvent.view()) && this.clickedView.equals(adapterViewItemLongClickEvent.clickedView()) && this.position == adapterViewItemLongClickEvent.position() && this.f135id == adapterViewItemLongClickEvent.mo15id();
    }

    public int hashCode() {
        long jHashCode = (((((this.view.hashCode() ^ 1000003) * 1000003) ^ this.clickedView.hashCode()) * 1000003) ^ this.position) * 1000003;
        long j = this.f135id;
        return (int) (jHashCode ^ (j ^ (j >>> 32)));
    }
}
