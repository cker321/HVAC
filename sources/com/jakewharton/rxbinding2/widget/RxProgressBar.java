package com.jakewharton.rxbinding2.widget;

import android.widget.ProgressBar;
import com.jakewharton.rxbinding2.internal.Preconditions;
import io.reactivex.functions.Consumer;

/* loaded from: classes.dex */
public final class RxProgressBar {
    public static Consumer<? super Integer> incrementProgressBy(final ProgressBar progressBar) {
        Preconditions.checkNotNull(progressBar, "view == null");
        return new Consumer<Integer>() { // from class: com.jakewharton.rxbinding2.widget.RxProgressBar.1
            @Override // io.reactivex.functions.Consumer
            public void accept(Integer num) {
                progressBar.incrementProgressBy(num.intValue());
            }
        };
    }

    public static Consumer<? super Integer> incrementSecondaryProgressBy(final ProgressBar progressBar) {
        Preconditions.checkNotNull(progressBar, "view == null");
        return new Consumer<Integer>() { // from class: com.jakewharton.rxbinding2.widget.RxProgressBar.2
            @Override // io.reactivex.functions.Consumer
            public void accept(Integer num) {
                progressBar.incrementSecondaryProgressBy(num.intValue());
            }
        };
    }

    public static Consumer<? super Boolean> indeterminate(final ProgressBar progressBar) {
        Preconditions.checkNotNull(progressBar, "view == null");
        return new Consumer<Boolean>() { // from class: com.jakewharton.rxbinding2.widget.RxProgressBar.3
            @Override // io.reactivex.functions.Consumer
            public void accept(Boolean bool) {
                progressBar.setIndeterminate(bool.booleanValue());
            }
        };
    }

    public static Consumer<? super Integer> max(final ProgressBar progressBar) {
        Preconditions.checkNotNull(progressBar, "view == null");
        return new Consumer<Integer>() { // from class: com.jakewharton.rxbinding2.widget.RxProgressBar.4
            @Override // io.reactivex.functions.Consumer
            public void accept(Integer num) {
                progressBar.setMax(num.intValue());
            }
        };
    }

    public static Consumer<? super Integer> progress(final ProgressBar progressBar) {
        Preconditions.checkNotNull(progressBar, "view == null");
        return new Consumer<Integer>() { // from class: com.jakewharton.rxbinding2.widget.RxProgressBar.5
            @Override // io.reactivex.functions.Consumer
            public void accept(Integer num) {
                progressBar.setProgress(num.intValue());
            }
        };
    }

    public static Consumer<? super Integer> secondaryProgress(final ProgressBar progressBar) {
        Preconditions.checkNotNull(progressBar, "view == null");
        return new Consumer<Integer>() { // from class: com.jakewharton.rxbinding2.widget.RxProgressBar.6
            @Override // io.reactivex.functions.Consumer
            public void accept(Integer num) {
                progressBar.setSecondaryProgress(num.intValue());
            }
        };
    }

    private RxProgressBar() {
        throw new AssertionError("No instances.");
    }
}
