.class public Lcom/landleaf/smarthome/model/SceneModelDao;
.super Lorg/greenrobot/greendao/AbstractDao;
.source "SceneModelDao.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/landleaf/smarthome/model/SceneModelDao$Properties;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/greenrobot/greendao/AbstractDao<",
        "Lcom/landleaf/smarthome/model/SceneModel;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# static fields
.field public static final TABLENAME:Ljava/lang/String; = "SCENE_MODEL"


# instance fields
.field private final actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;


# direct methods
.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V

    .line 37
    new-instance p1, Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-direct {p1}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;-><init>()V

    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModelDao;->actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    return-void
.end method

.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lorg/greenrobot/greendao/AbstractDaoSession;)V

    .line 37
    new-instance p1, Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-direct {p1}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;-><init>()V

    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModelDao;->actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    return-void
.end method

.method public static createTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "IF NOT EXISTS "

    goto :goto_0

    :cond_0
    const-string p1, ""

    .line 50
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"SCENE_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"ID\" TEXT,\"UPDATE_FLAG\" INTEGER NOT NULL ,\"NAME\" TEXT,\"MODE\" INTEGER NOT NULL ,\"SCENE_NO\" INTEGER NOT NULL ,\"ACTIONS\" TEXT);"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public static dropTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    .line 62
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

    const-string p1, "\"SCENE_MODEL\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 63
    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected final bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/SceneModel;)V
    .locals 4

    .line 96
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 98
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getSceneID()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 100
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 103
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 105
    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_1
    const/4 v0, 0x3

    .line 107
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getUpdateFlag()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 109
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x4

    .line 111
    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_2
    const/4 v0, 0x5

    .line 113
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getMode()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v0, 0x6

    .line 114
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getSceneNo()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 116
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getActions()Ljava/util/List;

    move-result-object p2

    if-eqz p2, :cond_3

    const/4 v0, 0x7

    .line 118
    iget-object v1, p0, Lcom/landleaf/smarthome/model/SceneModelDao;->actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-virtual {v1, p2}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToDatabaseValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_3
    return-void
.end method

.method protected bridge synthetic bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/SceneModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/SceneModelDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/SceneModel;)V

    return-void
.end method

.method protected final bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/SceneModel;)V
    .locals 4

    .line 68
    invoke-interface {p1}, Lorg/greenrobot/greendao/database/DatabaseStatement;->clearBindings()V

    .line 70
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getSceneID()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 75
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 77
    invoke-interface {p1, v1, v0}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    :cond_1
    const/4 v0, 0x3

    .line 79
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getUpdateFlag()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 81
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x4

    .line 83
    invoke-interface {p1, v1, v0}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    :cond_2
    const/4 v0, 0x5

    .line 85
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getMode()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    const/4 v0, 0x6

    .line 86
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getSceneNo()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 88
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/SceneModel;->getActions()Ljava/util/List;

    move-result-object p2

    if-eqz p2, :cond_3

    const/4 v0, 0x7

    .line 90
    iget-object v1, p0, Lcom/landleaf/smarthome/model/SceneModelDao;->actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-virtual {v1, p2}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToDatabaseValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    :cond_3
    return-void
.end method

.method protected bridge synthetic bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/SceneModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/SceneModelDao;->bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/SceneModel;)V

    return-void
.end method

.method public getKey(Lcom/landleaf/smarthome/model/SceneModel;)Ljava/lang/Long;
    .locals 0

    if-eqz p1, :cond_0

    .line 161
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneModel;->getSceneID()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/SceneModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/SceneModelDao;->getKey(Lcom/landleaf/smarthome/model/SceneModel;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public hasKey(Lcom/landleaf/smarthome/model/SceneModel;)Z
    .locals 0

    .line 169
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneModel;->getSceneID()Ljava/lang/Long;

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
    check-cast p1, Lcom/landleaf/smarthome/model/SceneModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/SceneModelDao;->hasKey(Lcom/landleaf/smarthome/model/SceneModel;)Z

    move-result p1

    return p1
.end method

.method protected final isEntityUpdateable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/SceneModel;
    .locals 9

    .line 129
    new-instance v8, Lcom/landleaf/smarthome/model/SceneModel;

    add-int/lit8 v0, p2, 0x0

    .line 130
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

    .line 131
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

    .line 132
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    add-int/lit8 v0, p2, 0x3

    .line 133
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_2

    move-object v5, v2

    goto :goto_2

    :cond_2
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    :goto_2
    add-int/lit8 v0, p2, 0x4

    .line 134
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    add-int/lit8 v0, p2, 0x5

    .line 135
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    add-int/lit8 p2, p2, 0x6

    .line 136
    invoke-interface {p1, p2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_3

    move-object p1, v2

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneModelDao;->actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToEntityProperty(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    :goto_3
    move-object v0, v8

    move-object v2, v3

    move v3, v4

    move-object v4, v5

    move v5, v6

    move v6, v7

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/landleaf/smarthome/model/SceneModel;-><init>(Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;IILjava/util/List;)V

    return-object v8
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/SceneModelDao;->readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/SceneModel;

    move-result-object p1

    return-object p1
.end method

.method public readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/SceneModel;I)V
    .locals 3

    add-int/lit8 v0, p3, 0x0

    .line 143
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
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setSceneID(Ljava/lang/Long;)V

    add-int/lit8 v0, p3, 0x1

    .line 144
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, v2

    goto :goto_1

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setId(Ljava/lang/String;)V

    add-int/lit8 v0, p3, 0x2

    .line 145
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setUpdateFlag(I)V

    add-int/lit8 v0, p3, 0x3

    .line 146
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_2

    move-object v0, v2

    goto :goto_2

    :cond_2
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setName(Ljava/lang/String;)V

    add-int/lit8 v0, p3, 0x4

    .line 147
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setMode(I)V

    add-int/lit8 v0, p3, 0x5

    .line 148
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setSceneNo(I)V

    add-int/lit8 p3, p3, 0x6

    .line 149
    invoke-interface {p1, p3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneModelDao;->actionsConverter:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-interface {p1, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToEntityProperty(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    :goto_3
    invoke-virtual {p2, v2}, Lcom/landleaf/smarthome/model/SceneModel;->setActions(Ljava/util/List;)V

    return-void
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;Ljava/lang/Object;I)V
    .locals 0

    .line 19
    check-cast p2, Lcom/landleaf/smarthome/model/SceneModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/SceneModelDao;->readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/SceneModel;I)V

    return-void
.end method

.method public readKey(Landroid/database/Cursor;I)Ljava/lang/Long;
    .locals 1

    add-int/lit8 p2, p2, 0x0

    .line 124
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
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/SceneModelDao;->readKey(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected final updateKeyAfterInsert(Lcom/landleaf/smarthome/model/SceneModel;J)Ljava/lang/Long;
    .locals 1

    .line 154
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/SceneModel;->setSceneID(Ljava/lang/Long;)V

    .line 155
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic updateKeyAfterInsert(Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Lcom/landleaf/smarthome/model/SceneModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/SceneModelDao;->updateKeyAfterInsert(Lcom/landleaf/smarthome/model/SceneModel;J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method
