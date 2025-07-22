package io.reactivex.android.schedulers;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import io.reactivex.Scheduler;
import io.reactivex.android.plugins.RxAndroidPlugins;
import java.util.concurrent.Callable;

/* loaded from: classes.dex */
public final class AndroidSchedulers {
    private static final Scheduler MAIN_THREAD = RxAndroidPlugins.initMainThreadScheduler(new Callable<Scheduler>() { // from class: io.reactivex.android.schedulers.AndroidSchedulers.1
        CallableC07521() {
        }

        @Override // java.util.concurrent.Callable
        public Scheduler call() throws Exception {
            return MainHolder.DEFAULT;
        }
    });

    private static final class MainHolder {
        static final Scheduler DEFAULT = new HandlerScheduler(new Handler(Looper.getMainLooper()), false);

        private MainHolder() {
        }
    }

    /* renamed from: io.reactivex.android.schedulers.AndroidSchedulers$1 */
    static class CallableC07521 implements Callable<Scheduler> {
        CallableC07521() {
        }

        @Override // java.util.concurrent.Callable
        public Scheduler call() throws Exception {
            return MainHolder.DEFAULT;
        }
    }

    public static Scheduler mainThread() {
        return RxAndroidPlugins.onMainThreadScheduler(MAIN_THREAD);
    }

    public static Scheduler from(Looper looper) {
        return from(looper, false);
    }

    public static Scheduler from(Looper looper, boolean z) {
        if (looper == null) {
            throw new NullPointerException("looper == null");
        }
        if (Build.VERSION.SDK_INT < 16) {
            z = false;
        } else if (z && Build.VERSION.SDK_INT < 22) {
            Message messageObtain = Message.obtain();
            try {
                messageObtain.setAsynchronous(true);
            } catch (NoSuchMethodError unused) {
                z = false;
            }
            messageObtain.recycle();
        }
        return new HandlerScheduler(new Handler(looper), z);
    }

    private AndroidSchedulers() {
        throw new AssertionError("No instances.");
    }
}
