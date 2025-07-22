package com.dnake.desktop.andserver.processor.generator;

import android.content.Context;
import com.dnake.desktop.component.AppExceptionResolver;
import com.yanzhenjie.andserver.framework.ExceptionResolver;
import com.yanzhenjie.andserver.register.OnRegister;
import com.yanzhenjie.andserver.register.Register;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class ResolverRegister implements OnRegister {
    private Map<String, ExceptionResolver> mMap;

    public ResolverRegister() {
        HashMap map = new HashMap();
        this.mMap = map;
        map.put("default", new AppExceptionResolver());
    }

    @Override // com.yanzhenjie.andserver.register.OnRegister
    public void onRegister(Context context, String str, Register register) {
        ExceptionResolver exceptionResolver = this.mMap.get(str);
        if (exceptionResolver != null) {
            register.setResolver(exceptionResolver);
        }
    }
}
