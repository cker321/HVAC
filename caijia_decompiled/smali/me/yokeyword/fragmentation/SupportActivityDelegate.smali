.class public Lme/yokeyword/fragmentation/SupportActivityDelegate;
.super Ljava/lang/Object;
.source "SupportActivityDelegate.java"


# instance fields
.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

.field private mDefaultFragmentBackground:I

.field private mFragmentAnimator:Lme/yokeyword/fragmentation/anim/FragmentAnimator;

.field mFragmentClickable:Z

.field mPopMultipleNoAnim:Z

.field private mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

.field private mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;


# direct methods
.method public constructor <init>(Lme/yokeyword/fragmentation/ISupportActivity;)V
    .locals 2

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mPopMultipleNoAnim:Z

    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentClickable:Z

    .line 27
    iput v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDefaultFragmentBackground:I

    .line 31
    instance-of v0, p1, Landroidx/fragment/app/FragmentActivity;

    if-eqz v0, :cond_0

    .line 33
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    .line 34
    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    .line 35
    new-instance v0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-direct {v0, p1}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    return-void

    .line 32
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Must extends FragmentActivity/AppCompatActivity"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lme/yokeyword/fragmentation/SupportActivityDelegate;)Landroidx/fragment/app/FragmentManager;
    .locals 0

    .line 18
    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lme/yokeyword/fragmentation/SupportActivityDelegate;)Lme/yokeyword/fragmentation/TransactionDelegate;
    .locals 0

    .line 18
    iget-object p0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    return-object p0
.end method

.method static synthetic access$200(Lme/yokeyword/fragmentation/SupportActivityDelegate;)Lme/yokeyword/fragmentation/ISupportActivity;
    .locals 0

    .line 18
    iget-object p0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    return-object p0
.end method

.method private getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;
    .locals 1

    .line 293
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method

.method private getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1

    .line 297
    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 182
    iget-boolean p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentClickable:Z

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public extraTransaction()Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 5

    .line 43
    new-instance v0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;

    iget-object v1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    check-cast v1, Landroidx/fragment/app/FragmentActivity;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTransactionDelegate()Lme/yokeyword/fragmentation/TransactionDelegate;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;-><init>(Landroidx/fragment/app/FragmentActivity;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/TransactionDelegate;Z)V

    return-object v0
.end method

.method public getDefaultFragmentBackground()I
    .locals 1

    .line 116
    iget v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDefaultFragmentBackground:I

    return v0
.end method

.method public getFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 1

    .line 69
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentAnimator:Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->copy()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object v0

    return-object v0
.end method

