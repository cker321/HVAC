package com.dnake.desktop;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.utils.PreferencesUtils;

/* loaded from: classes.dex */
public class BootBroadcastReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BOOT_COMPLETED".equals(intent.getAction())) {
            Log.d("BootBroadcastReceiver", context.getPackageName());
            PreferencesUtils.getInstance(context).write(Constant.SENSOR_HISTORY, "");
            Intent intent2 = new Intent("android.intent.action.MAIN");
            intent2.setPackage(context.getPackageName());
            intent2.addFlags(268435456);
            context.startActivity(intent2);
        }
    }
}
