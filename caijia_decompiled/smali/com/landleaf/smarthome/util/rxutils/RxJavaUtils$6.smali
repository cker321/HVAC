.class final Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$6;
.super Ljava/lang/Object;
.source "RxJavaUtils.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils;->countDown(JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function<",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$totalTime:J


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 210
    iput-wide p1, p0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$6;->val$totalTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 213
    iget-wide v0, p0, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$6;->val$totalTime:J

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 210
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/util/rxutils/RxJavaUtils$6;->apply(Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method
