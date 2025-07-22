.class public Lme/yokeyword/fragmentation/SupportFragment;
.super Landroidx/fragment/app/Fragment;
.source "SupportFragment.java"

# interfaces
.implements Lme/yokeyword/fragmentation/ISupportFragment;


# instance fields
.field protected _mActivity:Lme/yokeyword/fragmentation/SupportActivity;

.field final mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 21
    new-instance v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-direct {v0, p0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;-><init>(Lme/yokeyword/fragmentation/ISupportFragment;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    return-void
.end method


# virtual methods
.method public enqueueAction(Ljava/lang/Runnable;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 116
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->enqueueAction(Ljava/lang/Runnable;)V

    return-void
.end method

.method public extraTransaction()Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 1

    .line 35
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->extraTransaction()Lme/yokeyword/fragmentation/ExtraTransaction;

    move-result-object v0

    return-object v0
.end method

.method public findChildFragment(Ljava/lang/Class;)Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lme/yokeyword/fragmentation/ISupportFragment;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 438
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, p1}, Lme/yokeyword/fragmentation/SupportHelper;->findFragment(Landroidx/fragment/app/FragmentManager;Ljava/lang/Class;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object p1

    return-object p1
.end method

.method public findFragment(Ljava/lang/Class;)Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lme/yokeyword/fragmentation/ISupportFragment;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 431
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, p1}, Lme/yokeyword/fragmentation/SupportHelper;->findFragment(Landroidx/fragment/app/FragmentManager;Ljava/lang/Class;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object p1

    return-object p1
.end method

.method public getFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 1

    .line 196
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->getFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object v0

    return-object v0
.end method

.method public getPreFragment()Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1

    .line 424
    invoke-static {p0}, Lme/yokeyword/fragmentation/SupportHelper;->getPreFragment(Landroidx/fragment/app/Fragment;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    return-object v0
.end method

.method public getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;
    .locals 1

    .line 26
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    return-object v0
.end method

.method public getTopChildFragment()Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1

    .line 417
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportFragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    return-object v0
.end method

.method public getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1

    .line 413
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    return-object v0
.end method

.method protected hideSoftInput()V
    .locals 1

    .line 272
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->hideSoftInput()V

    return-void
.end method

.method public final isSupportVisible()Z
    .locals 1

    .line 177
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->isSupportVisible()Z

    move-result v0

    return v0
.end method

.method public varargs loadMultipleRootFragment(II[Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 300
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->loadMultipleRootFragment(II[Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 289
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
    .locals 1

    .line 293
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 58
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 59
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1

    .line 40
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 41
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onAttach(Landroid/app/Activity;)V

    .line 42
    iget-object p1, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    check-cast p1, Lme/yokeyword/fragmentation/SupportActivity;

    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportFragment;->_mActivity:Lme/yokeyword/fragmentation/SupportActivity;

    return-void
.end method

.method public onBackPressedSupport()Z
    .locals 1

    .line 214
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onBackPressedSupport()Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 47
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 48
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .locals 1

    .line 53
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onCreateAnimation(IZI)Landroid/view/animation/Animation;

    move-result-object p1

    return-object p1
.end method

.method public onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 1

    .line 186
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .line 88
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onDestroy()V

    .line 89
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 82
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onDestroyView()V

    .line 83
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onEnterAnimationEnd(Landroid/os/Bundle;)V
    .locals 1

    .line 137
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onEnterAnimationEnd(Landroid/os/Bundle;)V

    return-void
.end method

.method public onFragmentResult(IILandroid/os/Bundle;)V
    .locals 1

    .line 238
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onFragmentResult(IILandroid/os/Bundle;)V

    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 94
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 95
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onHiddenChanged(Z)V

    return-void
.end method

.method public onLazyInitView(Landroid/os/Bundle;)V
    .locals 1

    .line 148
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onLazyInitView(Landroid/os/Bundle;)V

    return-void
.end method

.method public onNewBundle(Landroid/os/Bundle;)V
    .locals 1

    .line 252
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onNewBundle(Landroid/os/Bundle;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 76
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 77
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 70
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 71
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onResume()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 64
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 65
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onSupportInvisible()V
    .locals 1

    .line 169
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onSupportInvisible()V

    return-void
.end method

.method public onSupportVisible()V
    .locals 1

    .line 159
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->onSupportVisible()V

    return-void
.end method

.method public pop()V
    .locals 1

    .line 362
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->pop()V

    return-void
.end method

.method public popChild()V
    .locals 1

    .line 369
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popChild()V

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

    .line 382
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popTo(Ljava/lang/Class;Z)V

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

    .line 390
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popTo(Ljava/lang/Class;ZLjava/lang/Runnable;)V

    return-void
.end method

.method public popTo(Ljava/lang/Class;ZLjava/lang/Runnable;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z",
            "Ljava/lang/Runnable;",
            "I)V"
        }
    .end annotation

    .line 394
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popTo(Ljava/lang/Class;ZLjava/lang/Runnable;I)V

    return-void
.end method

.method public popToChild(Ljava/lang/Class;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 398
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popToChild(Ljava/lang/Class;Z)V

    return-void
.end method

.method public popToChild(Ljava/lang/Class;ZLjava/lang/Runnable;)V
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

    .line 402
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popToChild(Ljava/lang/Class;ZLjava/lang/Runnable;)V

    return-void
.end method

.method public popToChild(Ljava/lang/Class;ZLjava/lang/Runnable;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;Z",
            "Ljava/lang/Runnable;",
            "I)V"
        }
    .end annotation

    .line 406
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->popToChild(Ljava/lang/Class;ZLjava/lang/Runnable;I)V

    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1

    .line 128
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->post(Ljava/lang/Runnable;)V

    return-void
.end method

.method public putNewBundle(Landroid/os/Bundle;)V
    .locals 1

    .line 262
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->putNewBundle(Landroid/os/Bundle;)V

    return-void
.end method

.method public replaceFragment(Lme/yokeyword/fragmentation/ISupportFragment;Z)V
    .locals 1

    .line 358
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->replaceFragment(Lme/yokeyword/fragmentation/ISupportFragment;Z)V

    return-void
.end method

.method public setFragmentAnimator(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V
    .locals 1

    .line 204
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->setFragmentAnimator(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V

    return-void
.end method

.method public setFragmentResult(ILandroid/os/Bundle;)V
    .locals 1

    .line 226
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->setFragmentResult(ILandroid/os/Bundle;)V

    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 100
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    .line 101
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->setUserVisibleHint(Z)V

    return-void
.end method

.method public showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 312
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 319
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method protected showSoftInput(Landroid/view/View;)V
    .locals 1

    .line 279
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->showSoftInput(Landroid/view/View;)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 323
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->start(Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 1

    .line 330
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->start(Lme/yokeyword/fragmentation/ISupportFragment;I)V

    return-void
.end method

.method public startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 1

    .line 337
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V

    return-void
.end method

.method public startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 344
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public startWithPopTo(Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/Class;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/yokeyword/fragmentation/ISupportFragment;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 353
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragment;->mDelegate:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->startWithPopTo(Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/Class;Z)V

    return-void
.end method
