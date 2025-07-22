package com.landleaf.smarthome.util;

import android.content.SharedPreferences;

/* loaded from: classes.dex */
public class SpUtils {
    private static SharedPreferences sharedPreferences;

    public static void setSharedPreferences(SharedPreferences sharedPreferences2) {
        sharedPreferences = sharedPreferences2;
    }

    public static void save(String str, Object obj) {
        if (obj instanceof Integer) {
            sharedPreferences.edit().putInt(str, ((Integer) obj).intValue()).commit();
            return;
        }
        if (obj instanceof Float) {
            sharedPreferences.edit().putFloat(str, ((Float) obj).floatValue()).commit();
            return;
        }
        if (obj instanceof Boolean) {
            sharedPreferences.edit().putBoolean(str, ((Boolean) obj).booleanValue()).commit();
        } else if (obj instanceof Long) {
            sharedPreferences.edit().putLong(str, ((Long) obj).longValue()).commit();
        } else if (obj instanceof String) {
            sharedPreferences.edit().putString(str, (String) obj).commit();
        }
    }

    public static void remove(String str) {
        sharedPreferences.edit().remove(str).commit();
    }

    public static void clear() {
        sharedPreferences.edit().clear().commit();
    }

    public static String read(String str, String str2) {
        return sharedPreferences.getString(str, str2);
    }

    public static int readInt(String str, int i) {
        return sharedPreferences.getInt(str, i);
    }

    public static float readFloat(String str, float f) {
        return sharedPreferences.getFloat(str, f);
    }

    public static long readLong(String str, long j) {
        return sharedPreferences.getLong(str, j);
    }

    public static boolean readBoolean(String str, boolean z) {
        return sharedPreferences.getBoolean(str, z);
    }
}
