package com.yanzhenjie.andserver.framework.view;

/* loaded from: classes.dex */
public class ObjectView implements View {
    private final boolean isRest;
    private final Object output;

    public ObjectView(boolean z, Object obj) {
        this.isRest = z;
        this.output = obj;
    }

    @Override // com.yanzhenjie.andserver.framework.view.View
    public boolean rest() {
        return this.isRest;
    }

    @Override // com.yanzhenjie.andserver.framework.view.View
    public Object output() {
        return this.output;
    }
}
