.class final enum Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;
.super Ljava/lang/Enum;
.source "CommsSender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/paho/client/mqttv3/internal/CommsSender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

.field public static final enum RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

.field public static final enum STARTING:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

.field public static final enum STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 38
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    const/4 v1, 0x0

    const-string v2, "STOPPED"

    invoke-direct {v0, v2, v1}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    const/4 v2, 0x1

    const-string v3, "RUNNING"

    invoke-direct {v0, v3, v2}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    const/4 v3, 0x2

    const-string v4, "STARTING"

    invoke-direct {v0, v4, v3}, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->STARTING:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    const/4 v4, 0x3

    new-array v4, v4, [Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    sget-object v5, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->STOPPED:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    aput-object v5, v4, v1

    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->RUNNING:Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    aput-object v1, v4, v2

    aput-object v0, v4, v3

    sput-object v4, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->ENUM$VALUES:[Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    return-object p0
.end method

.method public static values()[Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;
    .locals 4

    .line 1
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;->ENUM$VALUES:[Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    array-length v1, v0

    new-array v2, v1, [Lorg/eclipse/paho/client/mqttv3/internal/CommsSender$State;

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
