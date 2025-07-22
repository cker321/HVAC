.class public final enum Lcom/landleaf/smarthome/util/rxutils/SchedulerType;
.super Ljava/lang/Enum;
.source "SchedulerType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/landleaf/smarthome/util/rxutils/SchedulerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

.field public static final enum _io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

.field public static final enum _io_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

.field public static final enum _io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

.field public static final enum _main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 15
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    const/4 v1, 0x0

    const-string v2, "_main"

    invoke-direct {v0, v2, v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    .line 19
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    const/4 v2, 0x1

    const-string v3, "_io"

    invoke-direct {v0, v3, v2}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    .line 23
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    const/4 v3, 0x2

    const-string v4, "_io_main"

    invoke-direct {v0, v4, v3}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    .line 27
    new-instance v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    const/4 v4, 0x3

    const-string v5, "_io_io"

    invoke-direct {v0, v5, v4}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    const/4 v5, 0x4

    new-array v5, v5, [Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    .line 10
    sget-object v6, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    aput-object v6, v5, v1

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    aput-object v1, v5, v2

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->$VALUES:[Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/landleaf/smarthome/util/rxutils/SchedulerType;
    .locals 1

    .line 10
    const-class v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    return-object p0
.end method

.method public static values()[Lcom/landleaf/smarthome/util/rxutils/SchedulerType;
    .locals 1

    .line 10
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->$VALUES:[Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v0}, [Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    return-object v0
.end method
