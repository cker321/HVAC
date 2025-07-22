package com.dnake.desktop.utils;

import android.content.Context;
import android.content.SharedPreferences;

/* loaded from: classes.dex */
public class PreferencesUtils {
    private static final boolean DEFAULT_BOOLEAN_VALUE = false;
    private static final double DEFAULT_DOUBLE_VALUE = -1.0d;
    private static final float DEFAULT_FLOAT_VALUE = -1.0f;
    private static final int DEFAULT_INT_VALUE = -1;
    private static final long DEFAULT_LONG_VALUE = -1;
    public static final String DEFAULT_STRING_VALUE = "";
    private static String FILE_NAME = "sp_config";
    private static SharedPreferences sharedPreferences;

    public static PreferencesUtils getInstance(Context context) {
        if (sharedPreferences == null) {
            sharedPreferences = context.getApplicationContext().getSharedPreferences(FILE_NAME, 0);
        }
        return ViewHolder.instance;
    }

    static class ViewHolder {
        private static PreferencesUtils instance = new PreferencesUtils();

        ViewHolder() {
        }
    }

    public String read(String str) {
        return sharedPreferences.getString(str, "");
    }

    public String read(String str, String str2) {
        return sharedPreferences.getString(str, str2);
    }

    public void write(String str, String str2) {
        sharedPreferences.edit().putString(str, str2).apply();
    }

    public int readInt(String str) {
        return sharedPreferences.getInt(str, -1);
    }

    public int readInt(String str, int i) {
        return sharedPreferences.getInt(str, i);
    }

    public void writeInt(String str, int i) {
        sharedPreferences.edit().putInt(str, i).apply();
    }

    public float readFloat(String str) {
        return sharedPreferences.getFloat(str, DEFAULT_FLOAT_VALUE);
    }

    public float readFloat(String str, float f) {
        return sharedPreferences.getFloat(str, f);
    }

    public void writeFloat(String str, float f) {
        sharedPreferences.edit().putFloat(str, f).apply();
    }

    public boolean readBoolean(String str) {
        return sharedPreferences.getBoolean(str, false);
    }

    public boolean readBoolean(String str, boolean z) {
        return sharedPreferences.getBoolean(str, z);
    }

    public void writeBoolean(String str, boolean z) {
        sharedPreferences.edit().putBoolean(str, z).apply();
    }

    public void removeByKey(String str) {
        sharedPreferences.edit().remove(str).apply();
    }

    public void clear() {
        sharedPreferences.edit().clear().apply();
    }
}
