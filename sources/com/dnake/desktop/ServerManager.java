package com.dnake.desktop;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

/* loaded from: classes.dex */
public class ServerManager extends BroadcastReceiver {
    private static final String ACTION = "com.yanzhenjie.andserver.receiver";
    private static final String CMD_KEY = "CMD_KEY";
    private static final int CMD_VALUE_ERROR = 2;
    private static final int CMD_VALUE_START = 1;
    private static final int CMD_VALUE_STOP = 4;
    private static final String MESSAGE_KEY = "MESSAGE_KEY";
    private MainActivity mActivity;
    private Intent mService;

    public static void onServerStart(Context context, String str) {
        sendBroadcast(context, 1, str);
    }

    public static void onServerError(Context context, String str) {
        sendBroadcast(context, 2, str);
    }

    public static void onServerStop(Context context) {
        sendBroadcast(context, 4);
    }

    private static void sendBroadcast(Context context, int i) {
        sendBroadcast(context, i, null);
    }

    private static void sendBroadcast(Context context, int i, String str) {
        Intent intent = new Intent(ACTION);
        intent.putExtra(CMD_KEY, i);
        intent.putExtra(MESSAGE_KEY, str);
        context.sendBroadcast(intent);
    }

    public ServerManager(MainActivity mainActivity) {
        this.mActivity = mainActivity;
        this.mService = new Intent(mainActivity, (Class<?>) CoreService.class);
    }

    public void register() {
        this.mActivity.registerReceiver(this, new IntentFilter(ACTION));
    }

    public void unRegister() {
        this.mActivity.unregisterReceiver(this);
    }

    public void startServer() {
        this.mActivity.startService(this.mService);
    }

    public void stopServer() {
        this.mActivity.stopService(this.mService);
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (ACTION.equals(intent.getAction())) {
            int intExtra = intent.getIntExtra(CMD_KEY, 0);
            if (intExtra == 1) {
                this.mActivity.onServerStart(intent.getStringExtra(MESSAGE_KEY));
            } else if (intExtra == 2) {
                this.mActivity.onServerError(intent.getStringExtra(MESSAGE_KEY));
            } else {
                if (intExtra != 4) {
                    return;
                }
                this.mActivity.onServerStop();
            }
        }
    }
}
