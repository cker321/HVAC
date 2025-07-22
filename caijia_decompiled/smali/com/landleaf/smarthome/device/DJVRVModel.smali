.class public Lcom/landleaf/smarthome/device/DJVRVModel;
.super Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;
.source "DJVRVModel.java"


# annotations
.annotation runtime Lcom/landleaf/smarthome/device/ProductCodeAnnotation;
    value = {
        0x1f41
    }
.end annotation


# static fields
.field private static volatile singleton:Lcom/landleaf/smarthome/device/DJVRVModel;


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

.method public static getInstance()Lcom/landleaf/smarthome/device/DJVRVModel;
    .locals 2

    .line 23
    sget-object v0, Lcom/landleaf/smarthome/device/DJVRVModel;->singleton:Lcom/landleaf/smarthome/device/DJVRVModel;

    if-nez v0, :cond_1

    .line 24
    const-class v0, Lcom/landleaf/smarthome/device/DJVRVModel;

    monitor-enter v0

    .line 25
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/device/DJVRVModel;->singleton:Lcom/landleaf/smarthome/device/DJVRVModel;

    if-nez v1, :cond_0

    .line 26
    new-instance v1, Lcom/landleaf/smarthome/device/DJVRVModel;

    invoke-direct {v1}, Lcom/landleaf/smarthome/device/DJVRVModel;-><init>()V

    sput-object v1, Lcom/landleaf/smarthome/device/DJVRVModel;->singleton:Lcom/landleaf/smarthome/device/DJVRVModel;

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
    sget-object v0, Lcom/landleaf/smarthome/device/DJVRVModel;->singleton:Lcom/landleaf/smarthome/device/DJVRVModel;

    return-object v0
.end method


# virtual methods
.method public getAddLength()I
    .locals 1

    const/16 v0, 0x64

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

    .line 50
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attTagAdd:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attTagAdd:Ljava/util/Map;

    .line 52
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attTagAdd:Ljava/util/Map;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "switch"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attTagAdd:Ljava/util/Map;

    return-object v0
.end method

.method public getAttValueAdd()Ljava/util/Map;
    .locals 5
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
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    .line 62
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const/4 v2, 0x1

    const-string v3, "switch"

    invoke-direct {v1, v3, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;I)V

    const-string v4, "on"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const/4 v4, 0x2

    invoke-direct {v1, v3, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;I)V

    const-string v3, "off"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v3, "mode"

    invoke-direct {v1, v3, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;I)V

    const-string v2, "cold"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {v1, v3, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;I)V

    const-string v2, "hot"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const/4 v2, 0x3

    invoke-direct {v1, v3, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;I)V

    const-string v2, "wind"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    new-instance v1, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const/4 v2, 0x4

    invoke-direct {v1, v3, v2}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;I)V

    const-string v2, "dehumidification"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/landleaf/smarthome/device/DJVRVModel;->attValueAdd:Ljava/util/Map;

    return-object v0
.end method

.method public getIsMultiple()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getStartAdd()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
