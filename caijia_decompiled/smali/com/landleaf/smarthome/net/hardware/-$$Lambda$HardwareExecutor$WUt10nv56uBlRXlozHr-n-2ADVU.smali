.class public final synthetic Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/landleaf/smarthome/model/DeviceModel;

.field private final synthetic f$1:Ljava/lang/String;

.field private final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;->f$0:Lcom/landleaf/smarthome/model/DeviceModel;

    iput-object p2, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;->f$0:Lcom/landleaf/smarthome/model/DeviceModel;

    iget-object v1, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/landleaf/smarthome/net/hardware/-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU;->f$2:Ljava/lang/String;

    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-static {v0, v1, v2, p1}, Lcom/landleaf/smarthome/net/hardware/HardwareExecutor;->lambda$deviceWriteAsyn$4(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Ljava/lang/String;Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method
