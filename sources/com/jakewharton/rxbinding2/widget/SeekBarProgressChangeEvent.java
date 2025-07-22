package com.jakewharton.rxbinding2.widget;

import android.widget.SeekBar;

/* loaded from: classes.dex */
public abstract class SeekBarProgressChangeEvent extends SeekBarChangeEvent {
    public abstract boolean fromUser();

    public abstract int progress();

    public static SeekBarProgressChangeEvent create(SeekBar seekBar, int i, boolean z) {
        return new AutoValue_SeekBarProgressChangeEvent(seekBar, i, z);
    }

    SeekBarProgressChangeEvent() {
    }
}
