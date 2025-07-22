.class public Lcom/dnake/desktop/fragment/WindControlFragment;
.super Lcom/dnake/desktop/base/BaseFragment;
.source "WindControlFragment.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field colorLevelGood:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f05002c
    .end annotation
.end field

.field colorLevelMedium:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f05002d
    .end annotation
.end field

.field count:I

.field currentAirMode:I

.field currentMode:I

.field ivJiashi:Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f0800ac
    .end annotation
.end field

.field ivModes:[Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f0800af,
            0x7f0800b1,
            0x7f0800a8,
            0x7f0800aa,
            0x7f0800b2
        }
    .end annotation
.end field

.field ivPower:Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f0800ad
    .end annotation
.end field

.field ivVolumes:[Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f0800ab,
            0x7f0800b3,
            0x7f0800a9
        }
    .end annotation
.end field

.field jiashiOn:Z

.field private modeOff:[I

.field private modeOn:[I

.field myCustomLayout:Lcom/dnake/desktop/widget/LandleafView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f0800d6
    .end annotation
.end field

.field outdoorTemperature:F

.field powerOn:Z

.field showTemp:F

.field strLianghao:Ljava/lang/String;
    .annotation runtime Lbutterknife/BindString;
        value = 0x7f0d0038
    .end annotation
.end field

.field strShushi:Ljava/lang/String;
    .annotation runtime Lbutterknife/BindString;
        value = 0x7f0d0039
    .end annotation
.end field

.field private volumeOff:[I

.field private volumeOn:[I

.field private windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

.field windHumidity:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Lcom/dnake/desktop/base/BaseFragment;-><init>()V

    const-string v0, "WindControlFragment"

    .line 52
    iput-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->TAG:Ljava/lang/String;

    const/4 v0, 0x5

    new-array v1, v0, [I

    .line 76
    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->modeOff:[I

    new-array v0, v0, [I

    .line 77
    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->modeOn:[I

    const/4 v0, 0x3

    new-array v1, v0, [I

    .line 78
    fill-array-data v1, :array_2

    iput-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->volumeOff:[I

    new-array v0, v0, [I

    .line 79
    fill-array-data v0, :array_3

    iput-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->volumeOn:[I

    .line 80
    new-instance v0, Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-direct {v0}, Lcom/dnake/desktop/handler/WindControlHandler;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    const/4 v0, 0x0

    .line 102
    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->powerOn:Z

    .line 103
    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->jiashiOn:Z

    .line 104
    iput v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentMode:I

    .line 305
    iput v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->count:I

    return-void

    :array_0
    .array-data 4
        0x7f0700a2
        0x7f0700a7
        0x7f070077
        0x7f0700a9
        0x7f07007e
    .end array-data

    :array_1
    .array-data 4
        0x7f0700a3
        0x7f0700a8
        0x7f070078
        0x7f0700aa
        0x7f07007f
    .end array-data

    :array_2
    .array-data 4
        0x7f070088
        0x7f0700ab
        0x7f070079
    .end array-data

    :array_3
    .array-data 4
        0x7f070089
        0x7f0700ac
        0x7f07007a
    .end array-data
.end method

.method private getModeByTempHumidity()I
    .locals 2

    .line 379
    iget v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->outdoorTemperature:F

    const/high16 v1, 0x41c00000    # 24.0f

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/high16 v1, 0x41800000    # 16.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    const/4 v0, 0x3

    return v0

    .line 385
    :cond_1
    iget v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windHumidity:F

    const/high16 v1, 0x41200000    # 10.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    const/4 v0, 0x2

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private getWindSpeedByCO2(F)I
    .locals 1

    const/high16 v0, 0x44480000    # 800.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/high16 v0, 0x44160000    # 600.0f

    cmpg-float p1, p1, v0

    if-gez p1, :cond_1

    const/4 p1, 0x2

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private setJiashiIcon(I)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 337
    :goto_0
    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->jiashiOn:Z

    .line 338
    iget-object p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivJiashi:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    const v0, 0x7f07008d

    goto :goto_1

    :cond_1
    const v0, 0x7f07008c

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method private setModeIcons(I)V
    .locals 4

    .line 342
    iput p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentMode:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    .line 343
    iget-boolean v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->jiashiOn:Z

    if-eqz v1, :cond_0

    .line 344
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v1

    const/16 v2, 0x35

    iget-object v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v1, v2, v0, v3}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 346
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivModes:[Landroid/widget/ImageView;

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 347
    aget-object v1, v1, v0

    if-ne v0, p1, :cond_1

    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->modeOn:[I

    aget v2, v2, p1

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->modeOff:[I

    aget v2, v2, v0

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private setPowerIcon(I)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 332
    :goto_0
    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->powerOn:Z

    .line 333
    iget-object p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivPower:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    const v0, 0x7f07009a

    goto :goto_1

    :cond_1
    const v0, 0x7f070099

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method private setTemp(F)V
    .locals 8

    .line 358
    iget v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->showTemp:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/high16 v0, 0x41900000    # 18.0f

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_1

    const/high16 v0, 0x41d00000    # 26.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 362
    iget v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->colorLevelGood:I

    goto :goto_1

    :cond_2
    iget v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->colorLevelMedium:I

    :goto_1
    move v6, v1

    if-eqz v0, :cond_3

    .line 363
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->strShushi:Ljava/lang/String;

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->strLianghao:Ljava/lang/String;

    :goto_2
    move-object v7, v0

    .line 364
    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->myCustomLayout:Lcom/dnake/desktop/widget/LandleafView;

    float-to-int v0, p1

    int-to-float v3, v0

    const/high16 v4, -0x3e600000    # -20.0f

    const/high16 v5, 0x42480000    # 50.0f

    invoke-virtual/range {v2 .. v7}, Lcom/dnake/desktop/widget/LandleafView;->setProgress(FFFILjava/lang/String;)V

    .line 365
    iput p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->showTemp:F

    return-void
.end method

.method private setVolumeIcons(I)V
    .locals 3

    const/4 v0, 0x0

    .line 352
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->ivVolumes:[Landroid/widget/ImageView;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 353
    aget-object v1, v1, v0

    if-ne v0, p1, :cond_0

    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->volumeOn:[I

    aget v2, v2, p1

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->volumeOff:[I

    aget v2, v2, v0

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected getViewID()I
    .locals 1

    const v0, 0x7f0b0023

    return v0
.end method

.method protected initFragment()V
    .locals 0

    return-void
.end method

.method public onClickView(Landroid/view/View;)V
    .locals 6
    .annotation runtime Lbutterknife/OnClick;
        value = {
            0x7f0800ad,
            0x7f0800ab,
            0x7f0800b3,
            0x7f0800a9,
            0x7f0800b1,
            0x7f0800aa,
            0x7f0800af,
            0x7f0800a8,
            0x7f0800b2,
            0x7f0800ac
        }
    .end annotation

    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/16 v2, 0x34

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/16 v5, 0x33

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 120
    :pswitch_1
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v2, v4, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_0

    .line 152
    :pswitch_2
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    const/4 v0, 0x4

    iget-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v5, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_0

    .line 128
    :pswitch_3
    iget p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    if-ne p1, v3, :cond_0

    .line 129
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/WindControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const-string v0, "\u5f53\u524d\u7a7a\u8c03\u4e3a\u5236\u70ed\u6a21\u5f0f\uff01\u65b0\u98ce\u6a21\u5f0f\u4fee\u6539\u65e0\u6548\uff01"

    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 132
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v5, v4, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_0

    .line 144
    :pswitch_4
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v5, v1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_0

    .line 112
    :pswitch_5
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    const/16 v0, 0x32

    iget-boolean v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->powerOn:Z

    xor-int/2addr v1, v4

    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v0, v1, v2}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_0

    .line 157
    :pswitch_6
    iget p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentMode:I

    if-eq p1, v0, :cond_1

    iget-boolean p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->jiashiOn:Z

    if-nez p1, :cond_1

    .line 158
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/WindControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const-string v0, "\u53ea\u6709\u5236\u70ed\u6a21\u5f0f\u53ef\u5f00\u542f\u52a0\u6e7f\uff01"

    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 161
    :cond_1
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    const/16 v0, 0x35

    iget-boolean v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->jiashiOn:Z

    xor-int/2addr v1, v4

    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v0, v1, v2}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_0

    .line 116
    :pswitch_7
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v2, v1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_0

    .line 136
    :pswitch_8
    iget p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    if-ne p1, v4, :cond_2

    .line 137
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/WindControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const-string v0, "\u5f53\u524d\u7a7a\u8c03\u4e3a\u5236\u51b7\u6a21\u5f0f\uff01\u65b0\u98ce\u6a21\u5f0f\u4fee\u6539\u65e0\u6548\uff01"

    invoke-virtual {p0, p1, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 140
    :cond_2
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v5, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_0

    .line 124
    :pswitch_9
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v2, v3, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_0

    .line 148
    :pswitch_a
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v5, v3, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0800a8
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 89
    invoke-super {p0, p1}, Lcom/dnake/desktop/base/BaseFragment;->onHiddenChanged(Z)V

    if-eqz p1, :cond_0

    return-void

    .line 94
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    return-void
.end method

.method public readAirStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 0
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 226
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result p1

    iput p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    return-void
.end method

.method public readSensor(Lcom/dnake/desktop/bean/ReadDeviceStatus;)V
    .locals 1
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 309
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    .line 310
    iget p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->count:I

    rem-int/lit16 p1, p1, 0x1e0

    if-nez p1, :cond_0

    .line 311
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->uploadBugInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    .line 313
    :cond_0
    iget p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->count:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->count:I

    return-void
.end method

.method public readWindStatus(Lcom/dnake/desktop/bean/WindStatus;)V
    .locals 3
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 170
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "windStatus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->isTypeTemp()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getShowTemp()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setTemp(F)V

    .line 173
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getWindHumidity()F

    move-result p1

    iput p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windHumidity:F

    return-void

    .line 176
    :cond_0
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setModeIcons(I)V

    .line 177
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getWindSpeed()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setVolumeIcons(I)V

    .line 178
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getPower()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setPowerIcon(I)V

    .line 179
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/WindStatus;->getHumiditySwitch()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/dnake/desktop/fragment/WindControlFragment;->setJiashiIcon(I)V

    return-void
.end method

.method public remoteControl(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 9
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "remoteControl MqttMsgBodyModel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getProductCode()I

    move-result v0

    const/16 v1, 0x1bc3

    if-ne v0, v1, :cond_8

    .line 270
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/utils/CommonUtils;->parseRemoteInfo(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)Ljava/util/List;

    move-result-object v0

    .line 271
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dnake/desktop/bean/MqttRemoteControl;

    .line 272
    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "remoteControl mqttRemoteControl:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlValue()I

    move-result v2

    .line 276
    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlAddress()I

    move-result v3

    const/16 v4, 0x33

    const/4 v5, 0x0

    const/4 v6, 0x3

    const/4 v7, 0x1

    const-string v8, "\u65b0\u98ce\u7a7a\u8c03\u6a21\u5f0f\u51b2\u7a81\uff0c\u65b0\u98ce\u6a21\u5f0f\u4fee\u6539\u65e0\u6548\uff01"

    if-eq v3, v4, :cond_4

    const/16 v4, 0x35

    if-eq v3, v4, :cond_0

    goto :goto_2

    .line 283
    :cond_0
    iget v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentMode:I

    if-eq v3, v6, :cond_1

    if-eq v2, v7, :cond_2

    :cond_1
    const/4 v5, 0x1

    :cond_2
    if-nez v5, :cond_3

    const-string v8, "\u5236\u70ed\u4e0b\u624d\u53ef\u52a0\u6e7f"

    :cond_3
    :goto_1
    move v7, v5

    goto :goto_2

    .line 279
    :cond_4
    iget v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    if-ne v3, v7, :cond_5

    if-eq v2, v6, :cond_3

    :cond_5
    iget v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_6

    if-eq v2, v7, :cond_3

    :cond_6
    const/4 v5, 0x1

    goto :goto_1

    .line 293
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canControl:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "WindControlFragment"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v7, :cond_7

    .line 295
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    .line 296
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v3

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlAddress()I

    move-result v1

    iget-object v4, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v3, v1, v2, v4}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_0

    .line 298
    :cond_7
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 299
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v1

    const/16 v2, 0x1f4

    invoke-virtual {v1, p1, v2, v8}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;ILjava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    return-void
.end method

.method public sceneControl(Lcom/landleaf/smarthome/model/SceneControlBean;)V
    .locals 7
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 231
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->isDelayControl()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 235
    :cond_0
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x32

    if-nez v0, :cond_1

    .line 236
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v2, v1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    return-void

    .line 239
    :cond_1
    iget-boolean v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->powerOn:Z

    const/4 v3, 0x1

    if-nez v0, :cond_2

    .line 240
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    iget-object v4, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v0, v2, v3, v4}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 242
    :cond_2
    invoke-direct {p0}, Lcom/dnake/desktop/fragment/WindControlFragment;->getModeByTempHumidity()I

    move-result v0

    .line 244
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v2

    const/16 v4, 0x33

    const/16 v5, 0x34

    if-ne v2, v3, :cond_3

    .line 246
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/WindControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/dnake/desktop/utils/PreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object v2

    const/high16 v3, 0x44480000    # 800.0f

    const-string v6, "CO2"

    invoke-virtual {v2, v6, v3}, Lcom/dnake/desktop/utils/PreferencesUtils;->readFloat(Ljava/lang/String;F)F

    move-result v2

    .line 247
    invoke-direct {p0, v2}, Lcom/dnake/desktop/fragment/WindControlFragment;->getWindSpeedByCO2(F)I

    move-result v2

    .line 248
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v3

    iget-object v6, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v3, v5, v2, v6}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 250
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v2

    iget-object v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v2, v4, v0, v3}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 253
    :cond_3
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_4

    .line 254
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v2

    iget-object v6, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v2, v5, v3, v6}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 255
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v2

    iget-object v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v2, v4, v0, v3}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 258
    :cond_4
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result p1

    const/4 v2, 0x3

    if-ne p1, v2, :cond_5

    .line 259
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v5, v1, v2}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 260
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {p1, v4, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    :cond_5
    return-void
.end method

.method public updateDeviceInfo(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/RoomModel;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        sticky = true
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 318
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/landleaf/smarthome/model/RoomModel;

    .line 319
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5ba2\u5385"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 320
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/RoomModel;->getDevices()Ljava/util/List;

    move-result-object v0

    .line 321
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/landleaf/smarthome/model/DeviceModel;

    .line 322
    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v2

    const/16 v3, 0x1bc3

    if-ne v2, v3, :cond_1

    .line 323
    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    .line 324
    iget-object v2, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v2, v1}, Lcom/dnake/desktop/handler/WindControlHandler;->setDeviceSn(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public writeWindStatus(Lcom/dnake/desktop/bean/NtWriteResult;)V
    .locals 4
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 189
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->isWriteWind()Z

    move-result v0

    const/16 v1, 0x33

    if-nez v0, :cond_4

    .line 191
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v0

    if-nez v0, :cond_2

    .line 192
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eq v0, v3, :cond_0

    if-ne v0, v2, :cond_2

    .line 194
    :cond_0
    iget v0, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->currentAirMode:I

    if-ne v0, v3, :cond_1

    const/4 v2, 0x3

    .line 195
    :cond_1
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    iget-object v3, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->windControlHandler:Lcom/dnake/desktop/handler/WindControlHandler;

    invoke-virtual {v0, v1, v2, v3}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    .line 199
    :cond_2
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_3

    .line 200
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getValue()F

    move-result p1

    iput p1, p0, Lcom/dnake/desktop/fragment/WindControlFragment;->outdoorTemperature:F

    :cond_3
    return-void

    .line 204
    :cond_4
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getValue()F

    move-result v0

    float-to-int v0, v0

    .line 206
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v2

    const/16 v3, 0x32

    if-ne v2, v3, :cond_5

    .line 207
    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setPowerIcon(I)V

    .line 210
    :cond_5
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v2

    if-ne v2, v1, :cond_6

    .line 211
    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setModeIcons(I)V

    .line 214
    :cond_6
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v1

    const/16 v2, 0x34

    if-ne v1, v2, :cond_7

    .line 215
    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setVolumeIcons(I)V

    .line 218
    :cond_7
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result p1

    const/16 v1, 0x35

    if-ne p1, v1, :cond_8

    .line 219
    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/WindControlFragment;->setJiashiIcon(I)V

    :cond_8
    return-void
.end method
