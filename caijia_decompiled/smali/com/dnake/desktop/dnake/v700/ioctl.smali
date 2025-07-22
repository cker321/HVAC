.class public Lcom/dnake/desktop/dnake/v700/ioctl;
.super Ljava/lang/Object;
.source "ioctl.java"


# static fields
.field private static hooter_onoff:I = 0x64


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hooter(I)V
    .locals 3

    .line 8
    sget v0, Lcom/dnake/desktop/dnake/v700/ioctl;->hooter_onoff:I

    if-eq v0, p0, :cond_0

    .line 9
    new-instance v0, Lcom/dnake/desktop/dnake/v700/dmsg;

    invoke-direct {v0}, Lcom/dnake/desktop/dnake/v700/dmsg;-><init>()V

    .line 10
    new-instance v1, Lcom/dnake/desktop/dnake/v700/dxml;

    invoke-direct {v1}, Lcom/dnake/desktop/dnake/v700/dxml;-><init>()V

    const-string v2, "/params/onoff"

    .line 11
    invoke-virtual {v1, v2, p0}, Lcom/dnake/desktop/dnake/v700/dxml;->setInt(Ljava/lang/String;I)V

    .line 12
    invoke-virtual {v1}, Lcom/dnake/desktop/dnake/v700/dxml;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/control/hooter"

    invoke-virtual {v0, v2, v1}, Lcom/dnake/desktop/dnake/v700/dmsg;->to(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    sput p0, Lcom/dnake/desktop/dnake/v700/ioctl;->hooter_onoff:I

    :cond_0
    return-void
.end method
