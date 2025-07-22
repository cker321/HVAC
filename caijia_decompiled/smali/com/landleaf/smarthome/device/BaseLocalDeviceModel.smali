.class public abstract Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;
.super Ljava/lang/Object;
.source "BaseLocalDeviceModel.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field protected attTagAdd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected attValueAdd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation
.end field

.field protected isMultiple:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getAddLength()I
.end method

.method public abstract getAttTagAdd()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getAttValueAdd()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation
.end method

.method public getIsMultiple()Z
    .locals 1

    .line 30
    iget-boolean v0, p0, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->isMultiple:Z

    return v0
.end method

.method public abstract getStartAdd()I
.end method

.method public setAttTagAdd(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 36
    iput-object p1, p0, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->attTagAdd:Ljava/util/Map;

    return-void
.end method

.method public setAttValueAdd(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;)V"
        }
    .end annotation

    .line 42
    iput-object p1, p0, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->attValueAdd:Ljava/util/Map;

    return-void
.end method

.method public setMultiple(Z)V
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->isMultiple:Z

    return-void
.end method
