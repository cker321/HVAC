.class final Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$4;
.super Ljava/lang/Object;
.source "RxJavaUtils.java"

# interfaces
.implements Lio/reactivex/FlowableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->createFlowable(Ljava/lang/Object;)Lio/reactivex/Flowable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableOnSubscribe<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$t:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 95
    iput-object p1, p0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$4;->val$t:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/FlowableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/FlowableEmitter<",
            "TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 99
    :try_start_0
    iget-object v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$4;->val$t:Ljava/lang/Object;

    invoke-interface {p1, v0}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 100
    invoke-interface {p1}, Lio/reactivex/FlowableEmitter;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 102
    invoke-interface {p1, v0}, Lio/reactivex/FlowableEmitter;->onError(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
