.class Lme/yokeyword/fragmentation/debug/DebugStackDelegate$1;
.super Ljava/lang/Object;
.source "DebugStackDelegate.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->onPostCreate(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/debug/DebugStackDelegate;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$1;->this$0:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 69
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugStackDelegate$1;->this$0:Lme/yokeyword/fragmentation/debug/DebugStackDelegate;

    invoke-virtual {p1}, Lme/yokeyword/fragmentation/debug/DebugStackDelegate;->showFragmentStackHierarchyView()V

    return-void
.end method
