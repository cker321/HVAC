.class public final synthetic Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;-><init>()V

    sput-object v0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-static {p1}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->lambda$deviceWriteAsyn$3(Lcom/landleaf/smarthome/model/DeviceModel;)Z

    move-result p1

    return p1
.end method
