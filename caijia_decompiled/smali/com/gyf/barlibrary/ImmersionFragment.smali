.class public abstract Lcom/gyf/barlibrary/ImmersionFragment;
.super Landroidx/fragment/app/Fragment;
.source "ImmersionFragment.java"

# interfaces
.implements Lcom/gyf/barlibrary/ImmersionOwner;


# instance fields
.field private mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 22
    new-instance v0, Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/ImmersionProxy;-><init>(Landroidx/fragment/app/Fragment;)V

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    return-void
.end method


# virtual methods
.method public immersionBarEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 38
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 39
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0, p1}, Lcom/gyf/barlibrary/ImmersionProxy;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 68
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 69
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0, p1}, Lcom/gyf/barlibrary/ImmersionProxy;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 32
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 33
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0, p1}, Lcom/gyf/barlibrary/ImmersionProxy;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 56
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 57
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionProxy;->onDestroy()V

    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 62
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 63
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0, p1}, Lcom/gyf/barlibrary/ImmersionProxy;->onHiddenChanged(Z)V

    return-void
.end method

.method public onInvisible()V
    .locals 0

    return-void
.end method

.method public onLazyAfterView()V
    .locals 0

    return-void
.end method

.method public onLazyBeforeView()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 50
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 51
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionProxy;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 44
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 45
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionProxy;->onResume()V

    return-void
.end method

.method public onVisible()V
    .locals 0

    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 26
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    .line 27
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionFragment;->mImmersionProxy:Lcom/gyf/barlibrary/ImmersionProxy;

    invoke-virtual {v0, p1}, Lcom/gyf/barlibrary/ImmersionProxy;->setUserVisibleHint(Z)V

    return-void
.end method
