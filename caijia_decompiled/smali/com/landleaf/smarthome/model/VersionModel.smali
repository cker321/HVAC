.class public Lcom/landleaf/smarthome/model/VersionModel;
.super Ljava/lang/Object;
.source "VersionModel.java"


# instance fields
.field private updateFlag:Z

.field private url:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/landleaf/smarthome/model/VersionModel;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/landleaf/smarthome/model/VersionModel;->version:Ljava/lang/String;

    return-object v0
.end method

.method public isUpdateFlag()Z
    .locals 1

    .line 38
    iget-boolean v0, p0, Lcom/landleaf/smarthome/model/VersionModel;->updateFlag:Z

    return v0
.end method

.method public setUpdateFlag(Z)V
    .locals 0

    .line 42
    iput-boolean p1, p0, Lcom/landleaf/smarthome/model/VersionModel;->updateFlag:Z

    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/landleaf/smarthome/model/VersionModel;->url:Ljava/lang/String;

    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/landleaf/smarthome/model/VersionModel;->version:Ljava/lang/String;

    return-void
.end method
