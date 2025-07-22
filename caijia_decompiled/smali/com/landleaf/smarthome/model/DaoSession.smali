.class public Lcom/landleaf/smarthome/model/DaoSession;
.super Lorg/greenrobot/greendao/AbstractDaoSession;
.source "DaoSession.java"


# instance fields
.field private final deviceModelDao:Lcom/landleaf/smarthome/model/DeviceModelDao;

.field private final deviceModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

.field private final floorModelDao:Lcom/landleaf/smarthome/model/FloorModelDao;

.field private final floorModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

.field private final roomModelDao:Lcom/landleaf/smarthome/model/RoomModelDao;

.field private final roomModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

.field private final sceneModelDao:Lcom/landleaf/smarthome/model/SceneModelDao;

.field private final sceneModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;


# direct methods
.method public constructor <init>(Lorg/greenrobot/greendao/database/Database;Lorg/greenrobot/greendao/identityscope/IdentityScopeType;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/greenrobot/greendao/database/Database;",
            "Lorg/greenrobot/greendao/identityscope/IdentityScopeType;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/greenrobot/greendao/AbstractDao<",
            "**>;>;",
            "Lorg/greenrobot/greendao/internal/DaoConfig;",
            ">;)V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/AbstractDaoSession;-><init>(Lorg/greenrobot/greendao/database/Database;)V

    .line 44
    const-class p1, Lcom/landleaf/smarthome/model/DeviceModelDao;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/internal/DaoConfig;->clone()Lorg/greenrobot/greendao/internal/DaoConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->deviceModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    .line 45
    invoke-virtual {p1, p2}, Lorg/greenrobot/greendao/internal/DaoConfig;->initIdentityScope(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)V

    .line 47
    const-class p1, Lcom/landleaf/smarthome/model/FloorModelDao;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/internal/DaoConfig;->clone()Lorg/greenrobot/greendao/internal/DaoConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->floorModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    .line 48
    invoke-virtual {p1, p2}, Lorg/greenrobot/greendao/internal/DaoConfig;->initIdentityScope(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)V

    .line 50
    const-class p1, Lcom/landleaf/smarthome/model/RoomModelDao;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/internal/DaoConfig;->clone()Lorg/greenrobot/greendao/internal/DaoConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->roomModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    .line 51
    invoke-virtual {p1, p2}, Lorg/greenrobot/greendao/internal/DaoConfig;->initIdentityScope(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)V

    .line 53
    const-class p1, Lcom/landleaf/smarthome/model/SceneModelDao;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/internal/DaoConfig;->clone()Lorg/greenrobot/greendao/internal/DaoConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->sceneModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    .line 54
    invoke-virtual {p1, p2}, Lorg/greenrobot/greendao/internal/DaoConfig;->initIdentityScope(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)V

    .line 56
    new-instance p1, Lcom/landleaf/smarthome/model/DeviceModelDao;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->deviceModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-direct {p1, p2, p0}, Lcom/landleaf/smarthome/model/DeviceModelDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->deviceModelDao:Lcom/landleaf/smarthome/model/DeviceModelDao;

    .line 57
    new-instance p1, Lcom/landleaf/smarthome/model/FloorModelDao;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->floorModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-direct {p1, p2, p0}, Lcom/landleaf/smarthome/model/FloorModelDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->floorModelDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    .line 58
    new-instance p1, Lcom/landleaf/smarthome/model/RoomModelDao;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->roomModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-direct {p1, p2, p0}, Lcom/landleaf/smarthome/model/RoomModelDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->roomModelDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    .line 59
    new-instance p1, Lcom/landleaf/smarthome/model/SceneModelDao;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->sceneModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-direct {p1, p2, p0}, Lcom/landleaf/smarthome/model/SceneModelDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V

    iput-object p1, p0, Lcom/landleaf/smarthome/model/DaoSession;->sceneModelDao:Lcom/landleaf/smarthome/model/SceneModelDao;

    .line 61
    const-class p1, Lcom/landleaf/smarthome/model/DeviceModel;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->deviceModelDao:Lcom/landleaf/smarthome/model/DeviceModelDao;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DaoSession;->registerDao(Ljava/lang/Class;Lorg/greenrobot/greendao/AbstractDao;)V

    .line 62
    const-class p1, Lcom/landleaf/smarthome/model/FloorModel;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->floorModelDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DaoSession;->registerDao(Ljava/lang/Class;Lorg/greenrobot/greendao/AbstractDao;)V

    .line 63
    const-class p1, Lcom/landleaf/smarthome/model/RoomModel;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->roomModelDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DaoSession;->registerDao(Ljava/lang/Class;Lorg/greenrobot/greendao/AbstractDao;)V

    .line 64
    const-class p1, Lcom/landleaf/smarthome/model/SceneModel;

    iget-object p2, p0, Lcom/landleaf/smarthome/model/DaoSession;->sceneModelDao:Lcom/landleaf/smarthome/model/SceneModelDao;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DaoSession;->registerDao(Ljava/lang/Class;Lorg/greenrobot/greendao/AbstractDao;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->deviceModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/internal/DaoConfig;->clearIdentityScope()V

    .line 69
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->floorModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/internal/DaoConfig;->clearIdentityScope()V

    .line 70
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->roomModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/internal/DaoConfig;->clearIdentityScope()V

    .line 71
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->sceneModelDaoConfig:Lorg/greenrobot/greendao/internal/DaoConfig;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/internal/DaoConfig;->clearIdentityScope()V

    return-void
.end method

.method public getDeviceModelDao()Lcom/landleaf/smarthome/model/DeviceModelDao;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->deviceModelDao:Lcom/landleaf/smarthome/model/DeviceModelDao;

    return-object v0
.end method

.method public getFloorModelDao()Lcom/landleaf/smarthome/model/FloorModelDao;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->floorModelDao:Lcom/landleaf/smarthome/model/FloorModelDao;

    return-object v0
.end method

.method public getRoomModelDao()Lcom/landleaf/smarthome/model/RoomModelDao;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->roomModelDao:Lcom/landleaf/smarthome/model/RoomModelDao;

    return-object v0
.end method

.method public getSceneModelDao()Lcom/landleaf/smarthome/model/SceneModelDao;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DaoSession;->sceneModelDao:Lcom/landleaf/smarthome/model/SceneModelDao;

    return-object v0
.end method
