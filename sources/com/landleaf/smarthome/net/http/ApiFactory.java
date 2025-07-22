package com.landleaf.smarthome.net.http;

import android.app.Application;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.landleaf.smarthome.util.DeviceInfoUtil;
import java.io.File;
import java.util.concurrent.TimeUnit;
import okhttp3.Cache;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

/* loaded from: classes.dex */
public class ApiFactory {
    private static final String RETROFIT_CACHE_FILE_NAME = "retrofit";
    public static Application applicationInstance;
    private static volatile OkHttpClient client;
    public static String deviceMac;
    public static Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
    private static volatile NetApi testApi;

    private static OkHttpClient getClient() {
        if (client == null) {
            synchronized (ApiFactory.class) {
                if (client == null) {
                    NetInterceptor netInterceptor = new NetInterceptor();
                    netInterceptor.setScreenMac(DeviceInfoUtil.getDeviceId(applicationInstance));
                    client = new OkHttpClient.Builder().cache(new Cache(new File(applicationInstance.getCacheDir(), RETROFIT_CACHE_FILE_NAME), 10485760L)).connectTimeout(30L, TimeUnit.SECONDS).readTimeout(30L, TimeUnit.SECONDS).addInterceptor(netInterceptor).retryOnConnectionFailure(true).build();
                }
            }
        }
        return client;
    }

    public static NetApi getNetApi() {
        if (testApi == null) {
            synchronized (ApiFactory.class) {
                if (testApi == null) {
                    testApi = (NetApi) getRetrofitBuilder().baseUrl(UrlConsts.BASE_URL).build().create(NetApi.class);
                }
            }
        }
        return testApi;
    }

    private static Retrofit.Builder getRetrofitBuilder() {
        return new Retrofit.Builder().client(getClient()).addConverterFactory(GsonConverterFactory.create(gson)).addCallAdapterFactory(RxJava2CallAdapterFactory.create());
    }

    private ApiFactory() {
    }
}
