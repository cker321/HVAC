.class Lcom/dnake/desktop/utils/CommonUtils$3;
.super Ljava/lang/Object;
.source "CommonUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/utils/CommonUtils;

.field final synthetic val$airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

.field final synthetic val$controlTica:Lcom/dnake/desktop/bean/TicaInnerStatus;

.field final synthetic val$listNo:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/handler/AirControlHandler;Ljava/util/List;Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->this$0:Lcom/dnake/desktop/utils/CommonUtils;

    iput-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->val$airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iput-object p3, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->val$listNo:Ljava/util/List;

    iput-object p4, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->val$controlTica:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 86
    iget-object v0, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->val$airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v1, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->val$listNo:Ljava/util/List;

    iget-object v2, p0, Lcom/dnake/desktop/utils/CommonUtils$3;->val$controlTica:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v1, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->writeSceneMultiple(Ljava/util/List;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    return-void
.end method
