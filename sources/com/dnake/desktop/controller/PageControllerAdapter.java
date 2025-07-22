package com.dnake.desktop.controller;

import com.yanzhenjie.andserver.framework.handler.MappingAdapter;
import com.yanzhenjie.andserver.framework.handler.RequestHandler;
import com.yanzhenjie.andserver.framework.mapping.Addition;
import com.yanzhenjie.andserver.framework.mapping.Mapping;
import com.yanzhenjie.andserver.framework.mapping.Method;
import com.yanzhenjie.andserver.framework.mapping.Path;
import java.util.LinkedHashMap;
import java.util.Map;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public final class PageControllerAdapter extends MappingAdapter {
    private PageController mHost = new PageController();
    private Map<Mapping, RequestHandler> mMappingMap = new LinkedHashMap();

    public PageControllerAdapter() {
        Mapping mapping = new Mapping();
        Path path = new Path();
        path.addRule(MqttTopic.TOPIC_LEVEL_SEPARATOR);
        mapping.setPath(path);
        Method method = new Method();
        method.addRule("GET");
        mapping.setMethod(method);
        this.mMappingMap.put(mapping, new PageControllerIndexHandler(this.mHost, mapping, new Addition(), null));
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MappingAdapter
    protected Map<Mapping, RequestHandler> getMappingMap() {
        return this.mMappingMap;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.yanzhenjie.andserver.framework.handler.MappingAdapter
    public PageController getHost() {
        return this.mHost;
    }
}
