.class Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;
.super Ljava/lang/Object;
.source "DebugStackDelegate.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/debug/DebugStackDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StackViewTouchListener"
.end annotation


# instance fields
.field private clickLimitValue:I

.field private dX:F

.field private dY:F

.field private downX:F

.field private downY:F

.field private isClickState:Z

.field private stackView:Landroid/view/View;

.field final synthetic this$0:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/debug/DebugStackDelegate;Landroid/view/View;I)V
    .locals 0

    .line 235
    iput-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->this$0:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 230
    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->dY:F

    .line 231
    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->downY:F

    .line 236
    iput-object p2, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->stackView:Landroid/view/View;

    .line 237
    iput p3, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->clickLimitValue:I

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 242
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    .line 243
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    .line 244
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    if-eq v1, v2, :cond_2

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v1, v3, :cond_0

    const/4 p2, 0x3

    if-eq v1, p2, :cond_2

    return v4

    .line 253
    :cond_0
    iget v1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->downX:F

    sub-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->clickLimitValue:I

    int-to-float v1, v1

    cmpg-float p1, p1, v1

    if-gez p1, :cond_1

    iget p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->downY:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v0, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->clickLimitValue:I

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_1

    iget-boolean p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->isClickState:Z

    if-eqz p1, :cond_1

    .line 254
    iput-boolean v2, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->isClickState:Z

    goto :goto_0

    .line 256
    :cond_1
    iput-boolean v4, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->isClickState:Z

    .line 257
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->stackView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->dX:F

    add-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setX(F)V

    .line 258
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->stackView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget v0, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->dY:F

    add-float/2addr p2, v0

    invoke-virtual {p1, p2}, Landroid/view/View;->setY(F)V

    goto :goto_0

    .line 263
    :cond_2
    iget p2, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->downX:F

    sub-float/2addr p1, p2

    iget p2, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->clickLimitValue:I

    int-to-float p2, p2

    cmpg-float p1, p1, p2

    if-gez p1, :cond_4

    iget-boolean p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->isClickState:Z

    if-eqz p1, :cond_4

    .line 264
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->stackView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    goto :goto_0

    .line 246
    :cond_3
    iput-boolean v2, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->isClickState:Z

    .line 247
    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->downX:F

    .line 248
    iput v0, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->downY:F

    .line 249
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->stackView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    sub-float/2addr p1, v0

    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->dX:F

    .line 250
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->stackView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    sub-float/2addr p1, p2

    iput p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$StackViewTouchListener;->dY:F

    :cond_4
    :goto_0
    return v2
.end method
