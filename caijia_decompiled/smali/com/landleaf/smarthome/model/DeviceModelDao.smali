.class public Lcom/landleaf/smarthome/model/DeviceModelDao;
.super Lorg/greenrobot/greendao/AbstractDao;
.source "DeviceModelDao.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/greenrobot/greendao/AbstractDao<",
        "Lcom/landleaf/smarthome/model/DeviceModel;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# static fields
.field public static final TABLENAME:Ljava/lang/String; = "DEVICE_MODEL"


# instance fields
.field private roomModel_DevicesQuery:Lorg/greenrobot/greendao/query/Query;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/greenrobot/greendao/query/Query<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V

    return-void
.end method

.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lorg/greenrobot/greendao/AbstractDaoSession;)V

    return-void
.end method

.method public static createTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "IF NOT EXISTS "

    goto :goto_0

    :cond_0
    const-string p1, ""

    .line 52
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"DEVICE_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"DEVICE_SN\" TEXT,\"DEVICE_NAME\" TEXT,\"PORT\" INTEGER NOT NULL ,\"PROTOCOL\" INTEGER NOT NULL ,\"SORT_NO\" INTEGER NOT NULL ,\"ROOM_ID\" INTEGER,\"PRODUCT_CODE\" INTEGER NOT NULL ,\"HVAC_FLAG\" INTEGER NOT NULL );"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public static dropTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    .line 66
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

    const-string p1, "\"DEVICE_MODEL\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 67
    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public _queryRoomModel_Devices(Ljava/lang/Long;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            ")",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation

    .line 191
    monitor-enter p0

    .line 192
    :try_start_0
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModelDao;->roomModel_DevicesQuery:Lorg/greenrobot/greendao/query/Query;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModelDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v0

    .line 194
    sget-object v2, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->RoomId:Lorg/greenrobot/greendao/Property;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/greenrobot/greendao/Property;->eq(Ljava/lang/Object;)Lorg/greenrobot/greendao/query/WhereCondition;

    move-result-object v2

    new-array v3, v1, [Lorg/greenrobot/greendao/query/WhereCondition;

    invoke-virtual {v0, v2, v3}, Lorg/greenrobot/greendao/query/QueryBuilder;->where(Lorg/greenrobot/greendao/query/WhereCondition;[Lorg/greenrobot/greendao/query/WhereCondition;)Lorg/greenrobot/greendao/query/QueryBuilder;

    .line 195
    invoke-virtual {v0}, Lorg/greenrobot/greendao/query/QueryBuilder;->build()Lorg/greenrobot/greendao/query/Query;

    move-result-object v0

    iput-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModelDao;->roomModel_DevicesQuery:Lorg/greenrobot/greendao/query/Query;

    .line 197
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceModelDao;->roomModel_DevicesQuery:Lorg/greenrobot/greendao/query/Query;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/query/Query;->forCurrentThread()Lorg/greenrobot/greendao/query/Query;

    move-result-object v0

    .line 199
    invoke-virtual {v0, v1, p1}, Lorg/greenrobot/greendao/query/Query;->setParameter(ILjava/lang/Object;)Lorg/greenrobot/greendao/query/Query;

    .line 200
    invoke-virtual {v0}, Lorg/greenrobot/greendao/query/Query;->list()Ljava/util/List;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 197
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected final bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 4

    .line 102
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 104
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 106
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 109
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 111
    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 114
    :cond_1
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    .line 116
    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_2
    const/4 v0, 0x4

    .line 118
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getPort()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x5

    .line 119
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getProtocol()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x6

    .line 120
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getSortNo()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 122
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getRoomId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v1, 0x7

    .line 124
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    :cond_3
    const/16 v0, 0x8

    .line 126
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/16 v0, 0x9

    .line 127
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getHvacFlag()I

    move-result p2

    int-to-long v1, p2

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    return-void
.end method

.method protected bridge synthetic bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DeviceModelDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method

.method protected final bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/DeviceModel;)V
    .locals 4

    .line 72
    invoke-interface {p1}, Lorg/greenrobot/greendao/database/DatabaseStatement;->clearBindings()V

    .line 74
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 76
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 79
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 81
    invoke-interface {p1, v1, v0}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    .line 84
    :cond_1
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    .line 86
    invoke-interface {p1, v1, v0}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    :cond_2
    const/4 v0, 0x4

    .line 88
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getPort()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    const/4 v0, 0x5

    .line 89
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getProtocol()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    const/4 v0, 0x6

    .line 90
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getSortNo()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 92
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getRoomId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v1, 0x7

    .line 94
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    :cond_3
    const/16 v0, 0x8

    .line 96
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    const/16 v0, 0x9

    .line 97
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/DeviceModel;->getHvacFlag()I

    move-result p2

    int-to-long v1, p2

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    return-void
.end method

.method protected bridge synthetic bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DeviceModelDao;->bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/DeviceModel;)V

    return-void
.end method

.method public getKey(Lcom/landleaf/smarthome/model/DeviceModel;)Ljava/lang/Long;
    .locals 0

    if-eqz p1, :cond_0

    .line 173
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getId()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DeviceModelDao;->getKey(Lcom/landleaf/smarthome/model/DeviceModel;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public hasKey(Lcom/landleaf/smarthome/model/DeviceModel;)Z
    .locals 0

    .line 181
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/DeviceModel;->getId()Ljava/lang/Long;

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
    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/DeviceModelDao;->hasKey(Lcom/landleaf/smarthome/model/DeviceModel;)Z

    move-result p1

    return p1
.end method

.method protected final isEntityUpdateable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/DeviceModel;
    .locals 11

    .line 137
    new-instance v10, Lcom/landleaf/smarthome/model/DeviceModel;

    add-int/lit8 v0, p2, 0x0

    .line 138
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

    .line 139
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v3, v2

    goto :goto_1

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    :goto_1
    add-int/lit8 v0, p2, 0x2

    .line 140
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v4, v2

    goto :goto_2

    :cond_2
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    :goto_2
    add-int/lit8 v0, p2, 0x3

    .line 141
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    add-int/lit8 v0, p2, 0x4

    .line 142
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    add-int/lit8 v0, p2, 0x5

    .line 143
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    add-int/lit8 v0, p2, 0x6

    .line 144
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_3

    move-object v8, v2

    goto :goto_3

    :cond_3
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    move-object v8, v0

    :goto_3
    add-int/lit8 v0, p2, 0x7

    .line 145
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    add-int/lit8 p2, p2, 0x8

    .line 146
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    move-object v0, v10

    move-object v2, v3

    move-object v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move-object v7, v8

    move v8, v9

    move v9, p1

    invoke-direct/range {v0 .. v9}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/Long;II)V

    return-object v10
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DeviceModelDao;->readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/DeviceModel;

    move-result-object p1

    return-object p1
.end method

.method public readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/DeviceModel;I)V
    .locals 3

    add-int/lit8 v0, p3, 0x0

    .line 153
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
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setId(Ljava/lang/Long;)V

    add-int/lit8 v0, p3, 0x1

    .line 154
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, v2

    goto :goto_1

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    add-int/lit8 v0, p3, 0x2

    .line 155
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_2

    move-object v0, v2

    goto :goto_2

    :cond_2
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceName(Ljava/lang/String;)V

    add-int/lit8 v0, p3, 0x3

    .line 156
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setPort(I)V

    add-int/lit8 v0, p3, 0x4

    .line 157
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setProtocol(I)V

    add-int/lit8 v0, p3, 0x5

    .line 158
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setSortNo(I)V

    add-int/lit8 v0, p3, 0x6

    .line 159
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    :goto_3
    invoke-virtual {p2, v2}, Lcom/landleaf/smarthome/model/DeviceModel;->setRoomId(Ljava/lang/Long;)V

    add-int/lit8 v0, p3, 0x7

    .line 160
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    add-int/lit8 p3, p3, 0x8

    .line 161
    invoke-interface {p1, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/landleaf/smarthome/model/DeviceModel;->setHvacFlag(I)V

    return-void
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;Ljava/lang/Object;I)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/DeviceModelDao;->readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/DeviceModel;I)V

    return-void
.end method

.method public readKey(Landroid/database/Cursor;I)Ljava/lang/Long;
    .locals 1

    add-int/lit8 p2, p2, 0x0

    .line 132
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
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/DeviceModelDao;->readKey(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected final updateKeyAfterInsert(Lcom/landleaf/smarthome/model/DeviceModel;J)Ljava/lang/Long;
    .locals 1

    .line 166
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/DeviceModel;->setId(Ljava/lang/Long;)V

    .line 167
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic updateKeyAfterInsert(Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/DeviceModelDao;->updateKeyAfterInsert(Lcom/landleaf/smarthome/model/DeviceModel;J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method
