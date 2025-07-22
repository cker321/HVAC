.class Lcom/gyf/barlibrary/BarConfig;
.super Ljava/lang/Object;
.source "BarConfig.java"


# static fields
.field private static final MIUI_FORCE_FSG_NAV_BAR:Ljava/lang/String; = "force_fsg_nav_bar"

.field private static final NAV_BAR_HEIGHT_LANDSCAPE_RES_NAME:Ljava/lang/String; = "navigation_bar_height_landscape"

.field private static final NAV_BAR_HEIGHT_RES_NAME:Ljava/lang/String; = "navigation_bar_height"

.field private static final NAV_BAR_WIDTH_RES_NAME:Ljava/lang/String; = "navigation_bar_width"

.field private static final STATUS_BAR_HEIGHT_RES_NAME:Ljava/lang/String; = "status_bar_height"


# instance fields
.field private final mActionBarHeight:I

.field private final mHasNavigationBar:Z

.field private final mHasNotchScreen:Z

.field private final mInPortrait:Z

.field private final mNavigationBarHeight:I

.field private final mNavigationBarWidth:I

.field private final mSmallestWidthDp:F

.field private final mStatusBarHeight:I


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 3

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarConfig;->mInPortrait:Z

    .line 48
    invoke-direct {p0, p1}, Lcom/gyf/barlibrary/BarConfig;->getSmallestWidthDp(Landroid/app/Activity;)F

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/BarConfig;->mSmallestWidthDp:F

    const-string v0, "status_bar_height"

    .line 49
    invoke-direct {p0, p1, v0}, Lcom/gyf/barlibrary/BarConfig;->getInternalDimensionSize(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/BarConfig;->mStatusBarHeight:I

    .line 50
    invoke-direct {p0, p1}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/BarConfig;->mActionBarHeight:I

    .line 51
    invoke-direct {p0, p1}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/BarConfig;->mNavigationBarHeight:I

    .line 52
    invoke-direct {p0, p1}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/BarConfig;->mNavigationBarWidth:I

    .line 53
    iget v0, p0, Lcom/gyf/barlibrary/BarConfig;->mNavigationBarHeight:I

    if-lez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lcom/gyf/barlibrary/BarConfig;->mHasNavigationBar:Z

    .line 54
    invoke-static {p1}, Lcom/gyf/barlibrary/NotchUtils;->hasNotchScreen(Landroid/app/Activity;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/gyf/barlibrary/BarConfig;->mHasNotchScreen:Z

    return-void
.end method

.method private getActionBarHeight(Landroid/content/Context;)I
    .locals 4

    .line 60
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 61
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x10102eb

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 63
    iget v0, v0, Landroid/util/TypedValue;->data:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private getInternalDimensionSize(Landroid/content/Context;Ljava/lang/String;)I
    .locals 4

    const/4 v0, 0x0

    .line 128
    :try_start_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_1

    .line 130
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 131
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    if-lt p2, v1, :cond_0

    return p2

    .line 136
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 137
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, v1

    mul-float v1, v1, p2

    div-float/2addr v1, p1

    .line 138
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p1
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    :cond_1
    return v0
.end method

.method private getNavigationBarHeight(Landroid/content/Context;)I
    .locals 2

    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1

    .line 72
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-direct {p0, v0}, Lcom/gyf/barlibrary/BarConfig;->hasNavBar(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    iget-boolean v0, p0, Lcom/gyf/barlibrary/BarConfig;->mInPortrait:Z

    if-eqz v0, :cond_0

    const-string v0, "navigation_bar_height"

    goto :goto_0

    :cond_0
    const-string v0, "navigation_bar_height_landscape"

    .line 79
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/gyf/barlibrary/BarConfig;->getInternalDimensionSize(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private getNavigationBarWidth(Landroid/content/Context;)I
    .locals 2

    .line 88
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 89
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    invoke-direct {p0, v0}, Lcom/gyf/barlibrary/BarConfig;->hasNavBar(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "navigation_bar_width"

    .line 90
    invoke-direct {p0, p1, v0}, Lcom/gyf/barlibrary/BarConfig;->getInternalDimensionSize(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private getSmallestWidthDp(Landroid/app/Activity;)F
    .locals 3

    .line 149
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 150
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    .line 151
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    goto :goto_0

    .line 153
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 155
    :goto_0
    iget p1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p1, v1

    .line 156
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v0

    .line 157
    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    return p1
.end method

.method private hasNavBar(Landroid/app/Activity;)Z
    .locals 4

    .line 99
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 100
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "force_fsg_nav_bar"

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    return v2

    .line 105
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    .line 106
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    .line 108
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 109
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v1, :cond_1

    .line 110
    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 113
    :cond_1
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 114
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 116
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    .line 117
    invoke-virtual {p1, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 119
    iget p1, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 120
    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr v0, v3

    if-gtz v0, :cond_2

    sub-int/2addr v1, p1

    if-lez v1, :cond_3

    :cond_2
    const/4 v2, 0x1

    :cond_3
    return v2
.end method


# virtual methods
.method getActionBarHeight()I
    .locals 1

    .line 186
    iget v0, p0, Lcom/gyf/barlibrary/BarConfig;->mActionBarHeight:I

    return v0
.end method

.method getNavigationBarHeight()I
    .locals 1

    .line 204
    iget v0, p0, Lcom/gyf/barlibrary/BarConfig;->mNavigationBarHeight:I

    return v0
.end method

.method getNavigationBarWidth()I
    .locals 1

    .line 213
    iget v0, p0, Lcom/gyf/barlibrary/BarConfig;->mNavigationBarWidth:I

    return v0
.end method

.method getStatusBarHeight()I
    .locals 1

    .line 177
    iget v0, p0, Lcom/gyf/barlibrary/BarConfig;->mStatusBarHeight:I

    return v0
.end method

.method hasNavigationBar()Z
    .locals 1

    .line 195
    iget-boolean v0, p0, Lcom/gyf/barlibrary/BarConfig;->mHasNavigationBar:Z

    return v0
.end method

.method hasNotchScreen()Z
    .locals 1

    .line 222
    iget-boolean v0, p0, Lcom/gyf/barlibrary/BarConfig;->mHasNotchScreen:Z

    return v0
.end method

.method isNavigationAtBottom()Z
    .locals 2

    .line 168
    iget v0, p0, Lcom/gyf/barlibrary/BarConfig;->mSmallestWidthDp:F

    const/high16 v1, 0x44160000    # 600.0f

    cmpl-float v0, v0, v1

    if-gez v0, :cond_1

    iget-boolean v0, p0, Lcom/gyf/barlibrary/BarConfig;->mInPortrait:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
