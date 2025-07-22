package com.landleaf.smarthome.net.http;

import okhttp3.Interceptor;
import okhttp3.Response;
import okhttp3.ResponseBody;

/* loaded from: classes.dex */
public class NetInterceptor implements Interceptor {
    private String screenMac = "88888888";

    public void setScreenMac(String str) {
        this.screenMac = str;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) {
        try {
            Response responseProceed = chain.proceed(chain.request().newBuilder().addHeader("screenMac", this.screenMac).build());
            ResponseBody responseBodyBody = responseProceed.body();
            String strString = responseBodyBody.string();
            responseProceed.code();
            return responseProceed.newBuilder().body(ResponseBody.create(responseBodyBody.contentType(), strString)).build();
        } catch (Exception unused) {
            return null;
        }
    }
}
