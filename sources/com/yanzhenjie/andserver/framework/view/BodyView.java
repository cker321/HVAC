package com.yanzhenjie.andserver.framework.view;

import com.yanzhenjie.andserver.http.ResponseBody;

/* loaded from: classes.dex */
public class BodyView implements View {
    private ResponseBody mBody;

    @Override // com.yanzhenjie.andserver.framework.view.View
    public boolean rest() {
        return true;
    }

    public BodyView(ResponseBody responseBody) {
        this.mBody = responseBody;
    }

    @Override // com.yanzhenjie.andserver.framework.view.View
    public Object output() {
        return this.mBody;
    }
}
