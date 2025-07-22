.class Lcom/dnake/desktop/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/MainActivity;->initInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/MainActivity;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/MainActivity;)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/dnake/desktop/MainActivity$2;->this$0:Lcom/dnake/desktop/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 185
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity$2;->this$0:Lcom/dnake/desktop/MainActivity;

    invoke-static {v0}, Lcom/dnake/desktop/MainActivity;->access$100(Lcom/dnake/desktop/MainActivity;)V

    .line 186
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/bean/ReadDeviceStatus;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/dnake/desktop/bean/ReadDeviceStatus;-><init>(Z)V

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    return-void
.end method
