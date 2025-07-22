.class Lme/yokeyword/fragmentation/SupportActivityDelegate$1;
.super Lme/yokeyword/fragmentation/queue/Action;
.source "SupportActivityDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/SupportActivityDelegate;->onBackPressed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/SupportActivityDelegate;I)V
    .locals 0

    .line 148
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-direct {p0, p2}, Lme/yokeyword/fragmentation/queue/Action;-><init>(I)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 151
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    iget-boolean v0, v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentClickable:Z

    if-nez v0, :cond_0

    .line 152
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentClickable:Z

    .line 156
    :cond_0
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->access$000(Lme/yokeyword/fragmentation/SupportActivityDelegate;)Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportHelper;->getActiveFragment(Landroidx/fragment/app/FragmentManager;)Lme/yokeyword/fragmentation/ISupportFragment;

    move-result-object v0

    .line 157
    iget-object v1, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-static {v1}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->access$100(Lme/yokeyword/fragmentation/SupportActivityDelegate;)Lme/yokeyword/fragmentation/TransactionDelegate;

    move-result-object v1

    invoke-virtual {v1, v0}, Lme/yokeyword/fragmentation/TransactionDelegate;->dispatchBackPressedEvent(Lme/yokeyword/fragmentation/ISupportFragment;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 159
    :cond_1
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportActivityDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportActivityDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportActivityDelegate;->access$200(Lme/yokeyword/fragmentation/SupportActivityDelegate;)Lme/yokeyword/fragmentation/ISupportActivity;

    move-result-object v0

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportActivity;->onBackPressedSupport()V

    return-void
.end method
