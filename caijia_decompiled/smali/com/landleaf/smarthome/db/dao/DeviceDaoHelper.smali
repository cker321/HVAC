.class public Lcom/landleaf/smarthome/db/dao/DeviceDaoHelper;
.super Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;
.source "DeviceDaoHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/landleaf/smarthome/db/dao/BaseDaoHelper<",
        "Lcom/landleaf/smarthome/model/DeviceModelDao;",
        "Lcom/landleaf/smarthome/model/DeviceModel;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;-><init>()V

    .line 17
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getInstance()Lcom/landleaf/smarthome/db/manager/DbManager;

    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getDaoSession()Lcom/landleaf/smarthome/model/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DaoSession;->getDeviceModelDao()Lcom/landleaf/smarthome/model/DeviceModelDao;

    move-result-object v0

    iput-object v0, p0, Lcom/landleaf/smarthome/db/dao/DeviceDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    return-void
.end method


# virtual methods
.method public findDevice4Sn(Ljava/lang/String;)Lcom/landleaf/smarthome/model/DeviceModel;
    .locals 2

    .line 26
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/DeviceDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    check-cast v0, Lcom/landleaf/smarthome/model/DeviceModelDao;

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DeviceModelDao;->queryBuilder()Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object v0

    sget-object v1, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->DeviceSn:Lorg/greenrobot/greendao/Property;

    .line 27
    invoke-virtual {v1, p1}, Lorg/greenrobot/greendao/Property;->eq(Ljava/lang/Object;)Lorg/greenrobot/greendao/query/WhereCondition;

    move-result-object p1

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/greenrobot/greendao/query/WhereCondition;

    .line 26
    invoke-virtual {v0, p1, v1}, Lorg/greenrobot/greendao/query/QueryBuilder;->where(Lorg/greenrobot/greendao/query/WhereCondition;[Lorg/greenrobot/greendao/query/WhereCondition;)Lorg/greenrobot/greendao/query/QueryBuilder;

    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lorg/greenrobot/greendao/query/QueryBuilder;->unique()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/landleaf/smarthome/model/DeviceModel;

    return-object p1
.end method
