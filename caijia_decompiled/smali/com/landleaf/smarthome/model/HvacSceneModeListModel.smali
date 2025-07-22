.class public Lcom/landleaf/smarthome/model/HvacSceneModeListModel;
.super Ljava/lang/Object;
.source "HvacSceneModeListModel.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field attrs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation
.end field

.field temPanel:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAtts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/landleaf/smarthome/model/HvacSceneModeListModel;->attrs:Ljava/util/List;

    return-object v0
.end method

.method public getTemPanel()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lcom/landleaf/smarthome/model/HvacSceneModeListModel;->temPanel:Ljava/util/List;

    return-object v0
.end method

.method public setAtts(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceAttribute;",
            ">;)V"
        }
    .end annotation

    .line 58
    iput-object p1, p0, Lcom/landleaf/smarthome/model/HvacSceneModeListModel;->attrs:Ljava/util/List;

    return-void
.end method

.method public setTemPanel(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;)V"
        }
    .end annotation

    .line 66
    iput-object p1, p0, Lcom/landleaf/smarthome/model/HvacSceneModeListModel;->temPanel:Ljava/util/List;

    return-void
.end method
