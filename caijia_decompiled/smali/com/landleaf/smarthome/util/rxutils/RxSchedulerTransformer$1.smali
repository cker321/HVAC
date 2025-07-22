.class synthetic Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;
.super Ljava/lang/Object;
.source "RxSchedulerTransformer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 101
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->values()[Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    :try_start_0
    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_main:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerTransformer$1;->$SwitchMap$com$landleaf$smarthome$util$rxutils$SchedulerType:[I

    sget-object v1, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->_io_io:Lcom/landleaf/smarthome/util/rxutils/SchedulerType;

    invoke-virtual {v1}, Lcom/landleaf/smarthome/util/rxutils/SchedulerType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
