package com.dnake.desktop.andserver.processor.generator;

import android.content.Context;
import com.dnake.desktop.component.AppConfig;
import com.yanzhenjie.andserver.framework.config.Delegate;
import com.yanzhenjie.andserver.framework.config.WebConfig;
import com.yanzhenjie.andserver.framework.website.Website;
import com.yanzhenjie.andserver.register.OnRegister;
import com.yanzhenjie.andserver.register.Register;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class ConfigRegister implements OnRegister {
    private Map<String, WebConfig> mMap;

    public ConfigRegister() {
        HashMap map = new HashMap();
        this.mMap = map;
        map.put("default", new AppConfig());
    }

    @Override // com.yanzhenjie.andserver.register.OnRegister
    public void onRegister(Context context, String str, Register register) {
        WebConfig webConfig = this.mMap.get(str);
        if (webConfig != null) {
            Delegate delegateNewInstance = Delegate.newInstance();
            webConfig.onConfig(context, delegateNewInstance);
            List<Website> websites = delegateNewInstance.getWebsites();
            if (websites != null && !websites.isEmpty()) {
                Iterator<Website> it = websites.iterator();
                while (it.hasNext()) {
                    register.addAdapter(it.next());
                }
            }
            register.setMultipart(delegateNewInstance.getMultipart());
        }
    }
}
