.class final Lcom/trello/rxlifecycle3/Functions;
.super Ljava/lang/Object;
.source "Functions.java"


# static fields
.field static final CANCEL_COMPLETABLE:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function<",
            "Ljava/lang/Object;",
            "Lio/reactivex/Completable;",
            ">;"
        }
    .end annotation
.end field

.field static final RESUME_FUNCTION:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static final SHOULD_COMPLETE:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lcom/trello/rxlifecycle3/Functions$1;

    invoke-direct {v0}, Lcom/trello/rxlifecycle3/Functions$1;-><init>()V

    sput-object v0, Lcom/trello/rxlifecycle3/Functions;->RESUME_FUNCTION:Lio/reactivex/functions/Function;

    .line 39
    new-instance v0, Lcom/trello/rxlifecycle3/Functions$2;

    invoke-direct {v0}, Lcom/trello/rxlifecycle3/Functions$2;-><init>()V

    sput-object v0, Lcom/trello/rxlifecycle3/Functions;->SHOULD_COMPLETE:Lio/reactivex/functions/Predicate;

    .line 46
    new-instance v0, Lcom/trello/rxlifecycle3/Functions$3;

    invoke-direct {v0}, Lcom/trello/rxlifecycle3/Functions$3;-><init>()V

    sput-object v0, Lcom/trello/rxlifecycle3/Functions;->CANCEL_COMPLETABLE:Lio/reactivex/functions/Function;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
