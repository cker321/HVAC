package com.dnake.desktop.andserver.processor.generator;

import android.content.Context;
import com.dnake.desktop.component.AppMessageConverter;
import com.yanzhenjie.andserver.framework.MessageConverter;
import com.yanzhenjie.andserver.register.OnRegister;
import com.yanzhenjie.andserver.register.Register;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class ConverterRegister implements OnRegister {
    private Map<String, MessageConverter> mMap;

    public ConverterRegister() {
        HashMap map = new HashMap();
        this.mMap = map;
        map.put("default", new AppMessageConverter());
    }

    @Override // com.yanzhenjie.andserver.register.OnRegister
    public void onRegister(Context context, String str, Register register) {
        MessageConverter messageConverter = this.mMap.get(str);
        if (messageConverter != null) {
            register.setConverter(messageConverter);
        }
    }
}
