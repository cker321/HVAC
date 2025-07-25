package com.jakewharton.rxbinding2.widget;

import android.widget.TextView;

/* loaded from: classes.dex */
final class AutoValue_TextViewTextChangeEvent extends TextViewTextChangeEvent {
    private final int before;
    private final int count;
    private final int start;
    private final CharSequence text;
    private final TextView view;

    AutoValue_TextViewTextChangeEvent(TextView textView, CharSequence charSequence, int i, int i2, int i3) {
        if (textView == null) {
            throw new NullPointerException("Null view");
        }
        this.view = textView;
        if (charSequence == null) {
            throw new NullPointerException("Null text");
        }
        this.text = charSequence;
        this.start = i;
        this.before = i2;
        this.count = i3;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewTextChangeEvent
    public TextView view() {
        return this.view;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewTextChangeEvent
    public CharSequence text() {
        return this.text;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewTextChangeEvent
    public int start() {
        return this.start;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewTextChangeEvent
    public int before() {
        return this.before;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewTextChangeEvent
    public int count() {
        return this.count;
    }

    public String toString() {
        return "TextViewTextChangeEvent{view=" + this.view + ", text=" + ((Object) this.text) + ", start=" + this.start + ", before=" + this.before + ", count=" + this.count + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof TextViewTextChangeEvent)) {
            return false;
        }
        TextViewTextChangeEvent textViewTextChangeEvent = (TextViewTextChangeEvent) obj;
        return this.view.equals(textViewTextChangeEvent.view()) && this.text.equals(textViewTextChangeEvent.text()) && this.start == textViewTextChangeEvent.start() && this.before == textViewTextChangeEvent.before() && this.count == textViewTextChangeEvent.count();
    }

    public int hashCode() {
        return ((((((((this.view.hashCode() ^ 1000003) * 1000003) ^ this.text.hashCode()) * 1000003) ^ this.start) * 1000003) ^ this.before) * 1000003) ^ this.count;
    }
}
