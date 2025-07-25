.class Lcom/afollestad/materialdialogs/DialogBase;
.super Landroid/app/Dialog;
.source "DialogBase.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field private showListener:Landroid/content/DialogInterface$OnShowListener;

.field protected view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public findViewById(I)Landroid/view/View;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DialogBase;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    invoke-virtual {v0, p1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DialogBase;->showListener:Landroid/content/DialogInterface$OnShowListener;

    if-eqz v0, :cond_0

    .line 42
    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public setContentView(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 49
    new-instance p1, Ljava/lang/IllegalAccessError;

    const-string v0, "setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead."

    invoke-direct {p1, v0}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 56
    new-instance p1, Ljava/lang/IllegalAccessError;

    const-string v0, "setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead."

    invoke-direct {p1, v0}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 64
    new-instance p1, Ljava/lang/IllegalAccessError;

    const-string p2, "setContentView() is not supported in MaterialDialog. Specify a custom view in the Builder instead."

    invoke-direct {p1, p2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/afollestad/materialdialogs/DialogBase;->showListener:Landroid/content/DialogInterface$OnShowListener;

    return-void
.end method

.method final setOnShowListenerInternal()V
    .locals 0

    .line 32
    invoke-super {p0, p0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-void
.end method

.method final setViewInternal(Landroid/view/View;)V
    .locals 0

    .line 36
    invoke-super {p0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    return-void
.end method
