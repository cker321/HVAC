.class public Lcom/dnake/desktop/bean/AirControlReturn;
.super Ljava/lang/Object;
.source "AirControlReturn.java"


# instance fields
.field private msg:Ljava/lang/String;

.field private ok:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/dnake/desktop/bean/AirControlReturn;->msg:Ljava/lang/String;

    .line 16
    iput-boolean p2, p0, Lcom/dnake/desktop/bean/AirControlReturn;->ok:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/AirControlReturn;->ok:Z

    return-void
.end method


# virtual methods
.method public getMsg()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/dnake/desktop/bean/AirControlReturn;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public isOk()Z
    .locals 1

    .line 20
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/AirControlReturn;->ok:Z

    return v0
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/dnake/desktop/bean/AirControlReturn;->msg:Ljava/lang/String;

    return-void
.end method

.method public setOk(Z)V
    .locals 0

    .line 24
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/AirControlReturn;->ok:Z

    return-void
.end method
