package com.dnake.desktop;

import android.app.Application;
import android.preference.PreferenceManager;
import com.dnake.desktop.costant.VariableConstant;
import com.dnake.desktop.dnake.Rs485Executor;
import com.landleaf.smarthome.net.http.ApiFactory;
import com.landleaf.smarthome.util.DeviceInfoUtil;
import com.landleaf.smarthome.util.SpUtils;

/* loaded from: classes.dex */
public class App extends Application {
    public static String deviceId;
    public static App instance;

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        instance = this;
        ApiFactory.applicationInstance = this;
        SpUtils.setSharedPreferences(PreferenceManager.getDefaultSharedPreferences(instance));
        String deviceId2 = DeviceInfoUtil.getDeviceId(this);
        deviceId = deviceId2;
        VariableConstant.DEVICE_ID = deviceId2;
        Rs485Executor.getInstance().setup();
    }
}
