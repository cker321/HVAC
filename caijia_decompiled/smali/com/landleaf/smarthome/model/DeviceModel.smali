.class public Lcom/landleaf/smarthome/model/DeviceModel;
.super Ljava/lang/Object;
.source "DeviceModel.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0xbcdd158513234c5L


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

.field private id:Ljava/lang/Long;

.field private port:I

.field private productCode:I

.field private protocol:I

.field private roomId:Ljava/lang/Long;

.field private sortNo:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/Long;II)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->id:Ljava/lang/Long;

    .line 50
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->id:Ljava/lang/Long;

    .line 51
    iput-object p2, p0, Lcom/landleaf/smarthome/model/DeviceModel;->deviceSn:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lcom/landleaf/smarthome/model/DeviceModel;->deviceName:Ljava/lang/String;

    .line 53
    iput p4, p0, Lcom/landleaf/smarthome/model/DeviceModel;->port:I

    .line 54
    iput p5, p0, Lcom/landleaf/smarthome/model/DeviceModel;->protocol:I

    .line 55
    iput p6, p0, Lcom/landleaf/smarthome/model/DeviceModel;->sortNo:I

    .line 56
    iput-object p7, p0, Lcom/landleaf/smarthome/model/DeviceModel;->roomId:Ljava/lang/Long;

    .line 57
    iput p8, p0, Lcom/landleaf/smarthome/model/DeviceModel;->productCode:I

    .line 58
    iput p9, p0, Lcom/landleaf/smarthome/model/DeviceModel;->hvacFlag:I

    return-void
.end method


# virtual methods
.method public getAttrs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->attrs:Ljava/util/List;

    return-object v0
.end method

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

    .line 86
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->attrs:Ljava/util/List;

    return-object v0
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->deviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceSn()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->deviceSn:Ljava/lang/String;

    return-object v0
.end method

.method public getHvacFlag()I
    .locals 1

    .line 155
    iget v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->hvacFlag:I

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

    .line 70
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->hvacList:Ljava/util/List;

    return-object v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->port:I

    return v0
.end method

.method public getProductCode()I
    .locals 1

    .line 123
    iget v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->productCode:I

    return v0
.end method

.method public getProtocol()I
    .locals 1

    .line 78
    iget v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->protocol:I

    return v0
.end method

.method public getRoomId()Ljava/lang/Long;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->roomId:Ljava/lang/Long;

    return-object v0
.end method

.method public getSortNo()I
    .locals 1

    .line 114
    iget v0, p0, Lcom/landleaf/smarthome/model/DeviceModel;->sortNo:I

    return v0
.end method

.method public setAttrs(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;)V"
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->attrs:Ljava/util/List;

    return-void
.end method

.method public setDeviceName(Ljava/lang/String;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->deviceName:Ljava/lang/String;

    return-void
.end method

.method public setDeviceSn(Ljava/lang/String;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->deviceSn:Ljava/lang/String;

    return-void
.end method

.method public setHvacFlag(I)V
    .locals 0

    .line 159
    iput p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->hvacFlag:I

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

    .line 74
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->hvacList:Ljava/util/List;

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    .line 143
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->id:Ljava/lang/Long;

    return-void
.end method

.method public setPort(I)V
    .locals 0

    .line 110
    iput p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->port:I

    return-void
.end method

.method public setProductCode(I)V
    .locals 0

    .line 127
    iput p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->productCode:I

    return-void
.end method

.method public setProtocol(I)V
    .locals 0

    .line 82
    iput p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->protocol:I

    return-void
.end method

.method public setRoomId(Ljava/lang/Long;)V
    .locals 0

    .line 151
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->roomId:Ljava/lang/Long;

    return-void
.end method

.method public setSortNo(I)V
    .locals 0

    .line 118
    iput p1, p0, Lcom/landleaf/smarthome/model/DeviceModel;->sortNo:I

    return-void
.end method
