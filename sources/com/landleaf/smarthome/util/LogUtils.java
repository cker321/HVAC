package com.landleaf.smarthome.util;

import android.util.Log;

/* loaded from: classes.dex */
public class LogUtils {
    private static final String APP_TAG = "LogUtils";
    public static boolean isDebug = false;

    private static String getFunctionName() {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace == null) {
            return null;
        }
        for (StackTraceElement stackTraceElement : stackTrace) {
            if (!stackTraceElement.isNativeMethod() && !stackTraceElement.getClassName().equals(Thread.class.getName()) && !stackTraceElement.getClassName().equals(LogUtils.class.getName())) {
                return "[ Thread:" + Thread.currentThread().getName() + ",时间戳:" + System.currentTimeMillis() + ", at " + stackTraceElement.getClassName() + "." + stackTraceElement.getMethodName() + "(" + stackTraceElement.getFileName() + ":" + stackTraceElement.getLineNumber() + ") ]";
            }
        }
        return null;
    }

    /* renamed from: v */
    public static void m24v(String str) {
        if (isDebug) {
            Log.v(APP_TAG, getMsgFormat(str));
        }
    }

    /* renamed from: v */
    public static void m25v(String str, String str2) {
        if (isDebug) {
            Log.v(str, getMsgFormat(str2));
        }
    }

    /* renamed from: d */
    public static void m18d(String str) {
        if (isDebug) {
            Log.d(APP_TAG, getMsgFormat(str));
        }
    }

    /* renamed from: d */
    public static void m17d(Object obj) {
        if (isDebug) {
            Log.d(APP_TAG, getMsgFormat(obj.toString()));
        }
    }

    /* renamed from: d */
    public static void m19d(String str, String str2) {
        if (isDebug) {
            Log.d(str, getMsgFormat(str2));
        }
    }

    /* renamed from: i */
    public static void m22i(String str) {
        if (isDebug) {
            Log.i(APP_TAG, getMsgFormat(str));
        }
    }

    /* renamed from: i */
    public static void m23i(String str, String str2) {
        if (isDebug) {
            Log.i(str, getMsgFormat(str2));
        }
    }

    /* renamed from: w */
    public static void m26w(String str) {
        if (isDebug) {
            Log.w(APP_TAG, getMsgFormat(str));
        }
    }

    /* renamed from: w */
    public static void m27w(String str, String str2) {
        if (isDebug) {
            Log.w(str, getMsgFormat(str2));
        }
    }

    /* renamed from: e */
    public static void m20e(String str) {
        if (isDebug) {
            Log.e(APP_TAG, getMsgFormat(str));
        }
    }

    /* renamed from: e */
    public static void m21e(String str, String str2) {
        if (isDebug) {
            Log.e(str, getMsgFormat(str2));
        }
    }

    private static String getMsgFormat(String str) {
        return str + " ;" + getFunctionName();
    }
}
