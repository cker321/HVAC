.class Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe$EmitterListener;
.super Lio/reactivex/android/MainThreadDisposable;
.source "ViewDetachesOnSubscribe.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EmitterListener"
.end annotation


# instance fields
.field final emitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;


# direct methods
.method public constructor <init>(Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;Lio/reactivex/ObservableEmitter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe$EmitterListener;->this$0:Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;

    invoke-direct {p0}, Lio/reactivex/android/MainThreadDisposable;-><init>()V

    .line 47
    iput-object p2, p0, Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe$EmitterListener;->emitter:Lio/reactivex/ObservableEmitter;

    return-void
.end method


# virtual methods
.method protected onDispose()V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe$EmitterListener;->this$0:Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;

    iget-object v0, v0, Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;->view:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 57
    iget-object p1, p0, Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe$EmitterListener;->emitter:Lio/reactivex/ObservableEmitter;

    sget-object v0, Lcom/trello/rxlifecycle3/android/ViewDetachesOnSubscribe;->SIGNAL:Ljava/lang/Object;

    invoke-interface {p1, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
