package com.landleaf.smarthome.util;

import android.content.Context;
import android.provider.Settings;
import android.util.Log;

/* loaded from: classes.dex */
public class DeviceInfoUtil {
    private static final String DEFAULT_DEV_ID = "default";
    private static final String TAG = DeviceInfoUtil.class.getSimpleName();

    private DeviceInfoUtil() {
    }

    public static String getDeviceId(Context context) {
        String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
        if (string == null) {
            string = DEFAULT_DEV_ID;
        }
        Log.d(TAG, "The Device Id is:" + string);
        return string;
    }
}
