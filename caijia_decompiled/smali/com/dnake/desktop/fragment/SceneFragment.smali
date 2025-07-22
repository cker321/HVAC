.class public Lcom/dnake/desktop/fragment/SceneFragment;
.super Lcom/dnake/desktop/base/BaseFragment;
.source "SceneFragment.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field imageViews:[Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f080102,
            0x7f080101,
            0x7f080103,
            0x7f080100
        }
    .end annotation
.end field

.field scenceModeNormal:[I

.field scenceModeSelected:[I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 30
    invoke-direct {p0}, Lcom/dnake/desktop/base/BaseFragment;-><init>()V

    const-string v0, "SceneFragment"

    .line 32
    iput-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment;->TAG:Ljava/lang/String;

    const/4 v0, 0x4

    new-array v1, v0, [I

    .line 37
    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment;->scenceModeNormal:[I

    new-array v0, v0, [I

    .line 38
    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment;->scenceModeSelected:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f070093
        0x7f070091
        0x7f070095
        0x7f07008f
    .end array-data

    :array_1
    .array-data 4
        0x7f070094
        0x7f070092
        0x7f070096
        0x7f070090
    .end array-data
.end method

.method static synthetic access$000(Lcom/dnake/desktop/fragment/SceneFragment;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dnake/desktop/fragment/SceneFragment;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method private setCurrentMode(IZ)V
    .locals 1

    .line 102
    invoke-direct {p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment;->setModeSelected(I)V

    .line 103
    new-instance v0, Lcom/landleaf/smarthome/model/SceneControlBean;

    invoke-direct {v0, p1, p2}, Lcom/landleaf/smarthome/model/SceneControlBean;-><init>(IZ)V

    const/4 p1, 0x0

    .line 104
    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->setDelayControl(Z)V

    .line 105
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    const/16 p1, 0xa

    .line 106
    invoke-virtual {p0, v0, p1}, Lcom/dnake/desktop/fragment/SceneFragment;->setModeDelay(Lcom/landleaf/smarthome/model/SceneControlBean;I)V

    return-void
.end method

.method private setModeSelected(I)V
    .locals 3

    const/4 v0, 0x0

    .line 96
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment;->scenceModeNormal:[I

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 97
    iget-object v2, p0, Lcom/dnake/desktop/fragment/SceneFragment;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v0

    if-ne v0, p1, :cond_0

    iget-object v1, p0, Lcom/dnake/desktop/fragment/SceneFragment;->scenceModeSelected:[I

    aget v1, v1, v0

    goto :goto_1

    :cond_0
    aget v1, v1, v0

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected getViewID()I
    .locals 1

    const v0, 0x7f0b0025

    return v0
.end method

.method protected initFragment()V
    .locals 0

    return-void
.end method

.method public onViewClicked(Landroid/view/View;)V
    .locals 1
    .annotation runtime Lbutterknife/OnClick;
        value = {
            0x7f080102,
            0x7f080101,
            0x7f080103,
            0x7f080100
        }
    .end annotation

    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x2

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/dnake/desktop/fragment/SceneFragment;->setCurrentMode(IZ)V

    goto :goto_0

    .line 55
    :pswitch_1
    invoke-direct {p0, v0, v0}, Lcom/dnake/desktop/fragment/SceneFragment;->setCurrentMode(IZ)V

    goto :goto_0

    :pswitch_2
    const/4 p1, 0x1

    .line 59
    invoke-direct {p0, p1, v0}, Lcom/dnake/desktop/fragment/SceneFragment;->setCurrentMode(IZ)V

    goto :goto_0

    :pswitch_3
    const/4 p1, 0x3

    .line 89
    invoke-direct {p0, p1, v0}, Lcom/dnake/desktop/fragment/SceneFragment;->setCurrentMode(IZ)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f080100
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public sceneControl(Lcom/landleaf/smarthome/model/SceneControlBean;)V
    .locals 3
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/dnake/desktop/fragment/SceneFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sceneControl:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->isRemountControl()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment;->setModeSelected(I)V

    :cond_0
    return-void
.end method

.method public setModeDelay(Lcom/landleaf/smarthome/model/SceneControlBean;I)V
    .locals 2

    int-to-long v0, p2

    .line 119
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v1, p2}, Lio/reactivex/Single;->timer(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Single;

    move-result-object p2

    .line 120
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p2

    new-instance v0, Lcom/dnake/desktop/fragment/SceneFragment$1;

    invoke-direct {v0, p0, p1}, Lcom/dnake/desktop/fragment/SceneFragment$1;-><init>(Lcom/dnake/desktop/fragment/SceneFragment;Lcom/landleaf/smarthome/model/SceneControlBean;)V

    new-instance p1, Lcom/dnake/desktop/fragment/SceneFragment$2;

    invoke-direct {p1, p0}, Lcom/dnake/desktop/fragment/SceneFragment$2;-><init>(Lcom/dnake/desktop/fragment/SceneFragment;)V

    .line 121
    invoke-virtual {p2, v0, p1}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method
