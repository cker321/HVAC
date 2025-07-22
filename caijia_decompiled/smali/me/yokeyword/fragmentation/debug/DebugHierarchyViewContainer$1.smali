.class Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$1;
.super Ljava/lang/Object;
.source "DebugHierarchyViewContainer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->getTitleLayout()Landroid/widget/LinearLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$1;->this$0:Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 104
    iget-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer$1;->this$0:Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;

    invoke-static {p1}, Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;->access$000(Lme/yokeyword/fragmentation/debug/DebugHierarchyViewContainer;)Landroid/content/Context;

    move-result-object p1

    sget v0, Lme/yokeyword/fragmentation/R$string;->fragmentation_stack_help:I

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