.method public getTransactionDelegate()Lme/yokeyword/fragmentation/TransactionDelegate;
    .locals 2

    .line 53
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    invoke-direct {v0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;-><init>(Lme/yokeyword/fragmentation/ISupportActivity;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    .line 56
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    return-object v0
.end method

.method public varargs loadMultipleRootFragment(II[Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 2

    .line 202
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2, p3}, Lme/yokeyword/fragmentation/TransactionDelegate;->loadMultipleRootTransaction(Landroidx/fragment/app/FragmentManager;II[Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 191
    invoke-virtual {p0, p1, p2, v0, v1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
    .locals 6

    .line 195
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->loadRootTransaction(Landroidx/fragment/app/FragmentManager;ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V

    return-void
.end method

.method public logFragmentStackHierarchy(Ljava/lang/String;)V
    .locals 1

    .line 130
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->logFragmentRecords(Ljava/lang/String;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 148
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v0, v0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActionQueue:Lme/yokeyword/fragmentation/queue/ActionQueue;

    new-instance v1, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;-><init>(Lme/yokeyword/fragmentation/SupportActivityDelegate;I)V

    invoke-virtual {v0, v1}, Lme/yokeyword/fragmentation/queue/ActionQueue;->enqueue(Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method public onBackPressedSupport()V
    .locals 2

    .line 169
    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 170
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->pop()V

    goto :goto_0

    .line 172
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-static {v0}, Landroidx/core/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 47
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTransactionDelegate()Lme/yokeyword/fragmentation/TransactionDelegate;

    move-result-object p1

    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    .line 48
    iget-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportActivity;->onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object p1

    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentAnimator:Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    .line 49
    iget-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-static {}, Lme/yokeyword/fragmentation/Fragmentation;->getDefault()Lme/yokeyword/fragmentation/Fragmentation;

    move-result-object v0

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/Fragmentation;->getMode()I

    move-result v0

    invoke-virtual {p1, v0}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->onCreate(I)V

    return-void
.end method

.method public onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 1

    .line 103
    new-instance v0, Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;-><init>()V

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .line 177
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->onDestroy()V

    return-void
.end method

.method public onPostCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 60
    iget-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-static {}, Lme/yokeyword/fragmentation/Fragmentation;->getDefault()Lme/yokeyword/fragmentation/Fragmentation;

    move-result-object v0

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/Fragmentation;->getMode()I

    move-result v0

    invoke-virtual {p1, v0}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->onPostCreate(I)V

    return-void
.end method

.method public pop()V
    .locals 2

    .line 264
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->pop(Landroidx/fragment/app/FragmentManager;)V

    return-void
.end method

.method public popTo(Ljava/lang/Class;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 277
    invoke-virtual {p0, p1, p2, v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->popTo(Ljava/lang/Class;ZLjava/lang/Runnable;)V

    return-void
.end method

.method public popTo(Ljava/lang/Class;ZLjava/lang/Runnable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    const v0, 0x7fffffff

    .line 285
    invoke-virtual {p0, p1, p2, p3, v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->popTo(Ljava/lang/Class;ZLjava/lang/Runnable;I)V

    return-void
.end method

.method public popTo(Ljava/lang/Class;ZLjava/lang/Runnable;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z",
            "Ljava/lang/Runnable;",
            "I)V"
        }
    .end annotation

    .line 289
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v4

    move v2, p2

    move-object v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->popTo(Ljava/lang/String;ZLjava/lang/Runnable;Landroidx/fragment/app/FragmentManager;I)V

    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1

    .line 141
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->post(Ljava/lang/Runnable;)V

    return-void
.end method

.method public replaceFragment(Lme/yokeyword/fragmentation/ISupportFragment;Z)V
    .locals 7

    .line 257
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    if-eqz p2, :cond_0

    const/16 p2, 0xa

    const/16 v6, 0xa

    goto :goto_0

    :cond_0
    const/16 p2, 0xb

    const/16 v6, 0xb

    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public setDefaultFragmentBackground(I)V
    .locals 0

    .line 112
    iput p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDefaultFragmentBackground:I

    return-void
.end method

.method public setFragmentAnimator(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V
    .locals 3

    .line 77
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentAnimator:Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    .line 79
    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Landroidx/fragment/app/FragmentationMagician;->getActiveFragments(Landroidx/fragment/app/FragmentManager;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 80
    instance-of v2, v1, Lme/yokeyword/fragmentation/ISupportFragment;

    if-eqz v2, :cond_0

    .line 81
    check-cast v1, Lme/yokeyword/fragmentation/ISupportFragment;

    .line 82
    invoke-interface {v1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    .line 83
    iget-boolean v2, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mAnimByActivity:Z

    if-eqz v2, :cond_0

    .line 84
    invoke-virtual {p1}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->copy()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object v2

    iput-object v2, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mFragmentAnimator:Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    .line 85
    iget-object v2, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mAnimHelper:Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;

    if-eqz v2, :cond_0

    .line 86
    iget-object v2, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mAnimHelper:Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;

    iget-object v1, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mFragmentAnimator:Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    invoke-virtual {v2, v1}, Lme/yokeyword/fragmentation/helper/internal/AnimatorHelper;->notifyChanged(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public showFragmentStackHierarchyView()V
    .locals 1

    .line 123
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mDebugStackDelegate:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->showFragmentStackHierarchyView()V

    return-void
.end method

.method public showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    const/4 v0, 0x0

    .line 214
    invoke-virtual {p0, p1, v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 2

    .line 224
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->showHideFragment(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    const/4 v0, 0x0

    .line 228
    invoke-virtual {p0, p1, v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->start(Lme/yokeyword/fragmentation/ISupportFragment;I)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 7

    .line 235
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v3, p1

    move v5, p2

    invoke-virtual/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 7

    .line 242
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v3, p1

    move v4, p2

    invoke-virtual/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 3

    .line 249
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->startWithPop(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public startWithPopTo(Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/Class;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/yokeyword/fragmentation/ISupportFragment;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 253
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    move-object v3, p1

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->startWithPopTo(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;Z)V

    return-void
.end method
