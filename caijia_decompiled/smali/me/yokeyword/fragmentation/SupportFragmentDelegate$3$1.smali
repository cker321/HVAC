.class Lme/yokeyword/fragmentation/SupportFragmentDelegate$3$1;
.super Ljava/lang/Object;
.source "SupportFragmentDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;Landroid/view/View;)V
    .locals 0

    .line 598
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3$1;->this$1:Lme/yokeyword/fragmentation/SupportFragmentDelegate$3;

    iput-object p2, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 601
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportFragmentDelegate$3$1;->val$view:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method
