.class public Lcom/gyf/barlibrary/BarParams;
.super Ljava/lang/Object;
.source "BarParams.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field autoNavigationBarDarkModeAlpha:F

.field autoNavigationBarDarkModeEnable:Z

.field autoStatusBarDarkModeAlpha:F

.field autoStatusBarDarkModeEnable:Z

.field barHide:Lcom/gyf/barlibrary/BarHide;

.field contentAlpha:F

.field contentColor:I

.field contentColorTransform:I

.field defaultNavigationBarColor:I

.field public fits:Z

.field fixMarginAtBottom:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field flymeOSStatusBarFontColor:I

.field public fullScreen:Z

.field hideNavigationBar:Z

.field isSupportActionBar:Z

.field public keyboardEnable:Z

.field keyboardMode:I

.field navigationBarAlpha:F

.field navigationBarColor:I

.field navigationBarColorTransform:I

.field navigationBarDarkIcon:Z

.field navigationBarEnable:Z

.field navigationBarWithEMUI3Enable:Z

.field navigationBarWithKitkatEnable:Z

.field onKeyboardListener:Lcom/gyf/barlibrary/OnKeyboardListener;

.field statusBarAlpha:F

.field statusBarColor:I

.field statusBarColorEnabled:Z

.field statusBarColorTransform:I

.field statusBarDarkFont:Z

.field statusBarView:Landroid/view/View;

.field titleBarView:Landroid/view/View;

.field viewAlpha:F

.field viewMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    const/high16 v1, -0x1000000

    .line 29
    iput v1, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 35
    iput v1, p0, Lcom/gyf/barlibrary/BarParams;->defaultNavigationBarColor:I

    const/4 v2, 0x0

    .line 40
    iput v2, p0, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    .line 46
    iput v2, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    .line 52
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    .line 57
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->hideNavigationBar:Z

    .line 62
    sget-object v3, Lcom/gyf/barlibrary/BarHide;->FLAG_SHOW_BAR:Lcom/gyf/barlibrary/BarHide;

    iput-object v3, p0, Lcom/gyf/barlibrary/BarParams;->barHide:Lcom/gyf/barlibrary/BarHide;

    .line 67
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->statusBarDarkFont:Z

    .line 73
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarDarkIcon:Z

    .line 78
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeEnable:Z

    .line 84
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeEnable:Z

    .line 89
    iput v2, p0, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeAlpha:F

    .line 95
    iput v2, p0, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeAlpha:F

    const/4 v3, 0x1

    .line 102
    iput-boolean v3, p0, Lcom/gyf/barlibrary/BarParams;->statusBarColorEnabled:Z

    .line 107
    iput v1, p0, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    .line 113
    iput v1, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    .line 119
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    .line 123
    iput v2, p0, Lcom/gyf/barlibrary/BarParams;->viewAlpha:F

    .line 128
    iput v0, p0, Lcom/gyf/barlibrary/BarParams;->contentColor:I

    .line 133
    iput v1, p0, Lcom/gyf/barlibrary/BarParams;->contentColorTransform:I

    .line 138
    iput v2, p0, Lcom/gyf/barlibrary/BarParams;->contentAlpha:F

    .line 144
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->fits:Z

    .line 165
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    .line 170
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->keyboardEnable:Z

    const/16 v1, 0x12

    .line 175
    iput v1, p0, Lcom/gyf/barlibrary/BarParams;->keyboardMode:I

    .line 181
    iput-boolean v3, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    .line 186
    iput-boolean v3, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    .line 191
    iput-boolean v3, p0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithEMUI3Enable:Z

    .line 196
    iput-boolean v0, p0, Lcom/gyf/barlibrary/BarParams;->fixMarginAtBottom:Z

    return-void
.end method


# virtual methods
.method protected clone()Lcom/gyf/barlibrary/BarParams;
    .locals 1

    .line 208
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/BarParams;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 18
    invoke-virtual {p0}, Lcom/gyf/barlibrary/BarParams;->clone()Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    return-object v0
.end method
