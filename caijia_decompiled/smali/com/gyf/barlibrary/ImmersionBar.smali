.class public Lcom/gyf/barlibrary/ImmersionBar;
.super Ljava/lang/Object;
.source "ImmersionBar.java"


# static fields
.field private static final BOUNDARY_COLOR:I = -0x454546

.field private static final FLAG_FITS_DEFAULT:I = 0x0

.field private static final FLAG_FITS_STATUS:I = 0x3

.field private static final FLAG_FITS_SYSTEM_WINDOWS:I = 0x4

.field private static final FLAG_FITS_TITLE:I = 0x1

.field private static final FLAG_FITS_TITLE_MARGIN_TOP:I = 0x2

.field private static final IMMERSION_NAVIGATION_BAR_VIEW:I

.field private static final IMMERSION_STATUS_BAR_VIEW:I

.field private static final MIUI_NAVIGATION_BAR_DARK:Ljava/lang/String; = "EXTRA_FLAG_NAVIGATION_BAR_DARK_MODE"

.field private static final MIUI_STATUS_BAR_DARK:Ljava/lang/String; = "EXTRA_FLAG_STATUS_BAR_DARK_MODE"

.field private static final NAVIGATIONBAR_IS_MIN:Ljava/lang/String; = "navigationbar_is_min"

.field private static mImmersionBarMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/gyf/barlibrary/ImmersionBar;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mBarConfig:Lcom/gyf/barlibrary/BarConfig;

.field private mBarParams:Lcom/gyf/barlibrary/BarParams;

.field private mContentView:Landroid/view/ViewGroup;

.field private mDecorView:Landroid/view/ViewGroup;

.field private mDialog:Landroid/app/Dialog;

.field private mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

.field private mFitsStatusBarType:I

.field private mFragment:Landroidx/fragment/app/Fragment;

.field private mHasNavigationBarColor:Z

.field private mImmersionBarName:Ljava/lang/String;

.field private mIsFitsLayoutOverlap:Z

.field private mIsFitsNotch:Z

.field private mIsFragment:Z

.field private mNavigationBarHeight:I

.field private mNavigationBarWidth:I

.field private mNavigationObserver:Landroid/database/ContentObserver;

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private mTagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/gyf/barlibrary/BarParams;",
            ">;"
        }
    .end annotation
.end field

.field private mWindow:Landroid/view/Window;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    sget v0, Lcom/gyf/barlibrary/R$id;->immersion_status_bar_view:I

    sput v0, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_STATUS_BAR_VIEW:I

    .line 47
    sget v0, Lcom/gyf/barlibrary/R$id;->immersion_navigation_bar_view:I

    sput v0, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_NAVIGATION_BAR_VIEW:I

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 90
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    .line 94
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    .line 98
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    const/4 v1, 0x0

    .line 102
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 103
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    .line 107
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mTagMap:Ljava/util/Map;

    .line 111
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    .line 115
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 119
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mHasNavigationBarColor:Z

    .line 125
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsNotch:Z

    .line 127
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingLeft:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingTop:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingRight:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingBottom:I

    .line 137
    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 138
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    .line 140
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarName:Ljava/lang/String;

    .line 142
    new-instance p1, Lcom/gyf/barlibrary/BarParams;

    invoke-direct {p1}, Lcom/gyf/barlibrary/BarParams;-><init>()V

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    .line 144
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    const v0, 0x1020002

    .line 145
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Landroid/app/Dialog;)V
    .locals 1

    const-string v0, ""

    .line 222
    invoke-direct {p0, p1, p2, v0}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroid/app/Activity;Landroid/app/Dialog;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 2

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 90
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    .line 94
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    .line 98
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    const/4 v1, 0x0

    .line 102
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 103
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    .line 107
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mTagMap:Ljava/util/Map;

    .line 111
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    .line 115
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 119
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mHasNavigationBarColor:Z

    .line 125
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsNotch:Z

    .line 127
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingLeft:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingTop:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingRight:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingBottom:I

    .line 234
    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 235
    iput-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDialog:Landroid/app/Dialog;

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    .line 242
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarName:Ljava/lang/String;

    .line 249
    new-instance p1, Lcom/gyf/barlibrary/BarParams;

    invoke-direct {p1}, Lcom/gyf/barlibrary/BarParams;-><init>()V

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    .line 251
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    const p2, 0x1020002

    .line 252
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    return-void

    .line 243
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u5fc5\u987b\u5148\u5728\u5bbf\u4e3bActivity\u521d\u59cb\u5316"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 240
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "dialog\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 237
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Activity\u4e0d\u80fd\u4e3a\u7a7a!!!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private constructor <init>(Landroid/app/Activity;Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 90
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    .line 94
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    .line 98
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    const/4 v1, 0x0

    .line 102
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 103
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    .line 107
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mTagMap:Ljava/util/Map;

    .line 111
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    .line 115
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 119
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mHasNavigationBarColor:Z

    .line 125
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsNotch:Z

    .line 127
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingLeft:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingTop:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingRight:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingBottom:I

    .line 159
    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 160
    iput-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz p1, :cond_1

    .line 164
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 168
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    .line 169
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarName:Ljava/lang/String;

    .line 173
    new-instance p1, Lcom/gyf/barlibrary/BarParams;

    invoke-direct {p1}, Lcom/gyf/barlibrary/BarParams;-><init>()V

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    .line 175
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    const p2, 0x1020002

    .line 176
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    return-void

    .line 165
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u5fc5\u987b\u5148\u5728\u5bbf\u4e3bActivity\u521d\u59cb\u5316"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Activity\u4e0d\u80fd\u4e3a\u7a7a!!!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private constructor <init>(Landroidx/fragment/app/DialogFragment;)V
    .locals 1

    .line 187
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroidx/fragment/app/DialogFragment;Landroid/app/Dialog;)V

    return-void
.end method

