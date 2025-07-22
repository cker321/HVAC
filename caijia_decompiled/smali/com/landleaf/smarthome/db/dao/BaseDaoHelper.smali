.class public Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;
.super Ljava/lang/Object;
.source "BaseDaoHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/greenrobot/greendao/AbstractDao;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected dao:Lorg/greenrobot/greendao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected mManager:Lcom/landleaf/smarthome/db/manager/DbManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getInstance()Lcom/landleaf/smarthome/db/manager/DbManager;

    move-result-object v0

    iput-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->mManager:Lcom/landleaf/smarthome/db/manager/DbManager;

    return-void
.end method

.method public constructor <init>(Lorg/greenrobot/greendao/AbstractDao;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {}, Lcom/landleaf/smarthome/db/manager/DbManager;->getInstance()Lcom/landleaf/smarthome/db/manager/DbManager;

    move-result-object v0

    iput-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->mManager:Lcom/landleaf/smarthome/db/manager/DbManager;

    .line 25
    iput-object p1, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    return-void
.end method


# virtual methods
.method public deleteAll()V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->deleteAll()V

    .line 50
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->detachAll()V

    return-void
.end method

.method public deleteOneData(J)V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/greenrobot/greendao/AbstractDao;->deleteByKey(Ljava/lang/Object;)V

    .line 103
    iget-object p1, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/AbstractDao;->detachAll()V

    return-void
.end method

.method public deleteOneData(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 107
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, p1}, Lorg/greenrobot/greendao/AbstractDao;->delete(Ljava/lang/Object;)V

    .line 108
    iget-object p1, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/AbstractDao;->detachAll()V

    return-void
.end method

.method public findAllData()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TR;>;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->loadAll()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 75
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    return-object v0

    .line 76
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getDataCount()J
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method public insertDatas(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TR;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 60
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, p1}, Lorg/greenrobot/greendao/AbstractDao;->insertOrReplaceInTx(Ljava/lang/Iterable;)V

    .line 62
    iget-object p1, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/AbstractDao;->detachAll()V

    :cond_0
    return-void
.end method

.method public insertOneData(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)Z"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, p1}, Lorg/greenrobot/greendao/AbstractDao;->insertOrReplace(Ljava/lang/Object;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 38
    :goto_0
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0}, Lorg/greenrobot/greendao/AbstractDao;->detachAll()V

    return p1
.end method

.method public updateModel(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)Z"
        }
    .end annotation

    .line 91
    :try_start_0
    iget-object v0, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {v0, p1}, Lorg/greenrobot/greendao/AbstractDao;->update(Ljava/lang/Object;)V

    .line 92
    iget-object p1, p0, Lcom/landleaf/smarthome/db/dao/BaseDaoHelper;->dao:Lorg/greenrobot/greendao/AbstractDao;

    invoke-virtual {p1}, Lorg/greenrobot/greendao/AbstractDao;->detachAll()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 95
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    :goto_0
    return p1
.end method
