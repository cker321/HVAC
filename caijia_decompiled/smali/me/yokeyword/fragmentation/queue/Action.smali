.class public abstract Lme/yokeyword/fragmentation/queue/Action;
.super Ljava/lang/Object;
.source "Action.java"


# static fields
.field public static final ACTION_BACK:I = 0x3

.field public static final ACTION_LOAD:I = 0x4

.field public static final ACTION_NORMAL:I = 0x0

.field public static final ACTION_POP:I = 0x1

.field public static final ACTION_POP_MOCK:I = 0x2

.field public static final DEFAULT_POP_TIME:J = 0x12cL


# instance fields
.field public action:I

.field public duration:J

.field public fragmentManager:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lme/yokeyword/fragmentation/queue/Action;->action:I

    const-wide/16 v0, 0x0

    .line 20
    iput-wide v0, p0, Lme/yokeyword/fragmentation/queue/Action;->duration:J

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lme/yokeyword/fragmentation/queue/Action;->action:I

    const-wide/16 v0, 0x0

    .line 20
    iput-wide v0, p0, Lme/yokeyword/fragmentation/queue/Action;->duration:J

    .line 26
    iput p1, p0, Lme/yokeyword/fragmentation/queue/Action;->action:I

    return-void
.end method

.method public constructor <init>(ILandroidx/fragment/app/FragmentManager;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    .line 31
    iput-object p2, p0, Lme/yokeyword/fragmentation/queue/Action;->fragmentManager:Landroidx/fragment/app/FragmentManager;

    return-void
.end method


# virtual methods
.method public abstract run()V
.end method
