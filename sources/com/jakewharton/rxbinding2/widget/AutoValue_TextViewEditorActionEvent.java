package com.jakewharton.rxbinding2.widget;

import android.view.KeyEvent;
import android.widget.TextView;

/* loaded from: classes.dex */
final class AutoValue_TextViewEditorActionEvent extends TextViewEditorActionEvent {
    private final int actionId;
    private final KeyEvent keyEvent;
    private final TextView view;

    AutoValue_TextViewEditorActionEvent(TextView textView, int i, KeyEvent keyEvent) {
        if (textView == null) {
            throw new NullPointerException("Null view");
        }
        this.view = textView;
        this.actionId = i;
        this.keyEvent = keyEvent;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewEditorActionEvent
    public TextView view() {
        return this.view;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewEditorActionEvent
    public int actionId() {
        return this.actionId;
    }

    @Override // com.jakewharton.rxbinding2.widget.TextViewEditorActionEvent
    public KeyEvent keyEvent() {
        return this.keyEvent;
    }

    public String toString() {
        return "TextViewEditorActionEvent{view=" + this.view + ", actionId=" + this.actionId + ", keyEvent=" + this.keyEvent + "}";
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof TextViewEditorActionEvent)) {
            return false;
        }
        TextViewEditorActionEvent textViewEditorActionEvent = (TextViewEditorActionEvent) obj;
        if (this.view.equals(textViewEditorActionEvent.view()) && this.actionId == textViewEditorActionEvent.actionId()) {
            KeyEvent keyEvent = this.keyEvent;
            if (keyEvent == null) {
                if (textViewEditorActionEvent.keyEvent() == null) {
                    return true;
                }
            } else if (keyEvent.equals(textViewEditorActionEvent.keyEvent())) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int iHashCode = (((this.view.hashCode() ^ 1000003) * 1000003) ^ this.actionId) * 1000003;
        KeyEvent keyEvent = this.keyEvent;
        return iHashCode ^ (keyEvent == null ? 0 : keyEvent.hashCode());
    }
}
