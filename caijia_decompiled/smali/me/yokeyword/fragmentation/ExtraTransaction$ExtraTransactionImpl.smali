.class final Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;
.super Lme/yokeyword/fragmentation/ExtraTransaction;
.source "ExtraTransaction.java"

# interfaces
.implements Lme/yokeyword/fragmentation/ExtraTransaction$DontAddToBackStackTransaction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/ExtraTransaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ExtraTransactionImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lme/yokeyword/fragmentation/ISupportFragment;",
        ">",
        "Lme/yokeyword/fragmentation/ExtraTransaction;",
        "Lme/yokeyword/fragmentation/ExtraTransaction$DontAddToBackStackTransaction;"
    }
.end annotation


# instance fields
.field private mActivity:Landroidx/fragment/app/FragmentActivity;

.field private mFragment:Landroidx/fragment/app/Fragment;

.field private mFromActivity:Z

.field private mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

.field private mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;


# direct methods
.method constructor <init>(Landroidx/fragment/app/FragmentActivity;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/TransactionDelegate;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentActivity;",
            "TT;",
            "Lme/yokeyword/fragmentation/TransactionDelegate;",
            "Z)V"
        }
    .end annotation

    .line 137
    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction;-><init>()V

    .line 138
    iput-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mActivity:Landroidx/fragment/app/FragmentActivity;

    .line 139
    iput-object p2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    .line 140
    check-cast p2, Landroidx/fragment/app/Fragment;

    iput-object p2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mFragment:Landroidx/fragment/app/Fragment;

    .line 141
    iput-object p3, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    .line 142
    iput-boolean p4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mFromActivity:Z

    .line 143
    new-instance p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    invoke-direct {p1}, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;-><init>()V

    iput-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    return-void
.end method

.method private getFragmentManager()Landroidx/fragment/app/FragmentManager;
    .locals 1

    .line 289
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mFragment:Landroidx/fragment/app/Fragment;

    if-nez v0, :cond_0

    .line 290
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    return-object v0

    .line 292
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 9

    .line 231
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 232
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    move-object v5, p1

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public addSharedElement(Landroid/view/View;Ljava/lang/String;)Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 2

    .line 176
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iget-object v0, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->sharedElementList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 177
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->sharedElementList:Ljava/util/ArrayList;

    .line 179
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iget-object v0, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->sharedElementList:Ljava/util/ArrayList;

    new-instance v1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;

    invoke-direct {v1, p1, p2}, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;-><init>(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public dontAddToBackStack()Lme/yokeyword/fragmentation/ExtraTransaction$DontAddToBackStackTransaction;
    .locals 2

    .line 196
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->dontAddToBackStack:Z

    return-object p0
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 185
    invoke-virtual {p0, p1, p2, v0, v1}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
    .locals 8

    .line 190
    invoke-interface {p2}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 191
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    move v4, p1

    move-object v5, p2

    move v6, p3

    move v7, p4

    invoke-virtual/range {v2 .. v7}, Lme/yokeyword/fragmentation/TransactionDelegate;->loadRootTransaction(Landroidx/fragment/app/FragmentManager;ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V

    return-void
.end method

.method public popTo(Ljava/lang/String;Z)V
    .locals 2

    const/4 v0, 0x0

    const v1, 0x7fffffff

    .line 207
    invoke-virtual {p0, p1, p2, v0, v1}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->popTo(Ljava/lang/String;ZLjava/lang/Runnable;I)V

    return-void
.end method

.method public popTo(Ljava/lang/String;ZLjava/lang/Runnable;I)V
    .locals 6

    .line 212
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v4

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lme/yokeyword/fragmentation/TransactionDelegate;->popTo(Ljava/lang/String;ZLjava/lang/Runnable;Landroidx/fragment/app/FragmentManager;I)V

    return-void
.end method

.method public popToChild(Ljava/lang/String;Z)V
    .locals 2

    const/4 v0, 0x0

    const v1, 0x7fffffff

    .line 217
    invoke-virtual {p0, p1, p2, v0, v1}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->popToChild(Ljava/lang/String;ZLjava/lang/Runnable;I)V

    return-void
.end method

.method public popToChild(Ljava/lang/String;ZLjava/lang/Runnable;I)V
    .locals 7

    .line 222
    iget-boolean v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mFromActivity:Z

    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {p0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->popTo(Ljava/lang/String;ZLjava/lang/Runnable;I)V

    goto :goto_0

    .line 225
    :cond_0
    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v5

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move v6, p4

    invoke-virtual/range {v1 .. v6}, Lme/yokeyword/fragmentation/TransactionDelegate;->popTo(Ljava/lang/String;ZLjava/lang/Runnable;Landroidx/fragment/app/FragmentManager;I)V

    :goto_0
    return-void
.end method

.method public remove(Lme/yokeyword/fragmentation/ISupportFragment;Z)V
    .locals 2

    .line 202
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    check-cast p1, Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1, p1, p2}, Lme/yokeyword/fragmentation/TransactionDelegate;->remove(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;Z)V

    return-void
.end method

.method public replace(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 9

    .line 284
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 285
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v8, 0xa

    move-object v5, p1

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public setCustomAnimations(II)Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 1

    .line 155
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p1, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentEnter:I

    .line 156
    iget-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p2, p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopExit:I

    .line 157
    iget-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    const/4 p2, 0x0

    iput p2, p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopEnter:I

    .line 158
    iget-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p2, p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentExit:I

    return-object p0
.end method

.method public setCustomAnimations(IIII)Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 1

    .line 167
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p1, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentEnter:I

    .line 168
    iget-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p2, p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopExit:I

    .line 169
    iget-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p3, p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopEnter:I

    .line 170
    iget-object p1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput p4, p1, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentExit:I

    return-object p0
.end method

.method public setTag(Ljava/lang/String;)Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 1

    .line 148
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object p1, v0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->tag:Ljava/lang/String;

    return-object p0
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    const/4 v0, 0x0

    .line 237
    invoke-virtual {p0, p1, v0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->start(Lme/yokeyword/fragmentation/ISupportFragment;I)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 9

    .line 254
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 255
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v5, p1

    move v7, p2

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startDontHideSelf(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 9

    .line 242
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 243
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    move-object v5, p1

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startDontHideSelf(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 9

    .line 248
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 249
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v6, 0x0

    const/4 v8, 0x2

    move-object v5, p1

    move v7, p2

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 9

    .line 260
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 261
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startForResultDontHideSelf(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 9

    .line 266
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 267
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    const/4 v7, 0x0

    const/4 v8, 0x3

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v2 .. v8}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchStartTransaction(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;III)V

    return-void
.end method

.method public startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 3

    .line 272
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 273
    iget-object v0, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    invoke-virtual {v0, v1, v2, p1}, Lme/yokeyword/fragmentation/TransactionDelegate;->startWithPop(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public startWithPopTo(Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;Z)V
    .locals 8

    .line 278
    invoke-interface {p1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mTransactionRecord:Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;

    .line 279
    iget-object v2, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mTransactionDelegate:Lme/yokeyword/fragmentation/TransactionDelegate;

    invoke-direct {p0}, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;->mSupportF:Lme/yokeyword/fragmentation/ISupportFragment;

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Lme/yokeyword/fragmentation/TransactionDelegate;->startWithPopTo(Landroidx/fragment/app/FragmentManager;Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;Z)V

    return-void
.end method
