.class public Lcom/landleaf/smarthome/model/RoomModelDao;
.super Lorg/greenrobot/greendao/AbstractDao;
.source "RoomModelDao.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/landleaf/smarthome/model/RoomModelDao$Properties;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/greenrobot/greendao/AbstractDao<",
        "Lcom/landleaf/smarthome/model/RoomModel;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# static fields
.field public static final TABLENAME:Ljava/lang/String; = "ROOM_MODEL"


# instance fields
.field private daoSession:Lcom/landleaf/smarthome/model/DaoSession;

.field private floorModel_RoomsQuery:Lorg/greenrobot/greendao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/greenrobot/greendao/query/Query<",
            "Lcom/landleaf/smarthome/model/RoomModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V

    return-void
.end method

.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lorg/greenrobot/greendao/AbstractDaoSession;)V

    .line 45
    iput-object p2, p0, Lcom/landleaf/smarthome/model/RoomModelDao;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    return-void
.end method

.method public static createTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "IF NOT EXISTS "

    goto :goto_0

    :cond_0
    const-string p1, ""

    .line 51
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"ROOM_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"ROOM_NAME\" TEXT,\"ROOM_TYPE\" INTEGER NOT NULL ,\"SORT_NO\" INTEGER NOT NULL ,\"FLOOR_ID\" INTEGER NOT NULL );"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public static dropTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DROP TABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_0

    const-string p1, "IF EXISTS "

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"ROOM_MODEL\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 62
    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public _queryFloorModel_Rooms(J)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/RoomModel;",
            ">;"
        }
    .end annotation

    .line 160
    monitor-enter p0

    .line 161
    :try_start_0
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModelDao;->floorModel_RoomsQuery:Lorg/greenrobot/greendao/query/Query;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 162
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/RoomModelDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v0

    .line 163
    sget-object v2, Lcom/landleaf/smarthome/model/RoomModelDao$Properties;->FloorId:Lorg/greenrobot/greendao/Property;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/greenrobot/greendao/Property;->eq(Ljava/lang/Object;)Lorg/greenrobot/greendao/query/WhereCondition;

    move-result-object v2

    new-array v3, v1, [Lorg/greenrobot/greendao/query/WhereCondition;

    invoke-virtual {v0, v2, v3}, Lorg/greenrobot/greendao/query/QueryBuilder;->where(Lorg/greenrobot/greendao/query/WhereCondition;[Lorg/greenrobot/greendao/query/WhereCondition;)Lorg/greenrobot/greendao/query/QueryBuilder;

    .line 164
    invoke-virtual {v0}, Lorg/greenrobot/greendao/query/QueryBuilder;->build()Lorg/greenrobot/greendao/query/Query;

    move-result-object v0

    iput-object v0, p0, Lcom/landleaf/smarthome/model/RoomModelDao;->floorModel_RoomsQuery:Lorg/greenrobot/greendao/query/Query;

    .line 166
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModelDao;->floorModel_RoomsQuery:Lorg/greenrobot/greendao/query/Query;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/query/Query;->forCurrentThread()Lorg/greenrobot/greendao/query/Query;

    move-result-object v0

    .line 168
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/greenrobot/greendao/query/Query;->setParameter(ILjava/lang/Object;)Lorg/greenrobot/greendao/query/Query;

    .line 169
    invoke-virtual {v0}, Lorg/greenrobot/greendao/query/Query;->list()Ljava/util/List;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 166
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected final attachEntity(Lcom/landleaf/smarthome/model/RoomModel;)V
    .locals 1

    .line 103
    invoke-super {p0, p1}, Lorg/greenrobot/greendao/AbstractDao;->attachEntity(Ljava/lang/Object;)V

    .line 104
    iget-object v0, p0, Lcom/landleaf/smarthome/model/RoomModelDao;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/RoomModel;->__setDaoSession(Lcom/landleaf/smarthome/model/DaoSession;)V

    return-void
.end method

.method protected bridge synthetic attachEntity(Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/RoomModelDao;->attachEntity(Lcom/landleaf/smarthome/model/RoomModel;)V

    return-void
.end method

.method protected final bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/RoomModel;)V
    .locals 4

    .line 85
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 87
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 89
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 92
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 94
    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_1
    const/4 v0, 0x3

    .line 96
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomType()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x4

    .line 97
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getSortNo()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x5

    .line 98
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getFloorId()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    return-void
.end method

.method protected bridge synthetic bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/RoomModelDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/RoomModel;)V

    return-void
.end method

.method protected final bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/RoomModel;)V
    .locals 4

    .line 67
    invoke-interface {p1}, Lorg/greenrobot/greendao/database/DatabaseStatement;->clearBindings()V

    .line 69
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 71
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 74
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 76
    invoke-interface {p1, v1, v0}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    :cond_1
    const/4 v0, 0x3

    .line 78
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomType()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    const/4 v0, 0x4

    .line 79
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getSortNo()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    const/4 v0, 0x5

    .line 80
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/RoomModel;->getFloorId()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    return-void
.end method

