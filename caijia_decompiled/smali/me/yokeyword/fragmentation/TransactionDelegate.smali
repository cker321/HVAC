.class Lme/yokeyword/fragmentation/TransactionDelegate;
.super Ljava/lang/Object;
.source "TransactionDelegate.java"


# static fields
.field static final DEFAULT_POPTO_ANIM:I = 0x7fffffff

.field static final FRAGMENTATION_ARG_CONTAINER:Ljava/lang/String; = "fragmentation_arg_container"

.field static final FRAGMENTATION_ARG_CUSTOM_ENTER_ANIM:Ljava/lang/String; = "fragmentation_arg_custom_enter_anim"

.field static final FRAGMENTATION_ARG_CUSTOM_EXIT_ANIM:Ljava/lang/String; = "fragmentation_arg_custom_exit_anim"

.field static final FRAGMENTATION_ARG_CUSTOM_POP_EXIT_ANIM:Ljava/lang/String; = "fragmentation_arg_custom_pop_exit_anim"

.field static final FRAGMENTATION_ARG_IS_SHARED_ELEMENT:Ljava/lang/String; = "fragmentation_arg_is_shared_element"

.field static final FRAGMENTATION_ARG_REPLACE:Ljava/lang/String; = "fragmentation_arg_replace"

.field static final FRAGMENTATION_ARG_RESULT_RECORD:Ljava/lang/String; = "fragment_arg_result_record"

.field static final FRAGMENTATION_ARG_ROOT_STATUS:Ljava/lang/String; = "fragmentation_arg_root_status"

.field static final FRAGMENTATION_STATE_SAVE_ANIMATOR:Ljava/lang/String; = "fragmentation_state_save_animator"

.field static final FRAGMENTATION_STATE_SAVE_IS_HIDDEN:Ljava/lang/String; = "fragmentation_state_save_status"

.field private static final FRAGMENTATION_STATE_SAVE_RESULT:Ljava/lang/String; = "fragmentation_state_save_result"

.field private static final TAG:Ljava/lang/String; = "Fragmentation"

.field static final TYPE_ADD:I = 0x0

.field static final TYPE_ADD_RESULT:I = 0x1

.field static final TYPE_ADD_RESULT_WITHOUT_HIDE:I = 0x3

.field static final TYPE_ADD_WITHOUT_HIDE:I = 0x2

.field static final TYPE_REPLACE:I = 0xa

.field static final TYPE_REPLACE_DONT_BACK:I = 0xb


# instance fields
.field mActionQueue:Lme/yokeyword/fragmentation/queue/ActionQueue;

.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mHandler:Landroid/os/Handler;

.field private mSupport:Lme/yokeyword/fragmentation/ISupportActivity;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/ISupportActivity;)V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    .line 67
    check-cast p1, Landroidx/fragment/app/FragmentActivity;

    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    .line 68
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mHandler:Landroid/os/Handler;

    .line 69
    new-instance v0, Lme/yokeyword/fragmentation/queue/ActionQueue;

    invoke-direct {v0, p1}, Lme/yokeyword/fragmentation/queue/ActionQueue;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActionQueue:Lme/yokeyword/fragmentation/queue/ActionQueue;

    return-void
.end method

