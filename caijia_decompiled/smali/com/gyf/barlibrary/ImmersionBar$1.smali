.class Lcom/gyf/barlibrary/ImmersionBar$1;
.super Landroid/database/ContentObserver;
.source "ImmersionBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gyf/barlibrary/ImmersionBar;->fitsWindowsEMUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gyf/barlibrary/ImmersionBar;

.field final synthetic val$navigationBarView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/gyf/barlibrary/ImmersionBar;Landroid/os/Handler;Landroid/view/View;)V
    .locals 0

    .line 1997
    iput-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    iput-object p3, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->val$navigationBarView:Landroid/view/View;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 4

    .line 2000
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    new-instance v0, Lcom/gyf/barlibrary/BarConfig;

    invoke-static {p1}, Lcom/gyf/barlibrary/ImmersionBar;->access$100(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/gyf/barlibrary/BarConfig;-><init>(Landroid/app/Activity;)V

    invoke-static {p1, v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$002(Lcom/gyf/barlibrary/ImmersionBar;Lcom/gyf/barlibrary/BarConfig;)Lcom/gyf/barlibrary/BarConfig;

    .line 2001
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {p1}, Lcom/gyf/barlibrary/ImmersionBar;->access$200(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/view/ViewGroup;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result p1

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$200(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v0

    .line 2002
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$100(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$100(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 2003
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$100(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v3, "navigationbar_is_min"

    invoke-static {v1, v3, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 2007
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->val$navigationBarView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    const/4 p1, 0x0

    const/4 v0, 0x0

    goto/16 :goto_4

    .line 2012
    :cond_0
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->val$navigationBarView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2013
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$300(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/view/ViewGroup;

    move-result-object v1

    const v3, 0x1020002

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->checkFitsSystemWindows(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 2017
    :cond_1
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$400(Lcom/gyf/barlibrary/ImmersionBar;)I

    move-result v1

    if-nez v1, :cond_2

    .line 2018
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$000(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarHeight()I

    move-result v3

    invoke-static {v1, v3}, Lcom/gyf/barlibrary/ImmersionBar;->access$402(Lcom/gyf/barlibrary/ImmersionBar;I)I

    .line 2020
    :cond_2
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$500(Lcom/gyf/barlibrary/ImmersionBar;)I

    move-result v1

    if-nez v1, :cond_3

    .line 2021
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$000(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/gyf/barlibrary/BarConfig;->getNavigationBarWidth()I

    move-result v3

    invoke-static {v1, v3}, Lcom/gyf/barlibrary/ImmersionBar;->access$502(Lcom/gyf/barlibrary/ImmersionBar;I)I

    .line 2023
    :cond_3
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$600(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarParams;

    move-result-object v1

    iget-boolean v1, v1, Lcom/gyf/barlibrary/BarParams;->hideNavigationBar:Z

    if-nez v1, :cond_7

    .line 2024
    iget-object p1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->val$navigationBarView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 2025
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$000(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gyf/barlibrary/BarConfig;->isNavigationAtBottom()Z

    move-result v0

    if-eqz v0, :cond_5

    const/16 v0, 0x50

    .line 2026
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 2027
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$400(Lcom/gyf/barlibrary/ImmersionBar;)I

    move-result v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 2028
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$600(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$400(Lcom/gyf/barlibrary/ImmersionBar;)I

    move-result v0

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x0

    goto :goto_3

    :cond_5
    const v0, 0x800005

    .line 2031
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 2032
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$500(Lcom/gyf/barlibrary/ImmersionBar;)I

    move-result v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 2034
    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$600(Lcom/gyf/barlibrary/ImmersionBar;)Lcom/gyf/barlibrary/BarParams;

    move-result-object v0

    iget-boolean v0, v0, Lcom/gyf/barlibrary/BarParams;->fullScreen:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v0}, Lcom/gyf/barlibrary/ImmersionBar;->access$500(Lcom/gyf/barlibrary/ImmersionBar;)I

    move-result v0

    goto :goto_2

    :cond_6
    const/4 v0, 0x0

    :goto_2
    move v1, v0

    const/4 v0, 0x0

    .line 2036
    :goto_3
    iget-object v3, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->val$navigationBarView:Landroid/view/View;

    invoke-virtual {v3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    move p1, v0

    move v0, v1

    .line 2041
    :cond_7
    :goto_4
    iget-object v1, p0, Lcom/gyf/barlibrary/ImmersionBar$1;->this$0:Lcom/gyf/barlibrary/ImmersionBar;

    invoke-static {v1}, Lcom/gyf/barlibrary/ImmersionBar;->access$200(Lcom/gyf/barlibrary/ImmersionBar;)Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    invoke-static {v1, v2, v3, v0, p1}, Lcom/gyf/barlibrary/ImmersionBar;->access$700(Lcom/gyf/barlibrary/ImmersionBar;IIII)V

    return-void
.end method
