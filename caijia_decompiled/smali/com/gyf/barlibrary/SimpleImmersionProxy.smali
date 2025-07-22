.class public Lcom/gyf/barlibrary/SimpleImmersionProxy;
.super Ljava/lang/Object;
.source "SimpleImmersionProxy.java"


# instance fields
.field private mFragment:Landroidx/fragment/app/Fragment;

.field private mIsActivityCreated:Z

.field private mSimpleImmersionOwner:Lcom/gyf/barlibrary/SimpleImmersionOwner;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    .line 30
    instance-of v0, p1, Lcom/gyf/barlibrary/SimpleImmersionOwner;

    if-eqz v0, :cond_0

    .line 31
    check-cast p1, Lcom/gyf/barlibrary/SimpleImmersionOwner;

    iput-object p1, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mSimpleImmersionOwner:Lcom/gyf/barlibrary/SimpleImmersionOwner;

    return-void

    .line 33
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Fragment\u8bf7\u5b9e\u73b0SimpleImmersionOwner\u63a5\u53e3"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private setImmersionBar()V
    .locals 2

    .line 79
    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mIsActivityCreated:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mSimpleImmersionOwner:Lcom/gyf/barlibrary/SimpleImmersionOwner;

    .line 80
    invoke-interface {v0}, Lcom/gyf/barlibrary/SimpleImmersionOwner;->immersionBarEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mSimpleImmersionOwner:Lcom/gyf/barlibrary/SimpleImmersionOwner;

    invoke-interface {v0}, Lcom/gyf/barlibrary/SimpleImmersionOwner;->initImmersionBar()V

    :cond_0
    return-void
.end method


# virtual methods
.method public isUserVisibleHint()Z
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mIsActivityCreated:Z

    .line 43
    invoke-direct {p0}, Lcom/gyf/barlibrary/SimpleImmersionProxy;->setImmersionBar()V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/gyf/barlibrary/SimpleImmersionProxy;->setImmersionBar()V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mSimpleImmersionOwner:Lcom/gyf/barlibrary/SimpleImmersionOwner;

    invoke-interface {v0}, Lcom/gyf/barlibrary/SimpleImmersionOwner;->immersionBarEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->with(Landroidx/fragment/app/Fragment;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionBar;->destroy()V

    :cond_0
    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    .line 51
    iput-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mSimpleImmersionOwner:Lcom/gyf/barlibrary/SimpleImmersionOwner;

    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/gyf/barlibrary/SimpleImmersionProxy;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    xor-int/lit8 p1, p1, 0x1

    .line 60
    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    :cond_0
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/gyf/barlibrary/SimpleImmersionProxy;->setImmersionBar()V

    return-void
.end method
