.class Lcom/dnake/desktop/utils/CommonUtils$6;
.super Ljava/lang/Object;
.source "CommonUtils.java"

# interfaces
.implements Lcom/bigkoo/pickerview/listener/OnTimeSelectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/utils/CommonUtils;->showSetSleepTimeDialog(Landroid/content/Context;Lcom/dnake/desktop/callback/SceneSleepClicked;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/utils/CommonUtils;

.field final synthetic val$clicked:Lcom/dnake/desktop/callback/SceneSleepClicked;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/SceneSleepClicked;)V
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/dnake/desktop/utils/CommonUtils$6;->this$0:Lcom/dnake/desktop/utils/CommonUtils;

    iput-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils$6;->val$clicked:Lcom/dnake/desktop/callback/SceneSleepClicked;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimeSelect(Ljava/util/Date;Landroid/view/View;)V
    .locals 0

    .line 221
    iget-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils$6;->val$clicked:Lcom/dnake/desktop/callback/SceneSleepClicked;

    invoke-interface {p2, p1}, Lcom/dnake/desktop/callback/SceneSleepClicked;->timeSelected(Ljava/util/Date;)V

    return-void
.end method
