.class public final synthetic Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;-><init>()V

    sput-object v0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p1}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->lambda$deviceReadAsyn$2(Ljava/lang/Throwable;)V

    return-void
.end method
