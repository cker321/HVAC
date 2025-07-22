.class public Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;
.super Ljava/lang/Object;
.source "VisibleDelegate.java"


# static fields
.field private static final FRAGMENTATION_STATE_SAVE_COMPAT_REPLACE:Ljava/lang/String; = "fragmentation_compat_replace"

.field private static final FRAGMENTATION_STATE_SAVE_IS_INVISIBLE_WHEN_LEAVE:Ljava/lang/String; = "fragmentation_invisible_when_leave"


# instance fields
.field private mFirstCreateViewCompatReplace:Z

.field private mFragment:Landroidx/fragment/app/Fragment;

.field private mHandler:Landroid/os/Handler;

.field private mInvisibleWhenLeave:Z

.field private mIsFirstVisible:Z

.field private mIsSupportVisible:Z

.field private mNeedDispatch:Z

.field private mSaveInstanceState:Landroid/os/Bundle;

.field private mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;


# direct methods
.method public constructor <init>(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    .line 27
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsFirstVisible:Z

    .line 28
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFirstCreateViewCompatReplace:Z

    .line 37
    iput-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    .line 38
    check-cast p1, Landroidx/fragment/app/Fragment;

    iput-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    return-void
.end method

.method static synthetic access$000(Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;Z)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchSupportVisible(Z)V

    return-void
.end method

.method private checkAddState()Z
    .locals 2

    .line 190
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 191
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private dispatchChild(Z)V
    .locals 3

    .line 163
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    if-nez v0, :cond_0

    const/4 p1, 0x1

    .line 164
    iput-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    goto :goto_1

    .line 166
    :cond_0
    invoke-direct {p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->checkAddState()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 167
    :cond_1
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 168
    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->getActiveFragments(Landroidx/fragment/app/FragmentManager;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 170
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 171
    instance-of v2, v1, Lme/yokeyword/fragmentation/ISupportFragment;

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isHidden()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 172
    check-cast v1, Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {v1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->getVisibleDelegate()Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;

    move-result-object v1

    invoke-direct {v1, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchSupportVisible(Z)V

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method private dispatchSupportVisible(Z)V
    .locals 2

    if-eqz p1, :cond_0

    .line 138
    invoke-direct {p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->isParentInvisible()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 140
    :cond_0
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    const/4 v1, 0x1

    if-ne v0, p1, :cond_1

    .line 141
    iput-boolean v1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    return-void

    .line 145
    :cond_1
    iput-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    .line 148
    invoke-direct {p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->checkAddState()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    .line 149
    :cond_2
    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->onSupportVisible()V

    .line 151
    iget-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsFirstVisible:Z

    if-eqz p1, :cond_3

    .line 152
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsFirstVisible:Z

    .line 153
    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mSaveInstanceState:Landroid/os/Bundle;

    invoke-interface {p1, v0}, Lme/yokeyword/fragmentation/ISupportFragment;->onLazyInitView(Landroid/os/Bundle;)V

    .line 155
    :cond_3
    invoke-direct {p0, v1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchChild(Z)V

    goto :goto_0

    .line 157
    :cond_4
    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchChild(Z)V

    .line 158
    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->onSupportInvisible()V

    :goto_0
    return-void
.end method

.method private enqueueDispatchVisible()V
    .locals 2

    .line 129
    invoke-direct {p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate$1;

    invoke-direct {v1, p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate$1;-><init>(Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private getHandler()Landroid/os/Handler;
    .locals 2

    .line 206
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 207
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mHandler:Landroid/os/Handler;

    .line 209
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private isFragmentVisible(Landroidx/fragment/app/Fragment;)Z
    .locals 1

    .line 198
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isParentInvisible()Z
    .locals 3

    .line 180
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 182
    instance-of v1, v0, Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 183
    check-cast v0, Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportFragment;->isSupportVisible()Z

    move-result v0

    xor-int/2addr v0, v2

    return v0

    :cond_0
    if-eqz v0, :cond_1

    .line 186
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method private safeDispatchUserVisibleHint(Z)V
    .locals 1

    .line 120
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsFirstVisible:Z

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    return-void

    .line 122
    :cond_0
    invoke-direct {p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->enqueueDispatchVisible()V

    goto :goto_0

    .line 124
    :cond_1
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchSupportVisible(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method public isSupportVisible()Z
    .locals 1

    .line 202
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 56
    iget-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFirstCreateViewCompatReplace:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android:switcher:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 60
    :cond_0
    iget-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFirstCreateViewCompatReplace:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 61
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFirstCreateViewCompatReplace:Z

    .line 64
    :cond_1
    iget-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isHidden()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 65
    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->isFragmentVisible(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    iget-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    .line 66
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_4

    .line 67
    :cond_3
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    const/4 p1, 0x1

    .line 68
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->safeDispatchUserVisibleHint(Z)V

    :cond_4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 43
    iput-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mSaveInstanceState:Landroid/os/Bundle;

    const-string v0, "fragmentation_invisible_when_leave"

    .line 45
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    const-string v0, "fragmentation_compat_replace"

    .line 46
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFirstCreateViewCompatReplace:Z

    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    const/4 v0, 0x1

    .line 106
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsFirstVisible:Z

    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 93
    iget-object v1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 95
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 99
    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->safeDispatchUserVisibleHint(Z)V

    goto :goto_0

    .line 101
    :cond_1
    invoke-direct {p0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->enqueueDispatchVisible()V

    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 83
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->isFragmentVisible(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 84
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    .line 85
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    .line 86
    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchSupportVisible(Z)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 88
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 74
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsFirstVisible:Z

    if-nez v0, :cond_0

    .line 75
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->isFragmentVisible(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 76
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mNeedDispatch:Z

    const/4 v0, 0x1

    .line 77
    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchSupportVisible(Z)V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 51
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mInvisibleWhenLeave:Z

    const-string v1, "fragmentation_invisible_when_leave"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 52
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFirstCreateViewCompatReplace:Z

    const-string v1, "fragmentation_compat_replace"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 110
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p1, :cond_2

    .line 111
    :cond_0
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    .line 112
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->safeDispatchUserVisibleHint(Z)V

    goto :goto_0

    .line 113
    :cond_1
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->mIsSupportVisible:Z

    if-eqz v0, :cond_2

    if-nez p1, :cond_2

    const/4 p1, 0x0

    .line 114
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->dispatchSupportVisible(Z)V

    :cond_2
    :goto_0
    return-void
.end method
