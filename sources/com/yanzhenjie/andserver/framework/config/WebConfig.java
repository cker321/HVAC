package com.yanzhenjie.andserver.framework.config;

import android.content.Context;
import com.yanzhenjie.andserver.framework.website.Website;

/* loaded from: classes.dex */
public interface WebConfig {

    public interface Delegate {
        void addWebsite(Website website);

        void setMultipart(Multipart multipart);
    }

    void onConfig(Context context, Delegate delegate);
}
