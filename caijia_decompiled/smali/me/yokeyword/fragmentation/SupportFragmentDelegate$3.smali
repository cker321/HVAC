.class Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;
.super Ljava/lang/Object;
.source "SupportFragmentDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/SupportFragmentDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)V
    .locals 0

    .line 583
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 586
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$200(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 587
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$400(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    iget-object v1, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$300(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Landroid/os/Bundle;

    move-result-object v1

    invoke-interface {v0, v1}, Lme/yokeyword/fragmentation/ISupportFragment;->onEnterAnimationEnd(Landroid/os/Bundle;)V

    .line 589
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$500(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 590
    :cond_1
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$200(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    .line 592
    :cond_2
    iget-object v1, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$200(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-static {v1}, Lme/yokeyword/fragmentation/SupportHelper;->getPreFragment(Landroidx/fragment/app/Fragment;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v1

    if-nez v1, :cond_3

    return-void

    .line 595
    :cond_3
    invoke-interface {v1}, Lme/yokeyword/fragmentation/ISupportFragment;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    move-result-object v1

    invoke-static {v1}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$600(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)J

    move-result-wide v1

    .line 596
    iget-object v3, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v3}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$700(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)J

    move-result-wide v3

    .line 598
    iget-object v5, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v5}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$100(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Landroid/os/Handler;

    move-result-object v5

    new-instance v6, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3$1;

    invoke-direct {v6, p0, v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3$1;-><init>(Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;Landroid/view/View;)V

    sub-long/2addr v1, v3

    invoke-virtual {v5, v6, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
