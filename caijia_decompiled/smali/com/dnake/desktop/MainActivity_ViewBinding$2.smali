.class Lcom/dnake/desktop/MainActivity_ViewBinding$2;
.super Lbutterknife/internal/DebouncingOnClickListener;
.source "MainActivity_ViewBinding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/MainActivity_ViewBinding;-><init>(Lcom/dnake/desktop/MainActivity;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dnake/desktop/MainActivity_ViewBinding;

.field final synthetic val$target:Lcom/dnake/desktop/MainActivity;


# direct methods
.method constructor <init>(Lcom/dnake/desktop/MainActivity_ViewBinding;Lcom/dnake/desktop/MainActivity;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/dnake/desktop/MainActivity_ViewBinding$2;->this$0:Lcom/dnake/desktop/MainActivity_ViewBinding;

    iput-object p2, p0, Lcom/dnake/desktop/MainActivity_ViewBinding$2;->val$target:Lcom/dnake/desktop/MainActivity;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/dnake/desktop/MainActivity_ViewBinding$2;->val$target:Lcom/dnake/desktop/MainActivity;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/MainActivity;->onViewClicked(Landroid/view/View;)V

    return-void
.end method
