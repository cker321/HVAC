.class public Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;
.super Ljava/lang/Object;
.source "Fragmentation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/Fragmentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FragmentationBuilder"
.end annotation


# instance fields
.field private debug:Z

.field private handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

.field private mode:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)Z
    .locals 0

    .line 87
    iget-boolean p0, p0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->debug:Z

    return p0
.end method

.method static synthetic access$100(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)I
    .locals 0

    .line 87
    iget p0, p0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->mode:I

    return p0
.end method

.method static synthetic access$200(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)Lme/yokeyword/fragmentation/helper/ExceptionHandler;
    .locals 0

    .line 87
    iget-object p0, p0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    return-object p0
.end method


# virtual methods
.method public debug(Z)Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;
    .locals 0

    .line 96
    iput-boolean p1, p0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->debug:Z

    return-object p0
.end method

.method public handleException(Lme/yokeyword/fragmentation/helper/ExceptionHandler;)Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;
    .locals 0

    .line 116
    iput-object p1, p0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->handler:Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    return-object p0
.end method

.method public install()Lme/yokeyword/fragmentation/Fragmentation;
    .locals 1

    .line 121
    new-instance v0, Lme/yokeyword/fragmentation/Fragmentation;

    invoke-direct {v0, p0}, Lme/yokeyword/fragmentation/Fragmentation;-><init>(Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;)V

    sput-object v0, Lme/yokeyword/fragmentation/Fragmentation;->INSTANCE:Lme/yokeyword/fragmentation/Fragmentation;

    .line 122
    sget-object v0, Lme/yokeyword/fragmentation/Fragmentation;->INSTANCE:Lme/yokeyword/fragmentation/Fragmentation;

    return-object v0
.end method

.method public stackViewMode(I)Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;
    .locals 0

    .line 108
    iput p1, p0, Lme/yokeyword/fragmentation/Fragmentation$FragmentationBuilder;->mode:I

    return-object p0
.end method
