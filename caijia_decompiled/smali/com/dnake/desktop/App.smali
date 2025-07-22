.class public Lcom/dnake/desktop/App;
.super Landroid/app/Application;
.source "App.java"


# static fields
.field public static deviceId:Ljava/lang/String;

.field public static instance:Lcom/dnake/desktop/App;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .line 26
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 27
    sput-object p0, Lcom/dnake/desktop/App;->instance:Lcom/dnake/desktop/App;

    .line 28
    sput-object p0, Lcom/landleaf/smarthome/net/http/ApiFactory;->applicationInstance:Landroid/app/Application;

    .line 29
    sget-object v0, Lcom/dnake/desktop/App;->instance:Lcom/dnake/desktop/App;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {v0}, Lcom/landleaf/smarthome/util/SpUtils;->setSharedPreferences(Landroid/content/SharedPreferences;)V

    .line 30
    invoke-static {p0}, Lcom/landleaf/smarthome/util/DeviceInfoUtil;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/App;->deviceId:Ljava/lang/String;

    .line 31
    sput-object v0, Lcom/dnake/desktop/costant/VariableConstant;->DEVICE_ID:Ljava/lang/String;

    .line 32
    invoke-static {}, Lcom/dnake/desktop/dnake/Rs485Executor;->getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dnake/desktop/dnake/Rs485Executor;->setup()V

    return-void
.end method
