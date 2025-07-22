.class public Lcom/dnake/desktop/MainActivity;
.super Lcom/dnake/desktop/base/BaseActivity;
.source "MainActivity.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field clickedColor:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f05002a
    .end annotation
.end field

.field colorUnClick:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f050030
    .end annotation
.end field

.field protected mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

.field private mServerManager:Lcom/dnake/desktop/ServerManager;

.field mView:Ljava/util/List;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f0800fe,
            0x7f0800fd,
            0x7f080104
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/RelativeLayout;",
            ">;"
        }
    .end annotation
.end field

.field timeView:Lcom/dnake/desktop/widget/TimeView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080153
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    invoke-direct {p0}, Lcom/dnake/desktop/base/BaseActivity;-><init>()V

    const-string v0, "MainActivity"

    .line 60
    iput-object v0, p0, Lcom/dnake/desktop/MainActivity;->TAG:Ljava/lang/String;

    const/4 v0, 0x4

    new-array v0, v0, [Lme/yokeyword/fragmentation/SupportFragment;

    .line 62
    iput-object v0, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    return-void
.end method

.method static synthetic access$000(Lcom/dnake/desktop/MainActivity;)V
    .locals 0

    .line 58
    invoke-virtual {p0}, Lcom/dnake/desktop/MainActivity;->hideNavigation()V

    return-void
.end method

.method static synthetic access$100(Lcom/dnake/desktop/MainActivity;)V
    .locals 0

    .line 58
    invoke-direct {p0}, Lcom/dnake/desktop/MainActivity;->initWeather()V

    return-void
.end method

.method static synthetic access$200(Lcom/dnake/desktop/MainActivity;)Ljava/lang/String;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/dnake/desktop/MainActivity;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method private clearSelectedColor()V
    .locals 3

    const/4 v0, 0x0

    .line 102
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/MainActivity;->mView:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/dnake/desktop/MainActivity;->mView:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iget v2, p0, Lcom/dnake/desktop/MainActivity;->colorUnClick:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private initInfo()V
    .locals 10

    .line 182
    invoke-static {}, Lcom/dnake/desktop/utils/ThreadPoolManager;->getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/dnake/desktop/MainActivity$2;-><init>(Lcom/dnake/desktop/MainActivity;)V

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v2, 0xa

    const-string v3, "init_info"

    const-wide/16 v4, 0x5

    const-wide/16 v6, 0xb4

    const/4 v9, 0x0

    invoke-virtual/range {v0 .. v9}, Lcom/dnake/desktop/utils/ThreadPoolManager;->submitScheduleJob(Ljava/lang/Runnable;ILjava/lang/String;JJLjava/util/concurrent/TimeUnit;Ljava/lang/String;)Ljava/util/concurrent/Future;

    return-void
.end method

.method private initSceneInfo()V
    .locals 3

    .line 211
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/landleaf/smarthome/net/http/NetApi;->getSceneList()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/MainActivity$5;

    invoke-direct {v1, p0}, Lcom/dnake/desktop/MainActivity$5;-><init>(Lcom/dnake/desktop/MainActivity;)V

    new-instance v2, Lcom/dnake/desktop/MainActivity$6;

    invoke-direct {v2, p0}, Lcom/dnake/desktop/MainActivity$6;-><init>(Lcom/dnake/desktop/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private initWeather()V
    .locals 3

    .line 192
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/landleaf/smarthome/net/http/NetApi;->getWeather()Lio/reactivex/Observable;

    move-result-object v0

    .line 193
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/MainActivity$3;

    invoke-direct {v1, p0}, Lcom/dnake/desktop/MainActivity$3;-><init>(Lcom/dnake/desktop/MainActivity;)V

    new-instance v2, Lcom/dnake/desktop/MainActivity$4;

    invoke-direct {v2, p0}, Lcom/dnake/desktop/MainActivity$4;-><init>(Lcom/dnake/desktop/MainActivity;)V

    .line 194
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private setSelectedColor(I)V
    .locals 3

    const/4 v0, 0x0

    .line 96
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/MainActivity;->mView:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 97
    iget-object v1, p0, Lcom/dnake/desktop/MainActivity;->mView:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    if-ne p1, v0, :cond_0

    iget v2, p0, Lcom/dnake/desktop/MainActivity;->clickedColor:I

    goto :goto_1

    :cond_0
    iget v2, p0, Lcom/dnake/desktop/MainActivity;->colorUnClick:I

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected getLayoutViewId()I
    .locals 1

    const v0, 0x7f0b001d

    return v0
.end method

.method public goToActivity(Ljava/lang/String;)V
    .locals 3

    .line 172
    invoke-virtual {p0}, Lcom/dnake/desktop/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 173
    invoke-virtual {p0}, Lcom/dnake/desktop/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 174
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u754c\u9762\u8df3\u8f6c\u5931\u8d25,\u8bf7\u786e\u8ba4\u662f\u5426\u5b89\u88c5\u8be5\u6a21\u5757\uff01"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method protected initActivity()V
    .locals 7

    .line 76
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    new-instance v1, Lcom/dnake/desktop/fragment/MonitorFragment;

    invoke-direct {v1}, Lcom/dnake/desktop/fragment/MonitorFragment;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 77
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    new-instance v1, Lcom/dnake/desktop/fragment/WindControlFragment;

    invoke-direct {v1}, Lcom/dnake/desktop/fragment/WindControlFragment;-><init>()V

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 78
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    new-instance v1, Lcom/dnake/desktop/fragment/AirControlFragment;

    invoke-direct {v1}, Lcom/dnake/desktop/fragment/AirControlFragment;-><init>()V

    const/4 v4, 0x2

    aput-object v1, v0, v4

    .line 79
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    new-instance v1, Lcom/dnake/desktop/fragment/SceneFragment;

    invoke-direct {v1}, Lcom/dnake/desktop/fragment/SceneFragment;-><init>()V

    const/4 v5, 0x3

    aput-object v1, v0, v5

    const/4 v0, 0x4

    new-array v0, v0, [Lme/yokeyword/fragmentation/ISupportFragment;

    .line 80
    iget-object v1, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    aget-object v6, v1, v2

    aput-object v6, v0, v2

    aget-object v6, v1, v3

    aput-object v6, v0, v3

    aget-object v3, v1, v4

    aput-object v3, v0, v4

    aget-object v1, v1, v5

    aput-object v1, v0, v5

    const v1, 0x7f08008b

    invoke-virtual {p0, v1, v2, v0}, Lcom/dnake/desktop/MainActivity;->loadMultipleRootFragment(II[Lme/yokeyword/fragmentation/ISupportFragment;)V

    .line 82
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    sget-object v1, Lcom/dnake/desktop/App;->deviceId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->connect(Ljava/lang/String;)V

    .line 84
    new-instance v0, Lcom/dnake/desktop/ServerManager;

    invoke-direct {v0, p0}, Lcom/dnake/desktop/ServerManager;-><init>(Lcom/dnake/desktop/MainActivity;)V

    iput-object v0, p0, Lcom/dnake/desktop/MainActivity;->mServerManager:Lcom/dnake/desktop/ServerManager;

    .line 85
    invoke-virtual {v0}, Lcom/dnake/desktop/ServerManager;->register()V

    .line 86
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mServerManager:Lcom/dnake/desktop/ServerManager;

    invoke-virtual {v0}, Lcom/dnake/desktop/ServerManager;->startServer()V

    .line 87
    invoke-direct {p0}, Lcom/dnake/desktop/MainActivity;->initInfo()V

    return-void
.end method

.method protected macToQRcode(Landroid/widget/ImageView;)V
    .locals 4

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "2:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/dnake/desktop/App;->deviceId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 226
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 231
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/dnake/desktop/utils/CommonUtils;->create2DCode(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_0
    .catch Lcom/google/zxing/WriterException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 233
    invoke-virtual {v0}, Lcom/google/zxing/WriterException;->printStackTrace()V

    .line 235
    :goto_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 236
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 237
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 238
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 240
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 241
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestManager;->load([B)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 242
    invoke-virtual {v0}, Lcom/bumptech/glide/RequestBuilder;->fitCenter()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/RequestBuilder;

    .line 243
    invoke-virtual {v0, p1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 270
    invoke-super {p0}, Lcom/dnake/desktop/base/BaseActivity;->onDestroy()V

    .line 271
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mServerManager:Lcom/dnake/desktop/ServerManager;

    invoke-virtual {v0}, Lcom/dnake/desktop/ServerManager;->unRegister()V

    .line 272
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->mServerManager:Lcom/dnake/desktop/ServerManager;

    invoke-virtual {v0}, Lcom/dnake/desktop/ServerManager;->stopServer()V

    return-void
.end method

.method public onServerError(Ljava/lang/String;)V
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onServerStart(Ljava/lang/String;)V
    .locals 2

    .line 250
    sput-object p1, Lcom/dnake/desktop/costant/VariableConstant;->DEVICE_IP:Ljava/lang/String;

    .line 251
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onServerStart"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onServerStop()V
    .locals 2

    .line 265
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onServerStop!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected onStart()V
    .locals 1

    .line 161
    invoke-super {p0}, Lcom/dnake/desktop/base/BaseActivity;->onStart()V

    .line 162
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->timeView:Lcom/dnake/desktop/widget/TimeView;

    invoke-virtual {v0}, Lcom/dnake/desktop/widget/TimeView;->start()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 167
    invoke-super {p0}, Lcom/dnake/desktop/base/BaseActivity;->onStop()V

    .line 168
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity;->timeView:Lcom/dnake/desktop/widget/TimeView;

    invoke-virtual {v0}, Lcom/dnake/desktop/widget/TimeView;->stop()V

    return-void
.end method

.method public onViewClicked(Landroid/view/View;)V
    .locals 3
    .annotation runtime Lbutterknife/OnClick;
        value = {
            0x7f0800fb,
            0x7f0800fe,
            0x7f0800fd,
            0x7f080106,
            0x7f080108,
            0x7f080104,
            0x7f0800ae
        }
    .end annotation

    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string p1, "com.dnake.talk"

    .line 138
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity;->goToActivity(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_1
    const-string p1, "com.dnake.security"

    .line 135
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity;->goToActivity(Ljava/lang/String;)V

    goto :goto_0

    .line 129
    :sswitch_2
    invoke-direct {p0, v0}, Lcom/dnake/desktop/MainActivity;->setSelectedColor(I)V

    .line 130
    iget-object p1, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    const/4 v0, 0x3

    aget-object p1, p1, v0

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V

    goto :goto_0

    .line 118
    :sswitch_3
    invoke-direct {p0, v2}, Lcom/dnake/desktop/MainActivity;->setSelectedColor(I)V

    .line 119
    iget-object p1, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    aget-object p1, p1, v1

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V

    goto :goto_0

    .line 124
    :sswitch_4
    invoke-direct {p0, v1}, Lcom/dnake/desktop/MainActivity;->setSelectedColor(I)V

    .line 125
    iget-object p1, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    aget-object p1, p1, v0

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V

    goto :goto_0

    .line 112
    :sswitch_5
    invoke-direct {p0}, Lcom/dnake/desktop/MainActivity;->clearSelectedColor()V

    .line 113
    iget-object p1, p0, Lcom/dnake/desktop/MainActivity;->mFragments:[Lme/yokeyword/fragmentation/SupportFragment;

    aget-object p1, p1, v2

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/MainActivity;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V

    goto :goto_0

    .line 141
    :sswitch_6
    new-instance p1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-direct {p1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f0b0021

    .line 142
    invoke-virtual {p1, v0, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(IZ)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object p1

    .line 143
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->show()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object p1

    .line 144
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCustomView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0800ae

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 145
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCustomView()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f080054

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 146
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/MainActivity;->macToQRcode(Landroid/widget/ImageView;)V

    .line 147
    new-instance v0, Lcom/dnake/desktop/MainActivity$1;

    invoke-direct {v0, p0, p1}, Lcom/dnake/desktop/MainActivity$1;-><init>(Lcom/dnake/desktop/MainActivity;Lcom/afollestad/materialdialogs/MaterialDialog;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_0
    return-void

    :sswitch_data_0
    .sparse-switch
        0x7f0800ae -> :sswitch_6
        0x7f0800fb -> :sswitch_5
        0x7f0800fd -> :sswitch_4
        0x7f0800fe -> :sswitch_3
        0x7f080104 -> :sswitch_2
        0x7f080106 -> :sswitch_1
        0x7f080108 -> :sswitch_0
    .end sparse-switch
.end method
