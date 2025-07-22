.class Lcom/dnake/desktop/widget/TimeView$1;
.super Ljava/lang/Object;
.source "TimeView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/widget/TimeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/widget/TimeView;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/widget/TimeView;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 52
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 53
    iget-object v1, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    invoke-static {v1}, Lcom/dnake/desktop/widget/TimeView;->access$100(Lcom/dnake/desktop/widget/TimeView;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    invoke-static {v2}, Lcom/dnake/desktop/widget/TimeView;->access$000(Lcom/dnake/desktop/widget/TimeView;)Ljava/text/SimpleDateFormat;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    iget-object v1, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    invoke-static {v1}, Lcom/dnake/desktop/widget/TimeView;->access$300(Lcom/dnake/desktop/widget/TimeView;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    invoke-static {v2}, Lcom/dnake/desktop/widget/TimeView;->access$200(Lcom/dnake/desktop/widget/TimeView;)Ljava/text/SimpleDateFormat;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    iget-object v1, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    invoke-static {v1}, Lcom/dnake/desktop/widget/TimeView;->access$400(Lcom/dnake/desktop/widget/TimeView;)Landroid/widget/TextView;

    move-result-object v1

    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/dnake/desktop/utils/CommonUtils;->getWeekOfDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    iget-object v0, p0, Lcom/dnake/desktop/widget/TimeView$1;->this$0:Lcom/dnake/desktop/widget/TimeView;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Lcom/dnake/desktop/widget/TimeView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
