.class public Lcom/landleaf/smarthome/net/http/ApiFactory;
.super Ljava/lang/Object;
.source "ApiFactory.java"


# static fields
.field private static final RETROFIT_CACHE_FILE_NAME:Ljava/lang/String; = "retrofit"

.field public static applicationInstance:Landroid/app/Application;

.field private static volatile client:Lokhttp3/OkHttpClient;

.field public static deviceMac:Ljava/lang/String;

.field public static gson:Lcom/google/gson/Gson;

.field private static volatile testApi:Lcom/landleaf/smarthome/net/http/NetApi;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 78
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-virtual {v0, v1}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    sput-object v0, Lcom/landleaf/smarthome/net/http/ApiFactory;->gson:Lcom/google/gson/Gson;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getClient()Lokhttp3/OkHttpClient;
    .locals 7

    .line 37
    sget-object v0, Lcom/landleaf/smarthome/net/http/ApiFactory;->client:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_1

    .line 38
    const-class v0, Lcom/landleaf/smarthome/net/http/ApiFactory;

    monitor-enter v0

    .line 39
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/net/http/ApiFactory;->client:Lokhttp3/OkHttpClient;

    if-nez v1, :cond_0

    .line 40
    new-instance v1, Lcom/landleaf/smarthome/net/http/NetInterceptor;

    invoke-direct {v1}, Lcom/landleaf/smarthome/net/http/NetInterceptor;-><init>()V

    .line 41
    sget-object v2, Lcom/landleaf/smarthome/net/http/ApiFactory;->applicationInstance:Landroid/app/Application;

    invoke-static {v2}, Lcom/landleaf/smarthome/util/DeviceInfoUtil;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/net/http/NetInterceptor;->setScreenMac(Ljava/lang/String;)V

    .line 42
    new-instance v2, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v2}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    new-instance v3, Lokhttp3/Cache;

    new-instance v4, Ljava/io/File;

    sget-object v5, Lcom/landleaf/smarthome/net/http/ApiFactory;->applicationInstance:Landroid/app/Application;

    .line 43
    invoke-virtual {v5}, Landroid/app/Application;->getCacheDir()Ljava/io/File;

    move-result-object v5

    const-string v6, "retrofit"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/32 v5, 0xa00000

    invoke-direct {v3, v4, v5, v6}, Lokhttp3/Cache;-><init>(Ljava/io/File;J)V

    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient$Builder;->cache(Lokhttp3/Cache;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x1e

    .line 44
    invoke-virtual {v2, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 45
    invoke-virtual {v2, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    .line 46
    invoke-virtual {v2, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 47
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 60
    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    sput-object v1, Lcom/landleaf/smarthome/net/http/ApiFactory;->client:Lokhttp3/OkHttpClient;

    .line 62
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 64
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/net/http/ApiFactory;->client:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method public static getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;
    .locals 3

    .line 67
    sget-object v0, Lcom/landleaf/smarthome/net/http/ApiFactory;->testApi:Lcom/landleaf/smarthome/net/http/NetApi;

    if-nez v0, :cond_1

    .line 68
    const-class v0, Lcom/landleaf/smarthome/net/http/ApiFactory;

    monitor-enter v0

    .line 69
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/net/http/ApiFactory;->testApi:Lcom/landleaf/smarthome/net/http/NetApi;

    if-nez v1, :cond_0

    .line 70
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getRetrofitBuilder()Lretrofit2/Retrofit$Builder;

    move-result-object v1

    const-string v2, "https://gateway.landleaf-tech.com/homeauto-contact-screen/contact-screen/screen/"

    .line 71
    invoke-virtual {v1, v2}, Lretrofit2/Retrofit$Builder;->baseUrl(Ljava/lang/String;)Lretrofit2/Retrofit$Builder;

    move-result-object v1

    .line 72
    invoke-virtual {v1}, Lretrofit2/Retrofit$Builder;->build()Lretrofit2/Retrofit;

    move-result-object v1

    const-class v2, Lcom/landleaf/smarthome/net/http/NetApi;

    invoke-virtual {v1, v2}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/landleaf/smarthome/net/http/NetApi;

    sput-object v1, Lcom/landleaf/smarthome/net/http/ApiFactory;->testApi:Lcom/landleaf/smarthome/net/http/NetApi;

    .line 74
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 76
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/net/http/ApiFactory;->testApi:Lcom/landleaf/smarthome/net/http/NetApi;

    return-object v0
.end method

.method private static getRetrofitBuilder()Lretrofit2/Retrofit$Builder;
    .locals 2

    .line 80
    new-instance v0, Lretrofit2/Retrofit$Builder;

    invoke-direct {v0}, Lretrofit2/Retrofit$Builder;-><init>()V

    .line 81
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getClient()Lokhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit$Builder;->client(Lokhttp3/OkHttpClient;)Lretrofit2/Retrofit$Builder;

    move-result-object v0

    sget-object v1, Lcom/landleaf/smarthome/net/http/ApiFactory;->gson:Lcom/google/gson/Gson;

    .line 82
    invoke-static {v1}, Lretrofit2/converter/gson/GsonConverterFactory;->create(Lcom/google/gson/Gson;)Lretrofit2/converter/gson/GsonConverterFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit$Builder;->addConverterFactory(Lretrofit2/Converter$Factory;)Lretrofit2/Retrofit$Builder;

    move-result-object v0

    .line 83
    invoke-static {}, Lretrofit2/adapter/rxjava2/RxJava2CallAdapterFactory;->create()Lretrofit2/adapter/rxjava2/RxJava2CallAdapterFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit2/Retrofit$Builder;->addCallAdapterFactory(Lretrofit2/CallAdapter$Factory;)Lretrofit2/Retrofit$Builder;

    move-result-object v0

    return-object v0
.end method
