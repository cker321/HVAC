.class public Lcom/landleaf/smarthome/model/SceneDeviceModel;
.super Ljava/lang/Object;
.source "SceneDeviceModel.java"


# instance fields
.field private attrs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation
.end field

.field private deviceName:Ljava/lang/String;

.field private deviceSn:Ljava/lang/String;

.field private hvacFlag:I

.field private hvacList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/HvacSceneModeListModel;",
            ">;"
        }
    .end annotation
.end field

.field private port:Ljava/lang/String;

.field private productCode:Ljava/lang/String;

.field private roomId:Ljava/lang/Long;

.field private sortNo:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAtts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->attrs:Ljava/util/List;

    return-object v0
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->deviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceSn()Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->deviceSn:Ljava/lang/String;

    return-object v0
.end method

.method public getHvacFlag()I
    .locals 1

    .line 74
    iget v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->hvacFlag:I

    return v0
.end method

.method public getHvacList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/HvacSceneModeListModel;",
            ">;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->hvacList:Ljava/util/List;

    return-object v0
.end method

.method public getPort()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->port:Ljava/lang/String;

    return-object v0
.end method

.method public getProductCode()Ljava/lang/String;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->productCode:Ljava/lang/String;

    return-object v0
.end method

.method public getRoomId()Ljava/lang/Long;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->roomId:Ljava/lang/Long;

    return-object v0
.end method

.method public getSortNo()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->sortNo:I

    return v0
.end method

.method public setAtts(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;)V"
        }
    .end annotation

    .line 86
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->attrs:Ljava/util/List;

    return-void
.end method

.method public setDeviceName(Ljava/lang/String;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->deviceName:Ljava/lang/String;

    return-void
.end method

.method public setDeviceSn(Ljava/lang/String;)V
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method public setHvacFlag(I)V
    .locals 0

    .line 78
    iput p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->hvacFlag:I

    return-void
.end method

.method public setHvacList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/HvacSceneModeListModel;",
            ">;)V"
        }
    .end annotation

    .line 94
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->hvacList:Ljava/util/List;

    return-void
.end method

.method public setPort(Ljava/lang/String;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->port:Ljava/lang/String;

    return-void
.end method

.method public setProductCode(Ljava/lang/String;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->productCode:Ljava/lang/String;

    return-void
.end method

.method public setRoomId(Ljava/lang/Long;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->roomId:Ljava/lang/Long;

    return-void
.end method

.method public setSortNo(I)V
    .locals 0

    .line 54
    iput p1, p0, Lcom/landleaf/smarthome/model/SceneDeviceModel;->sortNo:I

    return-void
.end method