.method protected bridge synthetic bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/RoomModelDao;->bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/RoomModel;)V

    return-void
.end method

.method public getKey(Lcom/landleaf/smarthome/model/RoomModel;)Ljava/lang/Long;
    .locals 0

    if-eqz p1, :cond_0

    .line 142
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/RoomModel;->getId()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/RoomModelDao;->getKey(Lcom/landleaf/smarthome/model/RoomModel;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public hasKey(Lcom/landleaf/smarthome/model/RoomModel;)Z
    .locals 0

    .line 150
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/RoomModel;->getId()Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic hasKey(Ljava/lang/Object;)Z
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/RoomModelDao;->hasKey(Lcom/landleaf/smarthome/model/RoomModel;)Z

    move-result p1

    return p1
.end method

.method protected final isEntityUpdateable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/RoomModel;
    .locals 8

    .line 114
    new-instance v7, Lcom/landleaf/smarthome/model/RoomModel;

    add-int/lit8 v0, p2, 0x0

    .line 115
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    move-object v1, v0

    :goto_0
    add-int/lit8 v0, p2, 0x1

    .line 116
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :goto_1
    add-int/lit8 v0, p2, 0x2

    .line 117
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    add-int/lit8 v0, p2, 0x3

    .line 118
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    add-int/lit8 p2, p2, 0x4

    .line 119
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/landleaf/smarthome/model/RoomModel;-><init>(Ljava/lang/Long;Ljava/lang/String;IIJ)V

    return-object v7
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/RoomModelDao;->readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/RoomModel;

    move-result-object p1

    return-object p1
.end method

.method public readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/RoomModel;I)V
    .locals 3

    add-int/lit8 v0, p3, 0x0

    .line 126
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v0, v2

    goto :goto_0

    :cond_0
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_0
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/RoomModel;->setId(Ljava/lang/Long;)V

    add-int/lit8 v0, p3, 0x1

    .line 127
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {p2, v2}, Lcom/landleaf/smarthome/model/RoomModel;->setRoomName(Ljava/lang/String;)V

    add-int/lit8 v0, p3, 0x2

    .line 128
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/RoomModel;->setRoomType(I)V

    add-int/lit8 v0, p3, 0x3

    .line 129
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/RoomModel;->setSortNo(I)V

    add-int/lit8 p3, p3, 0x4

    .line 130
    invoke-interface {p1, p3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/landleaf/smarthome/model/RoomModel;->setFloorId(J)V

    return-void
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;Ljava/lang/Object;I)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/RoomModelDao;->readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/RoomModel;I)V

    return-void
.end method

.method public readKey(Landroid/database/Cursor;I)Ljava/lang/Long;
    .locals 1

    add-int/lit8 p2, p2, 0x0

    .line 109
    invoke-interface {p1, p2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public bridge synthetic readKey(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/RoomModelDao;->readKey(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected final updateKeyAfterInsert(Lcom/landleaf/smarthome/model/RoomModel;J)Ljava/lang/Long;
    .locals 1

    .line 135
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/RoomModel;->setId(Ljava/lang/Long;)V

    .line 136
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic updateKeyAfterInsert(Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/RoomModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/RoomModelDao;->updateKeyAfterInsert(Lcom/landleaf/smarthome/model/RoomModel;J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method
