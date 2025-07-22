.class Lme/yokeyword/fragmentation/SupportFragmentDelegate$2;
.super Ljava/lang/Object;
.source "SupportFragmentDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/SupportFragmentDelegate;->fixAnimationListener(Landroid/view/animation/Animation;)V
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

    .line 573
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$2;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 576
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$2;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    iget-object v0, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mEnterAnimListener:Lme/yokeyword/fragmentation/SupportFragmentDelegate$EnterAnimListener;

    invoke-interface {v0}, Lme/yokeyword/fragmentation/SupportFragmentDelegate$EnterAnimListener;->onEnterAnimStart()V

    .line 577
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$2;->this$0:Lme/yokeyword/fragmentation/SupportFragmentDelegate;

    const/4 v1, 0x0

    iput-object v1, v0, Lme/yokeyword/fragmentation/SupportFragmentDelegate;->mEnterAnimListener:Lme/yokeyword/fragmentation/SupportFragmentDelegate$EnterAnimListener;

    return-void
.end method
