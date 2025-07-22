package com.dnake.desktop.component;

import android.content.Context;
import com.yanzhenjie.andserver.framework.config.Multipart;
import com.yanzhenjie.andserver.framework.config.WebConfig;
import com.yanzhenjie.andserver.framework.website.AssetsWebsite;
import java.io.File;

/* loaded from: classes.dex */
public class AppConfig implements WebConfig {
    @Override // com.yanzhenjie.andserver.framework.config.WebConfig
    public void onConfig(Context context, WebConfig.Delegate delegate) {
        delegate.addWebsite(new AssetsWebsite(context, "/web"));
        delegate.setMultipart(Multipart.newBuilder().allFileMaxSize(20971520L).fileMaxSize(5242880L).maxInMemorySize(10240).uploadTempDir(new File(context.getCacheDir(), "_server_upload_cache_")).build());
    }
}
