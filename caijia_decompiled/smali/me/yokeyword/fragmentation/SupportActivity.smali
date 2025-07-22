.class public Lme/yokeyword/fragmentation/SupportActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SupportActivity.java"

# interfaces
.implements Lme/yokeyword/fragmentation/ISupportActivity;


# instance fields
.field final mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 20
    new-instance v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-direct {v0, p0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;-><init>(Lme/yokeyword/fragmentation/ISupportActivity;)V

    iput-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 59
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public extraTransaction()Lme/yokeyword/fragmentation/ExtraTransaction;
    .locals 1

    .line 33
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->extraTransaction()Lme/yokeyword/fragmentation/ExtraTransaction;

    move-result-object v0

    return-object v0
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

    .line 261
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0, p1}, Lme/yokeyword/fragmentation/SupportHelper;->findFragment(Landroidx/fragment/app/FragmentManager;Ljava/lang/Class;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object p1

    return-object p1
.end method

.method public getFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 1

    .line 86
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->getFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object v0

    return-object v0
.end method

.method public getSupportDelegate()Lme/yokeyword/fragmentation/SupportActivityDelegate;
    .locals 1

    .line 24
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    return-object v0
.end method

.method public getTopFragment()Lme/yokeyword/fragmentation/ISupportFragment;
    .locals 1

    .line 254
    invoke-virtual {p0}, Lme/yokeyword/fragmentation/SupportActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportHelper;->getTopFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    return-object v0
.end method

.method public varargs loadMultipleRootFragment(II[Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 137
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->loadMultipleRootFragment(II[Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 126
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V
    .locals 1

    .line 130
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->loadRootFragment(ILme/yokeyword/fragmentation/ISupportFragment;ZZ)V

    return-void
.end method

.method public final onBackPressed()V
    .locals 1

    .line 67
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->onBackPressed()V

    return-void
.end method

.method public onBackPressedSupport()V
    .locals 1

    .line 76
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->onBackPressedSupport()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 38
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 1

    .line 109
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->onCreateFragmentAnimator()Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    move-result-object v0

    return-object v0
.end method

.method protected onDestroy()V
    .locals 1

    .line 50
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->onDestroy()V

    .line 51
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 44
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 45
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->onPostCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public pop()V
    .locals 1

    .line 213
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->pop()V

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

    .line 226
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->popTo(Ljava/lang/Class;Z)V

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

    .line 234
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->popTo(Ljava/lang/Class;ZLjava/lang/Runnable;)V

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

    .line 238
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->popTo(Ljava/lang/Class;ZLjava/lang/Runnable;I)V

    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1

    .line 114
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->post(Ljava/lang/Runnable;)V

    return-void
.end method

.method public replaceFragment(Lme/yokeyword/fragmentation/ISupportFragment;Z)V
    .locals 1

    .line 206
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->replaceFragment(Lme/yokeyword/fragmentation/ISupportFragment;Z)V

    return-void
.end method

.method public setDefaultFragmentBackground(I)V
    .locals 1

    .line 247
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->setDefaultFragmentBackground(I)V

    return-void
.end method

.method public setFragmentAnimator(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V
    .locals 1

    .line 95
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->setFragmentAnimator(Lme/yokeyword/fragmentation/anim/FragmentAnimator;)V

    return-void
.end method

.method public showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 149
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 156
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->showHideFragment(Lme/yokeyword/fragmentation/ISupportFragment;Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 163
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->start(Lme/yokeyword/fragmentation/ISupportFragment;)V

    return-void
.end method

.method public start(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 1

    .line 172
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->start(Lme/yokeyword/fragmentation/ISupportFragment;I)V

    return-void
.end method

.method public startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V
    .locals 1

    .line 180
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->startForResult(Lme/yokeyword/fragmentation/ISupportFragment;I)V

    return-void
.end method

.method public startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V
    .locals 1

    .line 188
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->startWithPop(Lme/yokeyword/fragmentation/ISupportFragment;)V

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

    .line 199
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivity;->mDelegate:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->startWithPopTo(Lme/yokeyword/fragmentation/ISupportFragment;Ljava/lang/Class;Z)V

    return-void
.end method
