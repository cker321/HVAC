.class final Lme/yokeyword/fragmentation/SupportHelper$1;
.super Ljava/lang/Object;
.source "SupportHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/SupportHelper;->showSoftInput(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$imm:Landroid/view/inputmethod/InputMethodManager;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lme/yokeyword/fragmentation/SupportHelper$1;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    iput-object p2, p0, Lme/yokeyword/fragmentation/SupportHelper$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 34
    iget-object v0, p0, Lme/yokeyword/fragmentation/SupportHelper$1;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lme/yokeyword/fragmentation/SupportHelper$1;->val$view:Landroid/view/View;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    return-void
.end method
