.class Lcom/dnake/desktop/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/MainActivity;->onViewClicked(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/MainActivity;

.field final synthetic val$customDialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/MainActivity;Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/dnake/desktop/MainActivity$1;->this$0:Lcom/dnake/desktop/MainActivity;

    iput-object p2, p0, Lcom/dnake/desktop/MainActivity$1;->val$customDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 150
    iget-object p1, p0, Lcom/dnake/desktop/MainActivity$1;->val$customDialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 151
    iget-object p1, p0, Lcom/dnake/desktop/MainActivity$1;->this$0:Lcom/dnake/desktop/MainActivity;

    invoke-static {p1}, Lcom/dnake/desktop/MainActivity;->access$000(Lcom/dnake/desktop/MainActivity;)V

    return-void
.end method
