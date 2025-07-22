.class Lcom/dnake/desktop/utils/CommonUtils$5;
.super Ljava/lang/Object;
.source "CommonUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/utils/CommonUtils;->uploadBugInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/utils/CommonUtils;

.field final synthetic val$rs485Callback:Lcom/dnake/desktop/callback/Rs485Callback;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/Rs485Callback;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/dnake/desktop/utils/CommonUtils$5;->this$0:Lcom/dnake/desktop/utils/CommonUtils;

    iput-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils$5;->val$rs485Callback:Lcom/dnake/desktop/callback/Rs485Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/dnake/desktop/utils/CommonUtils$5;->val$rs485Callback:Lcom/dnake/desktop/callback/Rs485Callback;

    invoke-interface {v0}, Lcom/dnake/desktop/callback/Rs485Callback;->uploadDeviceBug()V

    return-void
.end method
