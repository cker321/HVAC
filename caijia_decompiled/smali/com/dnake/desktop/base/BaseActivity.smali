.class public abstract Lcom/dnake/desktop/base/BaseActivity;
.super Lme/yokeyword/fragmentation/SupportActivity;
.source "BaseActivity.java"


# instance fields
.field private bind:Lbutterknife/Unbinder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lme/yokeyword/fragmentation/SupportActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getLayoutViewId()I
.end method

.method public getMessage(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    return-void
.end method

.method protected hideNavigation()V
    .locals 2

    .line 69
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0xf06

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method protected abstract initActivity()V
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 27
    invoke-super {p0, p1}, Lme/yokeyword/fragmentation/SupportActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseActivity;->getLayoutViewId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/base/BaseActivity;->setContentView(I)V

    .line 29
    invoke-static {p0}, Lbutterknife/ButterKnife;->bind(Landroid/app/Activity;)Lbutterknife/Unbinder;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/base/BaseActivity;->bind:Lbutterknife/Unbinder;

    .line 30
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p1

    invoke-virtual {p1, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 31
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseActivity;->initActivity()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 42
    invoke-super {p0}, Lme/yokeyword/fragmentation/SupportActivity;->onDestroy()V

    .line 43
    iget-object v0, p0, Lcom/dnake/desktop/base/BaseActivity;->bind:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    .line 44
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 63
    invoke-super {p0, p1, p2}, Lme/yokeyword/fragmentation/SupportActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseActivity;->hideNavigation()V

    const/4 p1, 0x1

    return p1
.end method

.method protected onStart()V
    .locals 0

    .line 36
    invoke-super {p0}, Lme/yokeyword/fragmentation/SupportActivity;->onStart()V

    .line 37
    invoke-virtual {p0}, Lcom/dnake/desktop/base/BaseActivity;->hideNavigation()V

    return-void
.end method

.method protected showWarnToast(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 53
    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
