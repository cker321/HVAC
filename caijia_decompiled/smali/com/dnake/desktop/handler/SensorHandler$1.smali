.class synthetic Lcom/dnake/desktop/handler/SensorHandler$1;
.super Ljava/lang/Object;
.source "SensorHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/handler/SensorHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dnake$desktop$bean$SensorType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 154
    invoke-static {}, Lcom/dnake/desktop/bean/SensorType;->values()[Lcom/dnake/desktop/bean/SensorType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dnake/desktop/handler/SensorHandler$1;->$SwitchMap$com$dnake$desktop$bean$SensorType:[I

    :try_start_0
    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->MULTIPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/SensorType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dnake/desktop/handler/SensorHandler$1;->$SwitchMap$com$dnake$desktop$bean$SensorType:[I

    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->SIMPLE_SENSOR:Lcom/dnake/desktop/bean/SensorType;

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/SensorType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dnake/desktop/handler/SensorHandler$1;->$SwitchMap$com$dnake$desktop$bean$SensorType:[I

    sget-object v1, Lcom/dnake/desktop/bean/SensorType;->Z2_GC:Lcom/dnake/desktop/bean/SensorType;

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/SensorType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
