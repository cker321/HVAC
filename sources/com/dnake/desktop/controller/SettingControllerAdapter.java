package com.dnake.desktop.controller;

import com.yanzhenjie.andserver.framework.handler.MappingAdapter;
import com.yanzhenjie.andserver.framework.handler.RequestHandler;
import com.yanzhenjie.andserver.framework.mapping.Addition;
import com.yanzhenjie.andserver.framework.mapping.Mapping;
import com.yanzhenjie.andserver.framework.mapping.Method;
import com.yanzhenjie.andserver.framework.mapping.Path;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class SettingControllerAdapter extends MappingAdapter {
    private SettingController mHost = new SettingController();
    private Map<Mapping, RequestHandler> mMappingMap = new LinkedHashMap();

    public SettingControllerAdapter() {
        Mapping mapping = new Mapping();
        Path path = new Path();
        path.addRule("/user/register/info");
        mapping.setPath(path);
        Method method = new Method();
        method.addRule("GET");
        mapping.setMethod(method);
        this.mMappingMap.put(mapping, new SettingControllerInfoUpdateHandler(this.mHost, mapping, new Addition(), null));
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MappingAdapter
    protected Map<Mapping, RequestHandler> getMappingMap() {
        return this.mMappingMap;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.yanzhenjie.andserver.framework.handler.MappingAdapter
    public SettingController getHost() {
        return this.mHost;
    }
}
