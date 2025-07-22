.class public Lcom/landleaf/smarthome/db/manager/DbManager;
.super Ljava/lang/Object;
.source "DbManager.java"


# static fields
.field private static final DB_NAME:Ljava/lang/String; = "landleaf.db"

.field private static context:Landroid/content/Context;

.field private static volatile mDaoMaster:Lcom/landleaf/smarthome/model/DaoMaster;

.field private static volatile mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

.field private static volatile mDbManager:Lcom/landleaf/smarthome/db/manager/DbManager;

.field private static mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    sput-object p1, Lcom/landleaf/smarthome/db/manager/DbManager;->context:Landroid/content/Context;

    .line 31
    new-instance v0, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    const-string v1, "landleaf.db"

    invoke-direct {v0, p1, v1}, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    .line 32
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getDaoMaster()Lcom/landleaf/smarthome/model/DaoMaster;

    .line 33
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getDaoSession()Lcom/landleaf/smarthome/model/DaoSession;

    return-void
.end method

.method public static getDaoMaster()Lcom/landleaf/smarthome/model/DaoMaster;
    .locals 3

    .line 93
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoMaster:Lcom/landleaf/smarthome/model/DaoMaster;

    if-nez v0, :cond_1

    .line 94
    const-class v0, Lcom/landleaf/smarthome/db/manager/DbManager;

    monitor-enter v0

    .line 95
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoMaster:Lcom/landleaf/smarthome/model/DaoMaster;

    if-nez v1, :cond_0

    .line 99
    new-instance v1, Lcom/landleaf/smarthome/model/DaoMaster;

    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/landleaf/smarthome/model/DaoMaster;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    sput-object v1, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoMaster:Lcom/landleaf/smarthome/model/DaoMaster;

    .line 101
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 103
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoMaster:Lcom/landleaf/smarthome/model/DaoMaster;

    return-object v0
.end method

.method public static getDaoSession()Lcom/landleaf/smarthome/model/DaoSession;
    .locals 2

    .line 113
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

    if-nez v0, :cond_0

    .line 114
    const-class v0, Lcom/landleaf/smarthome/db/manager/DbManager;

    monitor-enter v0

    .line 115
    :try_start_0
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getDaoMaster()Lcom/landleaf/smarthome/model/DaoMaster;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/DaoMaster;->newSession()Lcom/landleaf/smarthome/model/DaoSession;

    move-result-object v1

    sput-object v1, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

    .line 116
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 119
    :cond_0
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

    return-object v0
.end method

.method public static getInstance()Lcom/landleaf/smarthome/db/manager/DbManager;
    .locals 3

    .line 37
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDbManager:Lcom/landleaf/smarthome/db/manager/DbManager;

    if-nez v0, :cond_1

    .line 38
    const-class v0, Lcom/landleaf/smarthome/db/manager/DbManager;

    monitor-enter v0

    .line 39
    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/db/manager/DbManager;->mDbManager:Lcom/landleaf/smarthome/db/manager/DbManager;

    if-nez v1, :cond_0

    .line 40
    new-instance v1, Lcom/landleaf/smarthome/db/manager/DbManager;

    sget-object v2, Lcom/landleaf/smarthome/db/manager/DbManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/landleaf/smarthome/db/manager/DbManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/landleaf/smarthome/db/manager/DbManager;->mDbManager:Lcom/landleaf/smarthome/db/manager/DbManager;

    .line 42
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 44
    :cond_1
    :goto_0
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDbManager:Lcom/landleaf/smarthome/db/manager/DbManager;

    return-object v0
.end method

.method public static getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .line 66
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    if-nez v0, :cond_0

    .line 67
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getInstance()Lcom/landleaf/smarthome/db/manager/DbManager;

    .line 69
    :cond_0
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .line 79
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    if-nez v0, :cond_0

    .line 80
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getInstance()Lcom/landleaf/smarthome/db/manager/DbManager;

    .line 83
    :cond_0
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static setDebug()V
    .locals 1

    const/4 v0, 0x1

    .line 53
    sput-boolean v0, Lorg/greenrobot/greendao/query/QueryBuilder;->LOG_SQL:Z

    .line 55
    sput-boolean v0, Lorg/greenrobot/greendao/query/QueryBuilder;->LOG_VALUES:Z

    return-void
.end method


# virtual methods
.method public closeConnection()V
    .locals 0

    .line 127
    invoke-virtual {p0}, Lcom/landleaf/smarthome/db/manager/DbManager;->closeHelper()V

    .line 128
    invoke-virtual {p0}, Lcom/landleaf/smarthome/db/manager/DbManager;->closeDaoSession()V

    return-void
.end method

.method public closeDaoSession()V
    .locals 1

    .line 140
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

    if-eqz v0, :cond_0

    .line 141
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoSession;->clear()V

    const/4 v0, 0x0

    .line 142
    sput-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDaoSession:Lcom/landleaf/smarthome/model/DaoSession;

    :cond_0
    return-void
.end method

.method public closeHelper()V
    .locals 1

    .line 132
    sget-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;->close()V

    const/4 v0, 0x0

    .line 134
    sput-object v0, Lcom/landleaf/smarthome/db/manager/DbManager;->mDevOpenHelper:Lcom/landleaf/smarthome/model/DaoMaster$DevOpenHelper;

    :cond_0
    return-void
.end method
