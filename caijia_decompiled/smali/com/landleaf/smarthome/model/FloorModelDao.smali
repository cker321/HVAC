.class public Lcom/landleaf/smarthome/model/FloorModelDao;
.super Lorg/greenrobot/greendao/AbstractDao;
.source "FloorModelDao.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/landleaf/smarthome/model/FloorModelDao$Properties;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/greenrobot/greendao/AbstractDao<",
        "Lcom/landleaf/smarthome/model/FloorModel;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# static fields
.field public static final TABLENAME:Ljava/lang/String; = "FLOOR_MODEL"


# instance fields
.field private daoSession:Lcom/landleaf/smarthome/model/DaoSession;


# direct methods
.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;)V

    return-void
.end method

.method public constructor <init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lcom/landleaf/smarthome/model/DaoSession;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2}, Lorg/greenrobot/greendao/AbstractDao;-><init>(Lorg/greenrobot/greendao/internal/DaoConfig;Lorg/greenrobot/greendao/AbstractDaoSession;)V

    .line 39
    iput-object p2, p0, Lcom/landleaf/smarthome/model/FloorModelDao;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    return-void
.end method

.method public static createTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "IF NOT EXISTS "

    goto :goto_0

    :cond_0
    const-string p1, ""

    .line 45
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"FLOOR_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"NAME\" TEXT,\"FLOOR\" INTEGER NOT NULL );"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public static dropTable(Lorg/greenrobot/greendao/database/Database;Z)V
    .locals 2

    .line 53
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

    const-string p1, "\"FLOOR_MODEL\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 54
    invoke-interface {p0, p1}, Lorg/greenrobot/greendao/database/Database;->execSQL(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected final attachEntity(Lcom/landleaf/smarthome/model/FloorModel;)V
    .locals 1

    .line 91
    invoke-super {p0, p1}, Lorg/greenrobot/greendao/AbstractDao;->attachEntity(Ljava/lang/Object;)V

    .line 92
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FloorModelDao;->daoSession:Lcom/landleaf/smarthome/model/DaoSession;

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/FloorModel;->__setDaoSession(Lcom/landleaf/smarthome/model/DaoSession;)V

    return-void
.end method

.method protected bridge synthetic attachEntity(Ljava/lang/Object;)V
    .locals 0

    .line 16
    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/FloorModelDao;->attachEntity(Lcom/landleaf/smarthome/model/FloorModel;)V

    return-void
.end method

.method protected final bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/FloorModel;)V
    .locals 4

    .line 75
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 77
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/FloorModel;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 79
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 82
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/FloorModel;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 84
    invoke-virtual {p1, v1, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    :cond_1
    const/4 v0, 0x3

    .line 86
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/FloorModel;->getFloor()I

    move-result p2

    int-to-long v1, p2

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    return-void
.end method

.method protected bridge synthetic bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 0

    .line 16
    check-cast p2, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/FloorModelDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Lcom/landleaf/smarthome/model/FloorModel;)V

    return-void
.end method

.method protected final bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/FloorModel;)V
    .locals 4

    .line 59
    invoke-interface {p1}, Lorg/greenrobot/greendao/database/DatabaseStatement;->clearBindings()V

    .line 61
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/FloorModel;->getId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 63
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    .line 66
    :cond_0
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/FloorModel;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 68
    invoke-interface {p1, v1, v0}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindString(ILjava/lang/String;)V

    :cond_1
    const/4 v0, 0x3

    .line 70
    invoke-virtual {p2}, Lcom/landleaf/smarthome/model/FloorModel;->getFloor()I

    move-result p2

    int-to-long v1, p2

    invoke-interface {p1, v0, v1, v2}, Lorg/greenrobot/greendao/database/DatabaseStatement;->bindLong(IJ)V

    return-void
.end method

.method protected bridge synthetic bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Ljava/lang/Object;)V
    .locals 0

    .line 16
    check-cast p2, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/FloorModelDao;->bindValues(Lorg/greenrobot/greendao/database/DatabaseStatement;Lcom/landleaf/smarthome/model/FloorModel;)V

    return-void
.end method

.method public getKey(Lcom/landleaf/smarthome/model/FloorModel;)Ljava/lang/Long;
    .locals 0

    if-eqz p1, :cond_0

    .line 126
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/FloorModel;->getId()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 16
    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/FloorModelDao;->getKey(Lcom/landleaf/smarthome/model/FloorModel;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public hasKey(Lcom/landleaf/smarthome/model/FloorModel;)Z
    .locals 0

    .line 134
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/FloorModel;->getId()Ljava/lang/Long;

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

    .line 16
    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/model/FloorModelDao;->hasKey(Lcom/landleaf/smarthome/model/FloorModel;)Z

    move-result p1

    return p1
.end method

.method protected final isEntityUpdateable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/FloorModel;
    .locals 5

    .line 102
    new-instance v0, Lcom/landleaf/smarthome/model/FloorModel;

    add-int/lit8 v1, p2, 0x0

    .line 103
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    move-object v1, v3

    goto :goto_0

    :cond_0
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :goto_0
    add-int/lit8 v2, p2, 0x1

    .line 104
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    add-int/lit8 p2, p2, 0x2

    .line 105
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-direct {v0, v1, v3, p1}, Lcom/landleaf/smarthome/model/FloorModel;-><init>(Ljava/lang/Long;Ljava/lang/String;I)V

    return-object v0
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/FloorModelDao;->readEntity(Landroid/database/Cursor;I)Lcom/landleaf/smarthome/model/FloorModel;

    move-result-object p1

    return-object p1
.end method

.method public readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/FloorModel;I)V
    .locals 3

    add-int/lit8 v0, p3, 0x0

    .line 112
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
    invoke-virtual {p2, v0}, Lcom/landleaf/smarthome/model/FloorModel;->setId(Ljava/lang/Long;)V

    add-int/lit8 v0, p3, 0x1

    .line 113
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {p2, v2}, Lcom/landleaf/smarthome/model/FloorModel;->setName(Ljava/lang/String;)V

    add-int/lit8 p3, p3, 0x2

    .line 114
    invoke-interface {p1, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/landleaf/smarthome/model/FloorModel;->setFloor(I)V

    return-void
.end method

.method public bridge synthetic readEntity(Landroid/database/Cursor;Ljava/lang/Object;I)V
    .locals 0

    .line 16
    check-cast p2, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/FloorModelDao;->readEntity(Landroid/database/Cursor;Lcom/landleaf/smarthome/model/FloorModel;I)V

    return-void
.end method

.method public readKey(Landroid/database/Cursor;I)Ljava/lang/Long;
    .locals 1

    add-int/lit8 p2, p2, 0x0

    .line 97
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

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/landleaf/smarthome/model/FloorModelDao;->readKey(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected final updateKeyAfterInsert(Lcom/landleaf/smarthome/model/FloorModel;J)Ljava/lang/Long;
    .locals 1

    .line 119
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/landleaf/smarthome/model/FloorModel;->setId(Ljava/lang/Long;)V

    .line 120
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic updateKeyAfterInsert(Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 0

    .line 16
    check-cast p1, Lcom/landleaf/smarthome/model/FloorModel;

    invoke-virtual {p0, p1, p2, p3}, Lcom/landleaf/smarthome/model/FloorModelDao;->updateKeyAfterInsert(Lcom/landleaf/smarthome/model/FloorModel;J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method
