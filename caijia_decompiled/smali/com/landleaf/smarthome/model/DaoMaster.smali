.class public Lcom/landleaf/smarthome/model/DaoMaster;
.super Lorg/greenrobot/greendao/AbstractDaoMaster;
.source "DaoMaster.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;,
        Lcom/landleaf/smarthome/model/DaoMaster$OpenHelper;
    }
.end annotation


# static fields
.field public static final SCHEMA_VERSION:I = 0x1


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 49
    new-instance v0, Lorg/greenrobot/greendao/database/StandardDatabase;

    invoke-direct {v0, p1}, Lorg/greenrobot/greendao/database/StandardDatabase;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-direct {p0, v0}, Lcom/landleaf/smarthome/model/DaoMaster;-><init>(Lorg/greenrobot/greendao/database/Database;)V

    return-void
.end method

.method public constructor <init>(Lorg/greenrobot/greendao/database/Database;)V
    .locals 1

    const/4 v0, 0x1

    .line 53
    invoke-direct {p0, p1, v0}, Lorg/greenrobot/greendao/AbstractDaoMaster;-><init>(Lorg/greenrobot/greendao/database/Database;I)V

    .line 54
    const-class p1, Lcom/landleaf/smarthome/model/DeviceModelDao;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    .line 55
    const-class p1, Lcom/landleaf/smarthome/model/FloorModelDao;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    .line 56
    const-class p1, Lcom/landleaf/smarthome/model/RoomModelDao;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    .line 57
    const-class p1, Lcom/landleaf/smarthome/model/SceneModelDao;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DaoMaster;->registerDaoClass(Ljava/lang/Class;)V

    return-void
.end method

.method public static createAllTables(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 0

    .line 24
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/DeviceModelDao;->createTable(Lorg/greenrobot/greendao/database/Database;Z)V

    .line 25
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/FloorModelDao;->createTable(Lorg/greenrobot/greendao/database/Database;Z)V

    .line 26
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/RoomModelDao;->createTable(Lorg/greenrobot/greendao/database/Database;Z)V

    .line 27
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/SceneModelDao;->createTable(Lorg/greenrobot/greendao/database/Database;Z)V

    return-void
.end method

.method public static dropAllTables(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 0

    .line 32
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/DeviceModelDao;->dropTable(Lorg/greenrobot/greendao/database/Database;Z)V

    .line 33
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/FloorModelDao;->dropTable(Lorg/greenrobot/greendao/database/Database;Z)V

    .line 34
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/RoomModelDao;->dropTable(Lorg/greenrobot/greendao/database/Database;Z)V

    .line 35
    invoke-static {p0, p1}, Lcom/landleaf/smarthome/model/SceneModelDao;->dropTable(Lorg/greenrobot/greendao/database/Database;Z)V

    return-void
.end method

.method public static newDevSession(Landroid/content/Context;Ljava/lang/String;)Lcom/landleaf/smarthome/model/DaoSession;
    .locals 1

    .line 43
    new-instance v0, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    invoke-direct {v0, p0, p1}, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;->getWritableDb()Lorg/greenrobot/greendao/database/Database;

    move-result-object p0

    .line 44
    new-instance p1, Lcom/landleaf/smarthome/model/DaoMaster;

    invoke-direct {p1, p0}, Lcom/landleaf/smarthome/model/DaoMaster;-><init>(Lorg/greenrobot/greendao/database/Database;)V

    .line 45
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DaoMaster;->newSession()Lcom/landleaf/smarthome/model/DaoSession;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public newSession()Lcom/landleaf/smarthome/model/DaoSession;
    .locals 4

    .line 61
    new-instance v0, Lcom/landleaf/smarthome/model/DaoSession;

    iget-object v1, p0, Lcom/landleaf/smarthome/model/DaoMaster;->db:Lorg/greenrobot/greendao/database/Database;

    sget-object v2, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->Session:Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    iget-object v3, p0, Lcom/landleaf/smarthome/model/DaoMaster;->daoConfigMap:Ljava/util/Map;

    invoke-direct {v0, v1, v2, v3}, Lcom/landleaf/smarthome/model/DaoSession;-><init>(Lorg/greenrobot/greendao/database/Database;Lorg/greenrobot/greendao/identityscope/IdentityScopeType;Ljava/util/Map;)V

    return-object v0
.end method

.method public newSession(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)Lcom/landleaf/smarthome/model/DaoSession;
    .locals 3

    .line 65
    new-instance v0, Lcom/landleaf/smarthome/model/DaoSession;

    iget-object v1, p0, Lcom/landleaf/smarthome/model/DaoMaster;->db:Lorg/greenrobot/greendao/database/Database;

    iget-object v2, p0, Lcom/landleaf/smarthome/model/DaoMaster;->daoConfigMap:Ljava/util/Map;

    invoke-direct {v0, v1, p1, v2}, Lcom/landleaf/smarthome/model/DaoSession;-><init>(Lorg/greenrobot/greendao/database/Database;Lorg/greenrobot/greendao/identityscope/IdentityScopeType;Ljava/util/Map;)V

    return-object v0
.end method

.method public bridge synthetic newSession()Lorg/greenrobot/greendao/AbstractDaoSession;
    .locals 1

    .line 19
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DaoMaster;->newSession()Lcom/landleaf/smarthome/model/DaoSession;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newSession(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)Lorg/greenrobot/greendao/AbstractDaoSession;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DaoMaster;->newSession(Lorg/greenrobot/greendao/identityscope/IdentityScopeType;)Lcom/landleaf/smarthome/model/DaoSession;

    move-result-object p1

    return-object p1
.end method
