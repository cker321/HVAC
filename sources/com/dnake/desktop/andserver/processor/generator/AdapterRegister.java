package com.dnake.desktop.andserver.processor.generator;

import android.content.Context;
import com.dnake.desktop.controller.PageControllerAdapter;
import com.dnake.desktop.controller.SettingControllerAdapter;
import com.yanzhenjie.andserver.framework.handler.HandlerAdapter;
import com.yanzhenjie.andserver.register.OnRegister;
import com.yanzhenjie.andserver.register.Register;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class AdapterRegister implements OnRegister {
    private Map<String, List<HandlerAdapter>> mMap = new HashMap();

    public AdapterRegister() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new PageControllerAdapter());
        arrayList.add(new SettingControllerAdapter());
        this.mMap.put("default", arrayList);
    }

    @Override // com.yanzhenjie.andserver.register.OnRegister
    public void onRegister(Context context, String str, Register register) {
        List<HandlerAdapter> list = this.mMap.get(str);
        if (list == null || list.isEmpty()) {
            return;
        }
        Iterator<HandlerAdapter> it = list.iterator();
        while (it.hasNext()) {
            register.addAdapter(it.next());
        }
    }
}
