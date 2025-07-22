package com.yanzhenjie.andserver;

import android.content.Context;
import com.yanzhenjie.andserver.register.OnRegister;
import com.yanzhenjie.andserver.register.Register;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public class ComponentRegister {
    private static final String ANDSERVER_SUFFIX = ".generator.andserver";
    private static final String PROCESSOR_PACKAGE = ".andserver.processor.generator.";
    private static final List<String> REGISTER_LIST;
    private Context mContext;

    static {
        ArrayList arrayList = new ArrayList();
        REGISTER_LIST = arrayList;
        arrayList.add("AdapterRegister");
        REGISTER_LIST.add("ConfigRegister");
        REGISTER_LIST.add("ConverterRegister");
        REGISTER_LIST.add("InterceptorRegister");
        REGISTER_LIST.add("ResolverRegister");
    }

    public ComponentRegister(Context context) {
        this.mContext = context;
    }

    public void register(Register register, String str) throws IOException, ClassNotFoundException {
        String[] list;
        try {
            list = this.mContext.getAssets().list("");
        } catch (IOException e) {
            e.printStackTrace();
            list = null;
        }
        if (list == null || list.length == 0) {
            return;
        }
        for (String str2 : list) {
            if (str2.endsWith(ANDSERVER_SUFFIX)) {
                String strSubstring = str2.substring(0, str2.indexOf(ANDSERVER_SUFFIX));
                Iterator<String> it = REGISTER_LIST.iterator();
                while (it.hasNext()) {
                    registerClass(register, str, String.format("%s%s%s", strSubstring, PROCESSOR_PACKAGE, it.next()));
                }
            }
        }
    }

    private void registerClass(Register register, String str, String str2) throws ClassNotFoundException {
        try {
            Class<?> cls = Class.forName(str2);
            if (OnRegister.class.isAssignableFrom(cls)) {
                ((OnRegister) cls.newInstance()).onRegister(this.mContext, str, register);
            }
        } catch (ClassNotFoundException unused) {
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e2) {
            e2.printStackTrace();
        }
    }
}
