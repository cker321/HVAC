.class public interface abstract Lme/yokeyword/fragmentation/ISupportFragment;
.super Ljava/lang/Object;
.source "ISupportFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/yokeyword/fragmentation/ISupportFragment$LaunchMode;
    }
.end annotation


# static fields
.field public static final RESULT_CANCELED:I = 0x0

.field public static final RESULT_OK:I = -0x1

.field public static final SINGLETASK:I = 0x2

.field public static final SINGLETOP:I = 0x1

.field public static final STANDARD:I


# virtual methods
.method public abstract enqueueAction(Ljava/lang/Runnable;)V
.end method

.method public abstract extraTransaction()Lme/yokeyword/fragmentation/ExtraTransaction;
.end method

.method public abstract getFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
.end method

.method public abstract getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;
.end method

.method public abstract isSupportVisible()Z
.end method

.method public abstract onBackPressedSupport()Z
.end method

.method public abstract onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
.end method

.method public abstract onEnterAnimationEnd(Landroid/os/Bundle;)V
.end method

.method public abstract onFragmentResult(IILandroid/os/Bundle;)V
.end method

.method public abstract onLazyInitView(Landroid/os/Bundle;)V
.end method

.method public abstract onNewBundle(Landroid/os/Bundle;)V
.end method

.method public abstract onSupportInvisible()V
.end method

.method public abstract onSupportVisible()V
.end method

.method public abstract post(Ljava/lang/Runnable;)V
.end method

.method public abstract putNewBundle(Landroid/os/Bundle;)V
.end method

.method public abstract setFragmentAnimator(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V
.end method

.method public abstract setFragmentResult(ILandroid/os/Bundle;)V
.end method
