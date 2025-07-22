.class public Lcom/gyf/barlibrary/FitsKeyboard;
.super Ljava/lang/Object;
.source "FitsKeyboard.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field private final mActionBarHeight:I

.field private mActivity:Landroid/app/Activity;

.field private mChildView:Landroid/view/View;

.field private mContentView:Landroid/view/View;

.field private mDecorView:Landroid/view/View;

.field private mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

.field private mIsAddListener:Z

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private final mStatusBarHeight:I

.field private mTempKeyboardHeight:I

.field private mWindow:Landroid/view/Window;


# direct methods
.method constructor <init>(Lcom/gyf/barlibrary/ImmersionBar;Landroid/app/Activity;Landroid/view/Window;)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingLeft:I

    iput v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingTop:I

    iput v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingRight:I

    iput v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingBottom:I

    .line 33
    iput-object p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    .line 34
    iput-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mActivity:Landroid/app/Activity;

    .line 35
    iput-object p3, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mWindow:Landroid/view/Window;

    .line 36
    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mDecorView:Landroid/view/View;

    const p2, 0x1020002

    .line 37
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    if-eqz p2, :cond_1

    .line 40
    instance-of p3, p2, Landroidx/drawerlayout/widget/DrawerLayout;

    if-eqz p3, :cond_0

    .line 41
    check-cast p2, Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {p2, v0}, Landroidx/drawerlayout/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    .line 43
    :cond_0
    iget-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    if-eqz p2, :cond_1

    .line 44
    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    iput p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingLeft:I

    .line 45
    iget-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    iput p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingTop:I

    .line 46
    iget-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    iput p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingRight:I

    .line 47
    iget-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p2

    iput p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingBottom:I

    .line 50
    :cond_1
    iget-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    if-eqz p2, :cond_2

    move-object p1, p2

    :cond_2
    iput-object p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mContentView:Landroid/view/View;

    .line 51
    new-instance p1, Lcom/gyf/barlibrary/BarConfig;

    iget-object p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    .line 52
    invoke-virtual {p1}, Lcom/gyf/barlibrary/BarConfig;->getStatusBarHeight()I

    move-result p2

    iput p2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mStatusBarHeight:I

    .line 53
    invoke-virtual {p1}, Lcom/gyf/barlibrary/BarConfig;->getActionBarHeight()I

    move-result p1

    iput p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mActionBarHeight:I

    return-void
.end method


# virtual methods
.method cancel()V
    .locals 2

    .line 80
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mIsAddListener:Z

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mDecorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mIsAddListener:Z

    :cond_0
    return-void
.end method

.method disable()V
    .locals 5

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mIsAddListener:Z

    if-eqz v0, :cond_1

    .line 68
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mContentView:Landroid/view/View;

    iget v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingLeft:I

    iget v2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingTop:I

    iget v3, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingRight:I

    iget v4, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mContentView:Landroid/view/View;

    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v1}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    .line 72
    invoke-virtual {v2}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    .line 73
    invoke-virtual {v3}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    .line 74
    invoke-virtual {v4}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingBottom()I

    move-result v4

    .line 71
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    :cond_1
    :goto_0
    return-void
.end method

.method enable(I)V
    .locals 2

    .line 57
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 58
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mWindow:Landroid/view/Window;

    invoke-virtual {v0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 59
    iget-boolean p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mIsAddListener:Z

    if-nez p1, :cond_0

    .line 60
    iget-object p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mDecorView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    const/4 p1, 0x1

    .line 61
    iput-boolean p1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mIsAddListener:Z

    :cond_0
    return-void
.end method

.method public onGlobalLayout()V
    .locals 8

    .line 88
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionBar;->getBarParams()Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionBar;->getBarParams()Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->keyboardEnable:Z

    if-eqz v0, :cond_8

    .line 89
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->getNavigationBarHeight(Landroid/app/Activity;)I

    move-result v0

    .line 91
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 93
    iget-object v2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mDecorView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 94
    iget-object v2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mContentView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v1

    .line 95
    iget v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mTempKeyboardHeight:I

    if-eq v2, v1, :cond_8

    .line 96
    iput v2, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mTempKeyboardHeight:I

    .line 97
    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mWindow:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const v3, 0x1020002

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->checkFitsSystemWindows(Landroid/view/View;)Z

    move-result v1

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v1, :cond_5

    .line 98
    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mChildView:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 99
    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v1}, Lcom/gyf/barlibrary/ImmersionBar;->getBarParams()Lcom/gyf/barlibrary/BarParams;

    move-result-object v1

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->isSupportActionBar:Z

    if-eqz v1, :cond_0

    .line 100
    iget v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mActionBarHeight:I

    iget v5, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mStatusBarHeight:I

    add-int/2addr v1, v5

    add-int/2addr v2, v1

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v1}, Lcom/gyf/barlibrary/ImmersionBar;->getBarParams()Lcom/gyf/barlibrary/BarParams;

    move-result-object v1

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->fits:Z

    if-eqz v1, :cond_1

    .line 103
    iget v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mStatusBarHeight:I

    add-int/2addr v2, v1

    :cond_1
    if-le v2, v0, :cond_2

    .line 106
    iget v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingBottom:I

    add-int/2addr v0, v2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 109
    :goto_0
    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mContentView:Landroid/view/View;

    iget v5, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingLeft:I

    iget v6, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingTop:I

    iget v7, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mPaddingRight:I

    invoke-virtual {v1, v5, v6, v7, v0}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_2

    .line 111
    :cond_3
    iget-object v1, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v1}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v2, v0

    if-le v2, v0, :cond_4

    add-int v1, v2, v0

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    .line 117
    :goto_1
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mContentView:Landroid/view/View;

    iget-object v5, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v5}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    .line 118
    invoke-virtual {v6}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    .line 119
    invoke-virtual {v7}, Lcom/gyf/barlibrary/ImmersionBar;->getPaddingRight()I

    move-result v7

    .line 117
    invoke-virtual {v0, v5, v6, v7, v1}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_2

    :cond_5
    sub-int/2addr v2, v0

    if-le v2, v0, :cond_6

    goto :goto_2

    :cond_6
    const/4 v3, 0x0

    :goto_2
    if-gez v2, :cond_7

    goto :goto_3

    :cond_7
    move v4, v2

    .line 131
    :goto_3
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionBar;->getBarParams()Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->onKeyboardListener:Lcom/gyf/barlibrary/OnKeyboardListener;

    if-eqz v0, :cond_8

    .line 132
    iget-object v0, p0, Lcom/gyf/barlibrary/FitsKeyboard;->mImmersionBar:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-virtual {v0}, Lcom/gyf/barlibrary/ImmersionBar;->getBarParams()Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    iget-object v0, v0, Lcom/gyf/barlibrary/BarParams;->onKeyboardListener:Lcom/gyf/barlibrary/OnKeyboardListener;

    invoke-interface {v0, v3, v4}, Lcom/gyf/barlibrary/OnKeyboardListener;->onKeyboardChange(ZI)V

    :cond_8
    return-void
.end method
