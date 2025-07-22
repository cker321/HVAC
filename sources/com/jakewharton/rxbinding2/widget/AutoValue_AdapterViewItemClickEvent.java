package com.jakewharton.rxbinding2.widget;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: classes.dex */
final class AutoValue_AdapterViewItemClickEvent extends AdapterViewItemClickEvent {
    private final View clickedView;

    /* renamed from: id */
    private final long f134id;
    private final int position;
    private final AdapterView<?> view;

    AutoValue_AdapterViewItemClickEvent(AdapterView<?> adapterView, View view, int i, long j) {
        if (adapterView == null) {
            throw new NullPointerException("Null view");
        }
        this.view = adapterView;
        if (view == null) {
            throw new NullPointerException("Null clickedView");
        }
        this.clickedView = view;
        this.position = i;
        this.f134id = j;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemClickEvent
    public AdapterView<?> view() {
        return this.view;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemClickEvent
    public View clickedView() {
        return this.clickedView;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemClickEvent
    public int position() {
        return this.position;
    }

    @Override // com.jakewharton.rxbinding2.widget.AdapterViewItemClickEvent
    /* renamed from: id */
    public long mo14id() {
        return this.f134id;
    }

    public String toString() {
        return "AdapterViewItemClickEvent{view=" + this.view + ", clickedView=" + this.clickedView + ", position=" + this.position + ", id=" + this.f134id + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AdapterViewItemClickEvent)) {
            return false;
        }
        AdapterViewItemClickEvent adapterViewItemClickEvent = (AdapterViewItemClickEvent) obj;
        return this.view.equals(adapterViewItemClickEvent.view()) && this.clickedView.equals(adapterViewItemClickEvent.clickedView()) && this.position == adapterViewItemClickEvent.position() && this.f134id == adapterViewItemClickEvent.mo14id();
    }

    public int hashCode() {
        long jHashCode = (((((this.view.hashCode() ^ 1000003) * 1000003) ^ this.clickedView.hashCode()) * 1000003) ^ this.position) * 1000003;
        long j = this.f134id;
        return (int) (jHashCode ^ (j ^ (j >>> 32)));
    }
}
