.class public abstract Lcom/dnake/desktop/base/BaseFragment;
.super Lme/yokeyword/fragmentation/SupportFragment;
.source "BaseFragment.java"


# instance fields
.field private bind:Lbutterknife/Unbinder;

.field protected clientId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getMessage(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    return-void
.end method

.method protected abstract getViewID()I
.end method

.method protected hideNavigation()V
    .locals 2

    .line 66
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0xf06

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method protected abstract initFragment()V
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 44
    invoke-super {p0, p1}, Lme/yokeyword/fragmentation/SupportFragment;->onCreate(Landroid/os/Bundle;)V

    .line 45
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p1

    invoke-virtual {p1, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 35
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseFragment;->getViewID()I

    move-result p3

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 36
    invoke-static {p0, p1}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object p2

    iput-object p2, p0, Lcom/dnake/desktop/base/BaseFragment;->bind:Lbutterknife/Unbinder;

    .line 37
    sget-object p2, Lcom/dnake/desktop/App;->deviceId:Ljava/lang/String;

    iput-object p2, p0, Lcom/dnake/desktop/base/BaseFragment;->clientId:Ljava/lang/String;

    .line 38
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseFragment;->initFragment()V

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    .line 50
    invoke-super {p0}, Lme/yokeyword/fragmentation/SupportFragment;->onDestroy()V

    .line 51
    iget-object v0, p0, Lcom/dnake/desktop/base/BaseFragment;->bind:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    .line 52
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    return-void
.end method

.method protected showWarnToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 61
    invoke-static {p1, p2, v0, v1}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
