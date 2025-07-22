.class public Lcom/landleaf/smarthome/device/WindControlModel;
.super Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;
.source "WindControlModel.java"


# annotations
.annotation runtime Lcom/landleaf/smarthome/device/ProductCodeAnnotation;
    value = {
        0x1bc3
    }
.end annotation


# static fields
.field private static volatile singleton:Lcom/landleaf/smarthome/device/WindControlModel;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/landleaf/smarthome/device/WindControlModel;
    .locals 2

    .line 23
    sget-object v0, Lcom/landleaf/smarthome/device/WindControlModel;->singleton:Lcom/landleaf/smarthome/device/WindControlModel;

    if-nez v0, :cond_1

    .line 24
    const-class v0, Lcom/landleaf/smarthome/device/WindControlModel;

    monitor-enter v0

    .line 25
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/device/WindControlModel;->singleton:Lcom/landleaf/smarthome/device/WindControlModel;

    if-nez v1, :cond_0

    .line 26
    new-instance v1, Lcom/landleaf/smarthome/device/WindControlModel;

    invoke-direct {v1}, Lcom/landleaf/smarthome/device/WindControlModel;-><init>()V

    sput-object v1, Lcom/landleaf/smarthome/device/WindControlModel;->singleton:Lcom/landleaf/smarthome/device/WindControlModel;

    .line 28
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 30
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/device/WindControlModel;->singleton:Lcom/landleaf/smarthome/device/WindControlModel;

    return-object v0
.end method


# virtual methods
.method public getAddLength()I
    .locals 1

    const/4 v0, 0x5

    return v0
.end method

.method public getAttTagAdd()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    .line 48
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    const/16 v1, 0x32

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "switch"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    const/16 v1, 0x33

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "mode"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    const/16 v1, 0x34

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "wind_speed"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    const/16 v1, 0x35

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "humidification_enable"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "return_air_temperature"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attTagAdd:Ljava/util/Map;

    return-object v0
.end method

.method public getAttValueAdd()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attValueAdd:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attValueAdd:Ljava/util/Map;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/device/WindControlModel;->attValueAdd:Ljava/util/Map;

    return-object v0
.end method

.method public getStartAdd()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
