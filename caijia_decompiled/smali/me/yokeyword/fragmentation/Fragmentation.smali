.class public Lme/yokeyword/fragmentation/Fragmentation;
.super Ljava/lang/Object;
.source "Fragmentation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;
    }
.end annotation


# static fields
.field public static final BUBBLE:I = 0x2

.field static volatile INSTANCE:Lme/yokeyword/fragmentation/Fragmentation; = null

.field public static final NONE:I = 0x0

.field public static final SHAKE:I = 0x1


# instance fields
.field private debug:Z

.field private handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

.field private mode:I


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 30
    iput v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->mode:I

    .line 50
    invoke-static {p1}, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->access$000(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)Z

    move-result v0

    iput-boolean v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->debug:Z

    if-eqz v0, :cond_0

    .line 52
    invoke-static {p1}, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->access$100(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)I

    move-result v0

    iput v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->mode:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 54
    iput v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->mode:I

    .line 56
    :goto_0
    invoke-static {p1}, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->access$200(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    move-result-object p1

    iput-object p1, p0, Lme/yokeyword/fragmentation/Fragmentation;->handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    return-void
.end method

.method public static builder()Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;
    .locals 1

    .line 84
    new-instance v0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;-><init>()V

    return-object v0
.end method

.method public static getDefault()Lme/yokeyword/fragmentation/Fragmentation;
    .locals 3

    .line 39
    sget-object v0, Lme/yokeyword/fragmentation/Fragmentation;->INSTANCE:Lme/yokeyword/fragmentation/Fragmentation;

    if-nez v0, :cond_1

    .line 40
    const-class v0, Lme/yokeyword/fragmentation/Fragmentation;

    monitor-enter v0

    .line 41
    :try_start_0
    sget-object v1, Lme/yokeyword/fragmentation/Fragmentation;->INSTANCE:Lme/yokeyword/fragmentation/Fragmentation;

    if-nez v1, :cond_0

    .line 42
    new-instance v1, Lme/yokeyword/fragmentation/Fragmentation;

    new-instance v2, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;

    invoke-direct {v2}, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;-><init>()V

    invoke-direct {v1, v2}, Lme/yokeyword/fragmentation/Fragmentation;-><init>(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)V

    sput-object v1, Lme/yokeyword/fragmentation/Fragmentation;->INSTANCE:Lme/yokeyword/fragmentation/Fragmentation;

    .line 44
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 46
    :cond_1
    :goto_0
    sget-object v0, Lme/yokeyword/fragmentation/Fragmentation;->INSTANCE:Lme/yokeyword/fragmentation/Fragmentation;

    return-object v0
.end method


# virtual methods
.method public getHandler()Lme/yokeyword/fragmentation/helper/ExceptionHandler;
    .locals 1

    .line 68
    iget-object v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .line 76
    iget v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->mode:I

    return v0
.end method

.method public isDebug()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/Fragmentation;->debug:Z

    return v0
.end method

.method public setDebug(Z)V
    .locals 0

    .line 64
    iput-boolean p1, p0, Lme/yokeyword/fragmentation/Fragmentation;->debug:Z

    return-void
.end method

.method public setHandler(Lme/yokeyword/fragmentation/helper/ExceptionHandler;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lme/yokeyword/fragmentation/Fragmentation;->handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    return-void
.end method

.method public setMode(I)V
    .locals 0

    .line 80
    iput p1, p0, Lme/yokeyword/fragmentation/Fragmentation;->mode:I

    return-void
.end method
