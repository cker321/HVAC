.class Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate$1;
.super Ljava/lang/Object;
.source "VisibleDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->enqueueDispatchVisible()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;


# direct methods
.method constructor <init>(Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;)V
    .locals 0

    .line 129
    iput-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate$1;->this$0:Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 132
    iget-object v0, p0, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate$1;->this$0:Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;->access$000(Lme/yokeyword/fragmentation/helper/internal/VisibleDelegate;Z)V

    return-void
.end method
