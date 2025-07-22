.class public Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;
.super Ljava/lang/Object;
.source "HardwareExecutor.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "HardwareExecutor"

.field private static context:Landroid/content/Context;

.field private static volatile singleton:Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;
    .locals 2

    .line 30
    sget-object v0, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->singleton:Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;

    if-nez v0, :cond_1

    .line 31
    const-class v0, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;

    monitor-enter v0

    .line 32
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->singleton:Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;

    if-nez v1, :cond_0

    .line 33
    new-instance v1, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;

    invoke-direct {v1}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;-><init>()V

    sput-object v1, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->singleton:Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;

    .line 34
    sput-object p0, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->context:Landroid/content/Context;

    .line 36
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 38
    :cond_1
    :goto_0
    sget-object p0, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->singleton:Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;

    return-object p0
.end method

.method static synthetic lambda$deviceReadAsyn$0(Lcom/landleaf/smarthome/model/DeviceModel;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$deviceReadAsyn$1(Lcom/landleaf/smarthome/model/DeviceModel;Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 51
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v0

    sget-object v1, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->getStartAdd()I

    .line 53
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getPort()I

    .line 54
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModel;->getProtocol()I

    return-void
.end method

.method static synthetic lambda$deviceReadAsyn$2(Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u901a\u8baf\u5f02\u5e38->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "HardwareExecutor"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic lambda$deviceWriteAsyn$3(Lcom/landleaf/smarthome/model/DeviceModel;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$deviceWriteAsyn$4(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    invoke-virtual {p3}, Lcom/landleaf/smarthome/model/DeviceModel;->getPort()I

    .line 83
    sget-object p3, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->context:Landroid/content/Context;

    invoke-static {p0, p1, p3}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAdd4AttTag(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Landroid/content/Context;)I

    .line 84
    sget-object p1, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->context:Landroid/content/Context;

    invoke-static {p0, p2, p1}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAdd4AttValue(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Landroid/content/Context;)I

    .line 85
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModel;->getProtocol()I

    return-void
.end method

.method static synthetic lambda$deviceWriteAsyn$5(Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u901a\u8baf\u5f02\u5e38->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "HardwareExecutor"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public deviceReadAsyn(Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 2

    .line 48
    invoke-static {p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->createObservable(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_io_o()Lio/reactivex/ObservableTransformer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$8AUq-9oiYt_tzvA6o12tZPqr0iQ;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$8AUq-9oiYt_tzvA6o12tZPqr0iQ;

    .line 49
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$i3XIfA6vey9418lx3fuo9xjejRg;

    invoke-direct {v1, p1}, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$i3XIfA6vey9418lx3fuo9xjejRg;-><init>(Lcom/landleaf/smarthome/model/DeviceModel;)V

    sget-object p1, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;

    .line 50
    invoke-virtual {v0, v1, p1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public deviceWriteAsyn(Lcom/landleaf/smarthome/model/DeviceModel;Lcom/landleaf/smarthome/model/DeviceAttribute;)V
    .locals 1

    .line 112
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrValue()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->deviceWriteAsyn(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public deviceWriteAsyn(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 79
    invoke-static {p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->createObservable(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_io_o()Lio/reactivex/ObservableTransformer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;

    .line 80
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;

    invoke-direct {v1, p1, p2, p3}, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;-><init>(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;

    .line 81
    invoke-virtual {v0, v1, p1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public deviceWriteAsyn(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 106
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 107
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v1, v2}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->deviceWriteAsyn(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
