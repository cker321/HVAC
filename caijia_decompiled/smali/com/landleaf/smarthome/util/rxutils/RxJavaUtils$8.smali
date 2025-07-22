.class final Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$8;
.super Ljava/lang/Object;
.source "RxJavaUtils.java"

# interfaces
.implements Lio/reactivex/ObservableTransformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->comActCompose(Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;)Lio/reactivex/ObservableTransformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableTransformer<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$activity:Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;


# direct methods
.method constructor <init>(Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;)V
    .locals 0

    .line 366
    iput-object p1, p0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$8;->val$activity:Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observable<",
            "TT;>;)",
            "Lio/reactivex/ObservableSource<",
            "TT;>;"
        }
    .end annotation

    .line 370
    invoke-static {}, Lcom/landleaf/smarthome/util/rxutils/RxSchedulerUtils;->_io_main_o()Lio/reactivex/ObservableTransformer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p1

    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$8;->val$activity:Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;

    sget-object v1, Lcom/trello/rxlifecycle3/android/ActivityEvent;->DESTROY:Lcom/trello/rxlifecycle3/android/ActivityEvent;

    .line 371
    invoke-virtual {v0, v1}, Lcom/trello/rxlifecycle3/components/support/RxAppCompatActivity;->bindUntilEvent(Lcom/trello/rxlifecycle3/android/ActivityEvent;)Lcom/trello/rxlifecycle3/LifecycleTransformer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->compose(Lio/reactivex/ObservableTransformer;)Lio/reactivex/Observable;

    move-result-object p1

    return-object p1
.end method
