.class public final synthetic Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/bigkoo/pickerview/listener/CustomListener;


# instance fields
.field private final synthetic f$0:Lcom/dnake/desktop/utils/CommonUtils;

.field private final synthetic f$1:Lcom/dnake/desktop/callback/SceneSleepClicked;


# direct methods
.method public synthetic constructor <init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/SceneSleepClicked;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;->f$0:Lcom/dnake/desktop/utils/CommonUtils;

    iput-object p2, p0, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;->f$1:Lcom/dnake/desktop/callback/SceneSleepClicked;

    return-void
.end method


# virtual methods
.method public final customLayout(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;->f$0:Lcom/dnake/desktop/utils/CommonUtils;

    iget-object v1, p0, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;->f$1:Lcom/dnake/desktop/callback/SceneSleepClicked;

    invoke-virtual {v0, v1, p1}, Lcom/dnake/desktop/utils/CommonUtils;->lambda$showSetSleepTimeDialog$2$CommonUtils(Lcom/dnake/desktop/callback/SceneSleepClicked;Landroid/view/View;)V

    return-void
.end method
