.class public abstract Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "RxFragmentActivity.java"

# interfaces
.implements Lcom/trello/rxlifecycle3/LifecycleProvider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/fragment/app/FragmentActivity;",
        "Lcom/trello/rxlifecycle3/LifecycleProvider<",
        "Lcom/trello/rxlifecycle3/android/ActivityEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/BehaviorSubject<",
            "Lcom/trello/rxlifecycle3/android/ActivityEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 35
    invoke-static {}, Lio/reactivex/subjects/BehaviorSubject;->create()Lio/reactivex/subjects/BehaviorSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    return-void
.end method


# virtual methods
.method public final bindToLifecycle()Lcom/trello/rxlifecycle3/LifecycleTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/trello/rxlifecycle3/LifecycleTransformer<",
            "TT;>;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-static {v0}, Lcom/trello/rxlifecycle3/android/RxLifecycleAndroid;->bindActivity(Lio/reactivex/Observable;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object v0

    return-object v0
.end method

.method public final bindUntilEvent(Lcom/trello/rxlifecycle3/android/ActivityEvent;)Lcom/trello/rxlifecycle3/LifecycleTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trello/rxlifecycle3/android/ActivityEvent;",
            ")",
            "Lcom/trello/rxlifecycle3/LifecycleTransformer<",
            "TT;>;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-static {v0, p1}, Lcom/trello/rxlifecycle3/RxLifecycle;->bindUntilEvent(Lio/reactivex/Observable;Ljava/lang/Object;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic bindUntilEvent(Ljava/lang/Object;)Lcom/trello/rxlifecycle3/LifecycleTransformer;
    .locals 0

    .line 33
    check-cast p1, Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {p0, p1}, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->bindUntilEvent(Lcom/trello/rxlifecycle3/android/ActivityEvent;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object p1

    return-object p1
.end method

.method public final lifecycle()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/trello/rxlifecycle3/android/ActivityEvent;",
            ">;"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-virtual {v0}, Lio/reactivex/subjects/BehaviorSubject;->hide()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 61
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v0, Lcom/trello/rxlifecycle3/android/ActivityEvent;->CREATE:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {p1, v0}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/ActivityEvent;->DESTROY:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 97
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/ActivityEvent;->PAUSE:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 83
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 75
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 76
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/ActivityEvent;->RESUME:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 68
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    .line 69
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/ActivityEvent;->START:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 89
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragmentActivity;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/ActivityEvent;->STOP:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 90
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    return-void
.end method
