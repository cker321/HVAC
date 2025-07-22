.class public Lcom/dnake/desktop/bean/LandleafDbEvent;
.super Ljava/lang/Object;
.source "LandleafDbEvent.java"


# instance fields
.field private res:Z

.field private useErrorProtocol:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->res:Z

    return-void
.end method


# virtual methods
.method public isRes()Z
    .locals 1

    .line 25
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->res:Z

    return v0
.end method

.method public isUseErrorProtocol()Z
    .locals 1

    .line 13
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->useErrorProtocol:Z

    return v0
.end method

.method public setRes(Z)V
    .locals 0

    .line 29
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->res:Z

    return-void
.end method

.method public setUseErrorProtocol(Z)V
    .locals 0

    .line 17
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->useErrorProtocol:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LandleafDbEvent{res="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->res:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", useErrorProtocol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/LandleafDbEvent;->useErrorProtocol:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
