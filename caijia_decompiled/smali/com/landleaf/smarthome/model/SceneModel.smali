.class public Lcom/landleaf/smarthome/model/SceneModel;
.super Ljava/lang/Object;
.source "SceneModel.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x58bc38f89e8ca6b3L


# instance fields
.field private actions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation
.end field

.field private id:Ljava/lang/String;

.field private mode:I

.field private name:Ljava/lang/String;

.field private sceneID:Ljava/lang/Long;

.field private sceneNo:I

.field private updateFlag:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneID:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;IILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;)V"
        }
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneID:Ljava/lang/Long;

    .line 40
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneID:Ljava/lang/Long;

    .line 41
    iput-object p2, p0, Lcom/landleaf/smarthome/model/SceneModel;->id:Ljava/lang/String;

    .line 42
    iput p3, p0, Lcom/landleaf/smarthome/model/SceneModel;->updateFlag:I

    .line 43
    iput-object p4, p0, Lcom/landleaf/smarthome/model/SceneModel;->name:Ljava/lang/String;

    .line 44
    iput p5, p0, Lcom/landleaf/smarthome/model/SceneModel;->mode:I

    .line 45
    iput p6, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneNo:I

    .line 46
    iput-object p7, p0, Lcom/landleaf/smarthome/model/SceneModel;->actions:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getActions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->actions:Ljava/util/List;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .line 98
    iget v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->mode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSceneID()Ljava/lang/Long;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneID:Ljava/lang/Long;

    return-object v0
.end method

.method public getSceneNo()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneNo:I

    return v0
.end method

.method public getUpdateFlag()I
    .locals 1

    .line 74
    iget v0, p0, Lcom/landleaf/smarthome/model/SceneModel;->updateFlag:I

    return v0
.end method

.method public setActions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;)V"
        }
    .end annotation

    .line 94
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->actions:Ljava/util/List;

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->id:Ljava/lang/String;

    return-void
.end method

.method public setMode(I)V
    .locals 0

    .line 102
    iput p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->mode:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 86
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->name:Ljava/lang/String;

    return-void
.end method

.method public setSceneID(Ljava/lang/Long;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneID:Ljava/lang/Long;

    return-void
.end method

.method public setSceneNo(I)V
    .locals 0

    .line 110
    iput p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->sceneNo:I

    return-void
.end method

.method public setUpdateFlag(I)V
    .locals 0

    .line 78
    iput p1, p0, Lcom/landleaf/smarthome/model/SceneModel;->updateFlag:I

    return-void
.end method
