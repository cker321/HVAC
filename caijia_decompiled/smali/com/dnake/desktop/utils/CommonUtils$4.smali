.class Lcom/dnake/desktop/utils/CommonUtils$4;
.super Ljava/lang/Object;
.source "CommonUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/utils/CommonUtils;->uploadAllAirStatus(Lcom/dnake/desktop/handler/AirControlHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/utils/CommonUtils;

.field final synthetic val$airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/handler/AirControlHandler;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/dnake/desktop/utils/CommonUtils$4;->this$0:Lcom/dnake/desktop/utils/CommonUtils;

    iput-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils$4;->val$airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/dnake/desktop/utils/CommonUtils$4;->val$airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v0}, Lcom/dnake/desktop/handler/AirControlHandler;->upload()V

    return-void
.end method
