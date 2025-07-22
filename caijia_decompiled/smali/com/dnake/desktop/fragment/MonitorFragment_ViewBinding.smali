.class public Lcom/dnake/desktop/fragment/MonitorFragment_ViewBinding;
.super Ljava/lang/Object;
.source "MonitorFragment_ViewBinding.java"

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/dnake/desktop/fragment/MonitorFragment;


# direct methods
.method public constructor <init>(Lcom/dnake/desktop/fragment/MonitorFragment;Landroid/view/View;)V
    .locals 4

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/dnake/desktop/fragment/MonitorFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/MonitorFragment;

    .line 28
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f08016f

    const-string v2, "field \'tvUnit\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUnit:Landroid/widget/TextView;

    .line 29
    const-class v0, Landroid/widget/ImageView;

    const v1, 0x7f0800b0

    const-string v2, "field \'ivWeatherStatus\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->ivWeatherStatus:Landroid/widget/ImageView;

    .line 30
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080171

    const-string v2, "field \'tvWeatherStatus\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWeatherStatus:Landroid/widget/TextView;

    .line 31
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080170

    const-string v2, "field \'tvUpdateTime\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUpdateTime:Landroid/widget/TextView;

    .line 32
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080161

    const-string v2, "field \'tvCalender\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCalender:Landroid/widget/TextView;

    .line 33
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080172

    const-string v2, "field \'tvWindDir\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWindDir:Landroid/widget/TextView;

    .line 34
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080173

    const-string v2, "field \'tvWindLevel\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWindLevel:Landroid/widget/TextView;

    .line 35
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f08016a

    const-string v2, "field \'tvSport\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvSport:Landroid/widget/TextView;

    .line 36
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f08016b

    const-string v2, "field \'tvSunny\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvSunny:Landroid/widget/TextView;

    .line 37
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080162

    const-string v2, "field \'tvChuanyi\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvChuanyi:Landroid/widget/TextView;

    .line 38
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080165

    const-string v2, "field \'tvGanmao\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvGanmao:Landroid/widget/TextView;

    .line 39
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080163

    const-string v2, "field \'tvCo2In\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCo2In:Landroid/widget/TextView;

    .line 40
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f08016c

    const-string v2, "field \'tvTempIn\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempIn:Landroid/widget/TextView;

    .line 41
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f08016d

    const-string v2, "field \'tvTempOut\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempOut:Landroid/widget/TextView;

    .line 42
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080166

    const-string v2, "field \'tvHumidityIn\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityIn:Landroid/widget/TextView;

    .line 43
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080167

    const-string v2, "field \'tvHumidityOut\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityOut:Landroid/widget/TextView;

    .line 44
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080168

    const-string v2, "field \'tvPmIn\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmIn:Landroid/widget/TextView;

    .line 45
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080169

    const-string v2, "field \'tvPmOut\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmOut:Landroid/widget/TextView;

    .line 46
    const-class v0, Lcom/dnake/desktop/widget/ArofeneView1;

    const v1, 0x7f080047

    const-string v2, "field \'arofeneViewVoc\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/widget/ArofeneView1;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->arofeneViewVoc:Lcom/dnake/desktop/widget/ArofeneView1;

    .line 47
    const-class v0, Landroid/widget/TextView;

    const v1, 0x7f080164

    const-string v2, "field \'tvDataType\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvDataType:Landroid/widget/TextView;

    .line 48
    const-class v0, Lcom/dnake/desktop/widget/LandleafView;

    const v1, 0x7f0800d6

    const-string v2, "field \'myMonitorLayout\'"

    invoke-static {p2, v1, v2, v0}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/widget/LandleafView;

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->myMonitorLayout:Lcom/dnake/desktop/widget/LandleafView;

    const/4 v0, 0x5

    new-array v0, v0, [Landroid/widget/RelativeLayout;

    .line 49
    const-class v1, Landroid/widget/RelativeLayout;

    const-string v2, "field \'layouts\'"

    const v3, 0x7f080109

    .line 50
    invoke-static {p2, v3, v2, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    const-class v1, Landroid/widget/RelativeLayout;

    const v3, 0x7f0800fa

    .line 51
    invoke-static {p2, v3, v2, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-class v1, Landroid/widget/RelativeLayout;

    const v3, 0x7f080107

    .line 52
    invoke-static {p2, v3, v2, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v3, 0x2

    aput-object v1, v0, v3

    const-class v1, Landroid/widget/RelativeLayout;

    const v3, 0x7f0800fc

    .line 53
    invoke-static {p2, v3, v2, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v3, 0x3

    aput-object v1, v0, v3

    const-class v1, Landroid/widget/RelativeLayout;

    const v3, 0x7f080105

    .line 54
    invoke-static {p2, v3, v2, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 49
    invoke-static {v0}, Lbutterknife/internal/Utils;->listFilteringNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    .line 56
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 57
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020002

    .line 58
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUnits:[Ljava/lang/String;

    const v1, 0x7f020001

    .line 59
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->dataTypes:[Ljava/lang/String;

    const/high16 v1, 0x7f020000

    .line 60
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->arofeneLevels:[Ljava/lang/String;

    const v1, 0x7f05002c

    .line 61
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    iput v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelGood:I

    const v1, 0x7f05002d

    .line 62
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    iput v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelMedium:I

    const v1, 0x7f05002b

    .line 63
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    iput v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->colorLevelBad:I

    const v1, 0x7f05002a

    .line 64
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    iput v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->colorClicked:I

    const v1, 0x7f050030

    .line 65
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    iput v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->colorUnClick:I

    const v1, 0x7f0700cb

    .line 66
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftBottomSelected:Landroid/graphics/drawable/Drawable;

    const v1, 0x7f0700cc

    .line 67
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftBottomUnSelect:Landroid/graphics/drawable/Drawable;

    const v1, 0x7f0700cd

    .line 68
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftTopSelected:Landroid/graphics/drawable/Drawable;

    const v1, 0x7f0700ce

    .line 69
    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->shapeLeftTopUnSelect:Landroid/graphics/drawable/Drawable;

    const p2, 0x7f0d0039

    .line 70
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->strShushi:Ljava/lang/String;

    const p2, 0x7f0d0038

    .line 71
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->strLianghao:Ljava/lang/String;

    const p2, 0x7f0d0037

    .line 72
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/dnake/desktop/fragment/MonitorFragment;->strJiaocha:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/dnake/desktop/fragment/MonitorFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/MonitorFragment;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 80
    iput-object v1, p0, Lcom/dnake/desktop/fragment/MonitorFragment_ViewBinding;->target:Lcom/dnake/desktop/fragment/MonitorFragment;

    .line 82
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUnit:Landroid/widget/TextView;

    .line 83
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->ivWeatherStatus:Landroid/widget/ImageView;

    .line 84
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWeatherStatus:Landroid/widget/TextView;

    .line 85
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvUpdateTime:Landroid/widget/TextView;

    .line 86
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCalender:Landroid/widget/TextView;

    .line 87
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWindDir:Landroid/widget/TextView;

    .line 88
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvWindLevel:Landroid/widget/TextView;

    .line 89
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvSport:Landroid/widget/TextView;

    .line 90
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvSunny:Landroid/widget/TextView;

    .line 91
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvChuanyi:Landroid/widget/TextView;

    .line 92
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvGanmao:Landroid/widget/TextView;

    .line 93
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvCo2In:Landroid/widget/TextView;

    .line 94
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempIn:Landroid/widget/TextView;

    .line 95
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvTempOut:Landroid/widget/TextView;

    .line 96
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityIn:Landroid/widget/TextView;

    .line 97
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvHumidityOut:Landroid/widget/TextView;

    .line 98
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmIn:Landroid/widget/TextView;

    .line 99
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvPmOut:Landroid/widget/TextView;

    .line 100
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->arofeneViewVoc:Lcom/dnake/desktop/widget/ArofeneView1;

    .line 101
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->tvDataType:Landroid/widget/TextView;

    .line 102
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->myMonitorLayout:Lcom/dnake/desktop/widget/LandleafView;

    .line 103
    iput-object v1, v0, Lcom/dnake/desktop/fragment/MonitorFragment;->layouts:Ljava/util/List;

    return-void

    .line 79
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
