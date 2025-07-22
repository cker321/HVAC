.class public Lcom/landleaf/smarthome/model/DeviceAttribute;
.super Ljava/lang/Object;
.source "DeviceAttribute.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private addValue:I

.field private attrTag:Ljava/lang/String;

.field private attrValue:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrTag:Ljava/lang/String;

    .line 26
    iput p2, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->addValue:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrTag:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrValue:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAddValue()I
    .locals 1

    .line 30
    iget v0, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->addValue:I

    return v0
.end method

.method public getAttrTag()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrTag:Ljava/lang/String;

    return-object v0
.end method

.method public getAttrValue()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrValue:Ljava/lang/String;

    return-object v0
.end method

.method public setAddValue(I)V
    .locals 0

    .line 34
    iput p1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->addValue:I

    return-void
.end method

.method public setAttrTag(Ljava/lang/String;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrTag:Ljava/lang/String;

    return-void
.end method

.method public setAttrValue(Ljava/lang/String;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrValue:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DeviceAttribute{attrTag=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", attrValue=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->attrValue:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", addValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/landleaf/smarthome/model/DeviceAttribute;->addValue:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
