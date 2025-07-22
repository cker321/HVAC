.class public Lcom/landleaf/smarthome/model/FamilyModel;
.super Ljava/lang/Object;
.source "FamilyModel.java"


# instance fields
.field private familyCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFamilyCode()Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/landleaf/smarthome/model/FamilyModel;->familyCode:Ljava/lang/String;

    return-object v0
.end method

.method public setFamilyCode(Ljava/lang/String;)V
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/landleaf/smarthome/model/FamilyModel;->familyCode:Ljava/lang/String;

    return-void
.end method
