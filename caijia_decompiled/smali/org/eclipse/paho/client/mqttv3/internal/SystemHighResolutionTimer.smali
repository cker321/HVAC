.class public Lorg/eclipse/paho/client/mqttv3/internal/SystemHighResolutionTimer;
.super Ljava/lang/Object;
.source "SystemHighResolutionTimer.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/internal/HighResolutionTimer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public nanoTime()J
    .locals 2

    .line 30
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method
