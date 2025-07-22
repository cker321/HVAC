.class public final synthetic Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$i3XIfA6vey9418lx3fuo9xjejRg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/landleaf/smarthome/model/DeviceModel;


# direct methods
.method public synthetic constructor <init>(Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$i3XIfA6vey9418lx3fuo9xjejRg;->f$0:Lcom/landleaf/smarthome/model/DeviceModel;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$i3XIfA6vey9418lx3fuo9xjejRg;->f$0:Lcom/landleaf/smarthome/model/DeviceModel;

    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-static {v0, p1}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->lambda$deviceReadAsyn$1(Lcom/landleaf/smarthome/model/DeviceModel;Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method
