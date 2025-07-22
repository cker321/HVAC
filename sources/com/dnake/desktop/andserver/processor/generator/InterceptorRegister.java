package com.dnake.desktop.andserver.processor.generator;

import android.content.Context;
import com.dnake.desktop.component.LoggerInterceptor;
import com.yanzhenjie.andserver.framework.HandlerInterceptor;
import com.yanzhenjie.andserver.register.OnRegister;
import com.yanzhenjie.andserver.register.Register;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class InterceptorRegister implements OnRegister {
    private Map<String, List<HandlerInterceptor>> mMap = new HashMap();

    public InterceptorRegister() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new LoggerInterceptor());
        this.mMap.put("default", arrayList);
    }

    @Override // com.yanzhenjie.andserver.register.OnRegister
    public void onRegister(Context context, String str, Register register) {
        List<HandlerInterceptor> list = this.mMap.get(str);
        if (list == null || list.isEmpty()) {
            return;
        }
        Iterator<HandlerInterceptor> it = list.iterator();
        while (it.hasNext()) {
            register.addInterceptor(it.next());
        }
    }
}
