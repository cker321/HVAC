package org.greenrobot.greendao;

import android.util.Log;

/* loaded from: classes.dex */
public class DaoLog {
    public static final int ASSERT = 7;
    public static final int DEBUG = 3;
    public static final int ERROR = 6;
    public static final int INFO = 4;
    private static final String TAG = "greenDAO";
    public static final int VERBOSE = 2;
    public static final int WARN = 5;

    public static boolean isLoggable(int i) {
        return Log.isLoggable(TAG, i);
    }

    public static String getStackTraceString(Throwable th) {
        return Log.getStackTraceString(th);
    }

    public static int println(int i, String str) {
        return Log.println(i, TAG, str);
    }

    /* renamed from: v */
    public static int m58v(String str) {
        return Log.v(TAG, str);
    }

    /* renamed from: v */
    public static int m59v(String str, Throwable th) {
        return Log.v(TAG, str, th);
    }

    /* renamed from: d */
    public static int m52d(String str) {
        return Log.d(TAG, str);
    }

    /* renamed from: d */
    public static int m53d(String str, Throwable th) {
        return Log.d(TAG, str, th);
    }

    /* renamed from: i */
    public static int m56i(String str) {
        return Log.i(TAG, str);
    }

    /* renamed from: i */
    public static int m57i(String str, Throwable th) {
        return Log.i(TAG, str, th);
    }

    /* renamed from: w */
    public static int m60w(String str) {
        return Log.w(TAG, str);
    }

    /* renamed from: w */
    public static int m61w(String str, Throwable th) {
        return Log.w(TAG, str, th);
    }

    /* renamed from: w */
    public static int m62w(Throwable th) {
        return Log.w(TAG, th);
    }

    /* renamed from: e */
    public static int m54e(String str) {
        return Log.w(TAG, str);
    }

    /* renamed from: e */
    public static int m55e(String str, Throwable th) {
        return Log.e(TAG, str, th);
    }
}
