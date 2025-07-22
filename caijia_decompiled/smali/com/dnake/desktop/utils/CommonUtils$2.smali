.class Lcom/dnake/desktop/utils/CommonUtils$2;
.super Ljava/lang/Object;
.source "CommonUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/utils/CommonUtils;

.field final synthetic val$rs485Callback:Lcom/dnake/desktop/callback/Rs485Callback;

.field final synthetic val$writeAddress:I

.field final synthetic val$writeValue:I


# direct methods
.method constructor <init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/Rs485Callback;II)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->this$0:Lcom/dnake/desktop/utils/CommonUtils;

    iput-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->val$rs485Callback:Lcom/dnake/desktop/callback/Rs485Callback;

    iput p3, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->val$writeAddress:I

    iput p4, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->val$writeValue:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->val$rs485Callback:Lcom/dnake/desktop/callback/Rs485Callback;

    iget v1, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->val$writeAddress:I

    iget v2, p0, Lcom/dnake/desktop/utils/CommonUtils$2;->val$writeValue:I

    invoke-interface {v0, v1, v2}, Lcom/dnake/desktop/callback/Rs485Callback;->write(II)V

    return-void
.end method
