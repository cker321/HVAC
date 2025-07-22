.class public Lcom/landleaf/smarthome/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 1

    .line 44
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p0

    const-string v0, "88888888"

    invoke-virtual {p0, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->connect(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$onCreate$2(Landroid/view/View;)V
    .locals 1

    .line 47
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendSecurityAlarmMsg(Ljava/util/List;)V

    return-void
.end method

.method static synthetic lambda$onCreate$3(Landroid/view/View;)V
    .locals 8

    .line 50
    new-instance p0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {p0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    const-string v0, "5"

    .line 51
    invoke-virtual {p0, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v0, 0x44d

    .line 52
    invoke-virtual {p0, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v2, "temperature"

    const-string v3, "20"

    invoke-direct {v1, v2, v3}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v3, "humidity"

    const-string v4, "25"

    invoke-direct {v2, v3, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v4, "voc"

    const-string v5, "0.2"

    invoke-direct {v3, v4, v5}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v5, "co2"

    const-string v6, "200"

    invoke-direct {v4, v5, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    new-instance v5, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v6, "pm25"

    const-string v7, "30"

    invoke-direct {v5, v6, v7}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendDeviceUpdateMsg(Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method

.method static synthetic lambda$onCreate$4(Landroid/view/View;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public synthetic lambda$onCreate$0$MainActivity(Landroid/widget/ImageView;Landroid/view/View;)V
    .locals 0

    .line 40
    invoke-virtual {p0}, Lcom/landleaf/smarthome/MainActivity;->test()V

    .line 41
    sget p2, Lcom/landleaf/smarthome/R$drawable;->test_2:I

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 34
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-static {p0}, Lcom/gyf/barlibrary/ImmersionBar;->with(Landroid/app/Activity;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    sget-object v0, Lcom/gyf/barlibrary/BarHide;->FLAG_HIDE_BAR:Lcom/gyf/barlibrary/BarHide;

    invoke-virtual {p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->hideBar(Lcom/gyf/barlibrary/BarHide;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/gyf/barlibrary/ImmersionBar;->init()V

    .line 36
    sget p1, Lcom/landleaf/smarthome/R$layout;->activity_main:I

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity;->setContentView(I)V

    .line 37
    sget p1, Lcom/landleaf/smarthome/R$id;->iv:I

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 39
    new-instance v0, Lcom/landleaf/smarthome/-$$Lambda$MainActivity$KXKqHXQHZN7nlSex4IyRP1SJ4hI;

    invoke-direct {v0, p0, p1}, Lcom/landleaf/smarthome/-$$Lambda$MainActivity$KXKqHXQHZN7nlSex4IyRP1SJ4hI;-><init>(Lcom/landleaf/smarthome/MainActivity;Landroid/widget/ImageView;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    sget p1, Lcom/landleaf/smarthome/R$id;->textView:I

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sget-object v0, Lcom/landleaf/smarthome/-$$Lambda$MainActivity$o3YfTcxQjjm6FTdau7Glp7myY9Q;->INSTANCE:Lcom/landleaf/smarthome/-$$Lambda$MainActivity$o3YfTcxQjjm6FTdau7Glp7myY9Q;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    sget p1, Lcom/landleaf/smarthome/R$id;->textView3:I

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sget-object v0, Lcom/landleaf/smarthome/-$$Lambda$MainActivity$fyEIR1lbFBLjIqa0yzZxQ5oT1w8;->INSTANCE:Lcom/landleaf/smarthome/-$$Lambda$MainActivity$fyEIR1lbFBLjIqa0yzZxQ5oT1w8;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    sget p1, Lcom/landleaf/smarthome/R$id;->textView2:I

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sget-object v0, Lcom/landleaf/smarthome/-$$Lambda$MainActivity$Lqe8tlc0etJMLbBDNnKVviemCaI;->INSTANCE:Lcom/landleaf/smarthome/-$$Lambda$MainActivity$Lqe8tlc0etJMLbBDNnKVviemCaI;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    sget p1, Lcom/landleaf/smarthome/R$id;->textView4:I

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sget-object v0, Lcom/landleaf/smarthome/-$$Lambda$MainActivity$oIzoqSjfqj7vlp5GMm9yar_-auE;->INSTANCE:Lcom/landleaf/smarthome/-$$Lambda$MainActivity$oIzoqSjfqj7vlp5GMm9yar_-auE;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/landleaf/smarthome/net/http/NetApi;->getWeather()Lio/reactivex/Observable;

    move-result-object p1

    .line 70
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance v0, Lcom/landleaf/smarthome/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/MainActivity$1;-><init>(Lcom/landleaf/smarthome/MainActivity;)V

    new-instance v1, Lcom/landleaf/smarthome/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/landleaf/smarthome/MainActivity$2;-><init>(Lcom/landleaf/smarthome/MainActivity;)V

    .line 71
    invoke-virtual {p1, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 85
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/landleaf/smarthome/net/http/NetApi;->getFloorDeviceList()Lio/reactivex/Observable;

    move-result-object p1

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance v0, Lcom/landleaf/smarthome/MainActivity$3;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/MainActivity$3;-><init>(Lcom/landleaf/smarthome/MainActivity;)V

    new-instance v1, Lcom/landleaf/smarthome/MainActivity$4;

    invoke-direct {v1, p0}, Lcom/landleaf/smarthome/MainActivity$4;-><init>(Lcom/landleaf/smarthome/MainActivity;)V

    invoke-virtual {p1, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method test()V
    .locals 0

    return-void
.end method
