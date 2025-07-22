.class public abstract Lcom/trello/rxlifecycle3/components/support/RxFragment;
.super Landroidx/fragment/app/Fragment;
.source "RxFragment.java"

# interfaces
.implements Lcom/trello/rxlifecycle3/LifecycleProvider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/fragment/app/Fragment;",
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

    .line 33
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 35
    invoke-static {}, Lio/reactivex/subjects/BehaviorSubject;->create()Lio/reactivex/subjects/BehaviorSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

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
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

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

    .line 48
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-static {v0, p1}, Lcom/trello/rxlifecycle3/RxLifecycle;->bindUntilEvent(Lio/reactivex/Observable;Ljava/lang/Object;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic bindUntilEvent(Ljava/lang/Object;)Lcom/trello/rxlifecycle3/LifecycleTransformer;
    .locals 0

    .line 33
    check-cast p1, Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p0, p1}, Lcom/trello/rxlifecycle3/components/support/RxFragment;->bindUntilEvent(Lcom/trello/rxlifecycle3/android/FragmentEvent;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

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

    .line 41
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    invoke-virtual {v0}, Lio/reactivex/subjects/BehaviorSubject;->hide()Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1

    .line 60
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 61
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v0, Lcom/trello/rxlifecycle3/android/FragmentEvent;->ATTACH:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p1, v0}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 66
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v0, Lcom/trello/rxlifecycle3/android/FragmentEvent;->CREATE:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p1, v0}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 108
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->DESTROY:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 109
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .line 102
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->DESTROY_VIEW:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 103
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public onDetach()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->DETACH:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 115
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 90
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->PAUSE:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 91
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 84
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 85
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->RESUME:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 78
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 79
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->START:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object v1, Lcom/trello/rxlifecycle3/android/FragmentEvent;->STOP:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    .line 97
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 72
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 73
    iget-object p1, p0, Lcom/trello/rxlifecycle3/components/support/RxFragment;->lifecycleSubject:Lio/reactivex/subjects/BehaviorSubject;

    sget-object p2, Lcom/trello/rxlifecycle3/android/FragmentEvent;->CREATE_VIEW:Lcom/trello/rxlifecycle3/android/FragmentEvent;

    invoke-virtual {p1, p2}, Lio/reactivex/subjects/BehaviorSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method
