.class public Landroidx/fragment/app/FragmentationMagician;
.super Ljava/lang/Object;
.source "FragmentationMagician.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static executePendingTransactionsAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V
    .locals 1

    .line 70
    new-instance v0, Landroidx/fragment/app/FragmentationMagician$4;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentationMagician$4;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-static {p0, v0}, Landroidx/fragment/app/FragmentationMagician;->hookStateSaved(Landroidx/fragment/app/FragmentManager;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static getActiveFragments(Landroidx/fragment/app/FragmentManager;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            ")",
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation

    .line 79
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static hookStateSaved(Landroidx/fragment/app/FragmentManager;Ljava/lang/Runnable;)V
    .locals 3

    .line 83
    instance-of v0, p0, Landroidx/fragment/app/FragmentManagerImpl;

    if-nez v0, :cond_0

    return-void

    .line 85
    :cond_0
    move-object v0, p0

    check-cast v0, Landroidx/fragment/app/FragmentManagerImpl;

    .line 86
    invoke-static {p0}, Landroidx/fragment/app/FragmentationMagician;->isStateSaved(Landroidx/fragment/app/FragmentManager;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 87
    iget-boolean p0, v0, Landroidx/fragment/app/FragmentManagerImpl;->mStateSaved:Z

    .line 88
    iget-boolean v1, v0, Landroidx/fragment/app/FragmentManagerImpl;->mStopped:Z

    const/4 v2, 0x0

    .line 89
    iput-boolean v2, v0, Landroidx/fragment/app/FragmentManagerImpl;->mStateSaved:Z

    .line 90
    iput-boolean v2, v0, Landroidx/fragment/app/FragmentManagerImpl;->mStopped:Z

    .line 92
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 94
    iput-boolean v1, v0, Landroidx/fragment/app/FragmentManagerImpl;->mStopped:Z

    .line 95
    iput-boolean p0, v0, Landroidx/fragment/app/FragmentManagerImpl;->mStateSaved:Z

    goto :goto_0

    .line 97
    :cond_1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void
.end method

.method public static isStateSaved(Landroidx/fragment/app/FragmentManager;)Z
    .locals 2

    .line 12
    instance-of v0, p0, Landroidx/fragment/app/FragmentManagerImpl;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 15
    :cond_0
    :try_start_0
    check-cast p0, Landroidx/fragment/app/FragmentManagerImpl;

    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManagerImpl;->isStateSaved()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return v1
.end method

.method public static popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V
    .locals 1

    .line 31
    new-instance v0, Landroidx/fragment/app/FragmentationMagician$1;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentationMagician$1;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-static {p0, v0}, Landroidx/fragment/app/FragmentationMagician;->hookStateSaved(Landroidx/fragment/app/FragmentManager;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;I)V
    .locals 1

    .line 57
    new-instance v0, Landroidx/fragment/app/FragmentationMagician$3;

    invoke-direct {v0, p0, p1, p2}, Landroidx/fragment/app/FragmentationMagician$3;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;I)V

    invoke-static {p0, v0}, Landroidx/fragment/app/FragmentationMagician;->hookStateSaved(Landroidx/fragment/app/FragmentManager;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static popBackStackImmediateAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V
    .locals 1

    .line 44
    new-instance v0, Landroidx/fragment/app/FragmentationMagician$2;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentationMagician$2;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-static {p0, v0}, Landroidx/fragment/app/FragmentationMagician;->hookStateSaved(Landroidx/fragment/app/FragmentManager;Ljava/lang/Runnable;)V

    return-void
.end method