.method private constructor <init>(Landroidx/fragment/app/DialogFragment;Landroid/app/Dialog;)V
    .locals 2

    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 90
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    .line 94
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    .line 98
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    const/4 v1, 0x0

    .line 102
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 103
    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    .line 107
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mTagMap:Ljava/util/Map;

    .line 111
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    .line 115
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 119
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mHasNavigationBarColor:Z

    .line 125
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsNotch:Z

    .line 127
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingLeft:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingTop:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingRight:I

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingBottom:I

    .line 191
    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 192
    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFragment:Landroidx/fragment/app/Fragment;

    .line 193
    iput-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    .line 200
    sget-object p2, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 204
    iget-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDialog:Landroid/app/Dialog;

    invoke-virtual {p2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    iput-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    .line 206
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroidx/fragment/app/DialogFragment;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarName:Ljava/lang/String;

    .line 208
    new-instance p1, Lcom/gyf/barlibrary/BarParams;

    invoke-direct {p1}, Lcom/gyf/barlibrary/BarParams;-><init>()V

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    .line 210
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    const p2, 0x1020002

    .line 211
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    return-void

    .line 201
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u5fc5\u987b\u5148\u5728\u5bbf\u4e3bActivity\u521d\u59cb\u5316"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 198
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "DialogFragment\u4e2d\u7684dialog\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 195
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Activity\u4e0d\u80fd\u4e3a\u7a7a!!!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 1

    .line 155
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroid/app/Activity;Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method static synthetic access$000(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarConfig;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    return-object p0
.end method

.method static synthetic access$002(Lcom/gyf/barlibrary/ImmersionBar;Lcom/gyf/barlibrary/BarConfig;)Lcom/gyf/barlibrary/BarConfig;
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    return-object p1
.end method

.method static synthetic access$100(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/app/Activity;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$200(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/view/ViewGroup;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$300(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/view/ViewGroup;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$400(Lcom/gyf/barlibrary/ImmersionBar;)I
    .locals 0

    .line 44
    iget p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    return p0
.end method

.method static synthetic access$402(Lcom/gyf/barlibrary/ImmersionBar;I)I
    .locals 0

    .line 44
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    return p1
.end method

.method static synthetic access$500(Lcom/gyf/barlibrary/ImmersionBar;)I
    .locals 0

    .line 44
    iget p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    return p0
.end method

.method static synthetic access$502(Lcom/gyf/barlibrary/ImmersionBar;I)I
    .locals 0

    .line 44
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    return p1
.end method

.method static synthetic access$600(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarParams;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    return-object p0
.end method

.method static synthetic access$700(Lcom/gyf/barlibrary/ImmersionBar;IIII)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/gyf/barlibrary/ImmersionBar;->setPadding(IIII)V

    return-void
.end method

.method private adjustDarkModeParams()V
    .locals 5

    .line 1867
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeEnable:Z

    const/4 v1, 0x1

    const v2, -0x454546

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    .line 1868
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    if-le v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1869
    :goto_0
    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v4, v4, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeAlpha:F

    invoke-virtual {p0, v0, v4}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarDarkFont(ZF)Lcom/gyf/barlibrary/ImmersionBar;

    .line 1871
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeEnable:Z

    if-eqz v0, :cond_3

    .line 1872
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    if-le v0, v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    .line 1873
    :goto_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeAlpha:F

    invoke-virtual {p0, v1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarDarkIcon(ZF)Lcom/gyf/barlibrary/ImmersionBar;

    :cond_3
    return-void
.end method

.method private cancelListener()V
    .locals 3

    .line 2163
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 2164
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 2165
    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 2166
    iput-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 2168
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    if-eqz v0, :cond_1

    .line 2169
    invoke-virtual {v0}, Lcom/gyf/barlibrary/FitsKeyboard;->cancel()V

    .line 2170
    iput-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    :cond_1
    return-void
.end method

.method public static checkFitsSystemWindows(Landroid/view/View;)Z
    .locals 6

    .line 2377
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 2380
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 2381
    check-cast p0, Landroid/view/ViewGroup;

    .line 2382
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_3

    .line 2383
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 2384
    instance-of v5, v4, Landroidx/drawerlayout/widget/DrawerLayout;

    if-eqz v5, :cond_1

    .line 2385
    invoke-static {v4}, Lcom/gyf/barlibrary/ImmersionBar;->checkFitsSystemWindows(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_1

    return v1

    .line 2389
    :cond_1
    invoke-virtual {v4}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v4

    if-eqz v4, :cond_2

    return v1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return v2
.end method

.method private fitsKeyboard()V
    .locals 4

    .line 2180
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_5

    .line 2181
    iget-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    if-nez v0, :cond_2

    .line 2182
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->keyboardEnable:Z

    if-eqz v0, :cond_1

    .line 2183
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    if-nez v0, :cond_0

    .line 2184
    new-instance v0, Lcom/gyf/barlibrary/FitsKeyboard;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-direct {v0, p0, v1, v2}, Lcom/gyf/barlibrary/FitsKeyboard;-><init>(Lcom/gyf/barlibrary/ImmersionBar;Landroid/app/Activity;Landroid/view/Window;)V

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    .line 2186
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->keyboardMode:I

    invoke-virtual {v0, v1}, Lcom/gyf/barlibrary/FitsKeyboard;->enable(I)V

    goto :goto_0

    .line 2188
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    if-eqz v0, :cond_5

    .line 2189
    invoke-virtual {v0}, Lcom/gyf/barlibrary/FitsKeyboard;->disable()V

    goto :goto_0

    .line 2193
    :cond_2
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-eqz v0, :cond_5

    .line 2195
    iget-object v1, v0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->keyboardEnable:Z

    if-eqz v1, :cond_4

    .line 2196
    iget-object v1, v0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    if-nez v1, :cond_3

    .line 2197
    new-instance v1, Lcom/gyf/barlibrary/FitsKeyboard;

    iget-object v2, v0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v3, v0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-direct {v1, v0, v2, v3}, Lcom/gyf/barlibrary/FitsKeyboard;-><init>(Lcom/gyf/barlibrary/ImmersionBar;Landroid/app/Activity;Landroid/view/Window;)V

    iput-object v1, v0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    .line 2199
    :cond_3
    iget-object v1, v0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    iget-object v0, v0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->keyboardMode:I

    invoke-virtual {v1, v0}, Lcom/gyf/barlibrary/FitsKeyboard;->enable(I)V

    goto :goto_0

    .line 2201
    :cond_4
    iget-object v0, v0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsKeyboard:Lcom/gyf/barlibrary/FitsKeyboard;

    if-eqz v0, :cond_5

    .line 2202
    invoke-virtual {v0}, Lcom/gyf/barlibrary/FitsKeyboard;->disable()V

    :cond_5
    :goto_0
    return-void
.end method

.method private fitsLayoutOverlap()V
    .locals 3

    .line 2107
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_3

    iget-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    if-nez v0, :cond_3

    .line 2108
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    goto :goto_0

    .line 2121
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v2, v2, Lcom/gyf/barlibrary/BarParams;->statusBarView:Landroid/view/View;

    invoke-static {v0, v2}, Lcom/gyf/barlibrary/ImmersionBar;->setStatusBarView(Landroid/app/Activity;Landroid/view/View;)V

    .line 2122
    iput-boolean v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    goto :goto_0

    .line 2116
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v2, v2, Lcom/gyf/barlibrary/BarParams;->titleBarView:Landroid/view/View;

    invoke-static {v0, v2}, Lcom/gyf/barlibrary/ImmersionBar;->setTitleBarMarginTop(Landroid/app/Activity;Landroid/view/View;)V

    .line 2117
    iput-boolean v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    goto :goto_0

    .line 2111
    :cond_2
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v2, v2, Lcom/gyf/barlibrary/BarParams;->titleBarView:Landroid/view/View;

    invoke-static {v0, v2}, Lcom/gyf/barlibrary/ImmersionBar;->setTitleBar(Landroid/app/Activity;Landroid/view/View;)V

    .line 2112
    iput-boolean v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsLayoutOverlap:Z

    :cond_3
    :goto_0
    return-void
.end method

.method private fitsNotchScreen()V
    .locals 3

    .line 1730
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsNotch:Z

    if-nez v0, :cond_0

    .line 1731
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v1, 0x1

    .line 1732
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 1733
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {v2, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1734
    iput-boolean v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFitsNotch:Z

    :cond_0
    return-void
.end method

.method private fitsWindows()V
    .locals 2

    .line 1913
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isEMUI3_x()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1915
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsWindowsAboveLOLLIPOP()V

    goto :goto_0

    .line 1918
    :cond_0
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsWindowsBelowLOLLIPOP()V

    .line 1920
    iget-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    if-nez v0, :cond_1

    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isEMUI3_x()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1921
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsWindowsEMUI()V

    :cond_1
    :goto_0
    return-void
.end method

.method private fitsWindowsAboveLOLLIPOP()V
    .locals 3

    .line 1931
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->checkFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1932
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    if-eqz v0, :cond_0

    .line 1933
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight()I

    move-result v0

    invoke-direct {p0, v1, v0, v1, v1}, Lcom/gyf/barlibrary/ImmersionBar;->setPadding(IIII)V

    :cond_0
    return-void

    .line 1938
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->fits:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    .line 1939
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 1941
    :goto_0
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v2, v2, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    if-eqz v2, :cond_3

    .line 1942
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result v0

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight()I

    move-result v2

    add-int/2addr v0, v2

    .line 1944
    :cond_3
    invoke-direct {p0, v1, v0, v1, v1}, Lcom/gyf/barlibrary/ImmersionBar;->setPadding(IIII)V

    return-void
.end method

.method private fitsWindowsBelowLOLLIPOP()V
    .locals 5

    .line 1952
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->checkFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1953
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    if-eqz v0, :cond_0

    .line 1954
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight()I

    move-result v0

    invoke-direct {p0, v1, v0, v1, v1}, Lcom/gyf/barlibrary/ImmersionBar;->setPadding(IIII)V

    :cond_0
    return-void

    .line 1959
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->fits:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    .line 1960
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 1962
    :goto_0
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v2, v2, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    if-eqz v2, :cond_3

    .line 1963
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result v0

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight()I

    move-result v2

    add-int/2addr v0, v2

    .line 1965
    :cond_3
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->hasNavigationBar()Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v2, v2, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v2, v2, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    if-eqz v2, :cond_8

    .line 1966
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v2, v2, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    if-nez v2, :cond_5

    .line 1967
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->isNavigationAtBottom()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1968
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarHeight()I

    move-result v2

    move v3, v2

    const/4 v2, 0x0

    goto :goto_2

    .line 1970
    :cond_4
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth()I

    move-result v2

    goto :goto_1

    :cond_5
    const/4 v2, 0x0

    :goto_1
    const/4 v3, 0x0

    .line 1973
    :goto_2
    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v4, v4, Lcom/gyf/barlibrary/BarParams;->hideNavigationBar:Z

    if-eqz v4, :cond_7

    .line 1974
    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v4}, Lcom/gyf/barlibrary/BarConfig;->isNavigationAtBottom()Z

    move-result v4

    if-eqz v4, :cond_6

    goto :goto_3

    :cond_6
    const/4 v2, 0x0

    goto :goto_4

    .line 1980
    :cond_7
    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v4}, Lcom/gyf/barlibrary/BarConfig;->isNavigationAtBottom()Z

    move-result v4

    if-nez v4, :cond_9

    .line 1981
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v2}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth()I

    move-result v2

    goto :goto_4

    :cond_8
    const/4 v2, 0x0

    :goto_3
    const/4 v3, 0x0

    .line 1986
    :cond_9
    :goto_4
    invoke-direct {p0, v1, v0, v2, v3}, Lcom/gyf/barlibrary/ImmersionBar;->setPadding(IIII)V

    return-void
.end method

.method private fitsWindowsEMUI()V
    .locals 4

    .line 1994
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    sget v1, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_NAVIGATION_BAR_VIEW:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1995
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    if-eqz v1, :cond_0

    if-eqz v0, :cond_1

    .line 1996
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    if-nez v1, :cond_1

    .line 1997
    new-instance v1, Lcom/gyf/barlibrary/ImmersionBar$1;

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    invoke-direct {v1, p0, v2, v0}, Lcom/gyf/barlibrary/ImmersionBar$1;-><init>(Lcom/gyf/barlibrary/ImmersionBar;Landroid/os/Handler;Landroid/view/View;)V

    iput-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 2045
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_1

    .line 2046
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "navigationbar_is_min"

    .line 2047
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationObserver:Landroid/database/ContentObserver;

    .line 2046
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    .line 2051
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static getActionBarHeight(Landroid/app/Activity;)I
    .locals 1

    .line 2471
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2472
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight()I

    move-result p0

    return p0
.end method

.method public static getNavigationBarHeight(Landroid/app/Activity;)I
    .locals 1

    .line 2419
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2420
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarHeight()I

    move-result p0

    return p0
.end method

.method public static getNavigationBarWidth(Landroid/app/Activity;)I
    .locals 1

    .line 2432
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2433
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth()I

    move-result p0

    return p0
.end method

.method public static getStatusBarHeight(Landroid/app/Activity;)I
    .locals 1

    .line 2458
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2459
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result p0

    return p0
.end method

.method public static hasNavigationBar(Landroid/app/Activity;)Z
    .locals 1

    .line 2406
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2407
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->hasNavigationBar()Z

    move-result p0

    return p0
.end method

.method public static hasNotchScreen(Landroid/app/Activity;)Z
    .locals 1

    .line 2483
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2484
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->hasNotchScreen()Z

    move-result p0

    return p0
.end method

.method public static hasNotchScreen(Landroid/view/View;)Z
    .locals 0

    .line 2495
    invoke-static {p0}, Lcom/gyf/barlibrary/NotchUtils;->hasNotchScreen(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private hideBar(I)I
    .locals 2

    .line 1885
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_4

    .line 1886
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar$3;->$SwitchMap$com$gyf$barlibrary$BarHide:[I

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v1, v1, Lcom/gyf/barlibrary/BarParams;->barHide:Lcom/gyf/barlibrary/BarHide;

    invoke-virtual {v1}, Lcom/gyf/barlibrary/BarHide;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    or-int/lit8 p1, p1, 0x0

    goto :goto_0

    :cond_1
    or-int/lit16 p1, p1, 0x202

    goto :goto_0

    :cond_2
    or-int/lit16 p1, p1, 0x404

    goto :goto_0

    :cond_3
    or-int/lit16 p1, p1, 0x206

    :cond_4
    :goto_0
    or-int/lit16 p1, p1, 0x1000

    return p1
.end method

.method public static hideStatusBar(Landroid/view/Window;)V
    .locals 1

    const/16 v0, 0x400

    .line 2505
    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setFlags(II)V

    return-void
.end method

.method private initBarAboveLOLLIPOP(I)I
    .locals 4

    .line 1747
    iget-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mHasNavigationBarColor:Z

    if-nez v0, :cond_0

    .line 1748
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v1

    iput v1, v0, Lcom/gyf/barlibrary/BarParams;->defaultNavigationBarColor:I

    const/4 v0, 0x1

    .line 1749
    iput-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mHasNavigationBarColor:Z

    :cond_0
    or-int/lit16 p1, p1, 0x400

    .line 1753
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    if-eqz v0, :cond_1

    or-int/lit16 p1, p1, 0x200

    .line 1757
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 1759
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->hasNavigationBar()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1760
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    const/high16 v1, 0x8000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 1763
    :cond_2
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 1765
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColorEnabled:Z

    if-eqz v0, :cond_3

    .line 1766
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v2, v2, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    invoke-static {v1, v2, v3}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    goto :goto_0

    .line 1769
    :cond_3
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    invoke-static {v1, v2, v3}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 1773
    :goto_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    if-eqz v0, :cond_4

    .line 1774
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v2, v2, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    invoke-static {v1, v2, v3}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    goto :goto_1

    .line 1777
    :cond_4
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->defaultNavigationBarColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    :goto_1
    return p1
.end method

.method private initBarBelowLOLLIPOP()V
    .locals 2

    .line 1787
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 1789
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->setupStatusBarView()V

    .line 1791
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->hasNavigationBar()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isEMUI3_x()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1792
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    const/high16 v1, 0x8000000

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    if-eqz v0, :cond_1

    .line 1794
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    .line 1796
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 1798
    :goto_0
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    if-nez v0, :cond_2

    .line 1799
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarHeight()I

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarHeight:I

    .line 1801
    :cond_2
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    if-nez v0, :cond_3

    .line 1802
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth()I

    move-result v0

    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mNavigationBarWidth:I

    .line 1805
    :cond_3
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->setupNavBarView()V

    :cond_4
    return-void
.end method

.method private static isEmpty(Ljava/lang/String;)Z
    .locals 0

    if-eqz p0, :cond_1

    .line 2510
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static isNavigationAtBottom(Landroid/app/Activity;)Z
    .locals 1

    .line 2445
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 2446
    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->isNavigationAtBottom()Z

    move-result p0

    return p0
.end method

.method public static isSupportNavigationIconDark()Z
    .locals 2

    .line 2263
    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isMIUI6Later()Z

    move-result v0

    if-nez v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

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

.method public static isSupportStatusBarDarkFont()Z
    .locals 2

    .line 2252
    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isMIUI6Later()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isFlymeOS4Later()Z

    move-result v0

    if-nez v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

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

.method private setBar()V
    .locals 3

    .line 1685
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    const/16 v0, 0x100

    .line 1688
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isEMUI3_x()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1690
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsNotchScreen()V

    .line 1692
    invoke-direct {p0, v0}, Lcom/gyf/barlibrary/ImmersionBar;->initBarAboveLOLLIPOP(I)I

    move-result v0

    .line 1694
    invoke-direct {p0, v0}, Lcom/gyf/barlibrary/ImmersionBar;->setStatusBarDarkFont(I)I

    move-result v0

    .line 1696
    invoke-direct {p0, v0}, Lcom/gyf/barlibrary/ImmersionBar;->setNavigationIconDark(I)I

    move-result v0

    goto :goto_0

    .line 1699
    :cond_0
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->initBarBelowLOLLIPOP()V

    .line 1702
    :goto_0
    invoke-direct {p0, v0}, Lcom/gyf/barlibrary/ImmersionBar;->hideBar(I)I

    move-result v0

    .line 1704
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsWindows()V

    .line 1705
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    .line 1707
    :cond_1
    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isMIUI6Later()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1709
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->statusBarDarkFont:Z

    const-string v2, "EXTRA_FLAG_STATUS_BAR_DARK_MODE"

    invoke-direct {p0, v0, v2, v1}, Lcom/gyf/barlibrary/ImmersionBar;->setMIUIBarDark(Landroid/view/Window;Ljava/lang/String;Z)V

    .line 1711
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    if-eqz v0, :cond_2

    .line 1712
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mWindow:Landroid/view/Window;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarDarkIcon:Z

    const-string v2, "EXTRA_FLAG_NAVIGATION_BAR_DARK_MODE"

    invoke-direct {p0, v0, v2, v1}, Lcom/gyf/barlibrary/ImmersionBar;->setMIUIBarDark(Landroid/view/Window;Ljava/lang/String;Z)V

    .line 1716
    :cond_2
    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isFlymeOS4Later()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1717
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->flymeOSStatusBarFontColor:I

    if-eqz v0, :cond_3

    .line 1718
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->flymeOSStatusBarFontColor:I

    invoke-static {v0, v1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/app/Activity;I)V

    goto :goto_1

    .line 1720
    :cond_3
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->statusBarDarkFont:Z

    invoke-static {v0, v1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/app/Activity;Z)V

    :cond_4
    :goto_1
    return-void
.end method

.method public static setFitsSystemWindows(Landroid/app/Activity;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    const v0, 0x1020002

    .line 2356
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 2357
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_3

    .line 2358
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2359
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    .line 2360
    instance-of v3, v2, Landroidx/drawerlayout/widget/DrawerLayout;

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x1

    .line 2363
    invoke-virtual {v2, v3}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 2364
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private setMIUIBarDark(Landroid/view/Window;Ljava/lang/String;Z)V
    .locals 7

    if-eqz p1, :cond_1

    .line 2082
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :try_start_0
    const-string v1, "android.view.MiuiWindowManager$LayoutParams"

    .line 2085
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 2086
    invoke-virtual {v1, p2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p2

    .line 2087
    invoke-virtual {p2, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p2

    const-string v1, "setExtraFlags"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    .line 2088
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz p3, :cond_0

    new-array p3, v2, [Ljava/lang/Object;

    .line 2091
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p3, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, p3, v6

    invoke-virtual {v0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    new-array p3, v2, [Ljava/lang/Object;

    .line 2094
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p3, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, p3, v6

    invoke-virtual {v0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method private setNavigationIconDark(I)I
    .locals 2

    .line 2072
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarDarkIcon:Z

    if-eqz v0, :cond_0

    or-int/lit8 p1, p1, 0x10

    :cond_0
    return p1
.end method

.method private setPadding(IIII)V
    .locals 1

    .line 2220
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 2221
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 2223
    :cond_0
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingLeft:I

    .line 2224
    iput p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingTop:I

    .line 2225
    iput p3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingRight:I

    .line 2226
    iput p4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingBottom:I

    return-void
.end method

.method private setStatusBarDarkFont(I)I
    .locals 2

    .line 2060
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->statusBarDarkFont:Z

    if-eqz v0, :cond_0

    or-int/lit16 p1, p1, 0x2000

    :cond_0
    return p1
.end method

.method public static setStatusBarView(Landroid/app/Activity;Landroid/view/View;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    .line 2339
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_2

    .line 2340
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 2341
    invoke-static {p0}, Lcom/gyf/barlibrary/ImmersionBar;->getStatusBarHeight(Landroid/app/Activity;)I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 2342
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    return-void
.end method

.method public static setTitleBar(Landroid/app/Activity;Landroid/view/View;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    .line 2280
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_4

    .line 2281
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 2282
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v2, -0x2

    if-eq v1, v2, :cond_3

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    goto :goto_0

    .line 2295
    :cond_2
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {p0}, Lcom/gyf/barlibrary/ImmersionBar;->getStatusBarHeight(Landroid/app/Activity;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 2296
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-static {p0}, Lcom/gyf/barlibrary/ImmersionBar;->getStatusBarHeight(Landroid/app/Activity;)I

    move-result p0

    add-int/2addr v1, p0

    .line 2297
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    .line 2296
    invoke-virtual {p1, v0, v1, p0, v2}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_1

    .line 2284
    :cond_3
    :goto_0
    new-instance v1, Lcom/gyf/barlibrary/ImmersionBar$2;

    invoke-direct {v1, v0, p1, p0}, Lcom/gyf/barlibrary/ImmersionBar$2;-><init>(Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;Landroid/app/Activity;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_4
    :goto_1
    return-void
.end method

.method public static setTitleBarMarginTop(Landroid/app/Activity;Landroid/view/View;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    .line 2316
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_2

    .line 2317
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2318
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 2319
    invoke-static {p0}, Lcom/gyf/barlibrary/ImmersionBar;->getStatusBarHeight(Landroid/app/Activity;)I

    move-result p0

    add-int/2addr v1, p0

    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 2318
    invoke-virtual {p1, v0, v1, p0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_2
    return-void
.end method

.method private setupNavBarView()V
    .locals 4

    .line 1837
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    sget v1, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_NAVIGATION_BAR_VIEW:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1839
    new-instance v0, Landroid/view/View;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1840
    sget v1, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_NAVIGATION_BAR_VIEW:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 1841
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1845
    :cond_0
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v1}, Lcom/gyf/barlibrary/BarConfig;->isNavigationAtBottom()Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_1

    .line 1846
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v3}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x50

    .line 1847
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_0

    .line 1849
    :cond_1
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    invoke-virtual {v3}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth()I

    move-result v3

    invoke-direct {v1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v2, 0x800005

    .line 1850
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1852
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1853
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v2, v2, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    invoke-static {v1, v2, v3}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1856
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->hideNavigationBar:Z

    if-nez v1, :cond_2

    const/4 v1, 0x0

    .line 1857
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_2
    const/16 v1, 0x8

    .line 1859
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method private setupStatusBarView()V
    .locals 5

    .line 1813
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    sget v1, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_STATUS_BAR_VIEW:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1815
    new-instance v0, Landroid/view/View;

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1816
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    .line 1817
    invoke-virtual {v4}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x30

    .line 1818
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 1819
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1820
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1821
    sget v2, Lcom/gyf/barlibrary/ImmersionBar;->IMMERSION_STATUS_BAR_VIEW:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 1822
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mDecorView:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1824
    :cond_0
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v2, v2, Lcom/gyf/barlibrary/BarParams;->statusBarColorEnabled:Z

    if-eqz v2, :cond_1

    .line 1825
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v2, v2, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    invoke-static {v1, v2, v3}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0

    .line 1828
    :cond_1
    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v2, v2, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    invoke-static {v2, v1, v3}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :goto_0
    return-void
.end method

.method private transformView()V
    .locals 7

    .line 2135
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_3

    .line 2136
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 2137
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 2138
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 2139
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 2140
    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v3, v3, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2141
    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v4, v4, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 2142
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 2143
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 2144
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    move-object v6, v4

    move-object v4, v3

    move-object v3, v6

    goto :goto_1

    :cond_1
    if-eqz v2, :cond_0

    .line 2147
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->viewAlpha:F

    const/4 v5, 0x0

    sub-float/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, v5

    if-nez v1, :cond_2

    .line 2148
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v4, v4, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    invoke-static {v1, v3, v4}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0

    .line 2150
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v4, v4, Lcom/gyf/barlibrary/BarParams;->viewAlpha:F

    invoke-static {v1, v3, v4}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto/16 :goto_0

    :cond_3
    return-void
.end method

.method private updateBarParams()V
    .locals 2

    .line 1663
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->adjustDarkModeParams()V

    .line 1664
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    .line 1666
    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isEMUI3_x()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    if-eqz v0, :cond_0

    .line 1667
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean v1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithEMUI3Enable:Z

    iput-boolean v1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    .line 1670
    :cond_0
    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarConfig:Lcom/gyf/barlibrary/BarConfig;

    .line 1672
    iget-boolean v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mIsFragment:Z

    if-eqz v0, :cond_1

    .line 1673
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-eqz v0, :cond_1

    .line 1675
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-object v1, v0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    :cond_1
    return-void
.end method

.method public static with(Landroid/app/Activity;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    .line 263
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 265
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroid/app/Activity;)V

    .line 266
    sget-object v1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public static with(Landroid/app/Activity;Landroid/app/Dialog;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 3

    .line 357
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 359
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroid/app/Activity;Landroid/app/Dialog;)V

    .line 360
    sget-object v1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public static with(Landroid/app/Activity;Landroid/app/Dialog;Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 377
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 379
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroid/app/Activity;Landroid/app/Dialog;Ljava/lang/String;)V

    .line 380
    sget-object v1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public static with(Landroid/app/Activity;Landroidx/fragment/app/Fragment;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 3

    .line 299
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 301
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroid/app/Activity;Landroidx/fragment/app/Fragment;)V

    .line 302
    sget-object v1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public static with(Landroidx/fragment/app/DialogFragment;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 4

    .line 316
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 319
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 321
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroidx/fragment/app/DialogFragment;)V

    .line 322
    sget-object v1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0

    .line 317
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Activity\u4e0d\u80fd\u4e3a\u7a7a!!!"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static with(Landroidx/fragment/app/DialogFragment;Landroid/app/Dialog;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 337
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 340
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 342
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroidx/fragment/app/DialogFragment;Landroid/app/Dialog;)V

    .line 343
    sget-object p1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0

    .line 338
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Activity\u4e0d\u80fd\u4e3a\u7a7a!!!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static with(Landroidx/fragment/app/Fragment;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 4

    .line 279
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 282
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gyf/barlibrary/ImmersionBar;

    if-nez v0, :cond_0

    .line 284
    new-instance v0, Lcom/gyf/barlibrary/ImmersionBar;

    invoke-direct {v0, p0}, Lcom/gyf/barlibrary/ImmersionBar;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 285
    sget-object v1, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0

    .line 280
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Activity\u4e0d\u80fd\u4e3a\u7a7a!!!"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public addTag(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    .line 1500
    invoke-static {p1}, Lcom/gyf/barlibrary/ImmersionBar;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1503
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarParams;->clone()Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    .line 1504
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mTagMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 1501
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "tag\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addViewSupportTransformColor(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 875
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->addViewSupportTransformColorInt(Landroid/view/View;I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public addViewSupportTransformColor(Landroid/view/View;I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 886
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->addViewSupportTransformColorInt(Landroid/view/View;I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public addViewSupportTransformColor(Landroid/view/View;II)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 899
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 900
    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 901
    invoke-static {v0, p3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p3

    .line 899
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->addViewSupportTransformColorInt(Landroid/view/View;II)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public addViewSupportTransformColor(Landroid/view/View;Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 912
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->addViewSupportTransformColorInt(Landroid/view/View;I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public addViewSupportTransformColor(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 926
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    .line 927
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    .line 925
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->addViewSupportTransformColorInt(Landroid/view/View;II)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public addViewSupportTransformColorInt(Landroid/view/View;I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    if-eqz p1, :cond_0

    .line 941
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 942
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v1, v1, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 943
    iget-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object p2, p2, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 939
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "View\u53c2\u6570\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addViewSupportTransformColorInt(Landroid/view/View;II)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    if-eqz p1, :cond_0

    .line 960
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 961
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 962
    iget-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object p2, p2, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 958
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "View\u53c2\u6570\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public autoDarkModeEnable(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    const/4 v0, 0x0

    .line 1059
    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->autoDarkModeEnable(ZF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public autoDarkModeEnable(ZF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1071
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeEnable:Z

    .line 1072
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, v0, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeAlpha:F

    .line 1073
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeEnable:Z

    .line 1074
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeAlpha:F

    return-object p0
.end method

.method public autoNavigationBarDarkModeEnable(ZF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1085
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeEnable:Z

    .line 1086
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->autoNavigationBarDarkModeAlpha:F

    return-object p0
.end method

.method public autoStatusBarDarkModeEnable(ZF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1079
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeEnable:Z

    .line 1080
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->autoStatusBarDarkModeAlpha:F

    return-object p0
.end method

.method public barAlpha(F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1047
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    .line 1048
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    return-object p0
.end method

.method public barColor(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 660
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->barColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColor(IF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 671
    iget-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {p2, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    int-to-float p1, p1

    invoke-virtual {p0, p2, p1}, Lcom/gyf/barlibrary/ImmersionBar;->barColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColor(IIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 685
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 686
    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    .line 685
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->barColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColor(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 696
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->barColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColor(Ljava/lang/String;F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 707
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->barColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColor(Ljava/lang/String;Ljava/lang/String;F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 721
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->barColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 731
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    .line 732
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    return-object p0
.end method

.method public barColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 744
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    .line 745
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 746
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    .line 747
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    return-object p0
.end method

.method public barColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 762
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    .line 763
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 765
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    .line 766
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    .line 768
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p3, p1, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    .line 769
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p3, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    return-object p0
.end method

.method public barColorTransform(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 843
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->barColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColorTransform(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 853
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->barColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public barColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 863
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    .line 864
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    return-object p0
.end method

.method public destroy()V
    .locals 4

    .line 1647
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->cancelListener()V

    .line 1649
    sget-object v0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1650
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1651
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1652
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mImmersionBarName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1653
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public fitsSystemWindows(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1210
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->fits:Z

    .line 1211
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean p1, p1, Lcom/gyf/barlibrary/BarParams;->fits:Z

    if-eqz p1, :cond_0

    .line 1212
    iget p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    if-nez p1, :cond_1

    const/4 p1, 0x4

    .line 1213
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1216
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    :cond_1
    :goto_0
    return-object p0
.end method

.method public fitsSystemWindows(ZI)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1230
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->fitsSystemWindowsInt(ZI)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public fitsSystemWindows(ZIIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1245
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 1246
    invoke-static {v0, p3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p3

    .line 1245
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/gyf/barlibrary/ImmersionBar;->fitsSystemWindowsInt(ZIIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public fitsSystemWindowsInt(ZI)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    const/high16 v0, -0x1000000

    const/4 v1, 0x0

    .line 1258
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/gyf/barlibrary/ImmersionBar;->fitsSystemWindowsInt(ZIIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public fitsSystemWindowsInt(ZIIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1273
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->fits:Z

    .line 1274
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->contentColor:I

    .line 1275
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p3, p1, Lcom/gyf/barlibrary/BarParams;->contentColorTransform:I

    .line 1276
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p4, p1, Lcom/gyf/barlibrary/BarParams;->contentAlpha:F

    .line 1277
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-boolean p1, p1, Lcom/gyf/barlibrary/BarParams;->fits:Z

    if-eqz p1, :cond_0

    .line 1278
    iget p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    if-nez p1, :cond_1

    const/4 p1, 0x4

    .line 1279
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1282
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 1284
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mContentView:Landroid/view/ViewGroup;

    iget-object p2, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget p2, p2, Lcom/gyf/barlibrary/BarParams;->contentColor:I

    iget-object p3, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget p3, p3, Lcom/gyf/barlibrary/BarParams;->contentColorTransform:I

    iget-object p4, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget p4, p4, Lcom/gyf/barlibrary/BarParams;->contentAlpha:F

    invoke-static {p2, p3, p4}, Landroidx/core/graphics/ColorUtils;->blendARGB(IIF)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    return-object p0
.end method

.method public fixMarginAtBottom(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1622
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->fixMarginAtBottom:Z

    return-object p0
.end method

.method public flymeOSStatusBarFontColor(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    .line 1156
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v1, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->flymeOSStatusBarFontColor:I

    return-object p0
.end method

.method public flymeOSStatusBarFontColor(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1168
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->flymeOSStatusBarFontColor:I

    return-object p0
.end method

.method public flymeOSStatusBarFontColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1180
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->flymeOSStatusBarFontColor:I

    return-object p0
.end method

.method public fullScreen(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1014
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    return-object p0
.end method

.method public getBarParams()Lcom/gyf/barlibrary/BarParams;
    .locals 1

    .line 2216
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    return-object v0
.end method

.method getPaddingBottom()I
    .locals 1

    .line 2242
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingBottom:I

    return v0
.end method

.method getPaddingLeft()I
    .locals 1

    .line 2230
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingLeft:I

    return v0
.end method

.method getPaddingRight()I
    .locals 1

    .line 2238
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingRight:I

    return v0
.end method

.method getPaddingTop()I
    .locals 1

    .line 2234
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mPaddingTop:I

    return v0
.end method

.method public getTag(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1516
    invoke-static {p1}, Lcom/gyf/barlibrary/ImmersionBar;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1519
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mTagMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/gyf/barlibrary/BarParams;

    if-eqz p1, :cond_0

    .line 1521
    invoke-virtual {p1}, Lcom/gyf/barlibrary/BarParams;->clone()Lcom/gyf/barlibrary/BarParams;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    :cond_0
    return-object p0

    .line 1517
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "tag\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public hideBar(Lcom/gyf/barlibrary/BarHide;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1191
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-object p1, v0, Lcom/gyf/barlibrary/BarParams;->barHide:Lcom/gyf/barlibrary/BarHide;

    .line 1192
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x13

    if-eq p1, v0, :cond_0

    invoke-static {}, Lcom/gyf/barlibrary/OSUtils;->isEMUI3_x()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1193
    :cond_0
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object p1, p1, Lcom/gyf/barlibrary/BarParams;->barHide:Lcom/gyf/barlibrary/BarHide;

    sget-object v0, Lcom/gyf/barlibrary/BarHide;->FLAG_HIDE_NAVIGATION_BAR:Lcom/gyf/barlibrary/BarHide;

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object p1, p1, Lcom/gyf/barlibrary/BarParams;->barHide:Lcom/gyf/barlibrary/BarHide;

    sget-object v0, Lcom/gyf/barlibrary/BarHide;->FLAG_HIDE_BAR:Lcom/gyf/barlibrary/BarHide;

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 1197
    :cond_1
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/gyf/barlibrary/BarParams;->hideNavigationBar:Z

    goto :goto_1

    .line 1195
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/gyf/barlibrary/BarParams;->hideNavigationBar:Z

    :cond_3
    :goto_1
    return-object p0
.end method

.method public init()V
    .locals 0

    .line 1631
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->updateBarParams()V

    .line 1633
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->setBar()V

    .line 1635
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsLayoutOverlap()V

    .line 1637
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->fitsKeyboard()V

    .line 1639
    invoke-direct {p0}, Lcom/gyf/barlibrary/ImmersionBar;->transformView()V

    return-void
.end method

.method public keyboardEnable(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1534
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget v0, v0, Lcom/gyf/barlibrary/BarParams;->keyboardMode:I

    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->keyboardEnable(ZI)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public keyboardEnable(ZI)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1545
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->keyboardEnable:Z

    .line 1546
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->keyboardMode:I

    return-object p0
.end method

.method public keyboardMode(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1558
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->keyboardMode:I

    return-object p0
.end method

.method public navigationBarAlpha(F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1036
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    return-object p0
.end method

.method public navigationBarColor(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 544
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColor(IF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 556
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColor(IIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 570
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 571
    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    .line 570
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColor(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 581
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColor(Ljava/lang/String;F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 593
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColor(Ljava/lang/String;Ljava/lang/String;F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 607
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    .line 608
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    .line 607
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    return-object p0
.end method

.method public navigationBarColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 631
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 632
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    return-object p0
.end method

.method public navigationBarColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 647
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 648
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    .line 649
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p3, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    return-object p0
.end method

.method public navigationBarColorTransform(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 812
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColorTransform(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 822
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 832
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColorTransform:I

    return-object p0
.end method

.method public navigationBarDarkIcon(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    const/4 v0, 0x0

    .line 1127
    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->navigationBarDarkIcon(ZF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public navigationBarDarkIcon(ZF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1139
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarDarkIcon:Z

    if-eqz p1, :cond_0

    .line 1140
    invoke-static {}, Lcom/gyf/barlibrary/ImmersionBar;->isSupportNavigationIconDark()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1141
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    goto :goto_0

    .line 1143
    :cond_0
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 p2, 0x0

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->navigationBarAlpha:F

    :goto_0
    return-object p0
.end method

.method public navigationBarEnable(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1584
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarEnable:Z

    return-object p0
.end method

.method public navigationBarWithEMUI3Enable(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1607
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithEMUI3Enable:Z

    return-object p0
.end method

.method public navigationBarWithKitkatEnable(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1595
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarWithKitkatEnable:Z

    return-object p0
.end method

.method public removeSupportAllView()Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1001
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1002
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_0
    return-object p0
.end method

.method public removeSupportView(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    if-eqz p1, :cond_1

    .line 988
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 989
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 990
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->viewMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object p0

    .line 986
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "View\u53c2\u6570\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public reset()Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1487
    new-instance v0, Lcom/gyf/barlibrary/BarParams;

    invoke-direct {v0}, Lcom/gyf/barlibrary/BarParams;-><init>()V

    iput-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v0, 0x0

    .line 1488
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    return-object p0
.end method

.method public setOnKeyboardListener(Lcom/gyf/barlibrary/OnKeyboardListener;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1570
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->onKeyboardListener:Lcom/gyf/barlibrary/OnKeyboardListener;

    if-nez v0, :cond_0

    .line 1571
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-object p1, v0, Lcom/gyf/barlibrary/BarParams;->onKeyboardListener:Lcom/gyf/barlibrary/OnKeyboardListener;

    :cond_0
    return-object p0
.end method

.method public statusBarAlpha(F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1025
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    return-object p0
.end method

.method public statusBarColor(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 425
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColor(IF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 437
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColor(IIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 451
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    .line 452
    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    .line 451
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColor(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 464
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColor(Ljava/lang/String;F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 476
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColor(Ljava/lang/String;Ljava/lang/String;F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 490
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    .line 491
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    .line 490
    invoke-virtual {p0, p1, p2, p3}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColorInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 502
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    return-object p0
.end method

.method public statusBarColorInt(IF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 515
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    .line 516
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    return-object p0
.end method

.method public statusBarColorInt(IIF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 531
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    .line 532
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    .line 533
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p3, p1, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    return-object p0
.end method

.method public statusBarColorTransform(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 781
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColorTransform(Ljava/lang/String;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 791
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarColorTransformEnable(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1476
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColorEnabled:Z

    return-object p0
.end method

.method public statusBarColorTransformInt(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 801
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColorTransform:I

    return-object p0
.end method

.method public statusBarDarkFont(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    const/4 v0, 0x0

    .line 1097
    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarDarkFont(ZF)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarDarkFont(ZF)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1109
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarDarkFont:Z

    if-eqz p1, :cond_0

    .line 1110
    invoke-static {}, Lcom/gyf/barlibrary/ImmersionBar;->isSupportStatusBarDarkFont()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1111
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    goto :goto_0

    .line 1113
    :cond_0
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 p2, 0x0

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->flymeOSStatusBarFontColor:I

    .line 1114
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 p2, 0x0

    iput p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarAlpha:F

    :goto_0
    return-object p0
.end method

.method public statusBarView(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1313
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarView(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarView(ILandroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 1325
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->statusBarView(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public statusBarView(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 1299
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-object p1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarView:Landroid/view/View;

    .line 1300
    iget p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    if-nez p1, :cond_1

    const/4 p1, 0x3

    .line 1301
    iput p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    :cond_1
    return-object p0
.end method

.method public supportActionBar(Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1336
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p1, v0, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    return-object p0
.end method

.method public titleBar(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    const/4 v0, 0x1

    .line 1382
    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->titleBar(IZ)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBar(ILandroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 1408
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->titleBar(Landroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBar(ILandroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 1421
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1, p3}, Lcom/gyf/barlibrary/ImmersionBar;->titleBar(Landroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBar(IZ)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1393
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1394
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->titleBar(Landroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1

    .line 1396
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/gyf/barlibrary/ImmersionBar;->titleBar(Landroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBar(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    :cond_0
    const/4 v0, 0x1

    .line 1351
    invoke-virtual {p0, p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->titleBar(Landroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBar(Landroid/view/View;Z)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 1366
    :cond_0
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 1367
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 1369
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-object p1, v0, Lcom/gyf/barlibrary/BarParams;->titleBarView:Landroid/view/View;

    .line 1370
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-boolean p2, p1, Lcom/gyf/barlibrary/BarParams;->statusBarColorEnabled:Z

    return-object p0
.end method

.method public titleBarMarginTop(I)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 1432
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1433
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->titleBarMarginTop(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1

    .line 1435
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->titleBarMarginTop(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBarMarginTop(ILandroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 0

    .line 1448
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->titleBarMarginTop(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;

    move-result-object p1

    return-object p1
.end method

.method public titleBarMarginTop(Landroid/view/View;)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    if-nez p1, :cond_0

    return-object p0

    .line 1462
    :cond_0
    iget v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    if-nez v0, :cond_1

    const/4 v0, 0x2

    .line 1463
    iput v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mFitsStatusBarType:I

    .line 1465
    :cond_1
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput-object p1, v0, Lcom/gyf/barlibrary/BarParams;->titleBarView:Landroid/view/View;

    return-object p0
.end method

.method public transparentBar()Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    .line 412
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v1, 0x0

    iput v1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    .line 413
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput v1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 414
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    return-object p0
.end method

.method public transparentNavigationBar()Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    .line 401
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v1, 0x0

    iput v1, v0, Lcom/gyf/barlibrary/BarParams;->navigationBarColor:I

    .line 402
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    return-object p0
.end method

.method public transparentStatusBar()Lcom/gyf/barlibrary/ImmersionBar;
    .locals 2

    .line 391
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    const/4 v1, 0x0

    iput v1, v0, Lcom/gyf/barlibrary/BarParams;->statusBarColor:I

    return-object p0
.end method

.method public viewAlpha(F)Lcom/gyf/barlibrary/ImmersionBar;
    .locals 1

    .line 974
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar;->mBarParams:Lcom/gyf/barlibrary/BarParams;

    iput p1, v0, Lcom/gyf/barlibrary/BarParams;->viewAlpha:F

    return-object p0
.end method
