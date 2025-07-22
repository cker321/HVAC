.class Lme/yokeyword/fragmentation/SupportFragmentDelegate$1$1;
.super Ljava/lang/Object;
.source "SupportFragmentDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/SupportFragmentDelegate$1;->onAnimationStart(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lme/yokeyword/fragmentation/SupportFragmentDelegate$1;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/SupportFragmentDelegate$1;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$1$1;->this$1:Lme/yokeyword/fragmentation/SupportFragmentDelegate$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 127
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$1$1;->this$1:Lme/yokeyword/fragmentation/SupportFragmentDelegate$1;

    iget-object v0, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$1;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-static {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->access$000(Lme/yokeyword/fragmentation/SupportFragmentDelegate;)Lme/yokeyword/fragmentation/ISupportActivity;

    move-result-object v0

    invoke-interface {v0}, Lme/yokeyword/fragmentation/ISupportActivity;->getSupportDelegate()Lme/yokeyword/fragmentation/SupportActivityDelegate;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lme/yokeyword/fragmentation/SupportActivityDelegate;->mFragmentClickable:Z

    return-void
.end method
