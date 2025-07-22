.class public abstract Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "RxDialogFragment.java"

# interfaces
.implements Lcom/trello/rxlifecycle3/LifecycleProvider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/fragment/app/DialogFragment;",
        "Lcom/trello/rxlifecycle3/LifecycleProvider<",
        "Lcom/trello/rxlifecycle3/android/FragmentEvent;",
        ">;"
    }
.end annotation


# instance fields
.field private final lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/BehaviorSubject<",
            "Lcom/trello/rxlifecycle3/android/FragmentEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    .line 36
    invoke-static {}, Lio/reactivex/subjects/BehaviorSubject;->create()Lio/reactivex/subjects/BehaviorSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

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

    .line 56
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-static {v0}, Lcom/trello/rxlifecycle3/android/RxLifecycleAndroid;->bindFragment(Lio/reactivex/Observable;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object v0

    return-object v0
.end method

.method public final bindUntilEvent(Lcom/trello/rxlifecycle3/android/FragmentEvent;)Lcom/trello/rxlifecycle3/LifecycleTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trello/rxlifecycle3/android/FragmentEvent;",
            ")",
            "Lcom/trello/rxlifecycle3/LifecycleTransformer<",
            "TT;>;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-static {v0, p1}, Lcom/trello/rxlifecycle3/RxLifecycle;->bindUntilEvent(Lio/reactivex/Observable;Ljava/lang/Object;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic bindUntilEvent(Ljava/lang/Object;)Lcom/trello/rxlifecycle3/LifecycleTransformer;
    .locals 0

    .line 34
    check-cast p1, Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p0, p1}, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->bindUntilEvent(Lcom/trello/rxlifecycle3/android/FragmentEvent;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object p1

    return-object p1
.end method

.method public final lifecycle()Lio/reactivex/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/trello/rxlifecycle3/android/FragmentEvent;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-virtual {v0}, Lio/reactivex/subjects/BehaviorSubject;->hide()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1

    .line 62
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 63
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v0, Lcom/trello/rxlifecycle3/android/FragmentEvent;->ATTACH:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p1, v0}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 69
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 70
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v0, Lcom/trello/rxlifecycle3/android/FragmentEvent;->CREATE:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p1, v0}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->DESTROY:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 119
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->DESTROY_VIEW:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 112
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroyView()V

    return-void
.end method

.method public onDetach()V
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->DETACH:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 126
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDetach()V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 97
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->PAUSE:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 98
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 90
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onResume()V

    .line 91
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->RESUME:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 83
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onStart()V

    .line 84
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->START:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->STOP:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 105
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 76
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 77
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxDialogFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object p2, Lcom/trello/rxlifecycle3/android/FragmentEvent;->CREATE_VIEW:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p1, p2}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method
