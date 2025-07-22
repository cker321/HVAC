package com.jakewharton.rxbinding2.widget;

import android.text.Editable;
import android.widget.TextView;

/* loaded from: classes.dex */
final class AutoValue_TextViewAfterTextChangeEvent extends TextViewAfterTextChangeEvent {
    private final Editable editable;
    private final TextView view;

    AutoValue_TextViewAfterTextChangeEvent(TextView textView, Editable editable) {
        if (textView == null) {
            throw new NullPointerException("Null view");
        }
        this.view = textView;
        this.editable = editable;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewAfterTextChangeEvent
    public TextView view() {
        return this.view;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewAfterTextChangeEvent
    public Editable editable() {
        return this.editable;
    }

    public String toString() {
        return "TextViewAfterTextChangeEvent{view=" + this.view + ", editable=" + ((Object) this.editable) + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof TextViewAfterTextChangeEvent)) {
            return false;
        }
        TextViewAfterTextChangeEvent textViewAfterTextChangeEvent = (TextViewAfterTextChangeEvent) obj;
        if (this.view.equals(textViewAfterTextChangeEvent.view())) {
            Editable editable = this.editable;
            if (editable == null) {
                if (textViewAfterTextChangeEvent.editable() == null) {
                    return true;
                }
            } else if (editable.equals(textViewAfterTextChangeEvent.editable())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int iHashCode = (this.view.hashCode() ^ 1000003) * 1000003;
        Editable editable = this.editable;
        return iHashCode ^ (editable == null ? 0 : editable.hashCode());
    }
}
