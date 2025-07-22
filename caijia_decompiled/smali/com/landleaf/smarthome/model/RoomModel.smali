.class public Lcom/landleaf/smarthome/model/RoomModel;
.super Ljava/lang/Object;
.source "RoomModel.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x75185a748983322eL


# instance fields
.field private transient daoSession:Lcom/landleaf/smarthome/model/DaoSession;

.field private devices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation
.end field

.field private floorId:J

.field private id:Ljava/lang/Long;

.field private transient myDao:Lcom/landleaf/smarthome/model/RoomModelDao;

.field private roomName:Ljava/lang/String;

.field private roomType:I

.field private sortNo:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;IIJ)V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->id:Ljava/lang/Long;

    .line 45
    iput-object p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->id:Ljava/lang/Long;

    .line 46
    iput-object p2, p0, Lcom/landleaf/smarthome/model/RoomModel;->roomName:Ljava/lang/String;

    .line 47
    iput p3, p0, Lcom/landleaf/smarthome/model/RoomModel;->roomType:I

    .line 48
    iput p4, p0, Lcom/landleaf/smarthome/model/RoomModel;->sortNo:I

    .line 49
    iput-wide p5, p0, Lcom/landleaf/smarthome/model/RoomModel;->floorId:J

    return-void
.end method


# virtual methods
.method public __setDaoSession(Lcom/landleaf/smarthome/model/DaoSession;)V
    .locals 0

    .line 146
    iput-object p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    if-eqz p1, :cond_0

    .line 147
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DaoSession;->getRoomModelDao()Lcom/landleaf/smarthome/model/RoomModelDao;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->myDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    return-void
.end method

.method public delete()V
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->myDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    if-eqz v0, :cond_0

    .line 119
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/RoomModelDao;->delete(Ljava/lang/Object;)V

    return-void

    .line 117
    :cond_0
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDevices()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->devices:Ljava/util/List;

    if-nez v0, :cond_2

    .line 91
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    if-eqz v0, :cond_1

    .line 95
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoSession;->getDeviceModelDao()Lcom/landleaf/smarthome/model/DeviceModelDao;

    move-result-object v0

    .line 96
    iget-object v1, p0, Lcom/landleaf/smarthome/model/RoomModel;->id:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModelDao;->_queryRoomModel_Devices(Ljava/lang/Long;)Ljava/util/List;

    move-result-object v0

    .line 97
    monitor-enter p0

    .line 98
    :try_start_0
    iget-object v1, p0, Lcom/landleaf/smarthome/model/RoomModel;->devices:Ljava/util/List;

    if-nez v1, :cond_0

    .line 99
    iput-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->devices:Ljava/util/List;

    .line 101
    :cond_0
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 93
    :cond_1
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->devices:Ljava/util/List;

    return-object v0
.end method

.method public getFloorId()J
    .locals 2

    .line 79
    iget-wide v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->floorId:J

    return-wide v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getRoomName()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->roomName:Ljava/lang/String;

    return-object v0
.end method

.method public getRoomType()I
    .locals 1

    .line 67
    iget v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->roomType:I

    return v0
.end method

.method public getSortNo()I
    .locals 1

    .line 73
    iget v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->sortNo:I

    return v0
.end method

.method public refresh()V
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->myDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/RoomModelDao;->refresh(Ljava/lang/Object;)V

    return-void

    .line 128
    :cond_0
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized resetDevices()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 108
    :try_start_0
    iput-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->devices:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setFloorId(J)V
    .locals 0

    .line 82
    iput-wide p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->floorId:J

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->id:Ljava/lang/Long;

    return-void
.end method

.method public setRoomName(Ljava/lang/String;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->roomName:Ljava/lang/String;

    return-void
.end method

.method public setRoomType(I)V
    .locals 0

    .line 70
    iput p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->roomType:I

    return-void
.end method

.method public setSortNo(I)V
    .locals 0

    .line 76
    iput p1, p0, Lcom/landleaf/smarthome/model/RoomModel;->sortNo:I

    return-void
.end method

.method public update()V
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModel;->myDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/RoomModelDao;->update(Ljava/lang/Object;)V

    return-void

    .line 139
    :cond_0
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
