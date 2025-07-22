.class public abstract Lme/yokeyword/fragmentation/ExtraTransaction;
.super Ljava/lang/Object;
.source "ExtraTransaction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/yokeyword/fragmentation/ExtraTransaction$ExtraTransactionImpl;,
        Lme/yokeyword/fragmentation/ExtraTransaction$DontAddToBackStackTransaction;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract addSharedElement(Landroid/view/View;Ljava/lang/String;)Lme/yokeyword/fragmentation/ExtraTransaction;
.end method

.method public abstract dontAddToBackStack()Lme/yokeyword/fragmentation/ExtraTransaction$DontAddToBackStackTransaction;
.end method

.method public abstract loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V
.end method

.method public abstract loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
.end method

.method public abstract popTo(Ljava/lang/String;Z)V
.end method

.method public abstract popTo(Ljava/lang/String;ZLjava/lang/Runnable;I)V
.end method

.method public abstract popToChild(Ljava/lang/String;Z)V
.end method

.method public abstract popToChild(Ljava/lang/String;ZLjava/lang/Runnable;I)V
.end method

.method public abstract remove(Lme/yokeyword/fragmentation/ISupportFragment;Z)V
.end method

.method public abstract replace(Lme/yokeyword/fragmentation/ISupportFragment;)V
.end method

.method public abstract setCustomAnimations(II)Lme/yokeyword/fragmentation/ExtraTransaction;
.end method

.method public abstract setCustomAnimations(IIII)Lme/yokeyword/fragmentation/ExtraTransaction;
.end method

.method public abstract setTag(Ljava/lang/String;)Lme/yokeyword/fragmentation/ExtraTransaction;
.end method

.method public abstract start(Lme/yokeyword/fragmentation/ISupportFragment;)V
.end method

.method public abstract start(Lme/yokeyword/fragmentation/ISupportFragment;I)V
.end method

.method public abstract startDontHideSelf(Lme/yokeyword/fragmentation/ISupportFragment;)V
.end method

.method public abstract startDontHideSelf(Lme/yokeyword/fragmentation/ISupportFragment;I)V
.end method

.method public abstract startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V
.end method

.method public abstract startForResultDontHideSelf(Lme/yokeyword/fragmentation/ISupportFragment;I)V
.end method

.method public abstract startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V
.end method

.method public abstract startWithPopTo(Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/String;Z)V
.end method
