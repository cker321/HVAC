package com.landleaf.smarthome.util.rxutils;

import android.view.View;
import com.jakewharton.rxbinding2.view.RxView;
import io.reactivex.Observable;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public class RxBindUtils {
    public static Observable rxClick(View view) {
        return RxView.clicks(view).throttleFirst(200L, TimeUnit.MILLISECONDS);
    }

    public static Observable rxClick(View view, long j) {
        return RxView.clicks(view).throttleFirst(j, TimeUnit.MILLISECONDS);
    }
}
