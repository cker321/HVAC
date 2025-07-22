.class public final enum Lcom/dnake/desktop/bean/SensorType;
.super Ljava/lang/Enum;
.source "SensorType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dnake/desktop/bean/SensorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dnake/desktop/bean/SensorType;

.field public static final enum AROFENE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

.field public static final enum MULTIPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

.field public static final enum SIMPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

.field public static final enum Z2_GC:Lcom/dnake/desktop/bean/SensorType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 5
    new-instance v0, Lcom/dnake/desktop/bean/SensorType;

    const/4 v1, 0x0

    const-string v2, "MULTIPLE_SENSOR"

    invoke-direct {v0, v2, v1}, Lcom/dnake/desktop/bean/SensorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dnake/desktop/bean/SensorType;->MULTIPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    new-instance v0, Lcom/dnake/desktop/bean/SensorType;

    const/4 v2, 0x1

    const-string v3, "SIMPLE_SENSOR"

    invoke-direct {v0, v3, v2}, Lcom/dnake/desktop/bean/SensorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dnake/desktop/bean/SensorType;->SIMPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    new-instance v0, Lcom/dnake/desktop/bean/SensorType;

    const/4 v3, 0x2

    const-string v4, "AROFENE_SENSOR"

    invoke-direct {v0, v4, v3}, Lcom/dnake/desktop/bean/SensorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dnake/desktop/bean/SensorType;->AROFENE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    new-instance v0, Lcom/dnake/desktop/bean/SensorType;

    const/4 v4, 0x3

    const-string v5, "Z2_GC"

    invoke-direct {v0, v5, v4}, Lcom/dnake/desktop/bean/SensorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dnake/desktop/bean/SensorType;->Z2_GC:Lcom/dnake/desktop/bean/SensorType;

    const/4 v5, 0x4

    new-array v5, v5, [Lcom/dnake/desktop/bean/SensorType;

    .line 4
    sget-object v6, Lcom/dnake/desktop/bean/SensorType;->MULTIPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    aput-object v6, v5, v1

    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->SIMPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    aput-object v1, v5, v2

    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->AROFENE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Lcom/dnake/desktop/bean/SensorType;->$VALUES:[Lcom/dnake/desktop/bean/SensorType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dnake/desktop/bean/SensorType;
    .locals 1

    .line 4
    const-class v0, Lcom/dnake/desktop/bean/SensorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dnake/desktop/bean/SensorType;

    return-object p0
.end method

.method public static values()[Lcom/dnake/desktop/bean/SensorType;
    .locals 1

    .line 4
    sget-object v0, Lcom/dnake/desktop/bean/SensorType;->$VALUES:[Lcom/dnake/desktop/bean/SensorType;

    invoke-virtual {v0}, [Lcom/dnake/desktop/bean/SensorType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dnake/desktop/bean/SensorType;

    return-object v0
.end method
