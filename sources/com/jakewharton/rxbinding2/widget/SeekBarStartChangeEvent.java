package com.jakewharton.rxbinding2.widget;

import android.widget.SeekBar;

/* loaded from: classes.dex */
public abstract class SeekBarStartChangeEvent extends SeekBarChangeEvent {
    public static SeekBarStartChangeEvent create(SeekBar seekBar) {
        return new AutoValue_SeekBarStartChangeEvent(seekBar);
    }

    SeekBarStartChangeEvent() {
    }
}