.method static synthetic access$000(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->bindContainerId(ILme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method static synthetic access$100(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;ZLjava/util/ArrayList;ZI)V
    .locals 0

    .line 32
    invoke-direct/range {p0 .. p8}, Lme/yokeyword/fragmentation/TransactionDelegate;->start(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;ZLjava/util/ArrayList;ZI)V

    return-void
.end method

.method static synthetic access$1000(Lme/yokeyword/fragmentation/TransactionDelegate;Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/TransactionDelegate;->safePopTo(Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;)V

    return-void
.end method

.method static synthetic access$1100(Lme/yokeyword/fragmentation/TransactionDelegate;)Lme/yokeyword/fragmentation/ISupportActivity;
    .locals 0

    .line 32
    iget-object p0, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    return-object p0
.end method

.method static synthetic access$1200(Lme/yokeyword/fragmentation/TransactionDelegate;Ljava/lang/String;ZLandroidx/fragment/app/FragmentManager;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/TransactionDelegate;->doPopTo(Ljava/lang/String;ZLandroidx/fragment/app/FragmentManager;I)V

    return-void
.end method

.method static synthetic access$1300(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->handleNewBundle(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method static synthetic access$1400(Lme/yokeyword/fragmentation/TransactionDelegate;)Landroid/os/Handler;
    .locals 0

    .line 32
    iget-object p0, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$200(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->supportCommit(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V

    return-void
.end method

.method static synthetic access$400(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V
    .locals 0

    .line 32
    invoke-direct/range {p0 .. p6}, Lme/yokeyword/fragmentation/TransactionDelegate;->doDispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method static synthetic access$500(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Lme/yokeyword/fragmentation/TransactionDelegate;->doShowHideFragment(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method static synthetic access$600(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->getTopFragmentForStart(Lme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->handleAfterSaveInStateTransactionException(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Landroid/view/animation/Animation;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Lme/yokeyword/fragmentation/TransactionDelegate;->mockStartWithPopAnim(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Landroid/view/animation/Animation;)V

    return-void
.end method

.method static synthetic access$900(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->removeTopFragment(Landroidx/fragment/app/FragmentManager;)V

    return-void
.end method

.method private addMockView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .locals 2

    .line 654
    new-instance v0, Lme/yokeyword/fragmentation/TransactionDelegate$17;

    iget-object v1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-direct {v0, p0, v1}, Lme/yokeyword/fragmentation/TransactionDelegate$17;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroid/content/Context;)V

    .line 660
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 661
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private bindContainerId(ILme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 471
    check-cast p2, Landroidx/fragment/app/Fragment;

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "fragmentation_arg_container"

    .line 472
    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method private static checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_0

    return-void

    .line 689
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private doDispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V
    .locals 15

    move-object v9, p0

    move-object/from16 v6, p1

    move-object/from16 v0, p2

    move-object/from16 v7, p3

    move/from16 v8, p6

    const-string v1, "toFragment == null"

    .line 338
    invoke-static {v7, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "Fragmentation"

    const/4 v2, 0x1

    if-eq v8, v2, :cond_0

    const/4 v2, 0x3

    if-ne v8, v2, :cond_2

    :cond_0
    if-eqz v0, :cond_2

    .line 341
    move-object v2, v0

    check-cast v2, Landroidx/fragment/app/Fragment;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v3

    if-nez v3, :cond_1

    .line 342
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " has not been attached yet! startForResult() converted to start()"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 344
    :cond_1
    move-object v3, v7

    check-cast v3, Landroidx/fragment/app/Fragment;

    move/from16 v4, p4

    invoke-direct {p0, v6, v2, v3, v4}, Lme/yokeyword/fragmentation/TransactionDelegate;->saveRequestCode(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;I)V

    .line 348
    :cond_2
    :goto_0
    invoke-direct {p0, v0, v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->getTopFragmentForStart(Lme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v10

    .line 350
    move-object v0, v7

    check-cast v0, Landroidx/fragment/app/Fragment;

    invoke-direct {p0, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object v0

    const/4 v2, 0x0

    const-string v3, "fragmentation_arg_container"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v10, :cond_3

    if-nez v0, :cond_3

    const-string v0, "There is no Fragment in the FragmentManager, maybe you need to call loadRootFragment()!"

    .line 352
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    if-eqz v10, :cond_4

    if-nez v0, :cond_4

    .line 357
    invoke-interface {v10}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget v0, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    invoke-direct {p0, v0, v7}, Lme/yokeyword/fragmentation/TransactionDelegate;->bindContainerId(ILme/yokeyword/fragmentation/ISupportFragment;)V

    .line 361
    :cond_4
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 364
    invoke-interface/range {p3 .. p3}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v3

    iget-object v3, v3, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    if-eqz v3, :cond_7

    .line 366
    iget-object v2, v3, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->tag:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 367
    iget-object v0, v3, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->tag:Ljava/lang/String;

    .line 369
    :cond_5
    iget-boolean v2, v3, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->dontAddToBackStack:Z

    .line 370
    iget-object v4, v3, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->sharedElementList:Ljava/util/ArrayList;

    if-eqz v4, :cond_6

    .line 371
    iget-object v1, v3, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->sharedElementList:Ljava/util/ArrayList;

    :cond_6
    move-object v11, v0

    move-object v13, v1

    move v12, v2

    goto :goto_1

    :cond_7
    move-object v11, v0

    move-object v13, v1

    const/4 v12, 0x0

    :goto_1
    move-object v0, p0

    move-object/from16 v1, p1

    move-object v2, v10

    move-object/from16 v3, p3

    move-object v4, v11

    move/from16 v5, p5

    .line 375
    invoke-direct/range {v0 .. v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->handleLaunchMode(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    const/4 v14, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object v2, v10

    move-object/from16 v3, p3

    move-object v4, v11

    move v5, v12

    move-object v6, v13

    move v7, v14

    move/from16 v8, p6

    .line 377
    invoke-direct/range {v0 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->start(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;ZLjava/util/ArrayList;ZI)V

    return-void
.end method

.method private doPopTo(Ljava/lang/String;ZLandroidx/fragment/app/FragmentManager;I)V
    .locals 7

    const-string v0, "popTo()"

    .line 540
    invoke-direct {p0, p3, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->handleAfterSaveInStateTransactionException(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 542
    invoke-virtual {p3, p1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    .line 545
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Pop failure! Can\'t find FragmentTag:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " in the FragmentManager\'s Stack."

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Fragmentation"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 554
    :cond_0
    invoke-static {p3, p1, p2}, Lme/yokeyword/fragmentation/SupportHelper;->getWillPopFragments(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v5

    .line 555
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 557
    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/fragment/app/Fragment;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p3

    move v4, p2

    move v6, p4

    .line 558
    invoke-direct/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->mockPopToAnim(Landroidx/fragment/app/Fragment;Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;I)V

    return-void
.end method

.method private doShowHideFragment(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 2

    if-ne p2, p3, :cond_0

    return-void

    .line 453
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    move-object v1, p2

    check-cast v1, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    if-nez p3, :cond_2

    .line 456
    invoke-static {p1}, Landroidx/fragment/app/FragmentationMagician;->getActiveFragments(Landroidx/fragment/app/FragmentManager;)Ljava/util/List;

    move-result-object p3

    if-eqz p3, :cond_3

    .line 458
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_1
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_1

    if-eq v1, p2, :cond_1

    .line 460
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    .line 465
    :cond_2
    check-cast p3, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, p3}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 467
    :cond_3
    invoke-direct {p0, p1, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->supportCommit(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V

    return-void
.end method

.method private enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V
    .locals 0

    if-nez p1, :cond_0

    const-string p1, "Fragmentation"

    const-string p2, "FragmentManager is null, skip the action!"

    .line 331
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 334
    :cond_0
    iget-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActionQueue:Lme/yokeyword/fragmentation/queue/ActionQueue;

    invoke-virtual {p1, p2}, Lme/yokeyword/fragmentation/queue/ActionQueue;->enqueue(Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method private findContainerById(Landroidx/fragment/app/Fragment;I)Landroid/view/ViewGroup;
    .locals 2

    .line 666
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 669
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 671
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 672
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    goto :goto_0

    .line 674
    :cond_1
    invoke-direct {p0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->findContainerById(Landroidx/fragment/app/Fragment;I)Landroid/view/ViewGroup;

    move-result-object p1

    goto :goto_0

    .line 677
    :cond_2
    iget-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 680
    :goto_0
    instance-of p2, p1, Landroid/view/ViewGroup;

    if-eqz p2, :cond_3

    .line 681
    check-cast p1, Landroid/view/ViewGroup;

    return-object p1

    :cond_3
    return-object v1
.end method

.method private getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;
    .locals 1

    .line 476
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    .line 478
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 479
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :cond_0
    return-object v0
.end method

.method private getTopFragmentForStart(Lme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 2

    if-nez p1, :cond_0

    .line 383
    invoke-static {p2}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object p1

    goto :goto_1

    .line 385
    :cond_0
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget v0, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    if-nez v0, :cond_2

    .line 386
    move-object v0, p1

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 387
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android:switcher:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 388
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Can\'t find container, please call loadRootFragment() first!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 391
    :cond_2
    :goto_0
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object p1

    iget p1, p1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    invoke-static {p2, p1}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;I)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object p1

    :goto_1
    return-object p1
.end method

.method private handleAfterSaveInStateTransactionException(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V
    .locals 0

    .line 694
    invoke-static {p1}, Landroidx/fragment/app/FragmentationMagician;->isStateSaved(Landroidx/fragment/app/FragmentManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 696
    new-instance p1, Lme/yokeyword/fragmentation/exception/AfterSaveStateTransactionWarning;

    invoke-direct {p1, p2}, Lme/yokeyword/fragmentation/exception/AfterSaveStateTransactionWarning;-><init>(Ljava/lang/String;)V

    .line 697
    invoke-static {}, Lme/yokeyword/fragmentation/Fragmentation;->getDefault()Lme/yokeyword/fragmentation/Fragmentation;

    move-result-object p2

    invoke-virtual {p2}, Lme/yokeyword/fragmentation/Fragmentation;->getHandler()Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 698
    invoke-static {}, Lme/yokeyword/fragmentation/Fragmentation;->getDefault()Lme/yokeyword/fragmentation/Fragmentation;

    move-result-object p2

    invoke-virtual {p2}, Lme/yokeyword/fragmentation/Fragmentation;->getHandler()Lme/yokeyword/fragmentation/helper/ExceptionHandler;

    move-result-object p2

    invoke-interface {p2, p1}, Lme/yokeyword/fragmentation/helper/ExceptionHandler;->onException(Ljava/lang/Exception;)V

    :cond_0
    return-void
.end method

.method private handleLaunchMode(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;I)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    .line 491
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p4, p1}, Lme/yokeyword/fragmentation/SupportHelper;->findBackStackFragment(Ljava/lang/Class;Ljava/lang/String;Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    const/4 v2, 0x1

    if-ne p5, v2, :cond_3

    if-eq p3, p2, :cond_2

    .line 495
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 496
    :cond_2
    invoke-direct {p0, p3, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->handleNewBundle(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return v2

    :cond_3
    const/4 p2, 0x2

    if-ne p5, p2, :cond_4

    const p2, 0x7fffffff

    .line 500
    invoke-direct {p0, p4, v0, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->doPopTo(Ljava/lang/String;ZLandroidx/fragment/app/FragmentManager;I)V

    .line 501
    iget-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mHandler:Landroid/os/Handler;

    new-instance p2, Lme/yokeyword/fragmentation/TransactionDelegate$12;

    invoke-direct {p2, p0, p3, v1}, Lme/yokeyword/fragmentation/TransactionDelegate$12;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return v2

    :cond_4
    return v0
.end method

.method private handleNewBundle(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 3

    .line 514
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v0, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mNewBundle:Landroid/os/Bundle;

    .line 516
    check-cast p1, Landroidx/fragment/app/Fragment;

    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "fragmentation_arg_container"

    .line 517
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 518
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 522
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 525
    :cond_1
    invoke-interface {p2, p1}, Lme/yokeyword/fragmentation/ISupportFragment;->onNewBundle(Landroid/os/Bundle;)V

    return-void
.end method

.method private mockPopToAnim(Landroidx/fragment/app/Fragment;Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/Fragment;",
            "Ljava/lang/String;",
            "Landroidx/fragment/app/FragmentManager;",
            "I",
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;I)V"
        }
    .end annotation

    .line 577
    instance-of v0, p1, Lme/yokeyword/fragmentation/ISupportFragment;

    if-nez v0, :cond_0

    .line 578
    invoke-direct {p0, p2, p3, p4, p5}, Lme/yokeyword/fragmentation/TransactionDelegate;->safePopTo(Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;)V

    return-void

    .line 582
    :cond_0
    move-object v0, p1

    check-cast v0, Lme/yokeyword/fragmentation/ISupportFragment;

    .line 583
    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    iget v1, v1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    invoke-direct {p0, p1, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->findContainerById(Landroidx/fragment/app/Fragment;I)Landroid/view/ViewGroup;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    .line 586
    :cond_1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_2

    return-void

    .line 589
    :cond_2
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 590
    invoke-direct {p0, p1, v1}, Lme/yokeyword/fragmentation/TransactionDelegate;->addMockView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;

    move-result-object v2

    .line 592
    invoke-direct {p0, p2, p3, p4, p5}, Lme/yokeyword/fragmentation/TransactionDelegate;->safePopTo(Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;)V

    const p2, 0x7fffffff

    if-ne p6, p2, :cond_3

    .line 596
    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object p2

    invoke-virtual {p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->getExitAnim()Landroid/view/animation/Animation;

    move-result-object p2

    if-nez p2, :cond_5

    .line 598
    new-instance p2, Lme/yokeyword/fragmentation/TransactionDelegate$13;

    invoke-direct {p2, p0}, Lme/yokeyword/fragmentation/TransactionDelegate$13;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;)V

    goto :goto_0

    :cond_3
    if-nez p6, :cond_4

    .line 602
    new-instance p2, Lme/yokeyword/fragmentation/TransactionDelegate$14;

    invoke-direct {p2, p0}, Lme/yokeyword/fragmentation/TransactionDelegate$14;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;)V

    goto :goto_0

    .line 605
    :cond_4
    iget-object p2, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-static {p2, p6}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p2

    .line 608
    :cond_5
    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 609
    iget-object p3, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mHandler:Landroid/os/Handler;

    new-instance p4, Lme/yokeyword/fragmentation/TransactionDelegate$15;

    invoke-direct {p4, p0, v2, p1, v1}, Lme/yokeyword/fragmentation/TransactionDelegate$15;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 618
    invoke-virtual {p2}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide p1

    .line 609
    invoke-virtual {p3, p4, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private mockStartWithPopAnim(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Landroid/view/animation/Animation;)V
    .locals 7

    .line 623
    move-object v0, p1

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 624
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object p1

    iget p1, p1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    invoke-direct {p0, v0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->findContainerById(Landroidx/fragment/app/Fragment;I)Landroid/view/ViewGroup;

    move-result-object v6

    if-nez v6, :cond_0

    return-void

    .line 627
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_1

    return-void

    .line 630
    :cond_1
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 631
    invoke-direct {p0, v3, v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->addMockView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;

    move-result-object v5

    .line 633
    invoke-interface {p2}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object p1

    new-instance p2, Lme/yokeyword/fragmentation/TransactionDelegate$16;

    move-object v1, p2

    move-object v2, p0

    move-object v4, p3

    invoke-direct/range {v1 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate$16;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroid/view/View;Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V

    iput-object p2, p1, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mEnterAnimListener:Lme/yokeyword/fragmentation/SupportFragmentDelegate$EnterAnimListener;

    return-void
.end method

.method private removeTopFragment(Landroidx/fragment/app/FragmentManager;)V
    .locals 2

    .line 252
    :try_start_0
    invoke-static {p1}, Lme/yokeyword/fragmentation/SupportHelper;->getBackStackTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 254
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    const/16 v1, 0x2002

    .line 255
    invoke-virtual {p1, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 256
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    .line 257
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method private safePopTo(Ljava/lang/String;Landroidx/fragment/app/FragmentManager;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/fragment/app/FragmentManager;",
            "I",
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .line 562
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportActivity;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportActivityDelegate;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mPopMultipleNoAnim:Z

    .line 564
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x2002

    .line 565
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 566
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 567
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_0

    .line 569
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 571
    invoke-static {p2, p1, p3}, Landroidx/fragment/app/FragmentationMagician;->popBackStackAllowingStateLoss(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;I)V

    .line 572
    invoke-static {p2}, Landroidx/fragment/app/FragmentationMagician;->executePendingTransactionsAllowingStateLoss(Landroidx/fragment/app/FragmentManager;)V

    .line 573
    iget-object p1, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mSupport:Lme/yokeyword/fragmentation/ISupportActivity;

    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportActivity;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportActivityDelegate;

    move-result-object p1

    const/4 p2, 0x0

    iput-boolean p2, p1, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mPopMultipleNoAnim:Z

    return-void
.end method

.method private saveRequestCode(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;I)V
    .locals 1

    .line 532
    invoke-direct {p0, p3}, Lme/yokeyword/fragmentation/TransactionDelegate;->getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object p3

    .line 533
    new-instance v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;-><init>()V

    .line 534
    iput p4, v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->requestCode:I

    const-string p4, "fragment_arg_result_record"

    .line 535
    invoke-virtual {p3, p4, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p4, "fragmentation_state_save_result"

    .line 536
    invoke-virtual {p1, p3, p4, p2}, Landroidx/fragment/app/FragmentManager;->putFragment(Landroid/os/Bundle;Ljava/lang/String;Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method private start(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;ZLjava/util/ArrayList;ZI)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            "Lme/yokeyword/fragmentation/ISupportFragment;",
            "Lme/yokeyword/fragmentation/ISupportFragment;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList<",
            "Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;",
            ">;ZI)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move/from16 v2, p8

    .line 398
    invoke-virtual/range {p1 .. p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v3

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_1

    if-eq v2, v6, :cond_1

    if-eq v2, v5, :cond_1

    if-ne v2, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v7, 0x1

    .line 400
    :goto_1
    move-object/from16 v8, p2

    check-cast v8, Landroidx/fragment/app/Fragment;

    .line 401
    move-object/from16 v9, p3

    check-cast v9, Landroidx/fragment/app/Fragment;

    .line 402
    invoke-direct {v0, v9}, Lme/yokeyword/fragmentation/TransactionDelegate;->getArguments(Landroidx/fragment/app/Fragment;)Landroid/os/Bundle;

    move-result-object v10

    xor-int/lit8 v11, v7, 0x1

    const-string v12, "fragmentation_arg_replace"

    .line 403
    invoke-virtual {v10, v12, v11}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const/16 v11, 0x1001

    const-string v12, "fragmentation_arg_root_status"

    if-nez p6, :cond_4

    if-eqz v7, :cond_3

    .line 407
    invoke-interface/range {p3 .. p3}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v13

    iget-object v13, v13, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    if-eqz v13, :cond_2

    .line 408
    iget v14, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentEnter:I

    const/high16 v15, -0x80000000

    if-eq v14, v15, :cond_2

    .line 409
    iget v14, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentEnter:I

    iget v15, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopExit:I

    iget v4, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopEnter:I

    iget v5, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentExit:I

    invoke-virtual {v3, v14, v15, v4, v5}, Landroidx/fragment/app/FragmentTransaction;->setCustomAnimations(IIII)Landroidx/fragment/app/FragmentTransaction;

    .line 411
    iget v4, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentEnter:I

    const-string v5, "fragmentation_arg_custom_enter_anim"

    invoke-virtual {v10, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 412
    iget v4, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentExit:I

    const-string v5, "fragmentation_arg_custom_exit_anim"

    invoke-virtual {v10, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 413
    iget v4, v13, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopExit:I

    const-string v5, "fragmentation_arg_custom_pop_exit_anim"

    invoke-virtual {v10, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_3

    .line 415
    :cond_2
    invoke-virtual {v3, v11}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_3

    .line 418
    :cond_3
    invoke-virtual {v10, v12, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_3

    :cond_4
    const-string v4, "fragmentation_arg_is_shared_element"

    .line 421
    invoke-virtual {v10, v4, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 422
    invoke-virtual/range {p6 .. p6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;

    .line 423
    iget-object v13, v5, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;->sharedElement:Landroid/view/View;

    iget-object v5, v5, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;->sharedName:Ljava/lang/String;

    invoke-virtual {v3, v13, v5}, Landroidx/fragment/app/FragmentTransaction;->addSharedElement(Landroid/view/View;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_2

    :cond_5
    :goto_3
    if-nez p2, :cond_7

    const-string v4, "fragmentation_arg_container"

    .line 427
    invoke-virtual {v10, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4, v9, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    if-nez v7, :cond_9

    .line 429
    invoke-virtual {v3, v11}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    if-eqz p7, :cond_6

    const/4 v5, 0x2

    goto :goto_4

    :cond_6
    const/4 v5, 0x1

    .line 430
    :goto_4
    invoke-virtual {v10, v12, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_5

    :cond_7
    if-eqz v7, :cond_8

    .line 435
    invoke-interface/range {p2 .. p2}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v4

    iget v4, v4, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    invoke-virtual {v3, v4, v9, v1}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    const/4 v4, 0x2

    if-eq v2, v4, :cond_9

    const/4 v4, 0x3

    if-eq v2, v4, :cond_9

    .line 437
    invoke-virtual {v3, v8}, Landroidx/fragment/app/FragmentTransaction;->hide(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    goto :goto_5

    .line 440
    :cond_8
    invoke-interface/range {p2 .. p2}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v4

    iget v4, v4, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mContainerId:I

    invoke-virtual {v3, v4, v9, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    :cond_9
    :goto_5
    if-nez p5, :cond_a

    const/16 v4, 0xb

    if-eq v2, v4, :cond_a

    .line 445
    invoke-virtual {v3, v1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    :cond_a
    move-object/from16 v1, p1

    .line 447
    invoke-direct {v0, v1, v3}, Lme/yokeyword/fragmentation/TransactionDelegate;->supportCommit(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V

    return-void
.end method

.method private supportCommit(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentTransaction;)V
    .locals 1

    const-string v0, "commit()"

    .line 485
    invoke-direct {p0, p1, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->handleAfterSaveInStateTransactionException(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 486
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method


# virtual methods
.method dispatchBackPressedEvent(Lme/yokeyword/fragmentation/ISupportFragment;)Z
    .locals 2

    if-eqz p1, :cond_1

    .line 302
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->onBackPressedSupport()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 307
    :cond_0
    check-cast p1, Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    .line 308
    check-cast p1, Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-virtual {p0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchBackPressedEvent(Lme/yokeyword/fragmentation/ISupportFragment;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V
    .locals 10

    .line 129
    new-instance v9, Lme/yokeyword/fragmentation/TransactionDelegate$4;

    const/4 v0, 0x2

    move v7, p5

    if-ne v7, v0, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    move-object v0, v9

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    invoke-direct/range {v0 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate$4;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    move-object v0, p0

    move-object v1, p1

    invoke-direct {p0, p1, v9}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method handleResultRecord(Landroidx/fragment/app/Fragment;)V
    .locals 3

    .line 317
    :try_start_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v1, "fragment_arg_result_record"

    .line 319
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;

    if-nez v0, :cond_1

    return-void

    .line 322
    :cond_1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "fragmentation_state_save_result"

    invoke-virtual {v1, p1, v2}, Landroidx/fragment/app/FragmentManager;->getFragment(Landroid/os/Bundle;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lme/yokeyword/fragmentation/ISupportFragment;

    .line 323
    iget v1, v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->requestCode:I

    iget v2, v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultCode:I

    iget-object v0, v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultBundle:Landroid/os/Bundle;

    invoke-interface {p1, v1, v2, v0}, Lme/yokeyword/fragmentation/ISupportFragment;->onFragmentResult(IILandroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method varargs loadMultipleRootTransaction(Landroidx/fragment/app/FragmentManager;II[Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 8

    .line 101
    new-instance v7, Lme/yokeyword/fragmentation/TransactionDelegate$3;

    const/4 v2, 0x4

    move-object v0, v7

    move-object v1, p0

    move-object v3, p1

    move-object v4, p4

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate$3;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;[Lme/yokeyword/fragmentation/ISupportFragment;II)V

    invoke-direct {p0, p1, v7}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method loadRootTransaction(Landroidx/fragment/app/FragmentManager;ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
    .locals 9

    .line 82
    new-instance v8, Lme/yokeyword/fragmentation/TransactionDelegate$2;

    const/4 v2, 0x4

    move-object v0, v8

    move-object v1, p0

    move v3, p2

    move-object v4, p3

    move-object v5, p1

    move v6, p4

    move v7, p5

    invoke-direct/range {v0 .. v7}, Lme/yokeyword/fragmentation/TransactionDelegate$2;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;IILme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;ZZ)V

    invoke-direct {p0, p1, v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method pop(Landroidx/fragment/app/FragmentManager;)V
    .locals 2

    .line 240
    new-instance v0, Lme/yokeyword/fragmentation/TransactionDelegate$9;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1, p1, p1}, Lme/yokeyword/fragmentation/TransactionDelegate$9;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentManager;)V

    invoke-direct {p0, p1, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method popQuiet(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 265
    new-instance v0, Lme/yokeyword/fragmentation/TransactionDelegate$10;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate$10;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    invoke-direct {p0, p1, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method popTo(Ljava/lang/String;ZLjava/lang/Runnable;Landroidx/fragment/app/FragmentManager;I)V
    .locals 9

    .line 285
    new-instance v8, Lme/yokeyword/fragmentation/TransactionDelegate$11;

    const/4 v2, 0x2

    move-object v0, v8

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p4

    move v6, p5

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lme/yokeyword/fragmentation/TransactionDelegate$11;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILjava/lang/String;ZLandroidx/fragment/app/FragmentManager;ILjava/lang/Runnable;)V

    invoke-direct {p0, p4, v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method post(Ljava/lang/Runnable;)V
    .locals 2

    .line 73
    iget-object v0, p0, Lme/yokeyword/fragmentation/TransactionDelegate;->mActionQueue:Lme/yokeyword/fragmentation/queue/ActionQueue;

    new-instance v1, Lme/yokeyword/fragmentation/TransactionDelegate$1;

    invoke-direct {v1, p0, p1}, Lme/yokeyword/fragmentation/TransactionDelegate$1;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lme/yokeyword/fragmentation/queue/ActionQueue;->enqueue(Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method remove(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Z)V
    .locals 8

    .line 218
    new-instance v7, Lme/yokeyword/fragmentation/TransactionDelegate$8;

    const/4 v2, 0x1

    move-object v0, v7

    move-object v1, p0

    move-object v3, p1

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate$8;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILandroidx/fragment/app/FragmentManager;Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Z)V

    invoke-direct {p0, p1, v7}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method showHideFragment(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 141
    new-instance v0, Lme/yokeyword/fragmentation/TransactionDelegate$5;

    invoke-direct {v0, p0, p1, p2, p3}, Lme/yokeyword/fragmentation/TransactionDelegate$5;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    invoke-direct {p0, p1, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    return-void
.end method

.method startWithPop(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 14

    .line 153
    new-instance v6, Lme/yokeyword/fragmentation/TransactionDelegate$6;

    const/4 v2, 0x2

    move-object v0, v6

    move-object v1, p0

    move-object/from16 v3, p2

    move-object v4, p1

    move-object/from16 v5, p3

    invoke-direct/range {v0 .. v5}, Lme/yokeyword/fragmentation/TransactionDelegate$6;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;ILme/yokeyword/fragmentation/ISupportFragment;Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;)V

    move-object v0, p0

    move-object v1, p1

    invoke-direct {p0, p1, v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v7, p0

    move-object v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    .line 176
    invoke-virtual/range {v7 .. v13}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method startWithPopTo(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;Z)V
    .locals 16

    .line 180
    new-instance v8, Lme/yokeyword/fragmentation/TransactionDelegate$7;

    const/4 v2, 0x2

    move-object v0, v8

    move-object/from16 v1, p0

    move/from16 v3, p5

    move-object/from16 v4, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    invoke-direct/range {v0 .. v7}, Lme/yokeyword/fragmentation/TransactionDelegate$7;-><init>(Lme/yokeyword/fragmentation/TransactionDelegate;IZLandroidx/fragment/app/FragmentManager;Ljava/lang/String;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->enqueue(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/queue/Action;)V

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    .line 210
    invoke-virtual/range {v9 .. v15}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method
