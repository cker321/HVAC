.class public final synthetic Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;-><init>()V

    sput-object v0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;->INSTANCE:Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M;

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

    invoke-static {p1}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->lambda$deviceWriteAsyn$5(Ljava/lang/Throwable;)V

    return-void
.end method
