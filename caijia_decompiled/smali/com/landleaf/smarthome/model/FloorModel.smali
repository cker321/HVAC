.class public Lcom/landleaf/smarthome/model/FloorModel;
.super Ljava/lang/Object;
.source "FloorModel.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x3f091a88232a3418L


# instance fields
.field private transient daoSession:Lcom/landleaf/smarthome/model/DaoSession;

.field private floor:I

.field private id:Ljava/lang/Long;

.field private transient myDao:Lcom/landleaf/smarthome/model/FloorModelDao;

.field private name:Ljava/lang/String;

.field private rooms:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/RoomModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;I)V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->id:Ljava/lang/Long;

    .line 36
    iput-object p1, p0, Lcom/landleaf/smarthome/model/FloorModel;->id:Ljava/lang/Long;

    .line 37
    iput-object p2, p0, Lcom/landleaf/smarthome/model/FloorModel;->name:Ljava/lang/String;

    .line 38
    iput p3, p0, Lcom/landleaf/smarthome/model/FloorModel;->floor:I

    return-void
.end method


# virtual methods
.method public __setDaoSession(Lcom/landleaf/smarthome/model/DaoSession;)V
    .locals 0

    .line 123
    iput-object p1, p0, Lcom/landleaf/smarthome/model/FloorModel;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    if-eqz p1, :cond_0

    .line 124
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DaoSession;->getFloorModelDao()Lcom/landleaf/smarthome/model/FloorModelDao;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/landleaf/smarthome/model/FloorModel;->myDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    return-void
.end method

.method public delete()V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->myDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/FloorModelDao;->delete(Ljava/lang/Object;)V

    return-void

    .line 94
    :cond_0
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFloor()I
    .locals 1

    .line 56
    iget v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->floor:I

    return v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRooms()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/RoomModel;",
            ">;"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->rooms:Ljava/util/List;

    if-nez v0, :cond_2

    .line 68
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    if-eqz v0, :cond_1

    .line 72
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoSession;->getRoomModelDao()Lcom/landleaf/smarthome/model/RoomModelDao;

    move-result-object v0

    .line 73
    iget-object v1, p0, Lcom/landleaf/smarthome/model/FloorModel;->id:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/landleaf/smarthome/model/RoomModelDao;->_queryFloorModel_Rooms(J)Ljava/util/List;

    move-result-object v0

    .line 74
    monitor-enter p0

    .line 75
    :try_start_0
    iget-object v1, p0, Lcom/landleaf/smarthome/model/FloorModel;->rooms:Ljava/util/List;

    if-nez v1, :cond_0

    .line 76
    iput-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->rooms:Ljava/util/List;

    .line 78
    :cond_0
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 70
    :cond_1
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->rooms:Ljava/util/List;

    return-object v0
.end method

.method public refresh()V
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->myDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/FloorModelDao;->refresh(Ljava/lang/Object;)V

    return-void

    .line 105
    :cond_0
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized resetRooms()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 85
    :try_start_0
    iput-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->rooms:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setFloor(I)V
    .locals 0

    .line 59
    iput p1, p0, Lcom/landleaf/smarthome/model/FloorModel;->floor:I

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/landleaf/smarthome/model/FloorModel;->id:Ljava/lang/Long;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/landleaf/smarthome/model/FloorModel;->name:Ljava/lang/String;

    return-void
.end method

.method public update()V
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModel;->myDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/FloorModelDao;->update(Ljava/lang/Object;)V

    return-void

    .line 116
    :cond_0
    new-instance v0, Lorg/greenrobot/greendao/DaoException;

    const-string v1, "Entity is detached from DAO context"

    invoke-direct {v0, v1}, Lorg/greenrobot/greendao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
