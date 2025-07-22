.class public Lcom/dnake/desktop/fragment/MonitorFragment;
.super Lcom/dnake/desktop/base/BaseFragment;
.source "MonitorFragment.java"


# static fields
.field public static final CO2_LEVEL_1:F = 1000.0f

.field public static final CO2_LEVEL_2:F = 1500.0f

.field public static final HUMIDITY_LEVEL_1:F = 30.0f

.field public static final HUMIDITY_LEVEL_2:F = 70.0f

.field public static final MAX_VALUE_CO2:F = 2000.0f

.field public static final MAX_VALUE_HUMIDITY:F = 100.0f

.field public static final MAX_VALUE_PM25:F = 200.0f

.field public static final MIN_VALUE_CO2:F = 0.0f

.field public static final MIN_VALUE_HUMIDITY:F = 0.0f

.field public static final MIN_VALUE_PM25:F = 0.0f

.field public static final PM25_LEVEL_1:F = 50.0f

.field public static final PM25_LEVEL_2:F = 100.0f

.field public static final VOC_LEVEL_1:F = 0.26f

.field public static final VOC_LEVEL_2:F = 0.6f


# instance fields
.field private TAG:Ljava/lang/String;

.field arofeneLevels:[Ljava/lang/String;
    .annotation runtime Lbutterknife/BindArray;
        value = 0x7f020000
    .end annotation
.end field

.field arofeneViewVoc:Lcom/dnake/desktop/widget/ArofeneView1;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080047
    .end annotation
.end field

.field colorClicked:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f05002a
    .end annotation
.end field

.field colorLevelBad:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f05002b
    .end annotation
.end field

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

.field colorUnClick:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f050030
    .end annotation
.end field

.field dataTypes:[Ljava/lang/String;
    .annotation runtime Lbutterknife/BindArray;
        value = 0x7f020001
    .end annotation
.end field

.field ivWeatherStatus:Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f0800b0
    .end annotation
.end field

.field layouts:Ljava/util/List;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f080109,
            0x7f0800fa,
            0x7f080107,
            0x7f0800fc,
            0x7f080105
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/RelativeLayout;",
            ">;"
        }
    .end annotation
.end field

.field myMonitorLayout:Lcom/dnake/desktop/widget/LandleafView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f0800d6
    .end annotation
.end field

.field private position:I

.field private recordBean:Lcom/dnake/desktop/bean/RecordBean;

.field private selectedColor:I

.field sensorHandler:Lcom/dnake/desktop/handler/SensorHandler;

.field shapeLeftBottomSelected:Landroid/graphics/drawable/Drawable;
    .annotation runtime Lbutterknife/BindDrawable;
        value = 0x7f0700cb
    .end annotation
.end field

.field shapeLeftBottomUnSelect:Landroid/graphics/drawable/Drawable;
    .annotation runtime Lbutterknife/BindDrawable;
        value = 0x7f0700cc
    .end annotation
.end field

.field shapeLeftTopSelected:Landroid/graphics/drawable/Drawable;
    .annotation runtime Lbutterknife/BindDrawable;
        value = 0x7f0700cd
    .end annotation
.end field

.field shapeLeftTopUnSelect:Landroid/graphics/drawable/Drawable;
    .annotation runtime Lbutterknife/BindDrawable;
        value = 0x7f0700ce
    .end annotation
.end field

.field strJiaocha:Ljava/lang/String;
    .annotation runtime Lbutterknife/BindString;
        value = 0x7f0d0037
    .end annotation
.end field

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

.field tvCalender:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080161
    .end annotation
.end field

.field tvChuanyi:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080162
    .end annotation
.end field

.field tvCo2In:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080163
    .end annotation
.end field

.field tvDataType:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080164
    .end annotation
.end field

.field tvGanmao:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080165
    .end annotation
.end field

.field tvHumidityIn:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080166
    .end annotation
.end field

.field tvHumidityOut:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080167
    .end annotation
.end field

.field tvPmIn:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080168
    .end annotation
.end field

.field tvPmOut:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080169
    .end annotation
.end field

.field tvSport:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f08016a
    .end annotation
.end field

.field tvSunny:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f08016b
    .end annotation
.end field

.field tvTempIn:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f08016c
    .end annotation
.end field

.field tvTempOut:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f08016d
    .end annotation
.end field

.field tvUnit:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f08016f
    .end annotation
.end field

.field tvUnits:[Ljava/lang/String;
    .annotation runtime Lbutterknife/BindArray;
        value = 0x7f020002
    .end annotation
.end field

.field tvUpdateTime:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080170
    .end annotation
.end field

.field tvWeatherStatus:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080171
    .end annotation
.end field

.field tvWindDir:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080172
    .end annotation
.end field

.field tvWindLevel:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080173
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Lcom/dnake/desktop/base/BaseFragment;-><init>()V

    const-string v0, "MonitorFragment"

    .line 52
    iput-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->TAG:Ljava/lang/String;

    const/4 v0, 0x2

    .line 136
    iput v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->position:I

    .line 146
    new-instance v0, Lcom/dnake/desktop/handler/SensorHandler;

    invoke-direct {v0}, Lcom/dnake/desktop/handler/SensorHandler;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->sensorHandler:Lcom/dnake/desktop/handler/SensorHandler;

    return-void
.end method

.method private setClick()V
    .locals 5

    const/4 v0, 0x1

    .line 167
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 169
    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Lcom/jakewharton/rxbinding2/view/RxView;->clicks(Landroid/view/View;)Lio/reactivex/Observable;

    move-result-object v1

    const-wide/16 v2, 0x2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 170
    invoke-virtual {v1, v2, v3, v4}, Lio/reactivex/Observable;->throttleFirst(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v1

    new-instance v2, Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;

    invoke-direct {v2, p0, v0}, Lcom/dnake/desktop/fragment/-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s;-><init>(Lcom/dnake/desktop/fragment/MonitorFragment;I)V

    .line 171
    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setRoomIn(Lcom/dnake/desktop/bean/RecordBean;)V
    .locals 6

    .line 262
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getVoc()F

    move-result v0

    .line 266
    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->arofeneViewVoc:Lcom/dnake/desktop/widget/ArofeneView1;

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getVocLevel(F)I

    move-result v0

    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/dnake/desktop/widget/ArofeneView1;->setArofeneLevelTxt(ILandroid/content/Context;)V

    .line 269
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getCo2()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getCO2ColorLevel(F)I

    .line 270
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCo2In:Landroid/widget/TextView;

    iget v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 271
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getCo2()F

    move-result v0

    float-to-int v0, v0

    .line 272
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getCo2()F

    move-result v1

    const/high16 v2, 0x44fa0000    # 2000.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    const/16 v0, 0x7d0

    .line 275
    :cond_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCo2In:Landroid/widget/TextView;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/dnake/desktop/utils/PreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getCo2()F

    move-result v1

    const-string v2, "CO2"

    invoke-virtual {v0, v2, v1}, Lcom/dnake/desktop/utils/PreferencesUtils;->writeFloat(Ljava/lang/String;F)V

    .line 279
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getTemp()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getTempColorLevel(F)I

    .line 280
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempIn:Landroid/widget/TextView;

    iget v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 281
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempIn:Landroid/widget/TextView;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getTemp()F

    move-result v3

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const v3, 0x7f0d004d

    invoke-virtual {p0, v3}, Lcom/dnake/desktop/fragment/MonitorFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "%s%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getHumidity()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getHumidityColorLevel(F)I

    .line 285
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityIn:Landroid/widget/TextView;

    iget v2, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 286
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityIn:Landroid/widget/TextView;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getHumidity()F

    move-result v2

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    const v2, 0x7f0d004a

    invoke-virtual {p0, v2}, Lcom/dnake/desktop/fragment/MonitorFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getPm25()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getPm25ColorLevel(F)I

    .line 290
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmIn:Landroid/widget/TextView;

    iget v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 291
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmIn:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/RecordBean;->getPm25()F

    move-result p1

    float-to-int p1, p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setValue()V
    .locals 12

    .line 302
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvDataType:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->dataTypes:[Ljava/lang/String;

    iget v2, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->position:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 307
    iget v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->position:I

    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-eq v0, v2, :cond_6

    if-eq v0, v4, :cond_4

    if-eq v0, v1, :cond_2

    const/4 v6, 0x4

    if-eq v0, v6, :cond_0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    goto :goto_4

    .line 331
    :cond_0
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->recordBean:Lcom/dnake/desktop/bean/RecordBean;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/RecordBean;->getPm25()F

    move-result v0

    :goto_0
    const/high16 v6, 0x43480000    # 200.0f

    .line 334
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getPm25ColorLevel(F)I

    move-result v7

    move v5, v0

    const/4 v8, 0x0

    const/high16 v9, 0x43480000    # 200.0f

    goto :goto_4

    .line 324
    :cond_2
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->recordBean:Lcom/dnake/desktop/bean/RecordBean;

    if-nez v0, :cond_3

    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/RecordBean;->getHumidity()F

    move-result v0

    :goto_1
    const/high16 v6, 0x42c80000    # 100.0f

    .line 327
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getHumidityColorLevel(F)I

    move-result v7

    move v5, v0

    const/4 v8, 0x0

    const/high16 v9, 0x42c80000    # 100.0f

    goto :goto_4

    .line 317
    :cond_4
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->recordBean:Lcom/dnake/desktop/bean/RecordBean;

    if-nez v0, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/RecordBean;->getTemp()F

    move-result v0

    move v5, v0

    :goto_2
    const/high16 v0, -0x3e600000    # -20.0f

    const/high16 v6, 0x42480000    # 50.0f

    .line 320
    invoke-virtual {p0, v5}, Lcom/dnake/desktop/fragment/MonitorFragment;->getTempColorLevel(F)I

    move-result v7

    const/high16 v8, -0x3e600000    # -20.0f

    const/high16 v9, 0x42480000    # 50.0f

    goto :goto_4

    .line 310
    :cond_6
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->recordBean:Lcom/dnake/desktop/bean/RecordBean;

    if-nez v0, :cond_7

    const/4 v0, 0x0

    goto :goto_3

    :cond_7
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/RecordBean;->getCo2()F

    move-result v0

    :goto_3
    const/high16 v6, 0x44fa0000    # 2000.0f

    .line 313
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getCO2ColorLevel(F)I

    move-result v7

    move v5, v0

    const/4 v8, 0x0

    const/high16 v9, 0x44fa0000    # 2000.0f

    :goto_4
    new-array v0, v1, [Ljava/lang/String;

    .line 338
    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->strShushi:Ljava/lang/String;

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->strLianghao:Ljava/lang/String;

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->strJiaocha:Ljava/lang/String;

    aput-object v1, v0, v4

    .line 339
    iget-object v6, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->myMonitorLayout:Lcom/dnake/desktop/widget/LandleafView;

    float-to-int v1, v5

    int-to-float v1, v1

    iget v10, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    aget-object v11, v0, v7

    move v7, v1

    invoke-virtual/range {v6 .. v11}, Lcom/dnake/desktop/widget/LandleafView;->setProgress(FFFILjava/lang/String;)V

    .line 341
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUnit:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUnits:[Ljava/lang/String;

    iget v2, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->position:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 343
    :goto_5
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_d

    .line 344
    iget v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->position:I

    if-ne v3, v0, :cond_a

    if-ne v3, v4, :cond_8

    .line 347
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftBottomSelected:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    :cond_8
    if-nez v3, :cond_9

    .line 349
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftTopSelected:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    .line 351
    :cond_9
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    const-string v1, "#2a4d63"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    goto :goto_6

    :cond_a
    if-ne v3, v4, :cond_b

    .line 356
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftBottomUnSelect:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    :cond_b
    if-nez v3, :cond_c

    .line 358
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftTopUnSelect:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    .line 360
    :cond_c
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    const-string v1, "#2f3032"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_d
    return-void
.end method

.method private setWeatherModel(Lcom/landleaf/smarthome/model/WeatherModel;)V
    .locals 7

    .line 203
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getTemp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->isNumber(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const-string v4, "%s%s"

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getTemp()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 205
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getTempColorLevel(F)I

    .line 206
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempOut:Landroid/widget/TextView;

    iget v5, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 207
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempOut:Landroid/widget/TextView;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getTemp()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    const v6, 0x7f0d004d

    invoke-virtual {p0, v6}, Lcom/dnake/desktop/fragment/MonitorFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getHumidity()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/dnake/desktop/utils/CommonUtils;->isNumber(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 212
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getHumidity()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 213
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getHumidityColorLevel(F)I

    .line 214
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityOut:Landroid/widget/TextView;

    iget v5, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 215
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityOut:Landroid/widget/TextView;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getHumidity()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v2

    const v2, 0x7f0d004a

    invoke-virtual {p0, v2}, Lcom/dnake/desktop/fragment/MonitorFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    :cond_1
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getPm25()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->isNumber(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 220
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getPm25()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 221
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getPm25ColorLevel(F)I

    .line 222
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmOut:Landroid/widget/TextView;

    iget v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmOut:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getPm25()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public getCO2ColorLevel(F)I
    .locals 1

    const/high16 v0, 0x447a0000    # 1000.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 413
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelGood:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x0

    return p1

    :cond_0
    const v0, 0x44bb8000    # 1500.0f

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    .line 417
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelBad:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x2

    return p1

    .line 420
    :cond_1
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelMedium:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x1

    return p1
.end method

.method public getHumidityColorLevel(F)I
    .locals 1

    const/high16 v0, 0x41f00000    # 30.0f

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x428c0000    # 70.0f

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    .line 382
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelGood:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x0

    return p1

    .line 385
    :cond_0
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelMedium:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x1

    return p1
.end method

.method public getPm25ColorLevel(F)I
    .locals 1

    const/high16 v0, 0x42480000    # 50.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 396
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelGood:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x0

    return p1

    :cond_0
    const/high16 v0, 0x42c80000    # 100.0f

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    .line 400
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelBad:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x2

    return p1

    .line 403
    :cond_1
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelMedium:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x1

    return p1
.end method

.method public getRecordModel(Lcom/dnake/desktop/bean/RecordBean;)V
    .locals 2
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    if-nez p1, :cond_0

    return-void

    .line 232
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "recordBean:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MonitorFragment"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    iput-object p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->recordBean:Lcom/dnake/desktop/bean/RecordBean;

    .line 234
    invoke-direct {p0, p1}, Lcom/dnake/desktop/fragment/MonitorFragment;->setRoomIn(Lcom/dnake/desktop/bean/RecordBean;)V

    .line 235
    invoke-direct {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->setValue()V

    .line 236
    invoke-static {p1}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 237
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/dnake/desktop/utils/PreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object v0

    const-string v1, "SENSOR_HISTORY"

    invoke-virtual {v0, v1, p1}, Lcom/dnake/desktop/utils/PreferencesUtils;->write(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getTempColorLevel(F)I
    .locals 1

    const/high16 v0, 0x41900000    # 18.0f

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x41d00000    # 26.0f

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    .line 369
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelGood:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x0

    return p1

    .line 372
    :cond_0
    iget p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelMedium:I

    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->selectedColor:I

    const/4 p1, 0x1

    return p1
.end method

.method protected getViewID()I
    .locals 1

    const v0, 0x7f0b0024

    return v0
.end method

.method public getVocLevel(F)I
    .locals 1

    const v0, 0x3e851eb8    # 0.26f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const v0, 0x3f19999a    # 0.6f

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    const/4 p1, 0x2

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public getWeather(Lcom/landleaf/smarthome/model/WeatherModel;)V
    .locals 3
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        sticky = true
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 180
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u6536\u5230\u5929\u6c14:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    return-void

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCalender:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getCalender()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWeatherStatus:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getWeatherStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUpdateTime:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getUpdateTime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWindDir:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getWindDirection()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWindLevel:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getWindLevel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvSport:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getSportLevel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvSunny:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getUvLevel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvChuanyi:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getDressLevel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvGanmao:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getColdLevel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/Fragment;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/WeatherModel;->getPicUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->ivWeatherStatus:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 196
    invoke-direct {p0, p1}, Lcom/dnake/desktop/fragment/MonitorFragment;->setWeatherModel(Lcom/landleaf/smarthome/model/WeatherModel;)V

    .line 197
    invoke-static {p1}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 198
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/dnake/desktop/utils/PreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object v0

    const-string v1, "WEATHER_HISTORY"

    invoke-virtual {v0, v1, p1}, Lcom/dnake/desktop/utils/PreferencesUtils;->write(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected initFragment()V
    .locals 4

    .line 151
    invoke-direct {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->setClick()V

    .line 153
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/dnake/desktop/utils/PreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object v0

    const-string v1, ""

    const-string v2, "WEATHER_HISTORY"

    invoke-virtual {v0, v2, v1}, Lcom/dnake/desktop/utils/PreferencesUtils;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    const-class v2, Lcom/landleaf/smarthome/model/WeatherModel;

    invoke-static {v0, v2}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/landleaf/smarthome/model/WeatherModel;

    .line 155
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/dnake/desktop/utils/PreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object v2

    const-string v3, "SENSOR_HISTORY"

    invoke-virtual {v2, v3, v1}, Lcom/dnake/desktop/utils/PreferencesUtils;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 156
    const-class v2, Lcom/dnake/desktop/bean/RecordBean;

    invoke-static {v1, v2}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dnake/desktop/bean/RecordBean;

    .line 157
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/MonitorFragment;->getWeather(Lcom/landleaf/smarthome/model/WeatherModel;)V

    .line 158
    invoke-virtual {p0, v1}, Lcom/dnake/desktop/fragment/MonitorFragment;->getRecordModel(Lcom/dnake/desktop/bean/RecordBean;)V

    return-void
.end method

.method public synthetic lambda$setClick$0$MonitorFragment(ILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 172
    iput p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->position:I

    .line 173
    invoke-direct {p0}, Lcom/dnake/desktop/fragment/MonitorFragment;->setValue()V

    return-void
.end method

.method public readSensor(Lcom/dnake/desktop/bean/ReadDeviceStatus;)V
    .locals 1
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 242
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->sensorHandler:Lcom/dnake/desktop/handler/SensorHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

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

    .line 247
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/landleaf/smarthome/model/RoomModel;

    .line 248
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5ba2\u5385"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 249
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/RoomModel;->getDevices()Ljava/util/List;

    move-result-object v0

    .line 250
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

    .line 251
    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v2

    const/16 v3, 0x44d

    if-ne v2, v3, :cond_1

    .line 252
    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    .line 253
    iget-object v2, p0, Lcom/dnake/desktop/fragment/MonitorFragment;->sensorHandler:Lcom/dnake/desktop/handler/SensorHandler;

    invoke-virtual {v2, v1}, Lcom/dnake/desktop/handler/SensorHandler;->setDeviceSn(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    return-void
.end method
